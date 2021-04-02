class ContentsController < ApplicationController

    before_action :authenticate_user!

    def index
        @contents = current_user.contents
    end

    def new
        @content = Content.new
    end

    def show
        @content = Content.find(params[:id])
    end     

    def edit
        @content = Content.find(params[:id])
    end

    def def create
        @content = current_user.contents.build(content_params)
        if @content.save
            redirect_to contents_path, notice:  "content successfully created"
        else
            render 'new'
        end
    end

    def update
        @content = content.find(params[:id])
        if @content.update(content_params)
          redirect_to content_path, notce: "content was successfully updated"
        else
          render 'edit'
        end
    end
    

    private

    def content_params
        params.require(:content).permit(:title, :description)    
    end
    
    
end