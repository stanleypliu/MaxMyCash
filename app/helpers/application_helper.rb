module ApplicationHelper
  def card_link_to(href)
    "<a href='#{href}'>
      <div>
        <div class='listing-card-title'><p><%= listing.location %></p><div class='listing-card-title-money'><p><p><%= listing.type%><%= listing.currency_amount %></p></div></div>
        <p><%= listing.user.first_name  %> <%= listing.user.last_name %></p>
        <p><%= listing.message %></p>
      </div>
    </a>".html_safe
  end
end
