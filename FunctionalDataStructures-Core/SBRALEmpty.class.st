Class {
	#name : #SBRALEmpty,
	#superclass : #SBRAL,
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #adding }
SBRALEmpty >> add: anElement [
	^ SBRALSpine
		tree: (SBRALLeaf new element: anElement)
		rest: self.
]

{ #category : #adding }
SBRALEmpty >> addLeaf: anElement to: aSpine [
	^ aSpine addLeaf: anElement.
]

{ #category : #adding }
SBRALEmpty >> addNode: anElement to: aSpine [
	^ aSpine addLeaf: anElement
]

{ #category : #accessing }
SBRALEmpty >> at: anIndex put: anElement [
	^ self add: anElement at: anIndex.
]

{ #category : #testing }
SBRALEmpty >> isEmpty [
	^ true
]

{ #category : #contracts }
SBRALEmpty >> isValid [
	^ true
]

{ #category : #accessing }
SBRALEmpty >> size [
	^ 0
]
