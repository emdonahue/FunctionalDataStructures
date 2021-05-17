Class {
	#name : #FDSLinkedList,
	#superclass : #Object,
	#traits : 'FDSAbstractLinkedListEmpty',
	#classTraits : 'FDSAbstractLinkedListEmpty classTrait',
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #classes }
FDSLinkedList class >> fullClass [
	^ FDSLinkedListFull.
]
