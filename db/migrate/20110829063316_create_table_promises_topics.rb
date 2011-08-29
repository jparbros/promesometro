class CreateTablePromisesTopics < ActiveRecord::Migration
  def self.up
    create_table :promises_topics, :id => false do |t|
    t.integer :promise_id
    t.integer :topic_id
    end
  end

  def self.down
    drop_table :promises_topics
  end
end
