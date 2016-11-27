class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :webmasters, dependent: :destroy 
    has_many :services, dependent: :destroy 
    has_many :companies, dependent: :destroy 
    has_many :ratings, dependent: :destroy 
    has_many :mratings, dependent: :destroy 
    has_many :mcalendars, dependent: :destroy 
    has_many :msponsors, dependent: :destroy 
    has_many :mobjects, dependent: :destroy
    has_many :madvisors, dependent: :destroy
    has_many :mstats, dependent: :destroy
    has_many :hs_ratings, dependent: :destroy 
    has_many :requests, dependent: :destroy 
    has_many :vehicles, dependent: :destroy 
    has_many :donation_stats, dependent: :destroy 
    has_many :bids, dependent: :destroy 
    has_many :events, dependent: :destroy 
    has_many :favourits, dependent: :destroy 
    has_many :hotspots, dependent: :destroy
    has_many :searches, dependent: :destroy
    has_many :customers, dependent: :destroy 
    has_many :user_tickets, dependent: :destroy 
    has_many :advisors, dependent: :destroy 
    has_many :transactions, dependent: :destroy 
    has_many :donations, dependent: :destroy 
    has_many :user_positions, dependent: :destroy 
    
    # validates :userid, presence: true, :uniqueness => true
    validates :lastname, presence: true    
    validates :name, presence: true
    
    before_validation :update_geo_address
    geocoded_by :geo_address
    after_validation :geocode

    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "250x250#", :small => "50x50#" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    def self.search(filter, search)
        if filter
            @search = Search.find(filter)
            where(@search.build_sql)
        else
            if search
                where('anonymous=? and active=? and (name LIKE ? OR lastname LIKE ? OR email LIKE ?)', false, true, "%#{search}%","%#{search}%","%#{search}%")
            else
                where('anonymous=? and active=?',false, true)
            end
        end
    end

    def update_geo_address
      self.geo_address = self.address1 + " " + address2 + " " + address3
    end
    
    def fullname
        [name, lastname, email].join(' ')        
    end


    def build_stats(array, records, label)
      if records != nil
        anz = records.count
        if anz > 0
          hash = Hash.new
          hash = {"label" => label, "value" => anz}
          array << hash
          return array
        end
      end
      return array
    end
end
