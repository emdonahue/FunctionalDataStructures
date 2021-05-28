Class {
	#name : #FDSLinkedListNonEmpty,
	#superclass : #FDSSequenceable,
	#instVars : [
		'first',
		'rest'
	],
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #classes }
FDSLinkedListNonEmpty class >> emptyClass [
	^ FDSLinkedList.
]

{ #category : #'instance creation' }
FDSLinkedListNonEmpty class >> first: aFirst rest: aRest [
	^ self new first: aFirst; rest: aRest.
]

{ #category : #adding }
FDSLinkedListNonEmpty >> add: anElement [
	^ self class first: anElement rest: self.
]

{ #category : #lazy }
FDSLinkedListNonEmpty >> append: aLinkedList [
	^ (rest append: aLinkedList) add: first.
]

{ #category : #accessing }
FDSLinkedListNonEmpty >> at: aKey ifPresent: pBlock ifAbsentPut: aBlock [ 
	^ self replace: [ :a | a isFDSAssociation and: [ aKey = a key ]]
		ifFound: [ :a | self associationClass key: a key val: (pBlock value: a val) ]
		ifNone: [ self add: (self associationClass key: aKey val: aBlock value) ].
]

{ #category : #enumerating }
FDSLinkedListNonEmpty >> collect: aBlock [ 
	^ (rest collect: aBlock) add: (aBlock value: first).
]

{ #category : #'as yet unclassified' }
FDSLinkedListNonEmpty >> do: aBlock [
	aBlock value: first.
	rest do: aBlock.
]

{ #category : #accessing }
FDSLinkedListNonEmpty >> first [
	^ first
]

{ #category : #accessing }
FDSLinkedListNonEmpty >> first: anObject [
	first := anObject
]

{ #category : #lazy }
FDSLinkedListNonEmpty >> rejectOne: aBlock [
	^ (aBlock value: first) 
		ifTrue: rest
		ifFalse: [ (rest rejectOne: aBlock) add: first ].
	
]

{ #category : #'as yet unclassified' }
FDSLinkedListNonEmpty >> replace: rBlock ifFound: fBlock [ 
	(rBlock value: first) 
		ifTrue: [ ^ rest add: (fBlock cull: first) ].
	^ (rest replace: rBlock ifFound: fBlock) add: first.
]

{ #category : #'as yet unclassified' }
FDSLinkedListNonEmpty >> replace: rBlock ifFound: fBlock ifNone: nBlock [
	| replaced r |
	replaced := false.
	r := self replace: [ :e | replaced := replaced | (rBlock value: e) ] ifFound: fBlock.
	^ replaced ifTrue: r ifFalse: nBlock.
	
]

{ #category : #accessing }
FDSLinkedListNonEmpty >> rest [
	^ rest
]

{ #category : #accessing }
FDSLinkedListNonEmpty >> rest: anObject [
	rest := anObject
]

{ #category : #removing }
FDSLinkedListNonEmpty >> reverse [
	^ self inject: self class empty into: [ :r :e | r add: e ].
]

{ #category : #enumerating }
FDSLinkedListNonEmpty >> reverseDo: aBlock [ 
	rest reverseDo: aBlock.
	aBlock value: first.
]

{ #category : #enumerating }
FDSLinkedListNonEmpty >> select: aBlock [
	^ (aBlock value: first) 
		ifTrue: [ (rest select: aBlock) add: first ]
		ifFalse: [ rest select: aBlock ].
]
