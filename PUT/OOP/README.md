<header>

<!--
  <<< Author notes: Course header >>>
  Read <https://skills.github.com/quickstart> for more information about how to build courses using this template.
  Include a 1280×640 image, course name in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Next to "About", add description & tags; disable releases, packages, & environments.
  Add your open source license, GitHub uses the MIT license.
-->

# Aquarium Project (Bartosz Skrzypczak)

Java Based application to demonstrate how to use OOP principles, for example interface, inheritance.

</header>

<!--
  <<< Author notes: Step 1 >>>
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
  TBD-step-1-notes.
-->

## Implementation:
<!--
_Welcome to "TBD-course-name"! :wave:_

TBD-step-1-information

**What is _TBD-term-1_**: TBD-definition-1

### :keyboard: Activity: TBD-step-1-name
-->
Main function is located in <b>Aquarium Class</b>, where the background, including seagrass etc. is created and displayed at first. Class contains variarbles storing actual number of <b>Animals</b> and running <b>Threads</b> too. Main function is not only responsible for visual pleasure but also for <b>Buttons</b> work, cause in main <b>ActionListeners</b> are placed<br/>
Buttons available for user and their functions:
- <b>Add Fish</b> (opens a panel to choose which animal user wants to add)
- <b>Remove Fish</b> (opens a panel to choose which animal user wants to remove)
- <b>Add Random Fish</b> (adds up to 10 animals of randomly choosen spieces)
- <b>Remove All Fish</b> (removes all fishes in aquarium) <br/><br/>

Each time a new animal is added, method <b>display()</b> and then <b>swim()</b> are called and new Thread is created and starts running.
The <b>Animal class</b> has its subclasses such as:
- <b>Fish</b>
- <b>Crab</b>
- <b>Turtle</b>
- <b>Mussel</b>
- <b>Seahorse</b><br/>

All objects of class Animals has some attributes including its width, height, speed etc. This class include three crucial methods:<br/>
- <b>move()</b> (decides in which of eight direction object should move and how big the movement is)
- <b>reproduce()</b> (if two animals of the same spiece are close enough and if they are prolific, they can reproduce. This results in new animal creation, but also parents lose their ability to reproduce again)
- <b>die()</b> (each animals has its own time of living, after it animals dies)

<b>Animal Class</b> has its subclasses, <b>Fish</b> (which will be discused later), <b>Turtle</b>, <b>Mussel</b>, <b>Crab</b> and <b>Seahorse</b>. These classes inherit all of Animal methods and fields, some of methods are <b>overriden</b> but few is new.

<b>Fish Class</b> is subclass of <b>Animal Class</b> but at the same time is parent class for <b>RedFish</b>, <b>YellowFish</b> and <b>Shark</b> classes. Just like previously mentioned subclasses of Animal theese inherit all too, and add some of their own. For example class <b>Shark</b> has its own field <b>hunger level</b> and additional method <b>hunt()</b> based on hunger level. <br/>
## Example of UI:
<p align="center"><img align="center" src="https://github.com/dataproctech/long-term-project-java-bskrzypczak/blob/main/Aquarium1.png" height="400" width="700" /></p>
<p align="center"><img align="center" src="https://github.com/dataproctech/long-term-project-java-bskrzypczak/blob/main/Aquarium2.png" height="400" width="700" /></p>

<footer>

<!--
  <<< Author notes: Footer >>>
  Add a link to get support, GitHub status page, code of conduct, license link.
-->

---

Get help: [TBD-support](TBD-support-link) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2023 TBD-copyright-holder &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [MIT License](https://gh.io/mit)

</footer>
