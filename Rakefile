desc 'Delete png files from output'
task :clean do |_t, args|
  puts 'inside clean'
  files = Dir['output/*.png']
  puts files.each {|f| File.unlink(f) }
end

desc 'Run rspec'
task :rspec do |_t, args|
  cmd = 'rspec'
  system cmd
end

task :default => [:rspec]

