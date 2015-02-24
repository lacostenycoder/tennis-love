class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :provider
      t.string    :uid
      t.string    :email
      t.string    :first_name
      t.string    :last_name
      t.string    :phone_number
      t.string    :city
      t.string    :state
      t.string    :country
      t.string    :avatar
      t.string    :oauth_token
      t.string    :oauth_secret
      t.string    :type
      t.datetime  :oauth_expires_at

      t.boolean   :admin, default: false

      t.timestamps
    end
  end
end
