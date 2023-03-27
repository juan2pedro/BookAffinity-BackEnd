import { CopyPojo } from './copy.model';
import { UserPojo } from './user.model';
import { Table, Column, Model, BelongsTo, ForeignKey } from "sequelize-typescript";
import { NUMBER } from "sequelize";

@Table({
  freezeTableName: true,
  schema: 'BookAffinity',
  tableName: "invoice",
  createdAt: false,
  updatedAt: false
})
export class InvoicePojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_invoice',
    autoIncrement: true
  })
  id_invoice: number

  @ForeignKey(() => CopyPojo)
  @Column({
    type: NUMBER,
    field: 'id_copy'
  })
  id_copy: number

  @BelongsTo(() => CopyPojo)
  copy: CopyPojo[]

  @ForeignKey(() => UserPojo)
  @Column({
    type: NUMBER,
    field: 'id_user'
  })
  id_user: number

  @BelongsTo(() => UserPojo)
  user: UserPojo[]

}
