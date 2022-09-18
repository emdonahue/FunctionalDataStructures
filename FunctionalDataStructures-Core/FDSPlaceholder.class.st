Class {
	#name : #FDSPlaceholder,
	#superclass : #Object,
	#classInstVars : [
		'placeholder'
	],
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #accessing }
FDSPlaceholder class >> placeholder [
	^ placeholder ifNil: [ placeholder := self new ]
]

{ #category : #enumerating }
FDSPlaceholder >> do: aBlock [
]

{ #category : #testing }
FDSPlaceholder >> isFDSPlaceholder [
	^ true.
]
