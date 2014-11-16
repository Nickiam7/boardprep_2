class MembersController < ApplicationController
	before_action :set_member, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!, except: [:index]


	def index
		@members = Member.all
	end

	def list
		@members = Member.all
	end

	def show
	end

	def edit
	end

	def new
		@member = Member.new
	end

	def create
		@member = Member.new(member_params)
		if @member.save
			redirect_to list_path
			flash[:success] = "New member, #{@member.name} has been successfully created."
		else
			render 'new'
		end
	end

	def update
		if @member.update(member_params)
			redirect_to list_path
			flash[:success] = "#{@member.name} has been successully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@member.destroy
		redirect_to list_url
	end

	private 

		def set_member
			@member = Member.find(params[:id])
		end

		def member_params
			params.require(:member).permit(:name, :title, :sort, :photo)
		end
end
