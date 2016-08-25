module ApplicationHelper
  def link_to_add_field(name, f, association)
    new_object = f.object.send(association).build
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_field', f: builder)
    end
    link_to(name, '#', class: 'add_component', data: { id: id, fields: fields.delete("\n") })
  end
end
