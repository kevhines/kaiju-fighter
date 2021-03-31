kevin = User.create(username: "kevin", password: "123")
amanda = User.create(username: "amanda", password: "123")
cameron = User.create(username: "cameron", password: "123")


godzilla = Monster.create(name: "Godzilla", size: 40, user: kevin )
mothra = Monster.create(name: "Mothra", size: 20, user: amanda)
kingkong = Monster.create(name: "King Kong", size: 20, user: cameron)
rodan = Monster.create(name: "Rodan", size: 35, user: amanda)
behemoth = Monster.create(name: "Behemoth", size: 30, user: kevin)

newyork = Location.create(name: "New York")
tokyo = Location.create(name: "Tokyo")
maplewood = Location.create(name: "Maplewood")


one = Fight.create(title: "First Fight", challenger_id: 1, defender_id: 2, location_id: 1)
two = Fight.create(title: "Battle for Tokyo", defender: behemoth, challenger: rodan, location: tokyo)
three = rodan.fights_challenged.build(title: "Rodan's Revenge", defender_id: 3, location_id: 3)
four = rodan.fights_challenged.build(title: "Rodan's still mad", defender: behemoth, location: maplewood)
rodan.save
one.attack
two.attack
three.attack
four.attack
