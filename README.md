# Gilded Rose Refactoring Kata

Here is the text of the kata:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
“Aged Brie” actually increases in Quality the older it gets
The Quality of an item is never more than 50
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."

---------------------
## My Approach 

* The first step I took into completing this kata was to get an understanding of what I needed to do and what the current code was doing. I took a look at the requirements and did not fully get an understanding of what I needed to do. I went through each line one by and read it out loud to get an understanding of what was happening, After I figured out what was happening I wrote comments throughout the code to identify what was happening. 

* I did not get a full understanding by this stage but I was capable to start writing tests, I went through the requirements again and wrote them out on paper in a way that made sense for me. This allowed me to test every possible outcome within the nest IF statements. 

* Once I wrote all the tests I could think of and saw that they passed with the current code I decided it was time to refactor the code. I commented out the original code and started splitting the code into separate functions. Once I split the code up I decided to run tests again and made sure they passed, I then decided I was able to refactor my code again to make it more readable. 

* After reading through the code, requirements, and tests I was confident about what the program wanted and how I was going to go about it. I reduced IF statements down to single lines introduced a switch case and all my methods apart from one are around 3/4 lines long. I made sure my variables names and method names had very clear and descriptive names with the idea in mind that someone could read my code who may not have much knowledge on the topic. 

* I followed the process of testing, refactoring, and pushing my code up to GitHub and I did this multiple times. I realised i was using numbers throughout my code such as 0 and 50 for minimum and maximum quality values so I thought it was ideal that I introduced const variables to make my code cleaner and more readable. 

* My testing score was around 95% but I wanted to increase it so I started to implement more tests for edge cases, I came across a problem with min and max values where if the quality was increased by +2 or 3 but the current quality was 48/49 it would go over 50. This could be prevented with the nested if statement that was provided in the original code but I did not want to use this as it was not readable. I decided to create a function that would check if the quality value went over 50 and then set it back to 50. This allowed me to remove the nested IF statement and create more readable code. 

* I decided to refactor again and realised two classes were contained in one file so I decided to split the Gilded_rose and item class into their own file whilst splitting their tests into their own RSpec files. 

* The last bit of functionality of code i implemented was allowing to change the attributes of a conjured item, i found this really easy as all i had to do was copy the layout for a normal item and change the statement from returning 2 : 1 to 4 : 2. This then passed my tests i wrote for the conjured items previously. 

* The last refactor I completed was to update the test descriptions so if anyone else decided to read through my code they would have an easy time following along. 

---------------------
