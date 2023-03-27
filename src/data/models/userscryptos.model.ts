import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";

@Table({
  freezeTableName: true,
  schema: 'public',
  tableName: "users_cryptos",
  createdAt: false,
  updatedAt: false
})
export class UsersCryptosPojo extends Model {
  @Column({
    primaryKey: true,
    type: STRING,
    field: 'user_id'
  })
  user_id: string

  @Column({
    primaryKey: true,
    type: STRING,
    field: 'crypto_id'
  })
  crypto_id: string

  @Column({
    type: NUMBER,
    field: 'amount'
  })
  amount: number
}