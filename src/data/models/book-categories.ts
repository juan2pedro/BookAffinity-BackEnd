import { Table, Column, Model } from "sequelize-typescript";
import { NUMBER } from "sequelize";
import { ForeignKey } from "sequelize-typescript";
import { BookPojo } from "./book.model";
import { CategoryPojo } from "./category.model";

@Table({
  freezeTableName: true,
  schema: 'BookAffinity',
  tableName: "book_categories",
  createdAt: false,
  updatedAt: false
})
export class BookCategoriesPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_book_categories',
    autoIncrement: true
  })
  id_book_categories: number

  @ForeignKey(() => CategoryPojo)
  @Column
  id_category: number;
  
  @ForeignKey(() => BookPojo)
  @Column
  id_book: number;

  
}
