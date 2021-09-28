Extension { #name : #CTBinomialTree }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> asShapeTree [

	| shapes lines |
	shapes := self nodes.
	lines := self edges
]

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
CTBinomialTree >> nodes [
	| subtreeChildren |
	subtreeChildren := children asLinkedList flatCollect: [ 
		                   :aBinomialTree | aBinomialTree nodes ].
	^ Array with: self withAll: subtreeChildren
]
