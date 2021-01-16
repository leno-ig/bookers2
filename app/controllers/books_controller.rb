class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_elem, only: [:index, :new, :create]
  before_action :find_elem, only: [:show, :edit, :update, :destroy]
  before_action :reject_edit, only: [:edit, :update]

  def index
    @list = Book.all
  end

  def show
  end

  def create
    @elem.attributes = book_params
    if @elem.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@elem)
    else
      index
      render :index
    end
  end

  def edit
  end

  def update
    @elem.attributes = book_params
    if @elem.save
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@elem)
    else
      render :edit
    end
  end

  def destroy
    @elem.destroy
    flash[:notice] = 'You have destroyed book successfully.'
    redirect_to books_path
  end

  private

  def setup_elem
    @elem = current_user.books.build
  end

  def find_elem
    @elem = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def reject_edit
    redirect_to books_path if @elem.user_id != current_user.id
  end
end
