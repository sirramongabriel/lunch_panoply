 class Employee < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :company_id, :provider, :uid

  validates_presence_of :first_name, :last_name

  has_one :company

  has_many :comments
  has_many :menu_items, through: :comments


  def Employee.find_for_facebook_oauth(auth, signed_in_resource=nil)
    employee = Employee.where(:provider => auth.provider, :uid => auth.uid).first
    if employee
      return employee
    else
      registered_user = Employee.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        first_name = auth.extra.raw_info.name.split(" ")[0]
        last_name  = auth.extra.raw_info.name.split(" ")[-1]
        employee = Employee.create(first_name: first_name,
                            last_name: last_name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20]
                          )
      end   
    end
  end


  def Employee.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
    create_with_omniauth(auth)
  end

  def Employee.create_with_omniauth(auth)
    create! do |employee|
      employee.provider = auth['provider']
      employee.uid = auth['uid']
      if auth['info']
        employee.full_name = auth['info']['full_name'] || ""
        employee.email = auth['info']['email'] || ""
      end
    end
  end

  def Employee.by_first_name
  	Employee.all.order(first_name: asc)
  end

  def Employee.by_last_name
  	Employee.all.order(last_name: :asc)
  end

  def Employee.joined_on_newest_first
  	Employee.all.order(created_at: :desc)
  end

  def Employee.joined_on_oldest_first
  	Employee.all.order(created_at: :asc)
  end

  def Employee.by_favorite
  end

	def full_name
		"#{first_name} #{last_name}"
	end  
end

class InvalidEmployee < ActiveRecord::Base 
  belongs_to :company

  has_many :comments
  has_many :menu_items, through: :comments
end
