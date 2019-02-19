class WebSite::ToDoListsController < WebSite::BaseController

  def index
    @to_do_lists = @user.to_do_lists.order("created_at desc").paginate(per_page: 10, page: params[:page])
  end

  def new
    @to_do_list = ToDoList.new
  end

  def create
    @to_do_list = @user.to_do_lists.new(to_do_list_params)
    if @to_do_list.save
      redirect_to web_site_show_to_do_list_path(@user.id, @to_do_list.id), notice: 'Your to-do list is successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @to_do_list = ToDoList.find(params[:to_do_list_id])
  end

  def edit
    @to_do_list = ToDoList.find(params[:to_do_list_id])
  end

  def update
    @to_do_list = ToDoList.find(params[:to_do_list_id])
    if @to_do_list.update_attributes(to_do_list_params)
      redirect_to web_site_show_to_do_list_path(@user.id, @to_do_list.id), notice: 'To-do list was successfully updated.'
    else
      render action: "edit"
    end
  end

  def delete
    @to_do_list = ToDoList.find(params[:to_do_list_id])
    @to_do_list.destroy
    flash[:notice] = "To-do list deleted successfully."
    redirect_to web_site_to_do_list_index_path(@user.id)
  end

  private

  def to_do_list_params
    params.permit(:title ,:description)
  end

end