namespace :db do
  desc 'Create YAML test fixtures from data in an existing database.  
  Defaults to development database. Set RAILS_ENV to override.'

  task :extract_alts => :environment do
    sql = "SELECT * FROM %s"
    skip_tables = ["schema_info", "sessions"]
    ActiveRecord::Base.establish_connection
    tables = ["alt_widgets"]
    tables.each do |table_name|
      i = "000"
      File.open("#{RAILS_ROOT}/db/#{table_name}.yml", 'w') do |file|
        data = ActiveRecord::Base.connection.select_all(sql % table_name)
        file.write data.inject({}) { |hash, record|
          hash["#{table_name}_#{i.succ!}"] = record
          hash
        }.to_yaml
      end
    end
  end
end

namespace :meetronome do
  desc "insert the alt widget singletons in the db"

  task :build_alts => :environment do
    require 'find'
    Find.find( RAILS_ROOT + '/app/models/alt_widgets' ) do |file_name|
      if File.basename(file_name)[0] == ?.
        Find.prune
      else
        if /.rb$/ =~ file_name
          require file_name
        end
      end
    end

    Object.subclasses_of(AltWidget).each do |widget|
      widget.create! unless widget.find :first
      puts widget.name
    end
  end
end
