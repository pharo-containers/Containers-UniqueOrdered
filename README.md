# Pharo Containers-Grid
[![Build Status](https://travis-ci.com/Ducasse/Containers-UniqueOrdered.svg?branch=master)](https://travis-ci.com/Ducasse/Containers-UniqueOrdered)
[![Coverage Status](https://coveralls.io/repos/github//Ducasse/Containers-UniqueOrdered/badge.svg?branch=master)](https://coveralls.io/github//Ducasse/Containers-UniqueOrdered?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PolyMathOrg/DataFrame/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/dataframe)  -->

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
