# frozen_string_literal: true

# ApplicationRecord acts as an abstract base class for all models in the application.
# It inherits from ActiveRecord::Base, meaning all models inherit from ApplicationRecord
# by default. This setup allows shared logic or configurations to be placed in this class,
# applying to all models. Marking it as a primary abstract class ensures it's not used
# for queries or table-related operations directly, serving purely as a superclass.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
