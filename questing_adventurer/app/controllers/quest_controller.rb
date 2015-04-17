class QuestController < ApplicationController
	
  def index
  	@quests = Quest.all
  end

  def listing
  	@quests = Quest.all
  end

end
