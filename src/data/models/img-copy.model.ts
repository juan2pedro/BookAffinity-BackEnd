import { NUMBER, STRING } from "sequelize";
import { BelongsTo, Column, ForeignKey, Model, Table } from "sequelize-typescript";
import { CopyPojo } from './copy.model';

@Table({
  freezeTableName: true,
  schema: "BookAffinity",
  tableName: "img_copy",
  createdAt: false,
  updatedAt: false,
})
export class ImgCopyPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: "id_img_copy",
    autoIncrement: true,
  })
  id_img_copy: number;

  @Column({
    type: STRING,
    field: "rute",
  })
  rute: string;

  @ForeignKey(() => CopyPojo)
  @Column({
    type: NUMBER,
    field: "id_copy"
  })
  id_copy: number;

  @BelongsTo(() => CopyPojo)
  copy: CopyPojo
}
