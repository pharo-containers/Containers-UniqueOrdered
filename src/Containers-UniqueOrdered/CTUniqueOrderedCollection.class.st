"
UniqueOrderedCollection is an OrderedCollection that does not contain duplicates. 

For add: the order is the order of the first addition: 
hence ((col add: 1; add: 2; add: 1; yourself) indexOf: 1) = 1

For all the methods where the order is explicit addFirst: addLast:, 
previous similar elements are removed. 
"
Class {
	#name : #CTUniqueOrderedCollection,
	#superclass : #OrderedCollection,
	#category : #'Containers-UniqueOrdered'
}

{ #category : #adding }
CTUniqueOrderedCollection >> add: newObject [ 
	"Add newObject to the receiver. Answer newObject. 
	Note that add: is implemented using addLast: so a new element is always added at the end of the receiver."	
		
	"(CTUniqueOrderedCollection new add: 1; add: 2; add: 1; yourself) asArray >>> #(1 2)"

	(self includes: newObject)
		ifFalse: [ ^ super addLast: newObject].
	^ newObject
]

{ #category : #adding }
CTUniqueOrderedCollection >> add: newObject before: oldObject [ 
	"Add the argument, newObject, as an element of the receiver.  Put it
	in the position just preceding oldObject.  Answer newObject."
	
	newObject == oldObject ifTrue: [ ^ newObject ].
	(self includes: newObject)
		ifTrue: [self remove: newObject].
	^ super add: newObject before: oldObject 
]

{ #category : #adding }
CTUniqueOrderedCollection >> addFirst: newObject [
	"Add the argument in the first position of the receiver if it is not already in the receiver."
	
	"(CTUniqueOrderedCollection new add: 1; addLast: 2; addFirst: 3; yourself) asArray >>> #(3 1 2)"
	
	(self includes: newObject)
		ifTrue: [ self remove: newObject ].
	^ super addFirst: newObject
]

{ #category : #adding }
CTUniqueOrderedCollection >> addLast: newObject [ 
	"Add newObject to the end of the receiver. Answer newObject."
	"could certainly be optimized"

	"(CTUniqueOrderedCollection new addLast: 1; addLast: 2; addLast: 3; yourself) asArray >>> #(1 2 3)"
	
	(self includes: newObject)
		ifTrue: [ self remove: newObject ].
	^ super addLast: newObject
]
