"
UniqueOrderedCollection is an OrderedCollection that does not contain duplicates. 

For add: the order is the order of the first addition: hence ((col add: 1; add: 2; add: 1; yourself) indexOf: 1) = 1
For all the methods where the order is explicit addFirst: addLast:, previous similar elements are removed. 
"
Class {
	#name : #CTUniqueOrderedCollection,
	#superclass : #OrderedCollection,
	#category : #'Containers-UniqueOrdered'
}

{ #category : #adding }
CTUniqueOrderedCollection >> add: newObject [ 
	"Add newObject to the receiver.  Answer newObject."	

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
	
	(self includes: newObject)
		ifTrue: [ self remove: newObject ].
	^ super addFirst: newObject
]

{ #category : #adding }
CTUniqueOrderedCollection >> addLast: newObject [ 
	"Add newObject to the end of the receiver.  Answer newObject."
	"could certainly be optimized"

	(self includes: newObject)
		ifTrue: [ self remove: newObject ].
	^ super addLast: newObject
]
