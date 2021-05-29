Class {
	#name : #FDSSequenceable,
	#superclass : #FDSCollection,
	#classVars : [
		'singleton'
	],
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #comparing }
FDSSequenceable >> = aCollection [
	self class = aCollection class ifFalse: [ ^ false ].
	self first = aCollection first ifFalse: [ ^ false ].
	^ self rest = aCollection rest.
]
