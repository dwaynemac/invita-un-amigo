module InvitationsHelper

  def find_in_padma(text)
    link_to text, "http://crm.padm.am/contacts?q=#{text}"
  end

end
