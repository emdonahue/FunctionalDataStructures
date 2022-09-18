Class {
	#name : #SBRAL,
	#superclass : #FDSEmpty,
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #adding }
SBRAL >> add: anElement [
	^ SBRALSpine
		tree: (SBRALLeaf new element: anElement)
		rest: self.
]

{ #category : #adding }
SBRAL >> add: anElement at: anIndex [
	"Adds anElement at a non-existent index by extending with placeholders. anIndex is negative or 0, signifying the negative index at which it should be placed."
	<type: #VoidC type: #(OrC negative isZero) type: #SBRALSpine>
	^ ((1 to: anIndex negated) inject: self into: [ :sbral :i | 
		sbral add: FDSPlaceholder placeholder ]) add: anElement
]

{ #category : #adding }
SBRAL >> addLeaf: anElement to: aSpine [
	^ aSpine addLeaf: anElement.
]

{ #category : #adding }
SBRAL >> addNode: anElement to: aSpine [
	^ aSpine addLeaf: anElement
]

{ #category : #accessing }
SBRAL >> at: anIndex put: anElement [
	^ self add: anElement at: anIndex.
]

{ #category : #testing }
SBRAL >> isEmpty [
	^ true
]

{ #category : #contracts }
SBRAL >> isValid [
	^ true
]

{ #category : #accessing }
SBRAL >> size [
	^ 0
]
