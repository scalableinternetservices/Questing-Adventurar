class QuestPostingController < ApplicationController
  def index
  	@quests = Quest.all
  end
end
