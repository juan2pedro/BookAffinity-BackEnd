import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { BelongsToMany } from "sequelize-typescript";
import { BookPojo } from './book.model';
import { BookCategoriesPojo } from './book-categories';

@Table({
  freezeTableName: true,
  schema: 'BookAffinity',
  tableName: "category",
  createdAt: false,
  updatedAt: false
})
export class CategoryPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_category',
    autoIncrement: true
  })
  id_category: number

  @Column({
    type: STRING,
    field: 'name_category'
  })
  name_category: string

  @BelongsToMany(() => BookPojo, () => BookCategoriesPojo)
  books: BookPojo[];
}
