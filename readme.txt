Lab Deliverable 3: PhoMRE

Due Saturday, June 15th 11:59 PM

Submitting:

Submit your assignments in a folder called lab3 (or similar) to the subversion repository according to the directions on the syllabus page. Place all of your Lab Deliverable 3 work into one folder. You will only be graded on your material within a reasonably labeled folder. Also, please include a README text file that contains the programming language you used. If you want to give the TAs/graders instructions on how to compile, run, or even understand your code, you can place that within the README as well.

From now on, each HW and Lab Deliverable should be submitted as described here and in HW 1. Each assignment (HW or Lab Deliverable) should have its own folder with its own README inside of it. Please ask for assistance if you have any questions

Problem:

In this lab you will write a music recommendation engine using the Blackboard design pattern.

Melody really likes the track "Get Back" by the Beatles, but she's growing tired of listening to the Beatles, who have been around for awhile, and wants to discover something new. She fires up PhoMRE (Phoenix Music Recommendation Engine) and types in the name of an artist and track:

>> Ask me for a recommendation based on a track of your choosing: 
**** artist:  [here, Melody enters "The Beatles"]
**** track:   [here, Melody enters "Get Back"]
>> Working...  
>> ...  
>> ...  
>> Do you like "Wonderwall" by Oasis?  
>> Check it out: http://www.last.fm/music/Oasis/_/Wonderwall 
**** response (yes/No): [here, Melody answers "No" and sighs to herself] 
>> Okay. I'll find another recommendation. Working...  
>> ...  
>> ...  
>> Do you like "Charmless Man" by Blur?  
>> Check it out: http://www.last.fm/music/Blur/_/Charmless+Man
**** response (yes/No): [here, Melody answers "Yes"] 
>> Great! Would you like me to make another recommendation? 
**** response (yes/No): ["No"] 
>> Okay. Goodbye!

Eventually, Melody finds the track "Charmless Man" by Blur and decides that she likes Blur a lot better than Oasis.

To implement the PhoMRE (pronounced "farmer"), you will need a database of music. Luckily, last.fm has one of those for us to play with! Please read the following page and familiarize yourself with the idea:

http://www.last.fm/api/intro

The class has a last.fm account with the following information:

username: ooarch 
password: blackboard

We also have a registered API account page. Everyone can use the same one:

http://www.last.fm/api/account/5f376ba66130fc50ab78ff155b7430a7

In case you need it, here's the gmail account we used to register the last.fm account and API. Please don't abuse it, as I will be monitoring it carefully. Using the e-mail address for ANYTHING without requesting permission will result in an honor code violation and potentially failing the class:

username: ooarch.lastfm@gmail.com 
password: blackboard

You can use the API to get information about tracks, artists, tags (that identify characteristics of tracks, artists, et cetera), and more. Here's an example link, using our account (so you must be logged in to visit it properly):

http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=5f376ba66130fc50ab78ff155b7430a7&artist=the+beatles&track=get+back

This uses the track.getInfo method to, well, get info about the Beatles track "Get Back." The base URL for making queries is http://ws.audioscrobbler.com/2.0/. Notice that the API key from our account page is used, and notice the format for specifying the artist and track. Experiment with the web interface a bit and explore the methods to which you have access.

Here are some notes about the above information, and how you can use it within your program:

The data is returned to you in XML or JSON format. You can use either.
Here are lecture notes written by Stuart Kurtz, another computer science professor at UChicago, explaining XML:
http://brick.cs.uchicago.edu/Courses/CMSC-16200/2013/Lectures/lecture-20.php,
http://brick.cs.uchicago.edu/Courses/CMSC-16200/2013/Lectures/lecture-21.php.
Almost all programming languages have XML parsing libraries. See the notes and hints section at the bottom of this page for more info.
You can use any of the tools from the last.fm site as well: http://www.last.fm/api/downloads
The XML is simple, so parsing it as plain-text would not be too hard, but try a different method first.
Document in your README what method you used to extract this data. If you use an external library (including one of the APIs on the tools page in the previous bullet point), you must say so, which one(s), and link to the site(s) where you downloaded the library/libraries.
Every programming language I can think of can perform web queries. Here's how to do it in bash (depending on the software you have installed, one or the other command might work for you):
    wget [url_to_get] -O [filename_to_save_to]
    curl [url_to_get] -o [filename_to_save_to]
Again, if you use an external library to do this (which I doubt will be necessary), you must document it as described in the third sub-bullet of the first bullet above.
Of course, getting this information is step 1, but you need to use it to produce a recommendation! Each method for manipulating this information to help produce a recommendation can be viewed as a KnowledgeSource for your Blackboard pattern. You must implement the following knowledge source:

SimilarTrack: use the track.getSimilar method, and return one of the returned tracks.

Write the infrastructure for your blackboard pattern and implement this knowledge source. Provide recommendations that come from this knowledge source only. If the knowledge source becomes exhausted and Melody has not liked any of the tracks you recommended, tell her that you're sorry, but there are no more recommendations to be had. Test your program and make sure it works as expected.

Before you continue, answer the following questions:

What are the "puzzle pieces" of your blackboard?
Is adding a new knowledge source to your program as easy as adding the first one? If not, describe why; then, describe a solution to make it so, and refactor your code accordingly. If so, explain the structure of your code that allows for this.
This question basically guarantees that you're implementing the blackboard pattern correctly.
Do you have a Controller for your blackboard? If not, describe a solution to make it so, and refactor your code to include it. If so, explain how your Controller works.
Does this knowledge source need an Assumption? An Affirmation? Why, or why not? If it does and you haven't implemented it/them, make it so.
What are the Dependents in your blackboard? Read about Dependent abstract class in Booch p427 and make sure your code uses them.
Melody is disappointed, because the recommendations still aren't tailored for her. Another knowledge source could improve the program drastically! First, instead of treating the similar tracks as de-facto recommendations, we'll treat them as a pool for possible recommendations. Second, we should add the most popular track from n >= 3 similar artists to this pool as well. But, now we must select the appropriate recommendation from this pool! Choose at least one of the three following knowledge sources and implement it/them to perform this selection:

Playcount: choose the track from the pool with the most similar playcount to the input track
Listeners: choose the track with the most similar number of listeners
Duration: choose the track with the most similar duration
All of these fields can be obtained for a given track using the track.getInfo method.

When a track is rejected by Melody, you should do three things:

guarantee that the track won't be recommended again
...for this particular recommendation session; next time Melody asks for a recommendation for this track, your program should behave exactly the same way it did during this session
find a new track to add to the pool, to replace the rejected one
the number of tracks in your pool should always be the same
update the playcount, listeners, or duration value that we're comparing against (the "ideal" value)...the fact that Melody didn't like this track may indicate that she wants something slightly different
this constitutes a strategy (yes, the design pattern)
e.g.: if we chose the Duration knowledge source and the track we recommended was slightly longer than the input track, adjust the "ideal" value to be shorter
Test your code again, and see if it behaves as you expect. Before you continue, answer the following questions:

How do you differentiate between tracks you blackboard thinks might be good recommendations? You must never select a suggestion randomly. Randomly means:
You picked a track at random from the pool of possible recommendations.
Many other recommendations could have been chosen, but because of some heuristic within your program, the program selected that particular recommendation. Exception: two tracks have exactly the same playcount, listeners, or duration value.
What is the user? Is the user a knowledge source now? Which portion of the blackboard does the user impact?
There seems to be a "short-term" and "long-term" portion of the blackboard. The short-term portion of the solution is to find a track to recommend next. The long-term solution is to find a track the user likes.
How are these represented within your blackboard object?
What is the relationship between them?
When does each portion get updated, i.e., what is the "update-cycle" for each section? How do you perform this update?
How does each knowledge source influence the blackboard? In your answer, describe which knowledge sources influence which timescales, and how. Some may correspond to just one timescale, while others, both.
Now, document and implement a knowledge source of your own. Be creative: there are no restrictions here, except for that you cannot simply implement the knowledge sources you didn't implement from the previous part. The idea must be your own.

Finally, think of and document a strategy (yes, the design pattern kind) for tuning your Blackboard Controller; it can be a simple manual control strategy where Melody specifies, in some user-friendly way, how much she cares about the different knowledge sources, or it can be complicated, like an automatic learning algorithm. We might offer extra credit for really stellar tuning mechanisms! But, the point here is not to come up with an amazing method, but to make sure the functionality for adjusting the relative influence of knowledge sources was implemented in the first place, enforcing modularity.

Test your code, and answer the following questions:

Draw a UML diagram for your Blackboard and include it as an image file with your code. Visually identify the long-term and short-term components of your Blackboard. Visually identify the relationship between them.
Say you were reading on the internet and found a new knowledge source that was not the last.fm API, but a different one, that contained aural data about the song files themselves, such as the loudest frequencies at each second of a track.
How would you incorporate this knowledge source into your program? What parts of your design pattern you need to modify, and what parts of the code should NOT need to be modified? (Hint: the former group should be as small as possible, and the latter group as big as possible.)
Amend your UML diagram showing where the new knowledge source would be added and how it would interact with your current code.
Input a track of your choosing to your program, and get recommendations. Say "no" to your program at least 5 times, and eventually say "yes."
Provide the output for the entire recommendation session.
For each recommendation, show explicitly why your code made the recommendation it did and justify that it behaved as expected.
For each "no" you respond with, describe how the state of your blackboard changes and justify that it behaved as expected.
Describe the state of your blackboard when/after you made your "yes" response, and describe in detail how the state of the blackboard differed from the state it began in, when you first input the track from which to begin the recommendation process.
For b-d, you may present the answers visually and with phrases instead of complete sentences and paragraphs, if you choose.
Does your program work better with more knowledge source? Informally describe the difference in behavior, as perceived by the user, between your program after just the first knowledge source, and your completed program. There are no wrong answers to this question.
Whoa, that was a lot of information! The next section contains a summary of it all.

What you need to implement:

Develop a basic version of the final program that you can use as scaffolding:
Implement the blackboard design pattern pattern and minimal UI as exemplified above.
Implement the SimilarTrack knowledge source.
Make sure you're using Controllers, Dependents, Assumptions, and Affirmations correctly, and that you continue to do so.
Test your code and answer the questions for this section.
Flesh out your program:
Make the SimilarTrack knowledge source construct a pool of possible recommendations instead of using it to select a specific track.
Add to this pool at least 3 tracks from similar artists.
Implement at least one of the three specified additional knowledge sources and its corresponding strategy.
Test your code and answer the questions for this section.
Add your own creative extension to your program:
Implement your own knowledge source. Document it.
Implement a strategy for tuning your Blackboard's Controller. Document it.
Test your code and answer the questions for this section.
Show your completed program to your best friend and blow their mind! Celebrate with some spam (or asparagus, if you prefer healthy and/or vegetarian celebratory foods).
Notes and hints:

Here's a list of things we're testing with this assignment:
implementing the Blackboard pattern (among others)
writing large programs in modular, sane ways
interacting with APIs
querying databases and manipulating XML files
critical thinking about problem-solving using computer science as a tool
Of course, the UI need not be identical to the one in the example with Melody. Use your own words and structure it as you please. Also, of course, your program need not be named PhoMRE; I know my acronym-puns are awful!
Melody is the "target user" throughout this document, so you can replace "Melody" with "the user" everywhere if it makes more sense to you. I use "Melody" in the descriptions, and "the user" in the questions. If you find an inconsistency in my use of the two terms, let me know so I can fix it.
You should provide Melody with some information about each track you recommend. The minimum is to give them the last.fm link for the track, which is returned by the track.getInfo method. You may provide them with more information too, but the bare minimum is that they're linked to somewhere they can sample the track. How else will they know if they like it or not?
Don't forget to document your knowledge source and Controller strategies. Include this documentation in the README or in a file whose name you provide in the README (suggestion: lab3_doc.txt).
These strategies need not be implement as strategies in that they should be specifiable by the user at runtime (although you can implement this if you want); instead, you should think of them as strategies in the sense that you should be able to write new ones and switch them out for the old ones in the code easily: they should be modular.
Don't forget to answer all the questions and provide the requested UML diagrams! Written answers must be in complete sentences (except where specified otherwise), and can be included in the README or in a file whose name you provide in the README (suggestion: lab3_answers.txt). Diagrams can be committed to your repository just like any other file. They can be any standard image filetype (png, jpeg, gif, pdf, svg, you name it). Brevity is encouraged.
When we say to test your code, we're not going to explicitly check that you do so (other than making sure you answered all the questions). We put these recommendations here to help you and to decrease your pain/frustration while implementing this. These tests would amount to rudimentary "unit testing." If you don't verify that your program works before moving on, errors in previous parts might muddy and obscure errors in later parts, and your code could crash and burn.
If you're having trouble with the last.fm API, ask questions sooner rather than later. There's a good chance lots of other people are having trouble too. This is a new assignment, so there might be some speedbumps. Let us know so that we can smooth them out.
Remember: if you use external libraries, you MUST tell us and provide us instructions for how to install them. Not doing so will result in a severely lowered grade. One way to ease the pain of using libraries, especially small and open-source ones, is to include them in your svn repository directly (of course, with any necessary licensing information to avoid breaking laws or committing plagiarism). That way we can compile, interpret, or run your code without having to install anything. If you use a compiled language, including a Makefile would be almost necessary (and very helpful) if you use external libraries. Bottom line: we must be able to test your code on our machines. If we can't we can't grade your assignment.
Suggestion: parse the XML using a library. Here are some suggested libraries for various languages:
Java (built-in)
C++ (add the 2 files to your svn repository and compile them in)
C# (built-in?)
Python (built-in)
Ruby (easily installable)
Scala (definitely built-in!)
Smalltalk Squeak >=4.2 (built-in)
Tell me if I missed any!
Fallback: use one of the APIs in the "tools" page: http://www.last.fm/api/downloads
Have fun! You can go above-and-beyond in absolutely any way you want.