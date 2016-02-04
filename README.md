# Design-Pattern-Repository

Pre-requisites:

1. Eclipse

2. xampp

This code requires a bin folder to be placed in DP folder.
Currently it is not uploaded here because of ignore list setting to ignore bin folders. However, this is a special bin folder whose files are not auto-generated

Instructions:

1. Start xampp server

2. On phpmyadmin, create a new database designpatternrepo

3. Import the latest sql script to populate the designpatternrepo database

Building fact repository of mined and tagged design pattern instances per project:

4. In eclipse, the MatrixFrame.java file in gr.uom.java.pattern.gui folder is the starting point which executes the design pattern detection utility and also the topic detection. It requires as input the path of the project source code. Once competed all info is updated in the designpatternrepo database.

Get recommendations for a user project

5. The DemoJFileChooser.java file is located in /TopicExtractionUtility/src/cc/mallet/javaTotext/DemoJFileChooser.java It is the starting point of execution of the recommendations and matching heuristics. Upon running, it requires as input the path of the file or files or project of the user for which the design patterns are to be recommended based on matching domains or topics.


The database for SEWordSIM is the 444MB SEWordSim-r1.db file. It is not uploaded on this Github repository because of the 100MB file size limitation. It needs to be placed in the TopicExtractionUtility folder. It can be downloaded from the following link
https://drive.google.com/folderview?id=0B8cuz9Ureg2bdEZRTlhTU0FmNmM&usp=sharing#



