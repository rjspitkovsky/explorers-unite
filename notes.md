<%= form_for @trip do |f| %>
  <%= f.label :country_name %>
  <%= f.collection_select :country, Country.all, :id, :name %>
  <%= f.submit %>
<% end %>
