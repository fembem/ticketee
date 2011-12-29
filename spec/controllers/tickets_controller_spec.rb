require 'spec_helper'

describe TicketsController do

end

require 'spec_helper'

describe TicketsController do
  let(:user) { create_user! }
  let(:project) { Factory(:project) }
  let(:ticket) { Factory(:ticket, :project => project,
      :user => user) }
      
  context "standard users" do
    
    before do
      sign_in(:user, user)
      Permission.create!(:user => user, :thing => project, :action => "view")
    end
    
    def cannot_create_tickets!
      response.should redirect_to(project)
      flash[:alert].should eql("You cannot create tickets on this project.")
    end
    
    it "cannot begin to create a ticket" do
      get :new, :project_id => project.id
      cannot_create_tickets!
    end
    
    it "cannot create a ticket without permission" do
      post :create, :project_id => project.id
      cannot_create_tickets!
    end

  end
  
end
