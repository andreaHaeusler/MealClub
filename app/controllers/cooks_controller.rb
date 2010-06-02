class CooksController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @member = Member.first(:conditions => ["name = ?", params[:cook][:name]])
    if not @member
      @member = Member.new
      @member.name = params[:cook][:name]
      @member.save
    end
    
    @cook = @meal.meal_cooks.create
    @cook.meal = @meal
    @cook.member = @member

    respond_to do |format|
      if @cook.save
        format.html { redirect_to(@meal, :notice => 'Cook was successfully created.') }
        format.xml  { render :xml => @meal, :status => :created, :location => @meal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meal.errors, :status => :unprocessable_entity }
      end
    end
  end
end
