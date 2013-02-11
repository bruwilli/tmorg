module ApplicationHelper
  
  def errors_for(object, attribute)
    render partial: 'shared/form_field_errors', 
           locals: { errors: object.errors[attribute] }
  end
end