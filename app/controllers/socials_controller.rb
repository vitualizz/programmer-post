class SocialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_social, except: :index

  def index
    @socials = Social.all
  end

  def show
    @social = Social.find params[:id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social
      @social = Social.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_params
      params.require(:social).permit(:name, :token)
    end
end
