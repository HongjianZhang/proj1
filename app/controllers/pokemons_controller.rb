class PokemonsController < ApplicationController
  def new
    @pokemon = Pokemon.new
  end

  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer = current_trainer
    @pokemon.save
    current_trainer.save
    redirect_to root_path
  end

  def damage
    @pokemon = Pokemon.find(params[:id])
    @pokemon.health -= 10
    if @pokemon.health <= 0
      @pokemon.destroy
      redirect_to trainer_path(id: @pokemon.trainer)
    else
      @pokemon.save
    redirect_to trainer_path(id: @pokemon.trainer)
  end
  end

  def create
    @pokemon = Pokemon.create(pokemon_params)
    @pokemon.health = 100
    @pokemon.level = 1
    @pokemon.trainer = current_trainer
    if @pokemon.save
      redirect_to trainer_path(current_trainer)
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to pokemons_new_path
    end
  end


  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end
