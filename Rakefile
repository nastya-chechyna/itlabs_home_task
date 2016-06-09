task :get_up do
  puts 'getting up'
end

task :default => :get_up

task :clean_teath => :get_up do
  puts 'going to bathroom'
end

task :choose_clother_color, [:color] => :clean_teath do |task, args|
  puts "#{args[:color]} color chosen"
end

task :run_all do
  sh 'cucumber -t @registration -f junit -o reports/ -f html -o reports/report.html'
end