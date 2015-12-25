class CollectionsController < ApplicationController
  def create
    collection = Collection.where(user_id: collection_params[:user_id], stamp_id: collection_params[:stamp_id]).first
    if collection
      render json: {
        data: {
          message: 'Already Stored',
          stamp_id: collection.stamp_id,
          user_id:  collection.user_id,
        }
      }, status: :success
    else
      new_collection = Collection.new(user_id: collection_params[:user_id], stamp_id: collection_params[:stamp_id])
      if new_collection.save
        render json: {
          data: {
            message: 'Successfuly Stored',
            stamp_id: new_collection.stamp_id,
            user_id:  new_collection.user_id,
          }
        }, status: :success
      else
        render json: {
          data: {
            message: 'Store Failed',
            stamp_id: new_collection.stamp_id,
            user_id:  new_collection.user_id,
          }
        }, status: :unprocessable_entity
      end
    end
  end

  private
  def collection_params
    params.require(:collection).permit(:user_id, :stamp_id)
  end
end
