Class {
	#name : #FDSQueueFull,
	#superclass : #FDSSequenceable,
	#instVars : [
		'head',
		'tail'
	],
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #classes }
FDSQueueFull class >> emptyClass [
	^ FDSQueue.
]

{ #category : #'instance creation' }
FDSQueueFull class >> head: aHead [
	^ aHead 
		ifEmpty: self empty
		ifNotEmpty: [ self head: aHead tail: self listClass empty ].
]

{ #category : #'instance creation' }
FDSQueueFull class >> head: aHead tail: aTail [
	^ aHead 
		ifEmpty: [ self head: aTail reverse ]
		ifNotEmpty: [ self new head: aHead; tail: aTail ].
]

{ #category : #comparing }
FDSQueueFull >> = aCollection [
	self class = aCollection class ifFalse: [ ^ false ].
	self first = aCollection first ifFalse: [ ^ false ].
	^ self rest = aCollection rest.
]

{ #category : #adding }
FDSQueueFull >> add: anElement [
	^ self copy head: head; tail: (tail add: anElement).
]

{ #category : #enumerating }
FDSQueueFull >> anySatisfy: aBlock [ 
	self detect: aBlock ifNone: [ ^ false ].
	^ true.
]

{ #category : #lazy }
FDSQueueFull >> append: aQueue [
	^ self class head: head tail: (aQueue tail append: (aQueue head append: tail)).
]

{ #category : #converting }
FDSQueueFull >> asArray [ 
	^ self inject: #() into: [ :a :e | a, {e} ].
]

{ #category : #enumerating }
FDSQueueFull >> collect: aBlock [
	^ self class head: (head collect: aBlock) tail: (tail collect: aBlock).
]

{ #category : #'as yet unclassified' }
FDSQueueFull >> do: aBlock [
	head do: aBlock.
	tail reverseDo: aBlock.
]

{ #category : #accessing }
FDSQueueFull >> first [ 
	^ head first.
]

{ #category : #'private-accessing' }
FDSQueueFull >> head [ 	
	^ head.
]

{ #category : #accessing }
FDSQueueFull >> head: anObject [
	head := anObject
]

{ #category : #lazy }
FDSQueueFull >> rejectOne: aBlock [ 
	^ head detect: aBlock 
		ifFound: [ self class head: (head rejectOne: aBlock) tail: tail ]
		ifNone: [ self class head: head tail: (tail rejectOne: aBlock) ].
]

{ #category : #'as yet unclassified' }
FDSQueueFull >> replace: rBlock ifFound: fBlock [
	^ self class head: (head replace: rBlock ifFound: fBlock ifNone: [
		^ self class head: head tail: (tail replace: rBlock ifFound: fBlock) ]) tail: tail.
]

{ #category : #'as yet unclassified' }
FDSQueueFull >> replace: rBlock ifFound: fBlock ifNone: nBlock [
	^ self class head: 
		(head replace: rBlock ifFound: fBlock ifNone: 
			[ ^ self class head: head tail: 
				(tail replace: rBlock ifFound: fBlock ifNone: [ ^ nBlock value ]) ]) 
		tail: tail.
]

{ #category : #accessing }
FDSQueueFull >> rest [ 
	^ head rest 
		ifEmpty: [ self class head: tail reverse ]
		ifNotEmpty: [ self class head: head rest tail: tail ].
]

{ #category : #enumerating }
FDSQueueFull >> reverseDo: aBlock [
	tail do: aBlock.
	head reverseDo: aBlock.
]

{ #category : #enumerating }
FDSQueueFull >> select: aBlock [
	^ self class head: (head select: aBlock) tail: (tail select: aBlock).
]

{ #category : #'private-accessing' }
FDSQueueFull >> tail [ 	
	^ tail.
]

{ #category : #accessing }
FDSQueueFull >> tail: anObject [
	tail := anObject
]
