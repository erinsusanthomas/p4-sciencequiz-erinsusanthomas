67-272: ScienceQuiz App
===

This code is for the ScienceQuiz project assigned to Information Systems students at Carnegie Mellon University in 67-272 during the Spring 2021 semester.  More information about this project can be found on [Canvas](https://canvas.cmu.edu/courses/20549/assignments/360007) (Assignments > Project- Phase 4).

Additional documentation for the requirements of this project and technical documents to guide student work can be found in the `docs` directory of this project.  Please be sure to read carefully all the project notes below. 

Project Notes: Phase 4
---
This phase we will continue our project to develop the business logic for the ScienceQuiz system. In phase 4, you will have to create models for `User`, `Event`, `Quiz`, `TeamQuiz` and
`StudentQuiz` and write code and unit tests for these models. In addition, you will have to make a number of adjustments to existing models (`Organization`, `Student`, `Team`, `StudentTeam`). This phase will constitute 16 percent of your final course grade and is broken down into the following components:

1. **Creation of Models**: In the starter code you are given, we have provided you an ERD, a database design, and a data dictionary, along with a set of project specs. These documents are all located in the `docs` directory of your starter repository.  All these documents are useful in this phase -- in some cases, they have overlapping coverage, but sometimes key ideas are found only in one of these documents.  You are responsible for what is on all of the documents provided. 

2. **Unit Testing**: Unit tests for all methods in all models must be written and fully passing. We will check to make sure there is 100 percent code coverage for unit tests using the `simplecov` gem used in class and in lab. Only the models in this phase need complete coverage. There are steep penalties for less than 100 percent coverage and no credit at all for less than 90 percent coverage -- see below for more details, but this is a critical aspect of this phase. 

3. **Coding Style**: All code must be appropriately organized. What that means at this stage is the following: Related or similar functionality is grouped or clustered together. Indentation should be used consistently to make code readable. Comments showing organization should be present and explaining difficult code should be used when/if necessary.

<hr>

**A few notes on grading this phase:**

1. Note that in this phase, the client has asked you to make a simple change to Team and add a reference to coach in it.  To complete this, you must add a new migration for teams that adds the coach id to the teams table.  DO NOT edit the original teams migration; doing so will be a 10 point penalty.  You will need to update all your code accordingly after the migration runs.

2.	The code solution (that you had from phase 3 also) is given to you again.  To give you a substantial boost, we are giving you all relationship tests as well as all validation tests.  You must pass all these tests; failing to do so could easily lead to the dreading cascading failure errors that some experiences in Phase 2 of this project.  We have also given you all deletion-related tests and the ability_test file.

3. We have refactored the testing code and created separate files for the remaining tests to be written with the basic shell for what you need.  It is up to you to complete the tests within these shells.  In the files `<model>Test` are relationship and validations tests only (and those are given); the only exception to that is the old scope and method tests from phase 2 that are unchanged are left in their original `<model>Test` file.  **Put all new tests in the appropriate files created for you and do not modify the `<model>Test` files.**

4. Note that while we gave you validation tests for all validations, for the custom validations, we have marked these simply as "pass validate test A" and the like.  Testing is a form of documentation and it should be possible for you to read and study the tests to understand the validations being requested.  You may **NOT** ask the TA or anyone else for assistance understanding what is required on these tests; indeed, to get assistance on these methods, you must first tell the TA what the purpose is. (There is a comment space above each of these tests set aside for you to record what it is doing.). Once you have made an effort to identify the purpose, we are happy to discuss it with you further.

5. To make your context work with ours, there are a few key things you must do when creating your context:

  - Ellie and Anna from ACAC both to have competed in a student quiz; doesn't matter the score or anything else, but there should be a quiz they have competed in.
  - ACAC 1 Senior (which Ellie and Anna should be part of) has to have competed in a quiz.
  - To make the user tests and more importantly, the ability tests to pass more easily, we are simply giving you a users context in `test/sets/users.rb`.
  - Note that Coach Sophie must be assigned to an active team at ACAC -- we highly recommend ACAC 1 Senior team -- for the ability tests to pass.

6. We have also given you all deletion-related tests and the ability_test file.  We describe these rules as best we can in the `Phase_4_Specs` sheet found in the `docs/phase_4`, but note that the tests are the standard; if you think there is a disconnect between our descriptions and the tests, _simply go by what the tests tell you._  The tests should be clear, but in many cases we added additional comments to help you understand what was going on. (Read through them in advance; the points noted about the context in #5 are also found in these tests' comments.)

7. Code quality issues will be assessed, but only as a penalty this time.  You will not get any points for code quality (we expect that) but can lose points for messy code.  We will also scan your scope tests to make sure they return a subset of records and not all or none of the records; at this point, we expect that standard to be understood and adhered to, so failures will be docked 3 points any time we find a scope test that is not in accordance.  Likewise, order by scopes will require a context not built in the order expected or a similar penalty will follow.

8. In terms of grades, 40 points will be given for running your unit tests.  If you are at less that 100.0% test coverage according to SimpleCov metrics, you will lose 15 points.  If you are at less that 90.0% test coverage according to SimpleCov metrics, you will lose an additional 20 points.  You get 5 points for simply passing all your own tests.

9. When we run our tests on your models, students will be given points for each set of tests (each file represents a set of tests).  You must pass all the tests to get the points for that file.  You can get credit for a set of tests, you must pass all the tests in a set to recieve credit.  The weighting of the sets will vary (depending on difficulty), but passing all sets together will account for 60 points.  While weighting varies by set, given that there are 22 sets and 60 points, all sets are worth minimum of 2 points (even `Organization`, which you hardly have to change) and at its maximum a set can be worth 5 points.

10. There is no tenth note.  Please move along. 
   
   ![](move_along.jpeg)
   
   _Image credit: tinyurl.com/b7s8v2r8_

11. You have a private repository on GitHub for this project which is accessible (initially) only to you and the teaching staff. We sent you an invitation to use this link to access it: [https://classroom.github.com/a/b615TzoQ] (https://classroom.github.com/a/b615TzoQ). If you change the visibility of your repository in any way or give any other individuals outside the faculty and Head TAs access (directly or indirectly) to this repository, you can expect an automatic zero for this project, an additional one-letter grade drop on the final grade, and this will be considered an academic violation that will be reported to the University.  _We will use the full range of monitoring tools that GitHub provided to classrooms to actively scan for such violations._

12. Your project will be turned in via GitHub and Gradescope no later than **5 pm on Thursday, April 22, 2021**. Any late submissions will be not be considered. Again, if you have questions regarding this project, please post them on Piazza or ask someone well in advance of the turn-in date. Waiting until the day before it is due to get help is unwise -- you risk not getting a timely response that close to the deadline and will not be given an extension because of such an error.

**Checkpoint for this phase**:

- _Checkpoint:_  By **Thursday, April 15th, 5 PM**, you must:

	1. complete the `User` model along with its tests as well as (1) create the new migration to modify the teams table and (2) update `Team` model and related testing files so that all `Team` tests pass. Only the tests in `UserTest` (not its affilated files) and `TeamTest` (not its affilated files) will be run. 
	2. complete the `Quiz` model along with its tests. Revisions to `Organization` and `Student` models must be complete.  Only the tests in `QuizTest`, `OrganizationTest`, and `StudentTest` will be checked; none of the affiliated test files associated with these models will be run.


These checkpoints are minimal requirements -- **if all you do is the minimum, it will put a lot of stress on the final week and likely lead to serious gaps.**

Good luck!

![](image.png)

_Image credit: https://www.slickwords.com/keep-going-you-are-getting-there/_


