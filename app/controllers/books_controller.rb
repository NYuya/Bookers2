class BooksController < ApplicationController
    before_action :authenticate_user!
    
	def index
    	@books = Book.all
    	@book = Book.new
        @user = current_user
    end
    def show
    	@book = Book.find(params[:id])
        @book = Book.new
        @user = current_user
    end

	def new
		@book = Book.new
    end

    def create
    	@book = Book.new(book_params)
	    @book.user_id = current_user.id
	    @book.save
	    redirect_to books_path
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
	      flash[:notice] = "Book was successfully destroyed."
	      redirect_to books_path

    end


    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
