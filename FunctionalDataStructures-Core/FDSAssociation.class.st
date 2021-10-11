Class {
	#name : #FDSAssociation,
	#superclass : #Object,
	#instVars : [
		'key',
		'val'
	],
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #'as yet unclassified' }
FDSAssociation class >> key: aKey val: aValue [
	^ self new key: aKey; val: aValue.
]

{ #category : #comparing }
FDSAssociation >> = anAssociation [
	anAssociation isFDSAssociation ifFalse: [ ^ false ].
	^ key = anAssociation key & (val = anAssociation val).
]

{ #category : #testing }
FDSAssociation >> isFDSAssociation [
	^ true.
]

{ #category : #accessing }
FDSAssociation >> key [
	^ key
]

{ #category : #accessing }
FDSAssociation >> key: anObject [
	key := anObject
]

{ #category : #printing }
FDSAssociation >> printOn: aStream [
	key printOn: aStream.
	aStream nextPutAll: '->'.
	val printOn: aStream.
]

{ #category : #accessing }
FDSAssociation >> val [
	^ val
]

{ #category : #accessing }
FDSAssociation >> val: anObject [
	val := anObject
]
