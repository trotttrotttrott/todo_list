# todo_list

Despite all the elegant productivity and time management tools around, there always seems to be a need for a shitty little todo list somewhere in order to stay alive.
Sometimes it's a post it, sometimes a file on your computer. Both shitty.
I think this ruby solution is a little less shitty.

## Setup

* This project isn't cool enough to be a gem so just clone it here: ~/tasks/
* $ gem install fsdb
* Add an alias for tasks.rb( something like: alias t='ruby ~/tasks/tasks.rb' )

## Usage

$ t push work 'do stuff'

$ t slice work 0

if you had 7 work tasks and you wanted to move the seventh to 0...
$ t move work 7 0

$ t update work 0 "this task was written badly so I'm rewriting it."

$ t print

$ t p # alias for print
