require 'fsdb'

class Tasks

  def initialize(method, *arguments)
    @db = FSDB::Database.new('~/tasks/db')
    before_filter(method, arguments.slice!(0), *arguments)
  end

  def before_filter(method, group, *arguments)
    if group.nil? || is_group?(group) || group == 'push'
      self.send(method, group, *arguments)
      print unless ['p', 'print'].include? method
    end
  end

  def push(group, *tasks)
    @db[group] ||= []
    tasks.to_a.each do |task|
      @db.edit group do |a|
        a << task
      end
    end
  end

  def slice(group, index)
    group_tasks = []
    @db.edit group do |a|
      a.slice!(index.to_i)
      group_tasks = a
    end
    @db.delete group if group_tasks.empty?
  end

  def move(group, *arguments)
    @db.edit group do |a|
      target_task = a.slice!(arguments[0].to_i)
      a.insert(arguments[1].to_i, target_task)
    end
  end

  def update(group, *arguments)
    @db.edit group do |a|
      a[arguments[0].to_i] = arguments[1]
    end
  end

  def print(*arguments)
    groups = arguments.any? ? arguments : @db.fetch('/')
    groups.each do |group|
      puts "\n#{group}"
      @db[group].each_with_index do |task, i|
        puts "#{i}. #{task}"
      end
    end
    puts "\n"
  end

  alias :p :print

  private

  def is_group?(group)
    if @db[group]
      true
    else
      puts "\n#{group} isn't a task group, turd brain."
      false
    end
  end

  def method_missing(m, *args, &block)
    puts %Q(What the fuck is #{m}?)
  end
end

if ARGV.any?
  Tasks.new ARGV.slice!(0), *ARGV
end
