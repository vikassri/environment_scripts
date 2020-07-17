## An Introduction to Cloudera Data Science Workbench (CDSW)

Copyright © 2010–2020 Cloudera. All rights reserved.
Not to be reproduced or shared without prior written 
consent from Cloudera.

#### HDFS directories used in this module
```sh
rides_dir = "/spark-perf/rideshare/rides"
```
#### Overview

In this module we demonstrate how to do the following:
 * Enter and execute code in CDSW
 * Get help from CDSW
 * Access Linux from CDSW
 * Install and work with Python packages
 * Format output in CDSW session
 * Start a Spark application from CDSW
 * Read a comma-delimited file from HDFS into a Spark SQL DataFrame
 * Examine some rows of a Spark SQL DataFrame
 * Stop a Spark application 

#### Entering Code

Enter code as you normally would in a Python shell or script:
``` python
print("Hello world!")

2 + 2

import math
def expit(x):
    """Compute the expit function (aka inverse-logit function or logistic function)."""
    return 1.0 / (1.0 + math.exp(-x))
expit(2)

import seaborn as sns
iris = sns.load_dataset("iris")
sns.pairplot(iris, hue="species")

```
#### Getting Help

Use the standard Python and IPython commands to get help:
```python
help(expit)

expit?

#expit??
```


#### Accessing the Linux Command Line

Run a Linux command by using the `!` prefix.

Print the current working directory:
```bash
!pwd
```
**Note:**  All CDSW users have the username `cdsw`.

List the contents of the current directory:
```bash
!ls -l
```

List the contents of the `/spark-perf` directory in the Hadoop Distributed File
System (HDFS):
```bash
!hdfs dfs -ls /spark-perf
```
You can also access the command line via the **Terminal access** menu item.


#### Working with Python Packages

**Important:** Packages are managed on a project-by-project basis.

Use `!pip3 list` to get a list of the currently installed packages:
``` bash
!pip3 list --format=columns
```

Search for the [folium](https://github.com/python-visualization/folium)
package in the Python package repository:
``` bash
!pip3 search folium
```
Install a new package:
``` bash
!pip3 install branca==0.3.0
!pip3 install folium==0.6.0 argparse==1.1 futures==3.0.3
```

**Note:** This package is now available in all future sessions launched in
this project.

** Note:** We have installed the `argparse` and `futures` packages to
eliminate dependency warnings.

Show details about the installed package:
```
!pip3 show folium
```
**Note:**  This returns nothing if the package is not installed.

Import the package:
``` python
import folium
```
Use the package:
``` python
folium.Map(location=[37.6813513,-122.3954593])
```
#### Uninstall the package:
``` bash
!pip3 uninstall -y folium
!pip3 uninstall -y branca
```
**Note:** Include the `-y` option to avoid an invisible prompt to confirm
the uninstall.

 **Important:** This package is no longer available in all future sessions
 launched in this project.


 #### Formatting Session Output

 Use [Markdown](https://daringfireball.net/projects/markdown/syntax) text to
 format your session output.

 **Important:** Prefix the markdown text with the Python comment character
 `#`.

 ### Headings
 # Heading 1
 ## Heading 2
 ### Heading 3
 ### Text

 Plain text

 *Emphasized text* or _emphasized text_

 **Bold text** or __bold text__

 `Code text` (Note these are backtick quotes.)

 #### Mathematical Text

 Display an inline term like $\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i$ using
 a [LaTeX](https://en.wikibooks.org/wiki/LaTeX/Mathematics) expression
 surrounded by dollar-sign characters.

A math expression can be displayed set apart by surrounding the LaTeX
shorthand with double dollar-signs, like so: $$f(x)=\frac{1}{1+e^{-x}}$$

#### Lists

Bulleted List
* Item 1
  * Item 1a
  * Item 1b
* Item 2
* Item 3

Numbered List
1. Item 1
2. Item 2
3. Item 3

#### Links

Link to [Cloudera](http://www.cloudera.com).

#### Images

Display a stored image file:
``` python
from IPython.display import Image
Image("resources/spark.png")
```

**Note:** The image path is relative to `/home/cdsw/` regardless of script
location.

#### Code blocks

To print a block of code in the output without running it, use a comment line
with three backticks to begin the block, then the block of code with each
line preceded with the comment character, then a comment line with three
backticks to close the block. Optionally include the language name after the
opening backticks:

```python
print("Hello, World!")
```

You can omit the language name to print the code block in black text without
syntax coloring, for example, to display a block of static data or output:

```
Hello, World!
```

#### Invisible comments

[//]: # (To include a comment that will not appear in the)
[//]: # (output at all, you can use this curious syntax.)

Move along, nothing to see here.


#### Running a Spark Application from CDSW

* A Spark *application* runs on the Java Virtual Machine (JVM)

* An application consists of a set of Java processes
   * A *driver* process coordinates the work
   * A set of *executor* processes perform the work

* An application normally runs on the CDH cluster via YARN
   * Used to process, analyze, and model large data sets
   * The driver runs in the CDSW session engine
   * The executors run in the worker nodes

* An application can run locally within the CDSW session engine
   * Used to develop and test code on small data sets
   * The driver runs in the CDSW session engine
   * The executors run as threads in the context of the driver process

* Start an application by creating an instance of the `SparkSession` class

* Stop an application by calling the `stop` method of the `SparkSession`
 instance


#### Starting a Spark Application
```python
Import the `SparkSession` class from the `pyspark.sql` module:
from pyspark.sql import SparkSession

Use the `builder` attribute to construct an instance of the `SparkSession` class:
spark = SparkSession.builder \
    .master("local") \
    .appName("spark") \
    .getOrCreate()
```
Call the optional `master` method to specify how the application runs:
* Pass `yarn` to run on the CDH cluster via YARN (default)
* Pass `local` to run in the CDSW session engine with one thread
* Pass `local[N]` to run in the CDSW session engine with $N$ threads
* Pass `local[*]` to run in the CDSW session engine with all available
threads

Call the optional `appName` method to specify a name for the application.

Call the required `getOrCreate` method to create the instance.

**Note:** `spark` is the conventional name for the `SparkSession` instance.

**Note:** The backslash `\` is the Python line continuation character.

Access the `version` attribute of the `SparkSession` instance to get the
Spark version number:
spark.version

**Note:**  We are using the Cloudera Distribution of Apache Spark.


#### Reading data into a Spark SQL DataFrame

Use the `parquet` method of the `DataFrameReader` class to read the ride data
from HDFS into a DataFrame:
rides = spark.read.parquet(rides_dir)

rides.show(5,truncate=False)

#### Stopping a Spark Application

Call the `stop` method to stop the application:
spark.stop()

**Note:** The Spark application will also stop when you stop the CDSW session
engine.


#### Exercises

(1) Experiment with the CDSW command line.

* Type `i` and then press the TAB key.  Use the UP and DOWN ARROW keys to
navigate the tab completion options.  Select `import` and then press the
RETURN key.

* Type `import math` but do not press the RETURN key.  Use the LEFT and RIGHT
ARROW keys to navigate along the command line.

* Use the UP and DOWN ARROW keys to navigate the command line history.

 (2) Experiment with the CDSW file editor.
 * Create a new file called `exercise2.py`.
 * Enter the following text and code into the file.

```python
### Generate a Random Uniform Number
#
## Import the `random` module:
import random

## Generate a random uniform variate in the interval [0, 1):
###random.random()
```

* Select a line or block of code and run the selection.

* Clear the console log and run the entire file.

(3) Experiment with the Linux command line.

* Click on **Terminal access** to open a terminal window.

* Use the `hdfs dfs -ls` command to explore the `/duocar/raw/` directory in
HDFS.

(4) Create a new `SparkSession` and configure Spark to run locally.

* Read the raw driver data from HDFS.
* Examine a few rows of the drivers DataFrame.

#### References

[Cloudera Data Science Workbench](https://www.cloudera.com/documentation/data-science-workbench/latest.html)
[Markdown](https://daringfireball.net/projects/markdown/)
[LaTeX](https://en.wikibooks.org/wiki/LaTeX/Mathematics)
[Apache Spark](https://spark.apache.org/)
[Spark Documentation](https://spark.apache.org/docs/latest/index.html)
[Spark Documentation - SQL, DataFrames, and DatasetsGuide](https://spark.apache.org/docs/latest/sql-programming-guide.html)
[Spark Python API - pyspark.sql.SparkSessionclass](https://spark.apache.org/docs/latest/api/python/pyspark.sql.html#pyspark.sql.SparkSession)
[Spark Python API - pyspark.sql.DataFrameclass](https://spark.apache.org/docs/latest/api/python/pyspark.sql.html#pyspark.sql.DataFrame)
[Using CDS 2.x Powered by Apache Spark](https://www.cloudera.com/documentation/data-science-workbench/latest/topics/cdsw_dist_comp_with_Spark.html)

