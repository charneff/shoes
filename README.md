Create a form for making new shoes and the corresponding new/create actions
Demonstrate creating the same form with form_tag, form_for, and form_with
Create the edit/update actions for editing a shoe
Add a button to delete a shoe





<form action="/shoes" method="post">
    <input type="hidden" name="authenticity_token" value="<%=form_authenticity_token %>">
    <label>Brand</label>
    <input type="text" name="shoes[brand]">
    <input type="submit" value="Create Shoe">
</form><br><hr>

<%= form_tag(shoes_path) do %>
    <%= label_tag(:brand) %>
    <%= text_field_tag :'shoes[brand]' %>
    <%= submit_tag("Create Shoes") %>
<% end %>
<br><hr>

<%= form_for(@shoe) do |f| %>
    <%= f.label :brand %>
    <%= f.text_field :brand %>
    <%= f.submit %>
<% end %><br><hr>

<%= form_with(model: @shoe, class: 'new_shoe') do |f|%>
    <%= f.label :brand %>
    <%= f.text_field :brand %>
    <%= f.submit %>
<% end %>

<%= form_with(model: @shoe) do |f| %>
    <%= f.label :brand %>
    <%= f.text_field :brand %>
    <%= f.label :price %>
    <%= f.number_field :price, min: 0, step: 0.01 %>
    <%= f.label :color %>
    <%= f.text_field :color %>
    <%= f.submit %>
<% end %>
