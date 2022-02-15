# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    
    { name: 'Apps Cat',
      email: 'apps@example.com',
      password_digest: 'dQlRIF'
    },
  
    { name: 'Olivia Benson',
      email: 'olivia@example.com',
      password_digest: 'eNc89tRUyB'
    },
]

messages = [
    {   
        plaintext: 'Attack at dawn',
        key1: 'lemon',
        output: 'lxfopvefrnhr',
        user_id: 1
  },

  { 
      plaintext: 'dear diary today i had a most strange encounter',
      key1: 'rosemary',
      output: 'ussvpirpphghmyzfrrsqaskqkfsrsevltcmrfei',
      key2: 'theres a breathless hush in the close tonight',
      output2: 'nzwmtarqglgatjdxjymihaxjrjucgwzehpuxmxb',
      user_id: 1
  },
  
]

users.each { |user| User.create(user) }
messages.each { |message| Message.create(message) }