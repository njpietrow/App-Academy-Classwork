# w3d4
<section class="sc-brqgnP gYSzuT sc-bJHhxl dHctkM"><h1>Screwedoku</h1><h2>Overview</h2><p>At the surface, this project is about learning and recognizing common ruby
errors.</p><p>Almost all of these errors are bugs that students hit in their projects (and
that engineers hit in the real world).</p><p>But this project is really about training you to think and debug like an
engineer. The faster you narrow down bugs:</p><ol><li>The faster you learn.</li><li>The more time you save each time you debug something new.</li><li>The more you can solve problems on your own.</li></ol><h2>Learning Goals</h2><ul><li>Be able to read a stack trace and work backwards toward the source of your
error</li><li>Be able to use a debugger effectively</li><li>Be comfortable using <code class="sc-cMljjf hbDMZX">git branch</code>, <code class="sc-cMljjf hbDMZX">git checkout</code>, and <code class="sc-cMljjf hbDMZX">git commit</code></li><li>Know how to <code class="sc-cMljjf hbDMZX">git push</code> to your own Github repo</li></ul><h2>Don'ts</h2><p><strong>Do NOT look up code on the main branch during the project. Looking up the
answer is cheating and defies the purpose of the project.</strong></p><p><strong>Do NOT give other students the solution when they ask you. Only offer them new
approaches that they can take.</strong></p><h2>Tips</h2><p>Make a list of strategies you've been using to debug as you go along.</p><p>If you want to print something out, use the debugger instead. Stop the code and
poke around. Don't use <code class="sc-cMljjf hbDMZX">puts</code> statements if you can avoid it.</p><p>If you get stuck and need ideas, reference our Debugging Cheatsheet in the 
sidebar.</p><h2>Instructions</h2><h3>Before Getting Started</h3><ul><li>Create a directory on the machine you're working on named with the name of 
the day<ul><li><code class="sc-cMljjf hbDMZX">WXDX</code> format - so for example if it is the 4th day of the 3rd week you
would create a folder named <code class="sc-cMljjf hbDMZX">W3D4</code>.</li></ul></li><li>At the end of the day, you will move your day's work folder (i.e.<code class="sc-cMljjf hbDMZX">W3D4</code>) into
your main local <code class="sc-cMljjf hbDMZX">AAClasswork</code> directory.<ul><li>Follow the Git Workflow reading (specifically, the "<strong>Working</strong>" 
section) to add, commit, and push your files!</li></ul></li></ul><p>Check out the instructions <a href="homework-and-classwork" target="_blank">here</a> for how you'll be submitting your
classwork going forward.</p><h3>Setup</h3><ul><li>Download the <a href="https://assets.aaonline.io/fullstack/ruby/projects/screwdoku/screwedoku.zip" target="_blank">zip</a> file.<ul><li><strong>NOTE</strong>: We will <strong>not</strong> be including or pushing up this project in our
classwork repo because it a big project with a lot of commits from some
previous a/A celebrities. Save the skeleton to a different location than
inside the directory you created for today's work.</li></ul></li><li>Run <code class="sc-cMljjf hbDMZX">bundle install</code>.</li><li>Start on the <code class="sc-cMljjf hbDMZX">main</code> branch, which has a working version of the game.</li></ul><h3>Gameplay</h3><p>Fix all the levels.</p><ul><li>List all the levels by running <code class="sc-cMljjf hbDMZX">git branch</code>.</li><li>Run <code class="sc-cMljjf hbDMZX">ruby sudoku.rb</code> on the main branch and fill a few spots to get a feel
for how the game works with correct code.</li></ul><p>Starting with <code class="sc-cMljjf hbDMZX">level-1</code>, for each level:</p><ul><li>Check out that level's code (e.g., run <code class="sc-cMljjf hbDMZX">git checkout level-1</code>,
<code class="sc-cMljjf hbDMZX">git checkout level-2</code>, etc.).</li><li>Run <code class="sc-cMljjf hbDMZX">ruby sudoku.rb</code> and try to fill a few spots. You can catch every bug
within two turns.</li><li>Your game will break somehow.</li><li>Figure out how to fix it using the strategies you've learned. You are allowed
to write extra code and new methods if necessary. You are allowed to use the
scientific method. Your approaches are allowed to be creative.</li><li>If you run out of approaches and are dumbfounded for more than 5 minutes, ask
your cohortmates for approaches to try.</li><li>Run <code class="sc-cMljjf hbDMZX">ruby sudoku.rb</code> and make sure the game plays like the main version. If
the game works after two turns, you're done!</li><li>Add and commit your change once the code works. <strong>Do NOT push</strong>. Reference
the Git Workflow reading in the sidebar if you need to (especially the "Working"
section).</li><li>Before checking out the next branch, close all of your file tabs in VS Code.
VS Code caches open files when switching branches. If you don't close them,
you may be viewing/editing a file that doesn't exist on the branch you just
checked-out.</li></ul><p>Check out the <code class="sc-cMljjf hbDMZX">final-level</code> and <code class="sc-cMljjf hbDMZX">super-evil-level</code> at the end.</p><h3>Bonus</h3><p>Make up three new levels (each on different branches) with three new tricky
errors. Get another group that has finished to try them.</p></section>
