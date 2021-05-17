Class {
	#name : #FDSLinkedListTest,
	#superclass : #TestCase,
	#category : #'FunctionalDataStructures-Test'
}

{ #category : #tests }
FDSLinkedListTest >> testRejectOne [
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) rejectOne: [ :e | e = 2 ]) equals: (FDSLinkedList with: 1 with: 3).
]

{ #category : #tests }
FDSLinkedListTest >> testRemove [
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) remove: 2) equals: (FDSLinkedList with: 1 with: 3).
]
