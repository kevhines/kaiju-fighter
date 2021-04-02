# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship - in models: User, Location, Monster
- [x] Include at least one belongs_to relationship - in models: Monster, Fight
- [x] Include at least two has_many through relationships - in model: Monster (two) - self-join
- [x] Include at least one many-to-many relationship - in model: Monster has many to many of itself thought Fights
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user - join table is fights and you can set location_id and title of fight
- [x] Include reasonable validations for simple model objects - all models have some validations
- [x] Include a class level ActiveRecord scope method - Monster and Location both have scope methods
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - monsters index is nested in users
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - fight new form is nested in monsters
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - all forms use fields_with_errors

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate