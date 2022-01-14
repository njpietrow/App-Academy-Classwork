<h1>Battleship Project</h1>
<h1>Mastermind Project</h1>
<p>Includes an intermediate algorithm to calculate number of "near matches" while excluding exact matches</p>
<section class="sc-brqgnP gYSzuT sc-bJHhxl dHctkM"><h1>Tic-Tac-Toe</h1><p>Let's write a Tic-Tac-Toe game! Read the entire instructions before getting
started. You'll be creating this entire project from scratch, no skeleton. We'll
build three iterations of the game, each adding an interesting twist on the
gameplay:</p><ul><li>Version 1 - Basic 3x3 grid game with 2 human players</li><li>Version 2 - Dynamic sized grid with 2 or more human players</li><li>Version 3 - Dynamic sized grid with 2 or more human or computer players</li></ul><h2>Version 1: Make it work</h2><p>Below we have recommendations on how to design your game. For simplicity, we'll
give the grid the dimensions of classic tic-tac-toe, 3x3. This can later be
refactored for a dynamic grid size. Let's establish some guidelines that will
help our game take shape later.</p><p>Programmatically, we'll use a 2-dimensional array to present the <em>grid</em>. Our
players will have unique symbols for gameplay. We'll refer to those as <em>marks</em>.
An empty position on the grid will be represented with an underscore <code class="sc-cMljjf hbDMZX">'_'</code>.
Below is an example of a grid:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;"><span class="token" style="color: rgb(248, 248, 242);">[</span>
    <span class="token" style="color: rgb(248, 248, 242);">[</span><span class="token" style="color: rgb(166, 226, 46);">:X</span><span class="token" style="color: rgb(248, 248, 242);">,</span> <span class="token" style="color: rgb(166, 226, 46);">:O</span><span class="token" style="color: rgb(248, 248, 242);">,</span> <span class="token" style="color: rgb(230, 219, 116);">'_'</span><span class="token" style="color: rgb(248, 248, 242);">]</span><span class="token" style="color: rgb(248, 248, 242);">,</span>
    <span class="token" style="color: rgb(248, 248, 242);">[</span><span class="token" style="color: rgb(166, 226, 46);">:O</span><span class="token" style="color: rgb(248, 248, 242);">,</span> <span class="token" style="color: rgb(166, 226, 46);">:X</span><span class="token" style="color: rgb(248, 248, 242);">,</span> <span class="token" style="color: rgb(230, 219, 116);">'_'</span><span class="token" style="color: rgb(248, 248, 242);">]</span><span class="token" style="color: rgb(248, 248, 242);">,</span>
    <span class="token" style="color: rgb(248, 248, 242);">[</span><span class="token" style="color: rgb(230, 219, 116);">'_'</span><span class="token" style="color: rgb(248, 248, 242);">,</span> <span class="token" style="color: rgb(230, 219, 116);">'_'</span><span class="token" style="color: rgb(248, 248, 242);">,</span> <span class="token" style="color: rgb(166, 226, 46);">:X</span><span class="token" style="color: rgb(248, 248, 242);">]</span><span class="token" style="color: rgb(248, 248, 242);">,</span>
<span class="token" style="color: rgb(248, 248, 242);">]</span></code></pre><p>To refer to a <em>position</em> of the grid, we'll use an array containing the row and
column indices. For example, the position of the first row, second column would
be <code class="sc-cMljjf hbDMZX">[0, 1]</code>; this is the location of a <code class="sc-cMljjf hbDMZX">:O</code>.</p><h3>Directory structure</h3><p>We'll be building 3 classes to construct our basic game. Begin by creating a
<code class="sc-cMljjf hbDMZX">tic_tac_toe_v1</code> directory with the following structure:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">tic_tac_toe_v1/
├── board.rb
├── human_player.rb
└── game.rb</code></pre><p>Once we have the basic game down, we'll implement some fun additional features!
Ready?</p><h3>Board</h3><p>The <code class="sc-cMljjf hbDMZX">Board</code> class is responsible for adding a player's marks, checking for
winners, and printing the game board. A board instance must have an attribute to
represent the grid. For simplicity, give the grid the dimensions of classic
tic-tac-toe, 3x3.</p><h4>Board#initialize</h4><p>A <code class="sc-cMljjf hbDMZX">Board</code> instance must have an instance variable to represent the game grid.
For now, <code class="sc-cMljjf hbDMZX">Board#initialize</code> does not need to accept any arguments. Initialize
the grid so that all positions are empty; this means that every position should
contain an underscore (<code class="sc-cMljjf hbDMZX">'_'</code>).</p><h4>Board#valid?(position)</h4><p>This method should return a boolean indicating whether or not the specified
position is valid for the board, meaning the position is not "out of bounds."</p><h4>Board#empty?(position)</h4><p>This method should return a boolean indicating whether or not the specified
position does not contain a player's mark.</p><h4>Board#place_mark(position, mark)</h4><p>This method should assign the given mark to the specified position of the grid.
It should raise an error when the position is not <code class="sc-cMljjf hbDMZX">#valid?</code> or not <code class="sc-cMljjf hbDMZX">#empty?</code>.</p><h4>Checkpoint - Board yet?</h4><p>At this point you've written a few Board methods that are critical to the
gameplay. Now's a good opportunity to pause and test our code for correctness. A
quick way to test is to use pry.</p><p>You should <code class="sc-cMljjf hbDMZX">cd</code> into the project folder and run <code class="sc-cMljjf hbDMZX">pry</code>. Then, use <code class="sc-cMljjf hbDMZX">load
'board.rb'</code> to load your code into the environment, this should return <code class="sc-cMljjf hbDMZX">true</code> if
the file was successfully loaded. From there, play around with your class by
creating an instance and calling some methods on it! If you edit the file you
are going to have to load it into the environment again.</p><p>Here are a few lines that we executed to test <em>our</em> code, feel free to try <em>your
own</em> scenarios:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'board.rb'
=&gt; true

[2] pry(main)&gt; b = Board.new
=&gt; #&lt;Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]&gt;

[3] pry(main)&gt; b.place_mark([-1, 2], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in `place_mark'

[4] pry(main)&gt; b.place_mark([1, 2], :X)
=&gt; :X

[5] pry(main)&gt; b
=&gt; #&lt;Board:0x @grid=[["_", "_", "_"], ["_", "_", :X], ["_", "_", "_"]]&gt;

[6] pry(main)&gt; b.place_mark([1, 3], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in `place_mark'

[7] pry(main)&gt; b.place_mark([0, 0], :O)
=&gt; :O

[8] pry(main)&gt; b
=&gt; #&lt;Board:0x @grid=[[:O, "_", "_"], ["_", "_", :X], ["_", "_", "_"]]&gt;

[9] pry(main)&gt; b.place_mark([0, 0], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in `place_mark'</code></pre><p>Once you feel confident with your code, move forward. As a programmer, you
should test your code often as you write. If you continue to write code on top
of broken code, you may accumulate a deficit of bugs that will be hard to
isolate later on. Be methodical! You should be testing your code often, and not
just when we tell you!</p><h4>Board#print</h4><p>This method should simply print out the board and all of the marks that have
been placed on it. Feel free to style the printing as much as you'd like, but be
sure to print out each row of the board on a new line. This will help us
visualize the board better as we debug or even play the game!</p><h4>Board#win_row?(mark)</h4><p>This method should return a boolean indicating whether or not the given mark has
completely filled up any row of the grid.</p><h4>Board#win_col?(mark)</h4><p>This method should return a boolean indicating whether or not the given mark has
completely filled up any column of the grid.</p><h4>Board#win_diagonal?(mark)</h4><p>This method should return a boolean indicating whether or not the given mark has
completely filled up either diagonal of the grid.</p><h4>Board#win?(mark)</h4><p>This method should return a boolean indicating whether or not the given mark has
filled any full row, column, or diagonal.</p><h4>Board#empty_positions?</h4><p>This method should return a boolean indicating whether or not there is at least
one empty position on the grid.</p><h4>Checkpoint - You're all winners</h4><p>If you haven't already, take a moment to use pry to test your win-checking
logic. Use your <code class="sc-cMljjf hbDMZX">#place_mark</code> to set the board up and <code class="sc-cMljjf hbDMZX">#print</code> to visually
verify any winners. We'll leave it to you to decide reasonable test scenarios.
As a rule of thumb for methods with boolean returns, be sure to test for
"false-positives" and "false-negatives". In other words, verify that <code class="sc-cMljjf hbDMZX">#win?</code> and
the related methods return true when they should <strong>and</strong> return false when they
should. Don't forget to test your <code class="sc-cMljjf hbDMZX">#empty_positions?</code> method as well!</p><h3>HumanPlayer</h3><p>The <code class="sc-cMljjf hbDMZX">HumanPlayer</code> class is responsible for holding information about the user
and prompting them to enter a position for gameplay.</p><h4>HumanPlayer#initialize(mark_value)</h4><p>We'll allow a player to use any mark they like, so an instance of <code class="sc-cMljjf hbDMZX">HumanPlayer</code>
should have a instance variable to store their mark. The value of this mark
should be provided as an argument when creating a new player. Consider adding a
getter method for the player's mark, this may be useful later!</p><h4>HumanPlayer#get_position</h4><p>This method should prompt and allow the user to enter a valid <code class="sc-cMljjf hbDMZX">row col</code>
position. We recommend that you ask the user to enter the position as two
numbers with a space between them. Your method should return their entered
position as an array of the form <code class="sc-cMljjf hbDMZX">[row, col]</code> so that it is compatible with the
design of our previous <code class="sc-cMljjf hbDMZX">Board</code> methods. For usability, raise an error when they
fail to enter a position in the specified format, such as if they only enter a
single number, use letters, or have too many spaces.</p><p>No need to verify if the position they entered is a valid position in this
class. That validation requires knowledge of the board and we want to keep our
concerns separated. Besides, you previously implemented that logic in
<code class="sc-cMljjf hbDMZX">Board#valid?</code> and <code class="sc-cMljjf hbDMZX">Board#empty?</code>.</p><p>It's also helpful if you state the player's mark when asking them to enter a
move, so we know whose turn it is.</p><h4>Checkpoint - Test often, we're only human after all</h4><p>This is a great time to test your work! Load your <code class="sc-cMljjf hbDMZX">HumanPlayer</code> class into pry
and test it. Here is how we tested our player:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'human_player.rb'
=&gt; true

[2] pry(main)&gt; player_1 = HumanPlayer.new(:X)
=&gt; #&lt;HumanPlayer:0x @mark=:X&gt;

[3] pry(main)&gt; player_1.mark
=&gt; :X

[4] pry(main)&gt; player_1.get_position
Player X, enter two numbers representing a position in the format `row col`
0 2
=&gt; [0, 2]

[5] pry(main)&gt; player_1.get_position
Player X, enter two numbers representing a position in the format `row col`
12 4
=&gt; [12, 4]

[6] pry(main)&gt; player_1.get_position
Player X, enter two numbers representing a position in the format `row col`
1 2 3
RuntimeError: sorry, that was invalid :(</code></pre><p>Before you move on, double check that your <code class="sc-cMljjf hbDMZX">Player#get_position</code> returns an
array of <em>numbers</em>, and not an array of strings. This will save you a ton of
headaches later!</p><h3>Game</h3><p>The <code class="sc-cMljjf hbDMZX">Game</code> class will be the main class that houses the instances of <code class="sc-cMljjf hbDMZX">Board</code> and
<code class="sc-cMljjf hbDMZX">HumanPlayer</code> required for gameplay. It will be responsible for passing data
between the board and players. It will also serve to contain the main game loop.</p><p>Be sure to <code class="sc-cMljjf hbDMZX">require</code> your <code class="sc-cMljjf hbDMZX">board.rb</code> and <code class="sc-cMljjf hbDMZX">human_player.rb</code> files into <code class="sc-cMljjf hbDMZX">game.rb</code>.</p><h4>Game#initialize(player_1_mark, player_2_mark)</h4><p>An instance of <code class="sc-cMljjf hbDMZX">Game</code> should have instance variables for player one, player two,
and the board. Design the <code class="sc-cMljjf hbDMZX">#initialize</code> method to accept the mark values to be
used for the players.</p><p>You should also initialize an instance variable to contain the current player.
By default, player one should begin as the current player.</p><h4>Game#switch_turn</h4><p>This method should set the current player to the other player. Calling this
method repeatedly should switch the current player back and forth between the
two players.</p><p>This method is critical for gameplay so be sure to test it in pry. Here is how
our switching mechanic performs:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'game.rb'
=&gt; true

[2] pry(main)&gt; game = Game.new(:X, :O)
=&gt; #&lt;Game:0x0
 @current_player=#&lt;HumanPlayer:0x @mark=:X&gt;,
 @board=#&lt;Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]&gt;,
 @player_1=#&lt;HumanPlayer:0x @mark=:X&gt;,
 @player_2=#&lt;HumanPlayer:0x @mark=:O&gt;&gt;

[3] pry(main)&gt; game.switch_turn
=&gt; #&lt;HumanPlayer:0x @mark=:O&gt;

[4] pry(main)&gt; game
=&gt; #&lt;Game:0x00007f8b5ac725f8
 @current_player=#&lt;HumanPlayer:0x @mark=:O&gt;,
 @board=#&lt;Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]&gt;,
 @player_1=#&lt;HumanPlayer:0x @mark=:X&gt;,
 @player_2=#&lt;HumanPlayer:0x @mark=:O&gt;&gt;

[5] pry(main)&gt; game.switch_turn
=&gt; #&lt;HumanPlayer:0x @mark=:X&gt;

[6] pry(main)&gt; game
=&gt; #&lt;Game:0x00007f8b5ac725f8
 @current_player=#&lt;HumanPlayer:0x @mark=:X&gt;,
 @player_1=#&lt;HumanPlayer:0x @mark=:X&gt;,
 @player_2=#&lt;HumanPlayer:0x @mark=:O&gt;&gt;
 @board=#&lt;Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]&gt;,</code></pre><p>Notice how <code class="sc-cMljjf hbDMZX">@current_player</code> changes when we call <code class="sc-cMljjf hbDMZX">#switch_turn</code>. With that, we
now have all the mechanics needed to put the game together!</p><h4>Game#play</h4><p>This method will contain the main game loop. Here is some psuedocode for the
loop:</p><ul><li>while there exists empty positions on the board<ul><li>print the board</li><li>get a position from the current player</li><li>place their mark at that position of the board</li><li>check if that user has won<ul><li>if they win, print out a 'victory' message saying who won and return to
end the game</li><li>otherwise they did not win, so switch turns</li></ul></li></ul></li><li>if we finish the while loop without returning, that means there are no more
empty positions on the board and noone has won, so print a 'draw' message</li></ul><p>Test your game in pry. Play a few games by creating an instance of <code class="sc-cMljjf hbDMZX">Game</code> and
invoking <code class="sc-cMljjf hbDMZX">#play</code> on it. After a game is over, be sure to create a <em>new</em> instance
of <code class="sc-cMljjf hbDMZX">Game</code> to play again, this is the only way to get a fresh board. Some
scenarios to test are: player one winning, player two winning, and a draw.</p><p>If any errors are raised during gameplay, your game loop and <code class="sc-cMljjf hbDMZX">#play</code> method will
end immediately, so you'll have to start a new game and retry!</p><h2>Version 2: Make it scalable</h2><p>Make a copy of your entire <code class="sc-cMljjf hbDMZX">tic_tac_toe_v1</code> directory and rename it
<code class="sc-cMljjf hbDMZX">tic_tac_toe_v2</code>. Open the version 2 in your editor and terminal so we can
refactor it to support more features. This will be our new working directory.</p><p>Our goal for this version is to make the game scale on two fronts:</p><ol><li>support a dynamic board size</li><li>support more than two players</li></ol><h3>Board size refactor</h3><p>We need to change a few things to support any size board. We'll mention a few
general todos, but you may need to change more if you hard-coded a 3x3 size in
your first iteration.</p><h4>Board#initialize</h4><p>Refactor this method to accept a number argument, <strong>n</strong>. The grid should be set
to a 2-dimensional array with size '<strong>n</strong> x <strong>n</strong>', instead of '3 x 3'. It's
worth noting that the grid will always be a square (meaning its height is equal
to its width). This will somewhat simplify things as we refactor our other
methods.</p><p>Consider refactoring these critical board methods if they contain any hardcoded
values:</p><ul><li><code class="sc-cMljjf hbDMZX">#valid?</code></li><li><code class="sc-cMljjf hbDMZX">#print</code></li><li><code class="sc-cMljjf hbDMZX">#win_row?</code></li><li><code class="sc-cMljjf hbDMZX">#win_col?</code></li><li><code class="sc-cMljjf hbDMZX">#win_diagonal</code></li><li><code class="sc-cMljjf hbDMZX">#win?</code></li><li><code class="sc-cMljjf hbDMZX">#empty_positions?</code></li></ul><h4>Checkpoint - Test the fruits of your labor(ed)</h4><p>Load <code class="sc-cMljjf hbDMZX">board.rb</code> using pry. Create different sized boards and invoke <strong>all</strong>
board methods on them. Here are our initial tests, but you should be much more
thorough:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'board.rb'
=&gt; true

[2] pry(main)&gt; small = Board.new(4)
=&gt; #&lt;Board:0x
 @grid=[
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"]]
   &gt;

[3] pry(main)&gt; large = Board.new(6)
=&gt; #&lt;Board:0x
 @grid=
  [["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"]]&gt;

[4] pry(main)&gt; small.valid?([3, 3])
=&gt; true

[5] pry(main)&gt; small.valid?([5, 5])
=&gt; false

[6] pry(main)&gt; large.valid?([5, 5])
=&gt; true</code></pre><h4>Game#initialize</h4><p>Refactor this method to also accept a number for the board size as the first
argument.</p><p>That <em>should</em> be all we need to refactor, since we designed our version 1 to
avoid as much coupling to <code class="sc-cMljjf hbDMZX">Board</code> as possible. However, take a moment to scan
the rest of your <code class="sc-cMljjf hbDMZX">Game</code> and <code class="sc-cMljjf hbDMZX">HumanPlayer</code> class to be sure.</p><p>Use pry to play a few games of varying size to completion before continuing
further.</p><h3>Number of players refactor</h3><p>Adding support for any number of players should require a decent refactor of the
<code class="sc-cMljjf hbDMZX">Game</code> class, but no major changes to <code class="sc-cMljjf hbDMZX">HumanPlayer</code>. The only logic that should
change is how we decide <em>which</em> player should move, but the capabilities of any
single player remains unchanged.</p><h4>Game#initialize</h4><p>An instance of <code class="sc-cMljjf hbDMZX">Game</code> will now need to track an array of many players instead of
just two. Make this an instance variable. Allow your <code class="sc-cMljjf hbDMZX">#initialize</code> to accept any
number of mark values. The number of marks passed to <code class="sc-cMljjf hbDMZX">#initialize</code> will decide
how many players are in the game.</p><h4>Game#switch_turn</h4><p>For our switching logic, we'll use a "Round Robin" strategy. This means that
players continually take turns in the same order. For example, if we had players
A, B, and C, then the turns would be ABCABCABC... until the game is over.</p><p>For simplicity, we'll always designate whoever is at the front of the array as
the current player. Consider using <code class="sc-cMljjf hbDMZX">Array#rotate!</code> to accomplish this.</p><p>Test the switching logic in isolation using pry. Here is how our class works:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'game.rb'
=&gt; true

[2] pry(main)&gt; g = Game.new(4, 'A', 'B', 'C')
=&gt; #&lt;Game:0x
 @board=
  #&lt;Board:0x
   @grid=[["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"]]&gt;,
 @current_player=#&lt;HumanPlayer:0x @mark="A"&gt;,
 @players=
  [#&lt;HumanPlayer:0x @mark="A"&gt;,
   #&lt;HumanPlayer:0x @mark="B"&gt;,
   #&lt;HumanPlayer:0x @mark="C"&gt;]&gt;

[3] pry(main)&gt; g.switch_turn
=&gt; #&lt;HumanPlayer:0x @mark="B"&gt;

[4] pry(main)&gt; g.switch_turn
=&gt; #&lt;HumanPlayer:0x @mark="C"&gt;

[5] pry(main)&gt; g
=&gt; #&lt;Game:0x
 @board=
  #&lt;Board:0x
   @grid=[["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"]]&gt;,
 @current_player=#&lt;HumanPlayer:0x @mark="C"&gt;,
 @players=
  [#&lt;HumanPlayer:0x @mark="C"&gt;,
   #&lt;HumanPlayer:0x @mark="A"&gt;,
   #&lt;HumanPlayer:0x @mark="B"&gt;]&gt;</code></pre><p>After you see that the current player is switching properly, you should be able
to play your game! Play a few rounds of varying size for good measure. Pretty
neat, huh?</p><h2>Version 3: Rise of the machines</h2><p>Make a copy of your entire <code class="sc-cMljjf hbDMZX">tic_tac_toe_v2</code> directory and rename it
<code class="sc-cMljjf hbDMZX">tic_tac_toe_v3</code>. Open the version 3 in your editor and terminal so we can
refactor it to support more features. This will be our new working directory.</p><p>Our goal for this version is to implement a simple <code class="sc-cMljjf hbDMZX">ComputerPlayer</code> class that
will play randomly. We will also add some improved error handling for our
existing <code class="sc-cMljjf hbDMZX">HumanPlayer</code>s.</p><p>Let's begin by adding a new file in our working directory to house
<code class="sc-cMljjf hbDMZX">ComputerPlayer</code>:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">tic_tac_toe_v3/
├── computer_player.rb
├── human_player.rb
├── board.rb
└── game.rb</code></pre><h3>Refactoring for random positions</h3><p>Our <code class="sc-cMljjf hbDMZX">ComputerPlayer</code> artificial intelligence will be naive. When it is their
turn, a computer will play a random position on the board. However, we'll want
ensure that the computers will choose a position that is legal according to
<code class="sc-cMljjf hbDMZX">Board#empty?</code> and <code class="sc-cMljjf hbDMZX">Board#valid?</code>. To implement this we, <em>could</em> just
continually "guess and check" random positions until a legal position is
stumbled upon, but this is a rather wasteful strategy. Instead, it would be much
more wise to provide a list of legal positions to the <code class="sc-cMljjf hbDMZX">ComputerPlayer</code> from
which they may randomly select.</p><p>Here is where we must make a design decision founded on object oriented
principles. We should try our best to keep all board and position related logic
inside of <code class="sc-cMljjf hbDMZX">Board</code>. Although our new major feature is <code class="sc-cMljjf hbDMZX">ComputerPlayer</code>, it is
apparent that the <code class="sc-cMljjf hbDMZX">Board</code> class also needs to provide additional information for
a <code class="sc-cMljjf hbDMZX">ComputerPlayer</code> to consume.</p><h4>Board#legal_positions</h4><p>This method should return an array containing all positions of the board that
are legal to place a new mark on. That is, the returned positions should not
already contain a mark and also be "in-bounds" on the grid.</p><h4>ComputerPlayer#initialize</h4><p>An instance of <code class="sc-cMljjf hbDMZX">ComputerPlayer</code> should have the same interface as a
<code class="sc-cMljjf hbDMZX">HumanPlayer</code>. This means that both classes should have the same method names,
but may implement these methods using different logic. Having a consistent
interface for all types of players will allow us to use computers and humans
interchangeably in a game with no annoying side-effects. The <code class="sc-cMljjf hbDMZX">#initialize</code> for a
computer should be identical to that of a human.</p><p>The programming paradigm we leverage here is known as <a href="https://en.wikipedia.org/wiki/Duck_typing" target="_blank">duck
typing</a>. If an object walks like a duck and quacks like a duck,
then we can use it as a duck for all intents and purposes. In our game, we have
duck typed <code class="sc-cMljjf hbDMZX">HumanPlayer</code> and <code class="sc-cMljjf hbDMZX">ComputerPlayer</code>.</p><h4>ComputerPlayer#get_position(legal_positions)</h4><p>Assume that this method takes in an array of positions as an argument. The
method should return a random position from the array. To make gameplay clear,
print a message saying the computer's mark along with the position they chose.</p><p>Unlike our new <code class="sc-cMljjf hbDMZX">ComputerPlayer#get_position</code>, you may recall that our old
<code class="sc-cMljjf hbDMZX">HumanPlayer#get_position</code> did not accept any argument. This discrepancy in
interface will cause issues. We'll reconcile this difference next.</p><h4>HumanPlayer#get_position(legal_positions)</h4><p>Refactor this method to accept an array of positions as an argument. If the user
enters a position that is not inside of the array argument, tell them that their
choice was illegal and prompt them to enter another. This method should continue
to prompt the user until they make a legal choice.</p><h4>Checkpoint - Turing's test†</h4><p>Before we go any further, let's take a moment to verify the behavior of all of
the methods we created or refactored. We'll test them in isolation of one
another before we connect them together.</p><p>Here's is the pry workflow we used to test our board:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'board.rb'
=&gt; true

[2] pry(main)&gt; my_board = Board.new(2)
=&gt; #&lt;Board:0x @grid=[["_", "_"], ["_", "_"]]&gt;

[3] pry(main)&gt; my_board.legal_positions
=&gt; [[0, 0], [0, 1], [1, 0], [1, 1]]

[4] pry(main)&gt; my_board.place_mark([0, 1], :Z)
=&gt; :Z

[5] my_board.legal_positions
=&gt; [[0, 0], [1, 0], [1, 1]]</code></pre><p>Let's also test our humans. Since <code class="sc-cMljjf hbDMZX">#getPositions</code> simply expects an array as its
argument, we can pass in some "mock" data that doesn't really come from any
board. Don't forget that <strong>abstraction</strong> is a pillar of object oriented
programming. Our <code class="sc-cMljjf hbDMZX">#getPositions</code> just cares about being given an array, it
doesn't care exactly where that array comes from:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'human_player.rb'
=&gt; true

[2] pry(main)&gt; dave = HumanPlayer.new(:X)
=&gt; #&lt;HumanPlayer:0x @mark=:X&gt;

[3] pry(main)&gt; positions = [[1, 2], [3, 4], [4, 3]]
=&gt; [[1, 2], [3, 4], [4, 3]]

[4] pry(main)&gt; dave.get_position(positions)
Player X, enter two numbers representing a position in the format `row col`
3 4
=&gt; [3, 4]

[5] pry(main)&gt; dave.get_position(positions)
Player X, enter two numbers representing a position in the format `row col`
2 5
[2, 5] is not a legal position
Player X, enter two numbers representing a position in the format `row col`
1 2
=&gt; [1, 2]</code></pre><p>Finally, let's verify our AI:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'computer_player.rb'
=&gt; true

[2] pry(main)&gt; hal_9000 = ComputerPlayer.new(:Y)
=&gt; #&lt;ComputerPlayer:0x @mark=:Y&gt;

[3] pry(main)&gt; positions = [[1, 2], [3, 4], [4, 3]]
=&gt; [[1, 2], [3, 4], [4, 3]]

[4] pry(main)&gt; hal_9000.get_position(positions)
Computer Y chose position [1, 2]
=&gt; [1, 2]

[5] pry(main)&gt; hal_9000.get_position(positions)
Computer Y chose position [3, 4]
=&gt; [3, 4]</code></pre><p>Do any other testing that you see fit before moving on.</p><h4>Game#initialize</h4><p>Refactor this method to accept an option hash instead of an arbitrary number of
marks (we previously implemented that in version 2). A hash is a great choice
here because we now need to communicate two details per player: their mark and
whether they are human or computer. We also have the upshot of hash keys
necessarily being unique. This is convenient because for proper gameplay we must
have unique marks among the players!</p><p>Assume that the keys of the hash are the marks and the values are booleans.
Interpret false as a human and true as a computer. The order of players in the
hash should dictate the order that they take their turns. For example, the
following game would entail three players of X (human), Y (computer), and Z
(human) playing on a 4 by 4 board:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">[1] pry(main)&gt; load 'game.rb'
=&gt; true

[2] pry(main)&gt; Game.new(4, X: false, Y: true, Z: false)
=&gt; #&lt;Game:0x
 @players=
  [#&lt;HumanPlayer:0x @mark=:X&gt;,
   #&lt;ComputerPlayer:0x @mark=:Y&gt;,
   #&lt;HumanPlayer:0x @mark=:Z&gt;]&gt;,
 @current_player=#&lt;HumanPlayer:0x @mark=:X&gt;,
 @board=
  #&lt;Board:0x
   @grid=[["_", "_", "_", "_"], ["_", "_", "_", "_"], ["_", "_", "_", "_"], ["_", "_", "_", "_"]]&gt;</code></pre><h4>Game#play</h4><p>Only one more refactor and we'll have our final product! Refactor this method
slightly to account for our new argument required for <code class="sc-cMljjf hbDMZX">#get_position</code>. That is,
be sure to pass in the board's legal positions for the player to choose from.</p><p>That's it. Play some diverse games with computers and humans to test your work.
You've done some <em>amazing</em> object oriented programming if you've gotten to this
point. Sit back, relax, and reward yourself by running this snippet in pry:</p><pre style="color: rgb(248, 248, 242); background: rgb(45, 45, 45); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; padding: 1em; overflow: auto; font-size: 16px;"><code style="color: rgb(248, 248, 242); background: none; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; text-align: left; white-space: pre; word-spacing: normal; word-break: normal; overflow-wrap: normal; line-height: 1.5; tab-size: 4; hyphens: none; font-size: 16px;">load <span class="token" style="color: rgb(230, 219, 116);">'game.rb'</span>
machine_civil_war <span class="token" style="color: rgb(248, 248, 242);">=</span> <span class="token" style="color: rgb(174, 129, 255);">Game</span><span class="token" style="color: rgb(248, 248, 242);">.</span><span class="token" style="color: rgb(102, 217, 239);">new</span><span class="token" style="color: rgb(248, 248, 242);">(</span><span class="token" style="color: rgb(174, 129, 255);">10</span><span class="token" style="color: rgb(248, 248, 242);">,</span> h<span class="token" style="color: rgb(248, 248, 242);">:</span> <span class="token" style="color: rgb(102, 217, 239);">true</span><span class="token" style="color: rgb(248, 248, 242);">,</span> u<span class="token" style="color: rgb(248, 248, 242);">:</span> <span class="token" style="color: rgb(102, 217, 239);">true</span><span class="token" style="color: rgb(248, 248, 242);">,</span> e<span class="token" style="color: rgb(248, 248, 242);">:</span> <span class="token" style="color: rgb(102, 217, 239);">true</span><span class="token" style="color: rgb(248, 248, 242);">)</span>
machine_civil_war<span class="token" style="color: rgb(248, 248, 242);">.</span>play</code></pre><p>No skynet anytime soon.</p><p>†<a href="https://en.wikipedia.org/wiki/Turing_test" target="_blank">The Turing test</a></p></section>
