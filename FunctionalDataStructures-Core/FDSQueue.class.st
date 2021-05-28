Class {
	#name : #FDSQueue,
	#superclass : #FDSEmpty,
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #classes }
FDSQueue class >> fullClass [
	^ FDSQueueFull.
]

{ #category : #'instance creation' }
FDSQueue class >> with: aElement with: bElement [
	^ (self with: aElement) add: bElement.
]

{ #category : #'instance creation' }
FDSQueue class >> with: aElement with: bElement with: cElement [
	^ (self with: aElement with: bElement) add: cElement.
]

{ #category : #'instance creation' }
FDSQueue class >> with: aElement with: bElement with: cElement with: dElement [
	^ (self with: aElement with: bElement with: cElement) add: dElement.
]

{ #category : #adding }
FDSQueue >> add: anElement [
	^ self fullClass head: (self listClass with: anElement) tail: self listClass empty.
]
