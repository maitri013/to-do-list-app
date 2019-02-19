class WebSite::ToDoItemsController < WebSite::BaseController

 before_action :load_to_do_list

 def index
    @to_do_items = @to_do_list.to_do_items.order("created_at desc").paginate(per_page: 10, page: params[:page])
  end

  def new
    @to_do_item = ToDoItem.new
  end

  def create
    @to_do_item = @to_do_list.to_do_items.new(to_do_item_params)
    if @to_do_item.save
      redirect_to web_site_to_do_items_index_path(@user.id, @to_do_list.id), notice: 'Your to-do item is successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @to_do_item = ToDoItem.find(params[:to_do_item_id])
  end

  def edit
    @to_do_item = ToDoItem.find(params[:to_do_item_id])
  end

  def update
    @to_do_item = ToDoItem.find(params[:to_do_item_id])
    if @to_do_item.update_attributes(to_do_item_params)
      redirect_to web_site_show_to_do_item_path(@user.id, @to_do_list.id ,@to_do_item.id), notice: 'To-do item was successfully updated.'
    else
      render action: "edit"
    end
  end

  def delete
    @to_do_item = ToDoItem.find(params[:to_do_item_id])
    @to_do_item.destroy
    flash[:notice] = "To-do item deleted successfully."
    redirect_to web_site_to_do_items_index_path(@user.id, @to_do_list.id)
  end

  private

  def load_to_do_list
    @to_do_list = @user.to_do_lists.find(params[:to_do_list_id])
  end

  def to_do_item_params
    params.permit(:title ,:description)
  end

end