class MemberLogs < ActiveRecord::Migration
  def self.up
    create_table :member_logs do |t|
      t.integer  :optype
      t.string   :operation
      t.string   :description
      t.integer  :operateor

      t.timestamps
    end
  end

  def self.down
    drop_table :member_logs
  end
end
