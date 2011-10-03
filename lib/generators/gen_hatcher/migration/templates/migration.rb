<% attribute_names = attributes.collect{|attr| attr.name}.join(',') -%>
class <%= migration_class_name %> < ActiveRecord::Migration
<%- if migration_action == 'add' -%>
  #Add <%= attribute_names -%> to <%= table_name %>
  def change
<% attributes.each do |attribute| -%>
    add_column :<%= table_name %>, :<%= attribute.name %>, :<%= attribute.type %>
<%- end -%>
  end
<%- else -%>
  <%- if migration_action -%>
  #<%= migration_action %> <%= attribute_names -%> to <%= table_name %>
  <%- else -%>
  #Database manipulation
  <%- end -%>
  def up
<% attributes.each do |attribute| -%>
  <%- if migration_action -%>
    <%= migration_action %>_column :<%= table_name %>, :<%= attribute.name %><% if migration_action == 'add' %>, :<%= attribute.type %><% end %>
  <%- end -%>
<%- end -%>
  end

  <%- if migration_action -%>
  #<%= migration_action == 'add' ? 'remove' : 'add' %> <%= attribute_names -%> to <%= table_name %>
  <%- else -%>
  #Undo database manipulation
  <%- end -%>
  def down
<% attributes.reverse.each do |attribute| -%>
  <%- if migration_action -%>
    <%= migration_action == 'add' ? 'remove' : 'add' %>_column :<%= table_name %>, :<%= attribute.name %><% if migration_action == 'remove' %>, :<%= attribute.type %><% end %>
  <%- end -%>
<%- end -%>
  end
<%- end -%>
end
