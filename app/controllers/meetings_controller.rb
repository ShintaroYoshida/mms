# coding: utf-8

class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
      
    @meetings = Meeting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
    
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @title = "ミーティングの登録"
    @msg = "新規にミーティングを登録します。"
    @meeting = Meeting.new
    if request.post? then
      Meeting.new(params[:meeting]).save
    end
    @datas = Meeting.where("id  > 0").order("name ASC")
    @projects = Project.where("id  > 0").order("name ASC")


#    @meeting = Meeting.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @meeting }
#    end
  end

  # GET /meetings/1/edit
  def edit
    @title = "ミーティングの編集"
    @msg = "ミーティングを編集します。"
    @meeting = Meeting.find(params[:id])

  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(params[:meeting])

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: '作成が完了しました！' }
        format.json { render json: @meeting, status: :created, location: @meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: '更新が完了しました！' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    if !checkme? @meeting then return end
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end
  
  # DELETE
  def delete
    obj = Meeting.find(params[:id])
    obj.destroy
    redirect_to :action => "index"
  end
  
end
