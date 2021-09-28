Extension { #name : #CTBinomialTree }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> edges [
	^ self edges: content -> content ~~> nil
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> edges: incomingEdges [
	^ children asLinkedList
		foldr: [ :each :acc | each edges: content -> each content ~~> acc ]
		init: incomingEdges
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> gtInspectorRecursiveSlotsInCanvas: aCanvas knownReferencesSet: aSet [
	| aGroup |
	aGroup := RSGroup new.
	self asRecursiveSlotsInGroup: aGroup knownReferencesSet: aSet.
	aGroup @ RSDraggable.
	^ aCanvas
		  addAll: aGroup;
		  yourself
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> gtInspectorRecursiveSlotsViewIn: composite [
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
CTBinomialTree >> gtInspectorTreeViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal3
		  title: 'Tree';
		  initializeCanvas: [ self gtInspectorTreeViewUsingCanvas: RSCanvas new ];
		  yourself
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> gtInspectorTreeViewUsingCanvas: aCanvas [
	^ self edges asLinkedList asTree
		  gtInspectorGraphViewIn: aCanvas
		  vertexBlock: [ :aVertex | 
			  RSLabel new
				  text: aVertex content;
				  color: Color black;
				  yourself ]
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> instVarsNamesOrderedCollection [
	"We choose the following order in which the `value` slot is 
	the rightmost because that allows us to compose better shapes 
	pointed by its reference."

	^ { 
		  #children asReflexiveAssociation.
		  #content asReflexiveAssociation }
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> nodes [
	| subtreeChildren |
	subtreeChildren := children asLinkedList flatCollect: [ 
		                   :aBinomialTree | aBinomialTree nodes ].
	^ Array with: self withAll: subtreeChildren
]
