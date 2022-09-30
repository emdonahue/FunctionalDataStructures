Class {
	#name : #SBRALLeaf,
	#superclass : #Object,
	#instVars : [
		'element'
	],
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #adding }
SBRALLeaf >> add: anElement to: aSpine [
	^ aSpine rest addLeaf: anElement to: aSpine
]

{ #category : #adding }
SBRALLeaf >> addLeaf: anElement to: aSpine [
	^ aSpine addNode: anElement.
]

{ #category : #accessing }
SBRALLeaf >> at: nTh [
	^ element
]

{ #category : #accessing }
SBRALLeaf >> at: nTh put: anElement [
	^ self class new element: anElement.
]

{ #category : #enumerating }
SBRALLeaf >> collect: aBlock [
	^ element isFDSPlaceholder 
		ifTrue: [ self ]
		ifFalse: [ self copy element: (aBlock value: element) ].
]

{ #category : #enumerating }
SBRALLeaf >> do: aBlock [
	element isFDSPlaceholder ifFalse: [
		aBlock value: element ].
]

{ #category : #accessing }
SBRALLeaf >> element [
	^ element
]

{ #category : #accessing }
SBRALLeaf >> element: anObject [
	element := anObject
]

{ #category : #contracts }
SBRALLeaf >> isValid [
	^ true
]

{ #category : #accessing }
SBRALLeaf >> size [
	^ 1
]
