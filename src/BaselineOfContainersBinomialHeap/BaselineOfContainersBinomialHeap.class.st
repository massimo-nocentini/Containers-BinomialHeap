"
I am the baseline of `Containers-BinomialHeap`: I load the packages `Containers-BinomialHeap`, `Containers-BinomialHeap-Visualizations` and `Containers-BinomialHeap-Tests`, and the projects `Containers-Essentials` and `Containers-BinaryTreeAbstract` that they require.

```smalltalk
Metacello new
	baseline: 'ContainersBinomialHeap';
	repository: 'github://massimo-nocentini/Containers-BinomialHeap:master/src';
	load
```
"
Class {
	#name : #BaselineOfContainersBinomialHeap,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersBinomialHeap
}

{ #category : #baselines }
BaselineOfContainersBinomialHeap >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		spec
			baseline: 'ContainersBinaryTreeAbstract'
			with: [ spec repository: 'github://massimo-nocentini/Containers-BinaryTreeAbstract:master/src' ].

		"Packages"
		spec
			package: 'Containers-BinomialHeap'
			with: [ spec requires: #( 'ContainersEssentials' ) ];
			package: 'Containers-BinomialHeap-Visualizations'
			with: [ spec requires: #( 'Containers-BinomialHeap' ) ];
			package: 'Containers-BinomialHeap-Tests'
			with: [ spec requires: #( 'Containers-BinomialHeap' 'ContainersBinaryTreeAbstract' ) ] ]
]
