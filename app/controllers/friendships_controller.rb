class FriendshipsController < ApplicationController
  def destroy
    friend_id = params[:id]
    friendship = Friendship.find_by_user_id_and_friend_id(current_user.id,friend_id)
    friendship.delete
    flash[:success] = "Friend Removed Successfully"
    redirect_to my_friends_path
  end
  
  def create
    friend_id = params[:friend_id]
    Friendship.create(:user_id => current_user.id, :friend_id => friend_id)
    redirect_to my_friends_path
  end
  
  
  
end
