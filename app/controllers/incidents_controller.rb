class IncidentsController < ApplicationController
  http_basic_authenticate_with :name => "yacht", :password => "imonaboat", :except => [:index, :show, :new, :create]
  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.order("created_at DESC").all
    @last_time = Incident.last_incident()
    @timezone = ActiveSupport::TimeZone["Eastern Time (US & Canada)"]
    if @last_time
      @last_time = @last_time.created_at
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incidents }
    end
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
    if params[:id] == "last"
      @incident = Incident.last_incident()
    else
      @incident = Incident.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incident }
    end
  end

  # GET /incidents/new
  # GET /incidents/new.json
  def new
    @incident = Incident.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incident }
    end
  end

  # GET /incidents/1/edit
  def edit
    if params[:id] == "last"
      @incident = Incident.last_incident()
    else
      @incident = Incident.find(params[:id])
    end
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(params[:incident])

    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render json: @incident, status: :created, location: @incident }
      else
        format.html { render action: "new" }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incidents/1
  # PUT /incidents/1.json
  def update
    @incident = Incident.find(params[:id])

    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident = Incident.find(params[:id])
    @incident.destroy

    respond_to do |format|
      format.html { redirect_to incidents_url }
      format.json { head :no_content }
    end
  end

  def all
    @incidents = Incident.all
  end
end
