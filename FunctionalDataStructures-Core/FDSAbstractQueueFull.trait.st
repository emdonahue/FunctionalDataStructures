Trait {
	#name : #FDSAbstractQueueFull,
	#instVars : [
		'head',
		'tail'
	],
	#traits : 'FDSAbstractQueue + FDSSequenceableNonEmpty',
	#classTraits : 'FDSAbstractQueue classTrait + FDSSequenceableNonEmpty classTrait',
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #adding }
FDSAbstractQueueFull >> add: anElement [
	^ self copy head: head; tail: (tail add: anElement).
]

{ #category : #enumerating }
FDSAbstractQueueFull >> do: aBlock [
	head do: aBlock.
	tail reverseDo: aBlock.
]

{ #category : #accessing }
FDSAbstractQueueFull >> first [ 
	^ head first.
]

{ #category : #accessing }
FDSAbstractQueueFull >> head: anObject [
	head := anObject
]

{ #category : #lazy }
FDSAbstractQueueFull >> rejectOne: aBlock [ 
	^ head detect: aBlock 
		ifFound: [ self class head: (head rejectOne: aBlock) tail: tail ]
		ifNone: [ self class head: head tail: (tail rejectOne: aBlock) ].
]

{ #category : #accessing }
FDSAbstractQueueFull >> rest [ 
	^ head rest 
		ifEmpty: [ self class head: tail reverse ]
		ifNotEmpty: [ self class head: head rest tail: tail ].
]

{ #category : #accessing }
FDSAbstractQueueFull >> tail: anObject [
	tail := anObject
]
