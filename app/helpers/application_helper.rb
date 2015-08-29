module ApplicationHelper
  def people_form_method(person)
    if person.new_record?
      @method = "post"
    else
      @method = "put"
    end
    @method
  end

  def people_form_action(person)
    if person.new_record?
      @action = "/people"
    else
      @action = "/people/#{person.id}"
    end
    @action
  end

  def form_class(person)
    if person.new_record?
      @class = "new-person"
    else
      @class = "edit-person"
    end
    @class
  end

  def form_id(person)
    if person.new_record?
      @id = "new-person"
    else
      @id = "edit-person"
    end
    @id
  end
end