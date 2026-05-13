class TagsController < ApplicationController
  def index
    @preset_tags = Tag.where(user_id: nil).order(:tag_type, :sentiment)
    @my_tags = current_user.tags.order(:tag_type, :sentiment)
  end

  def create
    @tag = current_user.tags.build(tag_params)
    if @tag.save
      redirect_to tags_path, notice: "タグを作成しました"
    else
      @preset_tags = Tag.where(user_id: nil).order(:tag_type, :sentiment)
      @my_tags = current_user.tags.order(:tag_type, :sentiment)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = current_user.tags.find(params[:id])
    @tag.destroy
    redirect_to tags_path, notice: "タグを削除しました"
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :tag_type, :sentiment)
  end
end
