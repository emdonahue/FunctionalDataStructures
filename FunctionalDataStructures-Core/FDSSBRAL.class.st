Class {
	#name : #FDSSBRAL,
	#superclass : #FDSEmpty,
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #classes }
FDSSBRAL class >> fullClass [
	^ FDSSBRALSpine
]

{ #category : #adding }
FDSSBRAL >> add: anElement [
	^ self fullClass
		tree: (FDSSBRALLeaf new element: anElement)
		rest: self.
]

{ #category : #adding }
FDSSBRAL >> add: anElement at: anIndex [
	"Adds anElement at a non-existent index by extending with placeholders. anIndex is negative or 0, signifying the negative index at which it should be placed."
	<type: #VoidC type: #(OrC negative isZero) type: #FDSSBRALSpine>
	^ ((1 to: anIndex negated) inject: self into: [ :sbral :i | 
		sbral add: FDSPlaceholder placeholder ]) add: anElement
]

{ #category : #adding }
FDSSBRAL >> addLeaf: anElement to: aSpine [
	^ aSpine addLeaf: anElement.
]

{ #category : #adding }
FDSSBRAL >> addNode: anElement to: aSpine [
	^ aSpine addLeaf: anElement
]

{ #category : #accessing }
FDSSBRAL >> at: anIndex put: anElement [
	^ self add: anElement at: anIndex.
]

{ #category : #testing }
FDSSBRAL >> isEmpty [
	^ true
]

{ #category : #contracts }
FDSSBRAL >> isValid [
	^ true
]

{ #category : #accessing }
FDSSBRAL >> size [
	^ 0
]
