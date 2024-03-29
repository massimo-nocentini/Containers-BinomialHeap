Extension { #name : #CTBinomialHeap }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialHeap >> acceptSlotDescriptorsVisitor: aVisitor [

	^ aVisitor visitCTBinomialHeap: self
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialHeap >> asShapeForest [

	| shapes |
	shapes := representation asLinkedList collect: [ :anAssociation | 
		          | box treeShape |
		          treeShape := RSComposite new
			                       shapes: { anAssociation value asShapeTree };
			                       padding: Float goldenRatio double;
			                       yourself.

		          box := RSBox new
			                 color: Color white;
			                 extent: treeShape extent;
			                 withBorder;
			                 cornerRadius: Float goldenRatio double;
			                 addInteraction: (RSLabeled new
					                  text: 'Rank ' , anAssociation key asString;
					                  yourself: [ :interaction | 
						                  interaction shapeBuilder labelShape
							                  fontSizeSilverRatio ]);
			                 yourself.

		          RSLocation new
			          center;
			          stick: treeShape on: box.

		          RSComposite new
			          model: anAssociation;
			          shapes: { 
					          box.
					          treeShape };
			          yourself ].

	RSVerticalLineLayout new
		alignCenter;
		verticalGap: Float goldenRatio double double;
		applyOn: shapes.

	^ RSComposite new
		  model: self;
		  shapes: shapes;
		  yourself
]
