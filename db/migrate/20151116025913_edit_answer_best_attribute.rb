class EditAnswerBestAttribute < ActiveRecord::Migration
  def change
    change_column :answers, :best, :boolean, :default => false
  end
end
