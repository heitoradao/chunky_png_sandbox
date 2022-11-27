desc 'Delete png files from output'
task :clean do |_t, args|
  puts 'inside clean'
  files = Dir['output/*.png']
  puts files.each {|f| File.unlink(f) }
end

