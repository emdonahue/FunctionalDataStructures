Class {
	#name : #FDSLinkedList,
	#superclass : #FDSEmpty,
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #accessing }
FDSLinkedList class >> first: anElement rest: aList [
	^ self fullClass first: anElement rest: aList.
]

{ #category : #classes }
FDSLinkedList class >> fullClass [
	^ FDSLinkedListNonEmpty.
]

{ #category : #'instance creation' }
FDSLinkedList class >> with: aElement with: bElement [
	^ (self with: bElement) add: aElement.
]

{ #category : #'instance creation' }
FDSLinkedList class >> with: aElement with: bElement with: cElement [
	^ (self with: bElement with: cElement) add: aElement.
]

{ #category : #'instance creation' }
FDSLinkedList class >> with: aElement with: bElement with: cElement with: dElement [
	^ (self with: bElement with: cElement with: dElement) add: aElement.
]

{ #category : #adding }
FDSLinkedList >> add: anElement [
	^ self class first: anElement rest: self.
]
