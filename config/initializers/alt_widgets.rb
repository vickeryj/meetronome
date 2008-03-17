require 'find'

#load all of the alt widget classes
Find.find( RAILS_ROOT + '/app/models/alt_widgets' ) do |file_name|
  if File.basename(file_name)[0] == ?.
    Find.prune
  else
    if /.rb$/ =~ file_name
      require file_name
    end
  end
end

widget_classes = Object.subclasses_of(AltWidget)

#make sure they have instances in the database.
widget_classes.each do |klass|
  klass.find_or_create_by_name(klass.to_s)
end