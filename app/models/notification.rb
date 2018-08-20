class Notification < ApplicationRecord
  after_create {NotificationJob.perform_now self}
end
