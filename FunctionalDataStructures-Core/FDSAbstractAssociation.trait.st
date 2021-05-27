Trait {
	#name : #FDSAbstractAssociation,
	#instVars : [
		'key',
		'val'
	],
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #'as yet unclassified' }
FDSAbstractAssociation classSide >> key: aKey val: aValue [
	^ self new key: aKey; val: aValue.
]

{ #category : #comparing }
FDSAbstractAssociation >> = anAssociation [
	anAssociation isFDSAssociation ifFalse: [ ^ false ].
	^ key = anAssociation key & (val = anAssociation val).
]

{ #category : #testing }
FDSAbstractAssociation >> isFDSAssociation [
	^ true.
]

{ #category : #accessing }
FDSAbstractAssociation >> key [
	^ key
]

{ #category : #accessing }
FDSAbstractAssociation >> key: anObject [
	key := anObject
]

{ #category : #printing }
FDSAbstractAssociation >> printOn: aStream [
	key printOn: aStream.
	aStream nextPutAll: '->'.
	val printOn: aStream.
]

{ #category : #accessing }
FDSAbstractAssociation >> val [
	^ val
]

{ #category : #accessing }
FDSAbstractAssociation >> val: anObject [
	val := anObject
]
