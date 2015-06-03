module ProfilesHelper
	def cache_key_for_review_row(review)
 		"review-#{review.id}"
 	end

 	def cache_key_for_accepted_quest_row(quest)
 		"quest-#{quest.id}-#{quest.updated_at}"
 	end

 	 def cache_key_for_pending_quest_row(pending)
 		"pending-#{pending.id}"
 	end

end
