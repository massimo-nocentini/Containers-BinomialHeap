Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTBinomialHeap: aHeap [

	^ (self visitObject: aHeap) , { 
		  (self newSlotDescriptor
			   selector: #min;
			   enablePredicate: [ aHeap isEmpty not ];
			   yourself).

		  (self newSlotDescriptor
			   selector: #asShapeForest;
			   inline;
			   quote) }
]
