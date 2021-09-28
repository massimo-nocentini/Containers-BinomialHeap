Extension { #name : #Collection }

{ #category : #'*Collections-Sequenceable-BinomialHeap' }
Collection >> asBinomialHeap [

	^ self asBinaryTree: BinomialHeap
]
