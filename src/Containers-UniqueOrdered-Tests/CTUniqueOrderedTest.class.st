Class {
	#name : #CTUniqueOrderedTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'Containers-UniqueOrdered-Tests'
}

{ #category : #setup }
CTUniqueOrderedTest >> setUp [

	collection := CTUniqueOrderedCollection new
]

{ #category : #tests }
CTUniqueOrderedTest >> testAddBeforeOfTwiceTheSame [
	collection add: 1.
	collection add: 33.
	collection add: 1.
	self assert: collection size equals: 2. 
	"1 33"
	collection add: 2 before: 33.
	"1 2 33"
	self assert: collection size equals: 3. 
	self assert: (collection indexOf: 2) equals: 2.
	self assert: (collection indexOf: 1) equals: 1.
	self assert: (collection indexOf: 33) equals: 3.
	"now we add again 2"
	collection add: 2 before: 1.
	"2 1 33"
	self assert: collection size equals: 3. 
	self assert: (collection indexOf: 2) equals: 1.
	self assert: (collection indexOf: 1) equals: 2.
	self assert: (collection indexOf: 33) equals: 3.
]

{ #category : #tests }
CTUniqueOrderedTest >> testAddBeforeTwisted [

	collection add: 1.
	collection add: 33.
	"1 33"
	collection add: 1 before: 1.
	"1 33"
	self assert: (collection indexOf: 33) equals: 2.
	self assert: (collection indexOf: 1) equals: 1.
]

{ #category : #tests }
CTUniqueOrderedTest >> testAddFirstOfTwiceTheSame [

	collection add: 1.
	collection addFirst: 33.
	collection add: 1.
	self assert: collection size equals: 2.
]

{ #category : #tests }
CTUniqueOrderedTest >> testAddLastOfTwiceTheSame [

	"For add: the order is the order of the first addition: 
	hence ((col add: 1; add: 2; add: 1; yourself) indexOf: 1) = 1

	For all the methods where the order is explicit addFirst: addLast:, 
   previous similar elements are removed."

	collection addLast: 1.
	collection addLast: 33.
	self assert: (collection indexOf: 1) equals: 1.
	collection addLast: 1.
	self assert: collection size equals: 2.
	self assert: (collection indexOf: 1) equals: 2
]

{ #category : #tests }
CTUniqueOrderedTest >> testAddOfTwiceTheSame [

	collection add: 1.
	collection add: 33.
	collection add: 1.
	self assert: collection size equals: 2.
	self assert: collection first equals: 1.
]

{ #category : #tests }
CTUniqueOrderedTest >> testAdditionOfTwiceTheSameDoNotCareOfOrder [

	collection add: 1.
	collection add: 1.
	self assert: collection size equals: 1.
]
