Extension { #name : #Collection }

{ #category : #'*Containers-BinomialHeap' }
Collection >> asBinomialHeap [

	^ self asBinaryTree: CTBinomialHeap
]
