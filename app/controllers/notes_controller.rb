class NotesController < ApplicationController
	before_action :find_note, only: [:show, :edit, :update, :destroy]
	def index	
		# @notes = Note.all.order("created_at DESC")      #this is rendering all notes
		@notes = Note.where(user_id: current_user)     #show Notes of current user only
	end

	def new 
		# @note = Note.new
		@note = current_user.notes.build				#create notes for current user
	end

	def create
		# @note = Note.new(note_params)
		@note = current_user.notes.build(note_params)
		
		if @note.save
			redirect_to @note
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @note.update(note_params)
			redirect_to @note
		else
			render 'edit'
		end
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end
	private
	 def find_note
	 	@note = Note.find(params[:id])
	 end

	 def note_params
	 	params.require(:note).permit(:title, :content)
	 end

end
