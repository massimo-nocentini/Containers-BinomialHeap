Extension { #name : #BinomialTree }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialTree >> edges [
	^ self edges: content -> content ~~> nil
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialTree >> edges: incomingEdges [
	^ children asLinkedList
		foldr: [ :each :acc | each edges: content -> each content ~~> acc ]
		init: incomingEdges
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialTree >> gtInspectorRecursiveSlotsInCanvas: aCanvas knownReferencesSet: aSet [
	| aGroup |
	aGroup := RSGroup new.
	self asRecursiveSlotsInGroup: aGroup knownReferencesSet: aSet.
	aGroup @ RSDraggable.
	^ aCanvas
		  addAll: aGroup;
		  yourself
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialTree >> gtInspectorRecursiveSlotsViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal3
		  title: 'Recursive slots';
		  initializeCanvas: [ 
			  | aCanvas |
			  aCanvas := self
				             gtInspectorRecursiveSlotsInCanvas: RSCanvas new
				             knownReferencesSet: IdentitySet empty.
			  aCanvas @ RSCanvasController ];
		  yourself
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialTree >> gtInspectorTreeViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal3
		  title: 'Tree';
		  initializeCanvas: [ self gtInspectorTreeViewUsingCanvas: RSCanvas new ];
		  yourself
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialTree >> gtInspectorTreeViewUsingCanvas: aCanvas [
	^ self edges asLinkedList asTree
		  gtInspectorGraphViewIn: aCanvas
		  vertexBlock: [ :aVertex | 
			  RSLabel new
				  text: aVertex content;
				  color: Color black;
				  yourself ]
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialTree >> instVarsNamesOrderedCollection [
	"We choose the following order in which the `value` slot is 
	the rightmost because that allows us to compose better shapes 
	pointed by its reference."

	^ { 
		  #children asReflexiveAssociation.
		  #content asReflexiveAssociation }
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
BinomialTree >> nodes [
	| subtreeChildren |
	subtreeChildren := children asLinkedList flatCollect: [ 
		                   :aBinomialTree | aBinomialTree nodes ].
	^ Array with: self withAll: subtreeChildren
]
