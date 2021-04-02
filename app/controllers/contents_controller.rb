class ContentsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_content, only: [:show, :edit, :update, :destroy]

    def index
        @contents = current_user.contents
    end

    def new
        @content = Content.new
    end

    def show
        
    end     

    def edit
        
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
        
        if @content.update(content_params)
          redirect_to content_path, notce: "content was successfully updated"
        else
          render 'edit'
        end
    end

    def destroy
        
        if @content.destroy
            redirect_to content_path, notice: 'content was successfully deleted.'
        else
            redirect_to contents_url
        end
    end
    
    

    private

    def set_content
        @content = Content.find(params[:id])
    end

    def content_params
        params.require(:content).permit(:title, :description)    
    end
    
    
end