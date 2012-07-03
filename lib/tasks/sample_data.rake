# encoding: utf-8

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_vendors
    make_offers
    connect_vendors_to_cities
  end
end

def make_vendors
  Vendor.create!  name: 'Μασούτης',
                  email: 'masoutis@app.com',
                  username: 'masoutis',
                  password: 'tetete',
                  password_confirmation: 'tetete',
                  broadcast: 'Κερδίσε 15% έκπτωση με την νέα MAS Club Card!'

  Vendor.create!  name: 'AB Βασιλόπουλος',
                  email: 'basilopoulos@app.com',
                  username: 'basilopoulos',
                  password: 'tetete',
                  password_confirmation: 'tetete'

  Vendor.create!  name: 'Lidl',
                  email: 'lidl@app.com',
                  username: 'lidl',
                  password: 'tetete',
                  password_confirmation: 'tetete'

  Vendor.create!  name: 'Carrefour',
                  email: 'lidl@appf.com',
                  username: 'lidfdl',
                  password: 'tetete',
                  password_confirmation: 'tetete'

  Vendor.create!  name: 'Dia',
                  email: 'ldidl@app.com',
                  username: 'lidl12',
                  password: 'tetete',
                  password_confirmation: 'tetete'

  Vendor.create!  name: 'Aρβανιτίδης',
                  email: 'lidl@appd.com',
                  username: 'lidlgf',
                  password: 'tetete',
                  password_confirmation: 'tetete'
end

def make_offers
  dir = File.join(Rails.root, 'tmp', 'sample-img/')
  desc = '<ul><li>Ελληνικό προϊόν</li><li>A\' ποιότητας</li></ul>'

  Vendor.all.each do |vendor|
    vendor.offers.create! title: 'Ελαιόλαδο Άλτις 1000γρ.',
                          price: 8.25, initial_price: 9.49,
                          starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                          image: File.open(dir + 'ladi.jpg'),
                          category_id: Category.find_by_title('Είδη μαγειρικής').id,
                          description: '<ul><li>100% παρθένο ελαιόλαδο</li><li>Κρητικής παραγωγής</li></ul>'

    vendor.offers.create! title: 'Γάλα Αγνό Light 1λτ.',
                          price: 1.20, initial_price: 1.90,
                          starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                          image: File.open(dir + 'gala.jpg'),
                          category_id: Category.find_by_title('Γαλακτοκομικά').id,
                          description: desc

    vendor.offers.create! title: 'Γαλοπούλα καπνιστή Υφαντής 1κιλό',
                           price: 1.85, initial_price: 2.35,
                           starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                           image: File.open(dir + 'galopoula.jpg'),
                           category_id: Category.find_by_title('Αλλαντικά').id,
                           description: desc

    vendor.offers.create! title: 'Σοκολάτα Lacta απλή 3τμχ.',
                         price: 2.25, initial_price: 4.65,
                         starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                         image: File.open(dir + 'sokolata.jpg'),
                         category_id: Category.find_by_title('Γλυκά').id,
                         description: desc

    vendor.offers.create! title: 'Αποσμητικό Nivea Happy Time',
                         price: 4.20, initial_price: 5.65,
                         starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                         image: File.open(dir + 'aposmitiko.jpg'),
                         category_id: Category.find_by_title('Είδη περιποίησης').id,
                         description: desc

    vendor.offers.create! title: 'Γιαούρτι στραγγιστό Όλυμπος',
                         price: 1.20, initial_price: 1.80,
                         starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                         image: File.open(dir + 'giaourti.jpg'),
                         category_id: Category.find_by_title('Γαλακτοκομικά').id,
                         description: desc

    vendor.offers.create! title: 'Αλεύρι Μύλοι Κρήτης για όλες τις χρήσεις 300γρ.',
                         price: 4.22, initial_price: 5.43,
                         starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                         image: File.open(dir + 'aleuri.jpg'),
                         category_id: Category.find_by_title('Είδη μαγειρικής').id,
                         description: desc

    vendor.offers.create! title: 'Μακαρόνια Misko λεπτά 250γρ.',
                         price: 2.05, initial_price: 2.89,
                         starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                         image: File.open(dir + 'makaronia.jpg'),
                         category_id: Category.find_by_title('Ζυμαρικά').id,
                         description: desc

    vendor.offers.create! title: 'Φυσικός χυμός πορτ. Όλυμπος 1lt.',
                         price: 1.49, initial_price: 1.99,
                         starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                         image: File.open(dir + 'xumos.jpg'),
                         category_id: Category.find_by_title('Χυμοί - Αναψυκτικά').id,
                         description: desc

    vendor.offers.create! title: 'Δημητριακά Fitness Nestle',
                          price: 1.39, initial_price: 2.20,
                          starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                          image: File.open(dir + 'dimitriaka.jpg'),
                          category_id: Category.find_by_title('Δημητριακά').id,
                          description: desc

    vendor.offers.create! title: 'Φιλαδέλφεια πλήρες 300γρ.',
                          price: 2.39, initial_price: 3.50,
                          starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                          image: File.open(dir + 'filadelfia.jpg'),
                          category_id: Category.find_by_title('Γαλακτοκομικά').id,
                          description: desc

    vendor.offers.create! title: 'Νέα Φυτίνη Ελαίς 5%',
                          price: 3.99, initial_price: 4.55,
                          starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                          image: File.open(dir + 'vouturo.jpg'),
                          category_id: Category.find_by_title('Είδη μαγειρικής').id,
                          description: desc

    vendor.offers.create! title: 'Μπριζόλα καπνιστή Πασσιάς 10 φέτες',
                          price: 2.30, initial_price: 4.10,
                          starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                          image: File.open(dir + 'mprizola.jpg'),
                          category_id: Category.find_by_title('Αλλαντικά').id,
                          description: desc

    vendor.offers.create! title: 'Σαμπουάν Clear for men',
                          price: 2.55, initial_price: 3.29,
                          starts_on: Date.current.yesterday, expires_on: Date.current + 30,
                          image: File.open(dir + 'sampouan.jpg'),
                          category_id: Category.find_by_title('Είδη περιποίησης').id,
                          description: desc
  end
end

def connect_vendors_to_cities
  Vendor.count.times do |n|
    Vendor.find(n+1).cities << City.all
  end
end