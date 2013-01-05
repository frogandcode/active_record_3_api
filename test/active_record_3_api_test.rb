require "#{File.dirname(__FILE__)}/test_helper"
require 'active_support'

ActiveRecord::Schema.define do
  create_table :user
  create_table :screenshot
  create_table :attachments
end

class User < ActiveRecord::Base
  has_many :screenshots
end

class Screenshot < ActiveRecord::Base
  belongs_to :user
end

class Attachment < ActiveRecord::Base
  belongs_to :screenshot
end

class ActiveRecord3ApiTest < ActiveSupport::TestCase
  test "#from" do
    User.expects(:scoped).with(:from => :users)
    User.from(:users)
  end

  test "#group" do
    User.expects(:scoped).with(:group => :user_type)
    User.group(:user_type)
  end

  test "#having" do
    args = {:status => 1}
    User.expects(:scoped).with(:having => args)
    User.having(args)
  end

  test "#includes with single include" do
    Screenshot.expects(:scoped).with(:include => [:user])
    Screenshot.includes(:user)
  end

  test "#includes with an array of includes" do
    args = [:user, :attachments]
    Screenshot.expects(:scoped).with(:include => args)
    Screenshot.includes(args)
  end

  test "#includes with multiple include args" do
    Screenshot.expects(:scoped).with(:include => [:user, :attachments])
    Screenshot.includes(:user, :attachments)
  end

  test "#includes with hash arg" do
    args = {:attachments => :user}
    Screenshot.expects(:scoped).with(:include => [args])
    Screenshot.includes(args)
  end

  test "#joins with a single join" do
    Screenshot.expects(:scoped).with(:joins => [:user])
    Screenshot.joins(:user)
  end

  test "#joins with an array of joins" do
    args = [:user, :attachments]
    Screenshot.expects(:scoped).with(:joins => args)
    Screenshot.joins(args)
  end

  test "#joins with multiple join args" do
    Screenshot.expects(:scoped).with(:joins => [:user, :attachments])
    Screenshot.joins(:user, :attachments)
  end

  test "#joins with hash arg" do
    args = {:attachments => :user}
    Screenshot.expects(:scoped).with(:joins => [args])
    Screenshot.joins(args)
  end

  test "#limit" do
    User.expects(:scoped).with(:limit => 5)
    User.limit(5)
  end

  test "#lock with no args" do
    User.expects(:scoped).with(:lock => true)
    User.lock
  end

  test "#lock with arg" do
    User.expects(:scoped).with(:lock => false)
    User.lock(false)
  end

  test "#offset" do
    User.expects(:scoped).with(:offset => 5)
    User.offset(5)
  end

  test "#order" do
    User.expects(:scoped).with(:order => :created_at)
    User.order(:created_at)
  end

  test "#readonly with no args" do
    User.expects(:scoped).with(:readonly => true)
    User.readonly
  end

  test "#readonly with arg" do
    User.expects(:scoped).with(:readonly => false)
    User.readonly(false)
  end

  test "#select" do
    User.expects(:scoped).with(:select => :name)
    User.select(:name)
  end

  test "#where with conditions hash" do
    args = {:login => 'dude'}
    User.expects(:scoped).with(:conditions => args)
    s = User.where(args)
  end

  test "#where with conditions string but no arguments" do
    User.expects(:scoped).with(:conditions => ["users.user_type = 1"])
    s = User.where("users.user_type = 1")
  end

  test "#where with conditions string and arguments" do
    User.expects(:scoped).with(:conditions => ["users.login = ? and user_type = ?", 'dude', 1])
    s = User.where("users.login = ? and user_type = ?", 'dude', 1)
  end

  test "#where with conditions string and hash arguments" do
    User.expects(:scoped).with(:conditions => ["users.login = :login and user_type = :user_type", {:login => 'dude', :user_type => 1}])
    s = User.where("users.login = :login and user_type = :user_type", :login => 'dude', :user_type => 1)
  end
end