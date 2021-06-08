Class {
	#name : #FDSQueueNonEmpty,
	#superclass : #FDSSequenceable,
	#instVars : [
		'head',
		'tail'
	],
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #classes }
FDSQueueNonEmpty class >> emptyClass [
	^ FDSQueue.
]

{ #category : #'instance creation' }
FDSQueueNonEmpty class >> head: aHead [
	^ aHead 
		ifEmpty: self empty
		ifNotEmpty: [ self head: aHead tail: self listClass empty ].
]

{ #category : #'instance creation' }
FDSQueueNonEmpty class >> head: aHead tail: aTail [
	^ aHead 
		ifEmpty: [ self head: aTail reverse ]
		ifNotEmpty: [ self new head: aHead; tail: aTail ].
]

{ #category : #comparing }
FDSQueueNonEmpty >> = aCollection [
	self class = aCollection class ifFalse: [ ^ false ].
	self first = aCollection first ifFalse: [ ^ false ].
	^ self rest = aCollection rest.
]

{ #category : #adding }
FDSQueueNonEmpty >> add: anElement [
	^ self copy head: head; tail: (tail add: anElement).
]

{ #category : #enumerating }
FDSQueueNonEmpty >> anySatisfy: aBlock [ 
	self detect: aBlock ifNone: [ ^ false ].
	^ true.
]

{ #category : #lazy }
FDSQueueNonEmpty >> append: aQueue [
	^ self class head: head tail: (aQueue tail append: (aQueue head append: tail)).
]

{ #category : #converting }
FDSQueueNonEmpty >> asArray [ 
	^ self inject: #() into: [ :a :e | a, {e} ].
]

{ #category : #enumerating }
FDSQueueNonEmpty >> collect: aBlock [
	^ self class head: (head collect: aBlock) tail: (tail collect: aBlock).
]

{ #category : #'as yet unclassified' }
FDSQueueNonEmpty >> do: aBlock [
	head do: aBlock.
	tail reverseDo: aBlock.
]

{ #category : #accessing }
FDSQueueNonEmpty >> first [ 
	^ head first.
]

{ #category : #'private-accessing' }
FDSQueueNonEmpty >> head [ 	
	^ head.
]

{ #category : #accessing }
FDSQueueNonEmpty >> head: anObject [
	head := anObject
]

{ #category : #lazy }
FDSQueueNonEmpty >> remove: anEltOrBlock [
	| blk |
	blk := anEltOrBlock isBlock ifTrue: anEltOrBlock ifFalse: [ [ :e | anEltOrBlock = e ] ].
	^ head detect: blk 
		ifFound: [ self class head: (head remove: blk) tail: tail ]
		ifNone: [ self class head: head tail: (tail remove: blk) ].
]

{ #category : #lazy }
FDSQueueNonEmpty >> remove: rBlock ifPresent: pBlock ifAbsent: aBlock [
	rBlock isBlock ifFalse: [ ^ super remove: rBlock ifPresent: pBlock ifAbsent: aBlock ].
	^ self class head: (head remove: rBlock ifPresent: pBlock ifAbsent: [
		^ self class head: head tail: (tail remove: rBlock ifPresent: pBlock ifAbsent: aBlock) ]) tail: tail.
]

{ #category : #'as yet unclassified' }
FDSQueueNonEmpty >> replace: rBlock ifFound: fBlock [
	^ self class head: (head replace: rBlock ifFound: fBlock ifNone: [
		^ self class head: head tail: (tail replace: rBlock ifFound: fBlock) ]) tail: tail.
]

{ #category : #'as yet unclassified' }
FDSQueueNonEmpty >> replace: rBlock ifFound: fBlock ifNone: nBlock [
	^ self class head: 
		(head replace: rBlock ifFound: fBlock ifNone: 
			[ ^ self class head: head tail: 
				(tail replace: rBlock ifFound: fBlock ifNone: [ ^ nBlock value ]) ]) 
		tail: tail.
]

{ #category : #accessing }
FDSQueueNonEmpty >> rest [ 
	^ head rest 
		ifEmpty: [ self class head: tail reverse ]
		ifNotEmpty: [ self class head: head rest tail: tail ].
]

{ #category : #enumerating }
FDSQueueNonEmpty >> reverseDo: aBlock [
	tail do: aBlock.
	head reverseDo: aBlock.
]

{ #category : #enumerating }
FDSQueueNonEmpty >> select: aBlock [
	^ self class head: (head select: aBlock) tail: (tail select: aBlock).
]

{ #category : #'private-accessing' }
FDSQueueNonEmpty >> tail [ 	
	^ tail.
]

{ #category : #accessing }
FDSQueueNonEmpty >> tail: anObject [
	tail := anObject
]
