<%= form_for @trip do |f| %>
  <%= f.label :country_name %>
  <%= f.collection_select :country, Country.all, :id, :name %>
  <%= f.submit %>
<% end %>

<h1><%= @user.name %> has taken the most trips.</h1>

<h2>They have taken <%= @user.trips.size %> trips.</h2>
