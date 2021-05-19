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
