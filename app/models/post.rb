class Post < ActiveRecord::Base
	validates :title, length: { in: 1..200 }
    has_many :taggings
    has_many :tags, through: :taggings
  	validates :content, presence: true

	belongs_to :user
	belongs_to :city

  def all_tags=(names)
      self.tags = names.split(", ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    foo = Tag.find_by(:name=>name)
      if foo
        foo.logs
      else
        false
      end
  end



end
