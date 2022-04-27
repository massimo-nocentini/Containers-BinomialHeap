Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTBinomialHeap: aHeap [

	^ (self visitObject: aHeap) , { 
		  (self newSlotDescriptorSelector
			   selector: #min;
			   enablePredicate: [ aHeap isEmpty not ];
			   yourself).

		  (self newSlotDescriptorSelector
			   selector: #asShapeForest;
			   inline;
			   quote) }
]
