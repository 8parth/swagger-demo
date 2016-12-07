class User < ApplicationRecord
	enum status: [:active, :inactive]
end
