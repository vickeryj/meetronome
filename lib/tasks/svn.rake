def ignore(pattern, dir)
  system "svn propset svn:ignore '#{pattern}' #{dir}"
  #puts "\t ignoring #{dir}/#{pattern}"
end

namespace :svn do

  desc "Configure svn:ignore properties"
  task :configure do
    puts "Setting svn:ignore properties:"
    ignore '*', 'tmp/cache'
    ignore '*', 'tmp/sessions'
    ignore '*', 'tmp/sockets'
    ignore '*.log', 'log'
    ignore 'lighttpd.conf', 'config'
    ignore 'schema.rb', 'db'
    puts "Done."
  end
   
  desc "Add all new files to subversion"
  task :add do
     system "svn status | grep '^\?' | sed -e 's/? *//' | sed -e 's/ /\ /g' | xargs svn add"
  end

end

namespace 'views' do
  desc 'Renames all .rhtml views to .html.erb, .rjs to .js.rjs, .rxml to .xml.builder and .haml to .html.haml'
  task 'rename' do
    Dir.glob('app/views/**/[^_]*.rhtml').each do |file|
      puts `svn mv #{file} #{file.gsub(/\.rhtml$/, '.html.erb')}`
    end

    Dir.glob('app/views/**/[^_]*.rjs').each do |file|
      puts `svn mv #{file} #{file.gsub(/\.rjs$/, '.js.rjs')}`
    end

    Dir.glob('app/views/**/[^_]*.rxml').each do |file|
      puts `svn mv #{file} #{file.gsub(/\.rxml$/, '.xml.builder')}`
    end

    Dir.glob('app/views/**/[^_]*.haml').each do |file|
      puts `svn mv #{file} #{file.gsub(/\.haml$/, '.html.haml')}`
    end
  end
end
