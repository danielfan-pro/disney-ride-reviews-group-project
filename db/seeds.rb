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

# 7 Dwarfs
# Would ride again
#   Lovely ride! The rollercoeaster is a lot of fun, and the lines are not too bad thanks to the tree shade, and the cool props.
#   5

# Meh
# This was a neat ride through the story of Snow White and the Seven Dwarfs. Not the best coaster I've ever been on but still very good. The swaying action was a cool feature.
# 3

# Just like the movie
# Rope Dropped and only waited 30 minutes. Fun, cute ride. It always feels over too quickly though.
# 4


# pirates of the carribean
#  This is the tale of captain...
#   One of the best boat rides I have ever been on with many animatronics and iconic scenes. It is missing a few scenes that Disneyland has but the overall ride is the same.
#   5

#   Loved the ride
#   An iconic boat ride through the life and times of being a pirate. Catchy theme song. Cannons and pirates and skeletons and captain jack and captain Barbosa
#   5

#   Terrible experience
#   Got stuck on the ride for 2 HOURS!!!
#   1


# peter pans flight
# A must for all Peter Pan fans
#   This was a must for one of my adult children. She's a Peter Pan fan. My 4-year-old grandchildren enjoyed it as well. Would recommend.
#   4

#   A whimsical flight through Neverland!
#   We visited Peter Pan's Flight while in Disneyworld. We had a long wait and a handicapped rider so they gave us a "fast pass" to come back after a designated time to enjoy our ride. It was worth the wait as this ride was a lot of fun. We soared over scenes from Peter Pan from Captain Hook to the Pirates making Wendy walk the plank. It was an enjoyable ride for all ages but is best for the young ones!
#   5

#   Not worth waiting for
#   This ride in not worth waiting for, it's slow and uneventful. This is best suited to those with young children.
# We had fast passes which meant only a 10 min wait.
# The main queue was over 2 hrs.
# 3

# Jungle Cruise
# Title: AWFUL! TERRIFIED MY CHILDREN!

# Body: THIS RIDE WAS HORRIBLE! My children (3 & 5) were terrified of this ride .. The waterfall too big and loud! The gorillas were SO REAL and ROARED at us. We spent 5 hours waiting in line for this ride and they wouldn’t even give me a free ride because we hated it! Will never visit this again unless I get a free season pass for me and my 10 family members.

# Rating: 1

# Photo: https://teisinc.com/wp-content/uploads/2014/10/bigstock-Baby-Crying-5482985.jpg



# Ariel
# Title: Wonderful! 

# Body: This ride took me back to my childhood days where I would watch The Little Mermaid on repeat. We loved this ride so much we will go back again tomorrow!

# Rating: 10

# Photo: https://i.pinimg.com/originals/cf/10/1e/cf101e99d5b8f22042926844016afc88.jpg


# Pirates
# Title: NOT FUN

# Body: they wouldn’t even let me take my rum on this ride! what is even the point!

# Rating: 8



# Aladdin
# Title: Put my kids to sleep

# Body: While this ride was cute and soothing, it put my kids to sleep. They woke up when we left the ride and then I had to deal with 3 cranky, screaming children for the rest of the day. Save this ride for the end of your day!

# Rating: 6

# Photo: https://i0.wp.com/babesindisneylandblog.com/wp-content/uploads/2016/07/IMG_2604.jpg?resize=623%2C467


# Aladdin
# Title: Made my kids throw up!

# Body: This was too much motion for my children. We had just eaten a big lunch, my kids got sick on the ride and it had to end early, AND we had to go back to the hotel to clean them up. Massive waste of time

# Rating: 2

# Photo: https://momunleashed.com/wp-content/uploads/2015/04/Sick-at-Disney-3.jpg


# Splash Mountain
# Title: Best. Ride. Ever.

# Body: it was so hot the day we went to disney, this was amazing to cool us down, we wanted to ride it 4 more times.

# Rating: 10


# its a small world
# Title: Super cute ride

# Body: Great ride

# Rating: 9

# Seven Dwarfs
# Title: Didn’t go on this ride

# Body: I didn’t go on this ride.

# Rating: 0

# peter pan
# Title: Good family fun

# Body: My children and my husband loved this ride. I was indifferent but because they enjoyed it, I was happy

# Rating: 7

# photo: https://i.ytimg.com/vi/R50He-bmA_U/maxresdefault.jpg
  