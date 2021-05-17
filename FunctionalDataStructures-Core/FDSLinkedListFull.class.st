Class {
	#name : #FDSLinkedListFull,
	#superclass : #Object,
	#traits : 'FDSAbstractLinkedListFull',
	#classTraits : 'FDSAbstractLinkedListFull classTrait',
	#instVars : [
		'first',
		'rest'
	],
	#category : #'FunctionalDataStructures-Core-concrete'
}

{ #category : #classes }
FDSLinkedListFull class >> emptyClass [
	^ FDSLinkedList.
]
