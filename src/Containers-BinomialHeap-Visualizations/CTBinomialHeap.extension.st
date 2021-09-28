Extension { #name : #CTBinomialHeap }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialHeap >> asShapeForest [

	| shapes |
	shapes := representation asLinkedList collect: [ :anAssociation | 
		          | c |
		          c := anAssociation value asShapeTree.
		          (RSComposite new
			           shapes: { c asShape };
			           padding: 5;
			           withBorder;
			           yourself) @ (RSLabeled new text: anAssociation key) ].

	RSVerticalLineLayout new
		alignCenter;
		verticalGap: 20;
		applyOn: shapes.

	^ RSComposite new
		  model: self;
		  shapes: shapes;
		  yourself
]
