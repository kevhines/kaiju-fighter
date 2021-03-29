godzilla = Monster.create(name: "Godzilla")
mothra = Monster.create(name: "Mothra")
kingkong = Monster.create(name: "King Kong")
rodan = Monster.create(name: "Rodan")
behemoth = Monster.create(name: "Behemoth")


ouch = Fight.create(challenger_id: 1, defender_id: 2)
Fight.create(defender: behemoth, challenger: rodan)
rodan.fights_challenged.build(defender_id: 3)
rodan.fights_challenged.build(defender: behemoth)
