# todo_list

a ruby with fsdb todo list to run in terminal

## Setup

__1 - clone it in your home directory__

`$ cd`

`$ git clone git@github.com:trotttrotttrott/todo_list.git`

__2 - install fsdb__

`$ gem install fsdb`

__3__ _(optional)_ __- Add an alias for tasks.rb( something like: alias tasks='ruby ~/tasks/tasks.rb' )__

## Usage

__methods:__

- push
- slice (s)
- move (m)
- update (u)
- print (p)

__A "boss" might do this:__

`$ tasks push correspondence 'talk to corporate' 'approve memos' 'send some faxes' &&`

`$ tasks push meetings 'lead a workshop' &&`

`$ tasks push employees 'remember birthdays' 'no promotion' 'harrassment law suit' &&`

`$ tasks push management 'direct workflows' 'micro manage' 'promote synergy' &&`

`$ tasks push enjoy 'my own bathroom' &&`

`$ tasks push for_fun 'hit on debra, get rejected, swallow sadness' 'call a sex-line, cry deeply, demand a refund' 'fifth of vodka' &&`

`$ tasks push health 'eat a begel'`

```
<<<< correspondence
  0. talk to corporate
  1. approve memos
  2. send some faxes

<<<< employees
  0. remember birthdays
  1. no promotion
  2. harrassment law suit

<<<< enjoy
  0. my own bathroom

<<<< for_fun
  0. hit on debra, get rejected, swallow sadness
  1. call a sex-line, cry deeply, demand a refund
  2. fifth of vodka

<<<< health
  0. eat a begel

<<<< management
  0. direct workflows
  1. micro manage
  2. promote synergy

<<<< meetings
  0. lead a workshop
```
`$ tasks slice correspondence 0 2 &&`

`$ tasks move management 2 1 &&`

`$ tasks update health 0 'eat a bagel'`

```
<<<< correspondence
  0. approve memos

<<<< employees
  0. remember birthdays
  1. no promotion
  2. harrassment law suit

<<<< enjoy
  0. my own bathroom

<<<< for_fun
  0. hit on debra, get rejected, swallow sadness
  1. call a sex-line, cry deeply, demand a refund
  2. fifth of vodka

<<<< health
  0. eat a bagel

<<<< management
  0. direct workflows
  1. promote synergy
  2. micro manage

<<<< meetings
  0. lead a workshop
```
`$ tasks print health meetings`

```
<<<< health
  0. eat a bagel

<<<< meetings
  0. lead a workshop
```
