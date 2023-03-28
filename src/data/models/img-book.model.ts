import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { ForeignKey, BelongsTo } from 'sequelize-typescript';
import { BookPojo } from './book.model';

@Table({
  freezeTableName: true,
  schema: 'BookAffinity',
  tableName: "img_book",
  createdAt: false,
  updatedAt: false
})
export class ImgBookPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_img_book',
    autoIncrement: true
  })
  id_img_book: number

  @Column({
    type: STRING,
    field: 'rute'
  })
  rute: string

  @ForeignKey(() => BookPojo)
  @Column
  id_book: number;

  @BelongsTo(() => BookPojo)
  book: BookPojo;

}
