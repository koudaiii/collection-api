class CollectionsController < ApplicationController
  def index
    stamp_ids = Collection.where(user_id: params[:user_id]).pluck(:stamp_id)
    render json: {
      data: {
        stamp_id: stamp_ids.sort,
      }
    }
  end

  def create
    collection = Collection.where(user_id: params[:user_id], stamp_id: params[:stamp_id]).first
    if collection
      render json: {
        data: {
          message: 'Already Stored',
          stamp_id: collection.stamp_id,
          user_id:  collection.user_id,
        }
      }
    else
      new_collection = Collection.new(user_id: params[:user_id], stamp_id: params[:stamp_id])
      if new_collection.save
        render json: {
          data: {
            message: 'Successfuly Stored',
            stamp_id: new_collection.stamp_id,
            user_id:  new_collection.user_id,
          }
        }
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
end
