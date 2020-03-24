class BooksController < ApplicationController
    before_action :authenticate_user!
    
	def index
    	@books = Book.all
        @user = current_user
    	@newbook = Book.new
    end
    def show
    	@book = Book.find(params[:id])
        @newbook = Book.new
        @user = current_user
    end

    def create
    	@newbook = Book.new(book_params)
	    @newbook.user_id = current_user.id
        @user = current_user
	    if @newbook.save
            flash[:notice] = "You have creatad book successfully."
            redirect_to book_path(@newbook.id)
        else
            @books = Book.all
            render :index
        end
    end
    def edit
  		@book = Book.find(params[:id])
  	end

 	def update
    	@book = Book.find(params[:id])
	    if @book.update(book_params)
	       flash[:notice] = "Book was successfully updated."
	       redirect_to book_path(@book.id)
		else
            render action: :edit
		end
  	end

  	def destroy
	    @book = Book.find(params[:id])
	    @book.destroy
        redirect_to books_path
    end


    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
