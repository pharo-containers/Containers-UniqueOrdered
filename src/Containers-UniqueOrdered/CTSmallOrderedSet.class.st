"
I am set and I also mantain the order in which elements are added when iterating.
"
Class {
	#name : #CTSmallOrderedSet,
	#superclass : #Object,
	#instVars : [
		'size',
		'table'
	],
	#category : #'Containers-UniqueOrdered'
}

{ #category : #'instance creation' }
CTSmallOrderedSet class >> new [
	^ self new: 3
]

{ #category : #'instance creation' }
CTSmallOrderedSet class >> new: anInteger [
	^ self basicNew initialize: anInteger; yourself
]

{ #category : #'instance creation' }
CTSmallOrderedSet class >> withAll: aCollection [
	^ (self new: aCollection size)
		addAll: aCollection;
		yourself
]

{ #category : #adding }
CTSmallOrderedSet >> add: newObject [
	(self findIndexFor: newObject) = 0
		ifTrue: [ self privateAdd: newObject ].
	^ newObject
]

{ #category : #adding }
CTSmallOrderedSet >> addAll: aCollection [
	aCollection do: [ :each |
		self add: each ].
	^ aCollection
]

{ #category : #enumerating }
CTSmallOrderedSet >> do: aOneArgumentBlock [
	1 to: size do: [ :i |
		aOneArgumentBlock value: (table at: i) ]
]

{ #category : #enumerating }
CTSmallOrderedSet >> do: aOneArgumentBlock separatedBy: aNiladicBlock [
	1 to: size do: [ :i |
		i > 1 ifTrue: [ aNiladicBlock value ].
		aOneArgumentBlock value: (table at: i) ]
]

{ #category : #'private ' }
CTSmallOrderedSet >> errorNotFound [
	self error: 'Not found'
]

{ #category : #'private ' }
CTSmallOrderedSet >> findIndexFor: aKey [
	1 to: size do: [ :index |
		(table at: index) = aKey
			ifTrue: [ ^ index ] ].
	^ 0
]

{ #category : #'private ' }
CTSmallOrderedSet >> grow [
	| newTable |
	"#replaceFrom:to:with:startingAt: would be better but not portable"
	newTable := Array new: 2 * size.
	1 to: size do: [ :index |
		newTable at: index put: (table at: index) ].
	table := newTable
]

{ #category : #testing }
CTSmallOrderedSet >> includes: anObject [
	^ (self findIndexFor: anObject) ~= 0
]

{ #category : #initialization }
CTSmallOrderedSet >> initialize: anInteger [
	self initialize.
	size := 0.
	table := Array new: anInteger
]

{ #category : #testing }
CTSmallOrderedSet >> isCollection [
	^ true
]

{ #category : #testing }
CTSmallOrderedSet >> isEmpty [
	^ size = 0
]

{ #category : #copying }
CTSmallOrderedSet >> postCopy [
	super postCopy.
	table := table copy
]

{ #category : #'private ' }
CTSmallOrderedSet >> privateAdd: newObject [
	size = table size ifTrue: [ self grow ].
	table at: (size := size + 1) put: newObject.
]

{ #category : #removing }
CTSmallOrderedSet >> remove: anObject [
	^ self remove: anObject ifAbsent: [ self errorNotFound ]
]

{ #category : #removing }
CTSmallOrderedSet >> remove: anObject ifAbsent: aNiladicBlock [
	| index |
	index := self findIndexFor: anObject.
	index = 0
		ifTrue: [ ^ aNiladicBlock value ]
		ifFalse: [ self removeIndex: index ].
	^ anObject
]

{ #category : #'private ' }
CTSmallOrderedSet >> removeIndex: index [
	table at: index put: nil.
	index to: size - 1 do: [ :i |
		table at: i put: (table at: i + 1) ].
	size := size - 1
]

{ #category : #accessing }
CTSmallOrderedSet >> size [
	^ size
]
