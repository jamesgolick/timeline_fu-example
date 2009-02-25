namespace :db do
  desc "Bootstraps the DB by adding a couple of model instances"
  task :bootstrap => :environment do
    francois = Person.create!(:name => "Francois")
    james    = Person.create!(:name => "James")
    mat      = Person.create!(:name => "Mathieu")
    daniel   = Person.create!(:name => "Daniel")

    francois.friends << james
    francois.friends << mat
    francois.friends << daniel

    james.friends << francois
    james.friends << mat
    james.friends << daniel

    mat.friends << james
    mat.friends << daniel

    daniel.friends << james
    daniel.friends << mat

    # Francois stops beings a friend of James
    # (long story :-) )
    francois.relationships.find_by_friend_id(james.id).destroy
  end
end
