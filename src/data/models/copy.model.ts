import { ImgCopyPojo } from './img-copy.model';
import { Table, Column, Model, HasMany, BelongsTo, ForeignKey } from "sequelize-typescript";
import { HasOne } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { InvoicePojo } from "./invoice.model";
import { UserPojo } from './user.model';

@Table({
  freezeTableName: true,
  schema: "BookAffinity",
  tableName: "copy",
  createdAt: false,
  updatedAt: false,
})
export class CopyPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: "id_copy",
    autoIncrement: true,
  })
  id_copy: number;

  @ForeignKey(() => UserPojo)
  @Column({
    type: NUMBER,
    field: "id_user",
  })
  id_user: number;

  @BelongsTo(() => UserPojo)
  user: UserPojo;

  @Column({
    type: NUMBER,
    field: "id_book",
  })
  id_book: number;

  @Column({
    type: NUMBER,
    field: "visible",
  })
  visible: number;

  @Column({
    type: STRING,
    field: "status",
  })
  status: string;

  @Column({
    type: NUMBER,
    field: "price",
  })
  price: number;

  @HasOne(() => InvoicePojo) 
  invoice: InvoicePojo[]

  @HasMany(() => ImgCopyPojo)
  ImgCopy: ImgCopyPojo[];

}
