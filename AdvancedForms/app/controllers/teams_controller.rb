class TeamsController < ApplicationController

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(whitelisted_team_params)

		if @team.save
			flash[:success] = "Team created successfully!"
			redirect_to teams_path
		else
			flash[:notice] = "Team failed to save!"
			render :new
		end
	end

	def update
		@team = Team.find(params[:id])

		if @team.update(whitelisted_team_params)
			flash[:success] = "Team updated successfully"
			redirect_to edit_team_path(params[:id])
		else
			flash[:notice] = "Team failed to update!"
			render :new
		end
	end

	def edit
		@team = Team.find(params[:id])
	end

private

	def whitelisted_team_params
		params.require( :team ).permit( :name, :description, :member_ids => [] )
	end
end
