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

{ #category : #lazy }
FDSAbstractQueueFull >> append: aQueue [
	^ self class head: head tail: (aQueue tail append: (aQueue head append: tail)).
]

{ #category : #enumerating }
FDSAbstractQueueFull >> collect: aBlock [
	^ self class head: (head collect: aBlock) tail: (tail collect: aBlock).
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

{ #category : #'private-accessing' }
FDSAbstractQueueFull >> head [ 	
	^ head.
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

{ #category : #'as yet unclassified' }
FDSAbstractQueueFull >> replace: rBlock ifFound: fBlock [
	^ self class head: (head replace: rBlock ifFound: fBlock ifNone: [
		^ self class head: head tail: (tail replace: rBlock ifFound: fBlock) ]) tail: tail.
]

{ #category : #'as yet unclassified' }
FDSAbstractQueueFull >> replace: rBlock ifFound: fBlock ifNone: nBlock [
	^ self class head: 
		(head replace: rBlock ifFound: fBlock ifNone: 
			[ ^ self class head: head tail: 
				(tail replace: rBlock ifFound: fBlock ifNone: [ ^ nBlock value ]) ]) 
		tail: tail.
]

{ #category : #accessing }
FDSAbstractQueueFull >> rest [ 
	^ head rest 
		ifEmpty: [ self class head: tail reverse ]
		ifNotEmpty: [ self class head: head rest tail: tail ].
]

{ #category : #enumerating }
FDSAbstractQueueFull >> reverseDo: aBlock [
	tail do: aBlock.
	head reverseDo: aBlock.
]

{ #category : #enumerating }
FDSAbstractQueueFull >> select: aBlock [
	^ self class head: (head select: aBlock) tail: (tail select: aBlock).
]

{ #category : #'private-accessing' }
FDSAbstractQueueFull >> tail [ 	
	^ tail.
]

{ #category : #accessing }
FDSAbstractQueueFull >> tail: anObject [
	tail := anObject
]
