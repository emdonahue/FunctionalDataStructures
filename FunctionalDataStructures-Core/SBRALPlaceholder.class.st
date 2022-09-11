Class {
	#name : #SBRALPlaceholder,
	#superclass : #Object,
	#classInstVars : [
		'placeholder'
	],
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #accessing }
SBRALPlaceholder class >> placeholder [
	^ placeholder ifNil: [ placeholder := self new ]
]
