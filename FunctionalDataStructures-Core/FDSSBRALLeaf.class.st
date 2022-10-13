Class {
	#name : #FDSSBRALLeaf,
	#superclass : #Object,
	#instVars : [
		'element'
	],
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #adding }
FDSSBRALLeaf >> add: anElement to: aSpine [
	^ aSpine rest addLeaf: anElement to: aSpine
]

{ #category : #adding }
FDSSBRALLeaf >> addLeaf: anElement to: aSpine [
	^ aSpine addNode: anElement.
]

{ #category : #accessing }
FDSSBRALLeaf >> at: nTh [
	^ element
]

{ #category : #accessing }
FDSSBRALLeaf >> at: nTh put: anElement [
	^ self class new element: anElement.
]

{ #category : #enumerating }
FDSSBRALLeaf >> collect: aBlock [
	^ element isFDSPlaceholder 
		ifTrue: [ self ]
		ifFalse: [ self copy element: (aBlock value: element) ].
]

{ #category : #enumerating }
FDSSBRALLeaf >> do: aBlock [
	element isFDSPlaceholder ifFalse: [
		aBlock value: element ].
]

{ #category : #accessing }
FDSSBRALLeaf >> element [
	^ element
]

{ #category : #accessing }
FDSSBRALLeaf >> element: anObject [
	element := anObject
]

{ #category : #contracts }
FDSSBRALLeaf >> isValid [
	^ true
]

{ #category : #accessing }
FDSSBRALLeaf >> size [
	^ 1
]
