Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTBinomialHeap: aHeap [

	^ (self visitObject: aHeap) , { 
		  ((self newSlotDescriptorSelector: #min) enablePredicate: [ 
			   aHeap isEmpty not ]).
		  ((self newSlotDescriptorSelector: #asShapeForest)
			   inline;
			   quote) }
]
