class login
    include ActiveModel::Model
    attr_accessor :email, :password

    validates :email, presence: { message: "email is required" }, length: {maximum: 255}, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'Please enter a valid email address'}
    validates :password, presence: true

    def checkLoin
        if(valid?) 
            true
        else
            false
        end
    end
end