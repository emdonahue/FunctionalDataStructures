Trait {
	#name : #FDSAbstractLinkedListFull,
	#instVars : [
		'first',
		'rest'
	],
	#traits : 'FDSAbstractLinkedList + FDSSequenceableNonEmpty',
	#classTraits : 'FDSAbstractLinkedList classTrait + FDSSequenceableNonEmpty classTrait',
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #lazy }
FDSAbstractLinkedListFull >> append: aLinkedList [
	^ (rest append: aLinkedList) add: first.
]

{ #category : #accessing }
FDSAbstractLinkedListFull >> at: aKey ifPresent: pBlock ifAbsentPut: aBlock [ 
	^ self replace: [ :a | a isFDSAssociation and: [ aKey = a key ]]
		ifFound: [ :a | self associationClass key: a key val: (pBlock value: a val) ]
		ifNone: [ self add: (self associationClass key: aKey val: aBlock value) ].
]

{ #category : #enumerating }
FDSAbstractLinkedListFull >> collect: aBlock [ 
	^ (rest collect: aBlock) add: (aBlock value: first).
]

{ #category : #enumerating }
FDSAbstractLinkedListFull >> do: aBlock [
	aBlock value: first.
	rest do: aBlock.
]

{ #category : #accessing }
FDSAbstractLinkedListFull >> first [
	^ first
]

{ #category : #accessing }
FDSAbstractLinkedListFull >> first: anObject [
	first := anObject
]

{ #category : #lazy }
FDSAbstractLinkedListFull >> rejectOne: aBlock [
	^ (aBlock value: first) 
		ifTrue: rest
		ifFalse: [ (rest rejectOne: aBlock) add: first ].
	
]

{ #category : #'as yet unclassified' }
FDSAbstractLinkedListFull >> replace: rBlock ifFound: fBlock [ 
	(rBlock value: first) 
		ifTrue: [ ^ rest add: (fBlock cull: first) ].
	^ (rest replace: rBlock ifFound: fBlock) add: first.
]

{ #category : #'as yet unclassified' }
FDSAbstractLinkedListFull >> replace: rBlock ifFound: fBlock ifNone: nBlock [
	| replaced r |
	replaced := false.
	r := self replace: [ :e | replaced := replaced | (rBlock value: e) ] ifFound: fBlock.
	^ replaced ifTrue: r ifFalse: nBlock.
	
]

{ #category : #accessing }
FDSAbstractLinkedListFull >> rest [
	^ rest
]

{ #category : #accessing }
FDSAbstractLinkedListFull >> rest: anObject [
	rest := anObject
]

{ #category : #removing }
FDSAbstractLinkedListFull >> reverse [
	^ self inject: self class empty into: [ :r :e | r add: e ].
]

{ #category : #enumerating }
FDSAbstractLinkedListFull >> reverseDo: aBlock [ 
	rest reverseDo: aBlock.
	aBlock value: first.
]

{ #category : #enumerating }
FDSAbstractLinkedListFull >> select: aBlock [
	^ (aBlock value: first) 
		ifTrue: [ (rest select: aBlock) add: first ]
		ifFalse: [ rest select: aBlock ].
]
