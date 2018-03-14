class CreateDebts < ActiveRecord::Migration[5.1]
  def change
    create_table :debts do |t|
      t.references :debtor
      t.references :creditor
      t.datetime   :date
      t.datetime   :deadline
      t.string     :purpose
      t.float      :amount
      t.boolean    :paid
      t.timestamps
    end
  end
end
