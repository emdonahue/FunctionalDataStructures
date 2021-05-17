Class {
	#name : #FDSQueueFull,
	#superclass : #Object,
	#traits : 'FDSAbstractQueueFull',
	#classTraits : 'FDSAbstractQueueFull classTrait',
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #classes }
FDSQueueFull class >> emptyClass [
	^ FDSQueue.
]
