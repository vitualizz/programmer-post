module SocialsHelper
  def check_connection(provider)
    if current_user.has_connection_with(provider)
      html = link_to disconnect_path(social: provider.downcase), class: "#{provider}-m phone-verified row" do
        content_tag :span, "Desconectar", class: "verified"
      end
    else
      path_provider = 
        case provider
          when "Instagram"
            user_instagram_omniauth_authorize_path(provider: provider.downcase)
          end
      html = link_to path_provider, class: "#{provider}-m phone-verified row" do
        content_tag :span, "Conectar con #{provider}", class: "un-verified"
      end
    end
  end
end