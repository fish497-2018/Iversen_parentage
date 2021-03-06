# Week 8 Project 
### (Iversen_parentage)

I'm using data on the parentage of a small population of Alaskan sockeye salmon. 

Columns used will be sex(.1,.2), length(.1,.2), and depth(.1,.2)
  * length = fork length in milimeters, depth = max body depth in mm
  * sex/length/depth correspond to the offspring
  * sex.1/length.1/depth.1 correspond to father of the offspring in same row
  * .2s correspond to mother of offspring in same row

The question explored: How does the length to depth body ratio of an offspring compare to its parents? Do larger than average L:D parents produce larger than average offspring?

### Plan of attack (Exercise 2)

*Keep in mind that sexual dimorphism is a thing in salmon - males will be larger than females on average*

* Remove all rows with NAs and blanks from the data frame

*Create new columns of length:depth ratios for moms, dads, and offspring and add to a renamed version of the data frame (using mutate and join)

* Calculate the average and standard deviations of L:D for moms and dads **separately** (so we can compare the effects of larger moms vs. larger dads). Also do this for offspring

* Calculate the z-score of each parent and offspring (i.e., the number of standard deviations they are from the mean)
    * *will applying this to all parents require a loop...?*
 
* Graph parent vs. offspring z-scores in a scatter plot
    * 2 plots: moms vs. offspring and dads vs. offspring
    * color points by offspring sex 
