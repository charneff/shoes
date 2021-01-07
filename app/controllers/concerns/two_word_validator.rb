class TwoWordValidator < ActiveModel::EachValidator
    def validate_each(rec, attr, val)
        if val.split.length != 2 
            rec.errors.add(attr, "must be 2 words")
        end 
    end
  end
  