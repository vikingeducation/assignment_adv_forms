class AddMovieIdToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :movie_id, :integer
  end
end
