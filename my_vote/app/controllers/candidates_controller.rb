class CandidatesController < ApplicationController
  
  before_action :find_by, only:[:show, :edit, :update, :destroy]
  
  def index
    @candidates = Candidate.all
  end
  
  def new
    @candidate = Candidate.new
  end
  
  def edit
  end
  
  def update
    
     if @candidate.update(candidate_params)
       redirect_to candidates_path, notice: "Candidate was updated successfully"
     else
    render "edit"  
    end
  end
  
  def destroy
    @candidate.destroy
    redirect_to candidates_path, notice: "Candidate was delete!!"
  end
  
  def show
  end
  
  def create
    @candidate = Candidate.new(candidate_params)
    
    
    if @candidate.save
    #flash[:notice] = "Candidate was created successfully"
    redirect_to candidates_path, notice: "Candidate was created successfully"
      
    else
    render "new"  
    end
  end
  
end
 
  private
  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :comment)
  end
  
  def find_by
     @candidate = Candidate.find_by(id: params[:id])
  end

