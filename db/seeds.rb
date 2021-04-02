kevin = User.create(username: "Kevin", password: "123")
amanda = User.create(username: "Amanda", password: "123")
cameron = User.create(username: "Cameron", password: "123")


godzilla = Monster.create(name: "Godzilla", size: 40, user: kevin )
mothra = Monster.create(name: "Mothra", size: 20, user: amanda)
kingkong = Monster.create(name: "King Kong", size: 20, user: cameron)
rodan = Monster.create(name: "Rodan", size: 35, user: amanda)
behemoth = Monster.create(name: "Behemoth", size: 30, user: kevin)
bees = Monster.create(name: "A Lot of Bees", size: 40, user: kevin )
tiny = Monster.create(name: "Tiny", size: 15, user: amanda)
bubba = Monster.create(name: "Bubba", size: 75, user: cameron)
whiskers = Monster.create(name: "Whiskers", size: 45, user: kevin)



newyork = Location.create(name: "New York")
tokyo = Location.create(name: "Tokyo")
maplewood = Location.create(name: "Maplewood")
skullisland = Location.create(name: "Skull Island")


Fight.battle_royale("Round One")
Fight.battle_royale("Revenge")
Fight.battle_royale("Too Fast")
Fight.battle_royale("Too Furious")
Fight.battle_royale("PayPerView")
Fight.battle_royale("Heavy Weights")
Fight.battle_royale("Championship Round")
Fight.battle_royale("Just for Fun")
