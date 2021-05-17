Class {
	#name : #FDSQueueTest,
	#superclass : #TestCase,
	#category : #'FunctionalDataStructures-Test'
}

{ #category : #tests }
FDSQueueTest >> testRemove [ 
	self assert: ((FDSQueue with: 1) remove: 1) equals: FDSQueue empty.
	self assert: ((FDSQueue with: 1 with: 2) remove: 1) equals: (FDSQueue with: 2).
	self assert: ((FDSQueue with: 1 with: 2) remove: 2) equals: (FDSQueue with: 1).
	self assert: ((FDSQueue with: 1 with: 2 with: 3) remove: 1) equals: (FDSQueue with: 2 with: 3).
	self assert: ((FDSQueue with: 1 with: 2 with: 3) remove: 2) equals: (FDSQueue with: 1 with: 3).
	self assert: ((FDSQueue with: 1 with: 2 with: 3) remove: 3) equals: (FDSQueue with: 1 with: 2).
]
