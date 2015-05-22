# Useful tidbits
## Scaffolding controllers
	rails g scaffold_controller Quest questgiver:references adventurer:references title:string price:decimal description:string post_time:datetime expiration_time:datetime
	rails g scaffold_controller User email:string password:string
	rails g scaffold_controller Pending quest_id:references user_id:references
	rails g scaffold_controller Review rating:integer quest:references questgiver:references adventurer:references comment:string post_time:datetime
