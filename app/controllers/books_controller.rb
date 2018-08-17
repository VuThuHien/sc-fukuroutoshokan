class BooksController < ApplicationController
    def index
        # @books = Book.all
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true)
    end
    def show
        @book = Book.find(params[:id])
    end
    def search
        @q = Book.search(search_params)
        @books = @q.result(distinct: true)
    end

    private
    def search_params
        params.require(:q).permit!
    end
end
