# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ### User ###
user_admin = User.create(
  email: "admin@gmail.com",
  password: "adminpassword",
  username: "admin",
  role: "admin"
)

user_1 = User.create(
  email: "user1@gmail.com",
  password: "user1password",
  username: "FLB5"
)

user_2 = User.create(
  email: "user2@gmail.com",
  password: "user2password",
  username: "Parrotdize"
)

user_3 = User.create(
  email: "user3@gmail.com",
  password: "user3password",
  username: "Courta"
)

user_4 = User.create(
  email: "user4@gmail.com",
  password: "user4password",
  username: "Tim Apple"
)

user_5 = User.create(
  email: "user5@gmail.com",
  password: "user5password",
  username: "Cark"
)

user_6 = User.create(
  email: "user6@gmail.com",
  password: "user6password",
  username: "Halloween"
)

# ### Rides ###
ride_1 = Ride.find_or_create_by(
  name: "Journey of The Little Mermaid", 
  location: "Fantasyland", 
  image_url: "https://disney-project-production.s3.amazonaws.com/lil+mermaid.jpg",
  description: "Revisit the classic “tail” of how one lucky little mermaid found true love… and legs." ,
  user: user_admin
  )

ride_2 = Ride.find_or_create_by(
  name: "Jungle Cruise" , 
  location: "Adventureland", 
  image_url: "https://disney-project-production.s3.amazonaws.com/ride_2.jpg",
  description: "Steam past lush foliage, butterflies and waterfalls on the Amazon in South America. Glimpse an abandoned camp overrun by curious gorillas on the shores of the African Congo.",
  user: user_admin
  )

ride_3 = Ride.find_or_create_by(
  name: "Splash Mountain" , 
  location: "Frontierland", 
  image_url: "https://disney-project-production.s3.amazonaws.com/ride_3.jpg",
  description: "Gently drift through a colorful Southern bayou along with happy-go-lucky Br’er Rabbit as he looks for his “laughing place.” But be warned: Br’er Bear and Br’er Fox are in hot pursuit of this wayward hare.",
  user: user_admin 
  )

ride_4 = Ride.find_or_create_by(
name: "\"it's a small world\"" , 
location: "Fantasyland", 
image_url: "https://disney-project-production.s3.amazonaws.com/ride_4.jpg",
description: "Sing along to the classic anthem of world peace during a delightful musical boat tour. Cruise along the Seven Seaways Waterway on a gentle 10-minute journey through all 7 continents. Pass through vivid, fantastical scenes representing the iconic sights and sounds of dozens of nations.",
user: user_admin
)

ride_5 = Ride.find_or_create_by(
name: "The Magic Carpets of Aladdin" , 
location: "Adventureland", 
image_url: "https://disney-project-production.s3.amazonaws.com/ride_5.jpg",
description: "Climb aboard a colorful, 4-passenger flying “rug” and take off into the air to the soothing sounds of Middle Eastern music. Soar around a giant genie bottle and magic lamp and enjoy a new view of the colorful bazaar below.",
user: user_admin
)

ride_6 = Ride.find_or_create_by(
name: "Peter Pan's Flight" , 
location: "Fantasyland", 
image_url: "https://disney-project-production.s3.amazonaws.com/ride_6.jpg",
description: "Board your pirate galleon and follow Peter Pan as he beckons you to join him on the flight of a lifetime. Wave goodbye to Nana and join the Darling children on a gentle cruise over London, where Big Ben and Tower Bridge light up the night sky.",
user: user_admin
)

ride_7 = Ride.find_or_create_by(
name: "Pirates of the Caribbean" , 
location: "Adventureland", 
image_url: "https://disney-project-production.s3.amazonaws.com/ride_7.jpg",
description: "Board a weathered barge for a treacherous voyage to the 17th century, when rowdy rogues and ruthless rapscallions ransacked Caribbean seaport towns. Sing along as pirates serenade you with their anthem, “Yo Ho, Yo Ho (A Pirate’s Life for Me).”",
user: user_admin
)


ride_8 = Ride.find_or_create_by(
name: "Seven Dwarfs Mine Train" , 
location: "Fantasyland", 
image_url: "https://disney-project-production.s3.amazonaws.com/ride_8.jpg",
description: "Deep inside an age-old mountain, clamber into a rustic mine train and make your way up a steep incline.",
user: user_admin
)

ride_9 = Ride.find_or_create_by(
  name: "Buzz Lightyear's Space Ranger Spin" , 
  location: "Tomorrowland", 
  image_url: "https://disney-project-production.s3.amazonaws.com/buzz-lightyear-space-ranger-spin-gallery00.jpeg",
  description: "Buzz Lightyear’s arch-nemesis from Toy Story 2 is stealing batteries from helpless toys to power a new weapon of destruction. Become a Junior Space Ranger and help stop Zurg!",
  user: user_admin
  )

ride_10 = Ride.find_or_create_by(
  name: "The Barnstormer" , 
  location: "Fantasyland", 
  image_url: "https://disney-project-production.s3.amazonaws.com/barnstormer-starring-great-goofini-gallery09.jpeg",
  description: "Make your way to an open-air barn where Goofy—known as The Great Goofini—performs his world-famous aerial stunt show. ",
  user: user_admin
  )

ride_11 = Ride.find_or_create_by(
  name: "Big Thunder Mountain Railroad" , 
  location: "Frontierland", 
  image_url: "https://disney-project-production.s3.amazonaws.com/big-thunder-mountain-railroad-gallery02.jpg",
  description: "Legend has it that soon after gold was first discovered here in the 1850s, eerie things began to happen. Trains would take off and race through tunnels—by themselves.",
  user: user_admin
  )

ride_12 = Ride.find_or_create_by(
  name: "Haunted Mansion" , 
  location: "Liberty Square", 
  image_url: "https://disney-project-production.s3.amazonaws.com/haunted-mansion-gallery12-16x9.jpg",
  description: "The disembodied voice of the Ghost Host is your private guide through the cadaverous realm of an eerie haunted estate, home to ghosts, ghouls and supernatural surprises.",
  user: user_admin
  )
  



# # ### Review ###
review_1 = Review.find_or_create_by(
  title: 'Fun kids’ ride',
  body: 'Emerge from the ocean’s depths in time to celebrate Ariel’s happily ever after in a spectacular fairytale finale.',
  rating: 5,
  user: user_1,
  ride: ride_1 
)

review_2 = Review.find_or_create_by(
  title: 'Better than the movie',
  body: 'Watch for angry hippos, hungry lions and “sleeping” zebras along the Nile and be on the lookout for a missing Jungle Cruise vessel and its helpless passengers. As the cruise continues down the Mekong River, you just might learn that the jungle always gets the last laugh.',
  rating: 4,
  user: user_1,
  ride: ride_2
)

review_3 = Review.find_or_create_by(
  title: 'It’s a 10-minute, 10,000-mile journey that you won’t soon forget!',
  body: 'Steam past lush foliage, butterflies and waterfalls on the Amazon in South America. Glimpse an abandoned camp overrun by curious gorillas on the shores of the African Congo.',
  rating: 4,
  user: user_2,
  ride: ride_2 
)