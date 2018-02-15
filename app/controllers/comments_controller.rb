class CommentsController < ApplicationController
  before_action :set_job

  def create
    @comment = @job.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented on the job post!"
      redirect_to jobs_path
    else
      flash[:alert] = "Check the comment form, something went wrong."
      render root_path
    end
  end

  def destroy
    @comment = @job.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "Comment deleted."
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

end
