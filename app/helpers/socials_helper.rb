module SocialsHelper
  def check_connection(provider)
    if current_user.has_connection_with(provider)
      html = link_to disconnect_path(social: provider.downcase), class: "#{provider}-m phone-verified row" do
        content_tag :span, "Desconectar #{provider}", class: "verified"
      end
    else
      html = link_to "/users/auth/#{provider.downcase}", class: "#{provider}-m phone-verified row" do
        content_tag :span, "Conectar con #{provider}", class: "un-verified"
      end
    end
  end

  def attr_social(provider, access_token)
    auth_attr = { uid: access_token['uid'], 
                  token: access_token['credentials']['token'], name: access_token['info']['name']}
    auth_attr.merge({ username: access_token['info']['username' && 'nickame'], 
                      description: access_token['info']['bio' && 'description']}) if ["Instagram","Linkedin"].include? provider
    auth_attr.merge({ email: access_token['info']['email']}) if ["Facebook", "Linkedin"].include? provider
    auth_attr.merge({ url: access_token['info']['urls']['public_profile']}) if provider == "Linkedin"
    auth_attr
  end
end
