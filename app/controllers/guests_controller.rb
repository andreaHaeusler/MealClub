class GuestsController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @member = Member.first(:conditions => ["name = ?", params[:guest][:name]])
    if not @member
      @member = Member.new
      @member.name = params[:guest][:name]
      @member.save
    end
    
    @guest = @meal.meal_guests.create
    @guest.meal = @meal
    @guest.member = @member

    respond_to do |format|
      if @guest.save
        format.html { redirect_to(@meal, :notice => 'Guest was successfully created.') }
        format.xml  { render :xml => @meal, :status => :created, :location => @meal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meal.errors, :status => :unprocessable_entity }
      end
    end
  end
end
