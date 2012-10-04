module ApplicationHelper

  def locale_selector
    if I18n.locale == :en
      link_to "Espa&ntilde;ol".html_safe, url_for(:locale => 'es')
    else
      link_to "English", url_for(:locale => 'en')
    end
  end
end
