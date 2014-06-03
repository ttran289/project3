class AddPictureRefToUser < ActiveRecord::Migration
  def change
    add_reference :, :user, index: true
  end
end
