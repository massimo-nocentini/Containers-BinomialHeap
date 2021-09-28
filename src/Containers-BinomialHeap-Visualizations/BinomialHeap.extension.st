Extension { #name : #BinomialHeap }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialHeap >> associations [
	^ self associations: representation
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialHeap >> associations: aValueLink [
	^ aValueLink
		ifNotNil: [ aValueLink value ~~> (self associations: aValueLink nextLink) ]
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialHeap >> gtInspectorTreesInCanvas: aCanvas [
	| shapes |
	shapes := representation asLinkedList collect: [ :anAssociation | 
		          | c |
		          c := anAssociation value gtInspectorTreeViewUsingCanvas:
			               RSCanvas new.
		          (RSComposite new
			           shapes: { c asShape };
			           padding: 5;
			           withBorder;
			           yourself) @ (RSLabeled new text: anAssociation key) ].
	RSVerticalLineLayout new
		alignCenter;
		verticalGap: 20;
		applyOn: shapes.
	^ aCanvas
		  addAll: shapes;
		  yourself
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialHeap >> gtInspectorTreesViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal3
		  title: 'Trees';
		  initializeCanvas: [ 
			  | c |
			  c := self gtInspectorTreesInCanvas: RSCanvas new.
			  c @ RSCanvasController ];
		  yourself
]
