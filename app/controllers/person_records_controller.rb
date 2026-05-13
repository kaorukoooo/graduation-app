class PersonRecordsController < ApplicationController
  before_action :set_person_record, only: [:show, :edit, :update, :destroy]

  def index
    @person_records = current_user.person_records.order(met_on: :desc)
  end

  def show
  end

  def new
    @person_record = current_user.person_records.build
    @preset_tags = Tag.where(user_id: nil).order(:tag_type, :sentiment)
    @my_tags = current_user.tags.order(:tag_type, :sentiment)
  end

  def create
    @person_record = current_user.person_records.build(person_record_params)
    if @person_record.save
      redirect_to person_records_path, notice: "記録を追加しました"
    else
      @preset_tags = Tag.where(user_id: nil).order(:tag_type, :sentiment)
      @my_tags = current_user.tags.order(:tag_type, :sentiment)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @preset_tags = Tag.where(user_id: nil).order(:tag_type, :sentiment)
    @my_tags = current_user.tags.order(:tag_type, :sentiment)
  end

  def update
    if @person_record.update(person_record_params)
      redirect_to person_record_path(@person_record), notice: "記録を更新しました"
    else
      @preset_tags = Tag.where(user_id: nil).order(:tag_type, :sentiment)
      @my_tags = current_user.tags.order(:tag_type, :sentiment)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person_record.destroy
    redirect_to person_records_path, notice: "記録を削除しました"
  end

  private

  def set_person_record
    @person_record = current_user.person_records.find(params[:id])
  end

  def person_record_params
    params.require(:person_record).permit(:nickname, :met_on, :good_points, :concerns, tag_ids: [])
  end
end
