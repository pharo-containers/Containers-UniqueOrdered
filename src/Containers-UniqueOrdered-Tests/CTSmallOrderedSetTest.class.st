Class {
	#name : #CTSmallOrderedSetTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'Containers-UniqueOrdered-Tests'
}

{ #category : #running }
CTSmallOrderedSetTest >> setUp [
	super setUp.
	collection := CTSmallOrderedSet new
]

{ #category : #testing }
CTSmallOrderedSetTest >> testAdd [
	| object |
	object := Object new.
	self assert: collection size equals: 0.
	self assert: (collection add: object) == object.
	self assert: collection size equals: 1.
	self assert: (collection add: object) == object.
	self assert: collection size equals: 1.
]

{ #category : #testing }
CTSmallOrderedSetTest >> testAddAll [
	collection addAll: #(2 1 1).
	self assert: collection size = 2.
	self assert: (collection includes: 1).
	self assert: (collection includes: 2)
]

{ #category : #testing }
CTSmallOrderedSetTest >> testAddingTwiceTheSameOnlyAddOne [
	| object |
	object := Object new.
	self assert: collection size equals: 0.
	collection add: object.
	self assert: collection size equals: 1.
	collection add: object.
	self assert: collection size equals: 1.
]

{ #category : #testing }
CTSmallOrderedSetTest >> testCopy [
	| copy |
	collection add: 1.
	copy := collection copy.
	collection add: 2.
	
	self assert: collection size equals: 2.
	self assert: copy size equals: 1.
	
	self assert: (collection includes: 2).
	self deny: (copy includes: 2).
]

{ #category : #testing }
CTSmallOrderedSetTest >> testDo [
	| seen |
	collection addAll: #(2 1 1).
	seen := Array streamContents: [ :stream |
		collection do: [ :each |
			stream nextPut: each ] ].
	self assert: seen size equals: 2.
	self assert: (seen at: 1) equals: 2.
	self assert: (seen at: 2) equals: 1
]

{ #category : #testing }
CTSmallOrderedSetTest >> testDoShouldIterateInOrder [
	| seen |
	collection addAll: #(1 2 1 1).
	seen := Array streamContents: [ :stream |
		collection do: [ :each |
			stream nextPut: each ] ].
	self assert: seen size equals: 2.
	self assert: (seen at: 1) equals: 1.
	self assert: (seen at: 2) equals: 2
]

{ #category : #testing }
CTSmallOrderedSetTest >> testIncludes [
	self deny: (collection includes: 0).
	collection add: 0.
	self assert: (collection includes: 0)
]

{ #category : #testing }
CTSmallOrderedSetTest >> testIsEmpty [
	self assert: collection isEmpty.
	collection add: 1.
	self deny: collection isEmpty.
	collection remove: 1.
	self assert: collection isEmpty
]

{ #category : #testing }
CTSmallOrderedSetTest >> testRemove [
	collection add: 1.
	self assert: (collection remove: 1) equals: 1.
	self should: [ collection remove: 1 ] raise: Error
]

{ #category : #testing }
CTSmallOrderedSetTest >> testRemoveIfAbsent [
	| absent |
	collection add: 1.
	absent := false.
	
	self assert: (collection remove: 1 ifAbsent: [ absent := true ]) equals: 1.
	self deny: absent.
	
	collection remove: 1 ifAbsent: [ absent := true ].
	self assert: absent.
]

{ #category : #testing }
CTSmallOrderedSetTest >> testSize [
	self assert: collection size equals: 0.
	collection addAll: #(2 1 1).
	self assert: collection size equals: 2.
]

{ #category : #testing }
CTSmallOrderedSetTest >> testUnion[
    "Tests the union operation of CTSmallOrderedSet to ensure it combines two sets, maintaining uniqueness and preserving the order of elements."
    "scope: class-variables  &  instance-variables: collection"

    | set1 set2 result |
    set1 := CTSmallOrderedSet withAll: #(1 2 3).
    set2 := CTSmallOrderedSet withAll: #(2 3 4).
    result := set1 union: set2.
    
    self assert: result size equals: 4.
    self assert: (result includes: 1).
    self assert: (result includes: 2).
    self assert: (result includes: 3).
    self assert: (result includes: 4).
    
    "Test order preservation"
    self assert: result asArray equals: #(1 2 3 4).
]

{ #category : #testing }
CTSmallOrderedSetTest >> testDifference [
    | set1 set2 result |
    set1 := CTSmallOrderedSet withAll: #(1 2 3 4).
    set2 := CTSmallOrderedSet withAll: #(2 4).
    result := set1 difference: set2.
    
    self assert: result size equals: 2.
    self assert: (result includes: 1).
    self assert: (result includes: 3).
    self deny: (result includes: 2).
    self deny: (result includes: 4).
]

{ #category : #testing }
CTSmallOrderedSetTest >> testIntersection [
    | set1 set2 result |
    set1 := CTSmallOrderedSet withAll: #(1 2 3 4).
    set2 := CTSmallOrderedSet withAll: #(2 4 5).
    result := set1 intersection: set2.
    
    self assert: result size equals: 2.
    self assert: (result includes: 2).
    self assert: (result includes: 4).
    self deny: (result includes: 1).
    self deny: (result includes: 3).
    self deny: (result includes: 5).
]