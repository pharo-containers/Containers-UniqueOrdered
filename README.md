# Containers-UniqueOrdered
To get unique (set) but ordered collection.
This package contains two collections: one that is an ordered set and one that is an ordered collection with unique items. 

```
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
```



This package is part of the Containers project: This project is to collect, clean, test and document alternate collection datastructures. 
Each package is modular so that users can only load the collection they need without 100 of related collections.
