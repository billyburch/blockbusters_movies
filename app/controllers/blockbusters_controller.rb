class BlockbustersController < ApplicationController
  def index
    @blockbusters = Blockbuster.all
  end

  def new
  end

  def create
    blockbuster = Blockbuster.new({
    name: params[:name],
    city: params[:city],
    state: params[:state],
    store_awards: params[:store_awards],
    rewards_program: params[:rewards_program]
    })

    blockbuster.save
    redirect_to '/blockbusters'
  end

  def show
    @blockbuster = Blockbuster.find(params[:id])
  end

  def edit
    @blockbuster = Blockbuster.find(params[:id])
  end

  def update
    blockbuster = Blockbuster.find(params[:id])
    blockbuster.update({
    name: params[:name],
    city: params[:city],
    state: params[:state],
    store_awards: params[:store_awards],
    rewards_program: params[:rewards_program]
    })
    blockbuster.save
    redirect_to "/blockbusters/#{blockbuster.id}"
  end

  def destroy
    Blockbuster.destroy(params[:id])
    redirect_to '/blockbusters'
  end

end