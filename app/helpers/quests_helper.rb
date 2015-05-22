module QuestsHelper

	def cache_key_for_quest_row(quest)
 		"quest-#{quest.id}-#{quest.updated_at}"
 	end

 	 def cache_key_for_quest_table
	 	"quest-table-#{@quests.maximum(:updated_at)}-#{Quest.maximum(:updated_at)}"
	 end
end
