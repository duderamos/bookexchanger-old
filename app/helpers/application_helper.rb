module ApplicationHelper
  def language_selector
    case I18n.locale
    when :en
      link_to 'Português', locale: :"pt-BR"
    else
      link_to 'English', locale: :en
    end
  end
end
