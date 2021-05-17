Class {
	#name : #FDSQueue,
	#superclass : #Object,
	#traits : 'FDSAbstractQueueEmpty',
	#classTraits : 'FDSAbstractQueueEmpty classTrait',
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #'as yet unclassified' }
FDSQueue class >> fullClass [
	^ FDSQueueFull.
]
