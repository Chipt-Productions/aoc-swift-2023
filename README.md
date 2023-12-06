# Learning Swift through Advent of Code

[![Language](https://img.shields.io/badge/language-Swift-red.svg)](https://swift.org)

Hi! 👋🏼 My name is Jade, and I'm a total Swift newbie.

The goal for this project is to better learn the Swift programming language by solving 
2023's [Advent of Code](<https://adventofcode.com/>) programming puzzles, made by
[Eric Wastl](<http://was.tl/>).

This project was created from Apple's 
[example starter project](https://github.com/apple/swift-aoc-starter-example) 
for building Advent of Code solutions using Swift.

## Local Usage

Swift comes with Xcode, or you can [install it](https://www.swift.org/install/)
on a supported macOS, Linux, or Windows platform. 

If you're using Xcode, you can open this project by choosing File / Open and
select the parent directory. 

If you prefer the command line, you can run the test suite with `swift test`,
and run the output with `swift run`.

If you're using Visual Studio Code to edit, you might find these Swift
extensions useful:

- [Swift](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang)
  (provides core language edit / debug / test features)
- [apple-swift-format](https://marketplace.visualstudio.com/items?itemName=vknabel.vscode-apple-swift-format)
  (supports the [swift-format](https://github.com/apple/swift-format) package)

## Daily Challenges

The challenges assume three files (replace 00 with the day of the challenge).

- `Data/Day00.txt`: the input data provided for the challenge
- `Sources/Day00.swift`: the code to solve the challenge
- `Tests/Day00.swift`: any unit tests that you want to include

To start a new day's challenge, make a copy of these files and update as
necessary. The `AdventOfCode.swift` file controls which day's challenge is run
with `swift run`. By default that runs the most recent challenge in the package.

To supply command line arguments use `swift run AdventOfCode`. For example,
`swift run -c release AdventOfCode --benchmark 3` builds the binary with full
optimizations, and benchmarks the challenge for day 3.

## Linting and Formatting

Challenge source code can be linted and formatted automatically using the
included dependency on `swift-format`.

Lint source code with the following command:

```shell
$ swift package lint-source-code
```

Format source code with the following command:

```shell
$ swift package format-source-code
Plugin ‘Format Source Code’ wants permission to write to the package directory.
Stated reason: “This command formats the Swift source files”.
Allow this plugin to write to the package directory? (yes/no)
```

To avoid the interactive prompt when formatting source code, use the 
`--allow-writing-to-package-directory` flag.
 
```shell
$ swift package format-source-code --allow-writing-to-package-directory
```

swift-format will use the built-in default style to lint and format code. A
`.swift-format` configuration file can be used to customize the style used, see
[Configuration](https://github.com/apple/swift-format/blob/main/Documentation/Configuration.md)
for more details. 

## Challenge Submissions

***Possible spoilers lie ahead -- Read at Your Own Risk***

### Day 01

This was a good real-world introduction to Swift. It challenged my knowledge 
of the syntax, types, and some of the String and Substring methods (there are
so many!).

There was a twist in part two of today's challenge, which was not very well 
documented. As a result, the second half took quite a while, and I had to
come up with a strange solution to avoid a complete refactor of my approach.

It's always hard to learn a new language, I knew I could have solved this much
faster if I were using a familiar language, such as TypeScript. However, I am
committing myself to complete this year's advent in Swift, as it's going to be
a great way to get more familiar with it. Hopefully by day 24 I'm no longer 
struggling with little things like creating Regexes or converting Substrings to 
Strings 😅.

Today's challenge also reminded me of the importance of tests, not just for
catching bugs, but for creating smaller, intentional sets of data to test out
important aspects of your code. Tests were instrumental for ensuring I properly
caught the quirk in Part 2's computation.

### Day 02

Today was a pretty big crash course into Swift regex, which, apparently, has 
been a bit of a mess. Support for Regex literals in Swift is relatively recent, 
and the syntax in many of the examples online are incomplete, and will throw 
an error. Today was one of those times I would have been at a bit of a loss, 
had I not had access to a very taltented Swift Engineer 
(the lovely [@pennig](https://github.com/pennig)).

With some help, I was able to get over the Regex learning curve and parse the 
data into the structure I wanted for analysis.

Only once I had written most of the parsing code, had we discovered Swift's 
[RegexBuilder](https://developer.apple.com/documentation/regexbuilder), and 
there is a strong temptation to revisit the parsing 👀.

At this point, I'm definitely still writing mediocre code, mostly due to 
limitations in understanding what's available to use, and how to be thinking 
about data and types in Swift. As I get more comfortable, I hope to implement 
some refactors and add some elegance and intentionality to this code. For now, 
well, I'm just glad I'm getting the right results. 😅

### Day 03

Oof, matrix traversal. I always cringe at these types of code puzzzles.

I won't pretend I didn't blatantly copy @pennig's code, after about a hundred
questions on Swift ranges and how his solution worked. The upside is I actually
feel like I've learned quite a bit today. Swift ranges are pretty cool.

Tests continue to be a vital proofing ground, as they can be run a lot faster
than the full code compile.

### Day 04

It's nice to come back to some fun regex parsing after yesterday (yes, I'm one 
of those weirdos who actually likes regex). Today is also a fun exploration into
sets, which I've lightly tapped on in my Swift learnings so far (alongside Advent 
of Code, I am taking some Codecademy courses to learn Swift and SwiftUI).

Sets give us a lot of methods for comparing two sets of things, and finding things
like intersections, unions, etc. There are quite a lot of methods, and it made 
figuring out today's challenge a breeze.

I'm also making use of reduce to minimize the amount of code needed for part 1,
which was a fun bit of practice, since reduce is a method I don't use very often 
(and should probably think to use more...).

Overall, today felt like the day I started feeling more comfortable in Swift -
thinking of my data with Structs and Sets, understanding types and how to handle
optionals, using smart instance methods, and composing my code in a way which 
feels readable and intuitive.

I look forward to Day 05.

### Day 05

Oof, today was brutal. This is what I get for looking forward to things. 😅

It started off well enough. Part 1 of today's challenge was, by far, the most
complex requirements yet. I spent a bit of time thinking about my data model, 
and liked the structure I came up with. I got everything parsed and made a nice 
recursion to go through all of the transformation steps programmatically (rather 
than linerally - not something I had to do, but something I wanted to try).

I submitted part 1 correctly on my first attempt, and then part 2 hit.

I tried to refactor things using IndexSets, and managed to do so, but my 
performance *tanked*, and I wasn't getting the correct answer either. I'm gonna
admit, I'm calling it in for Part 2 today. I managed to submit an answer through
the wonders of open source (😅), but I do want to take a fresh look at my own
solution again, perhaps once the dust has settled. 

Until mañana.
