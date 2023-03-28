import { CategoryPojo } from "../models/category.model";
import { connect } from "../config/author.db.config";

export class CategoryRepository {
  _db: any = {};
  _categoryRepository: any;

  constructor() {
    this._db = connect();
    this._categoryRepository = this._db.sequelize.getRepository(CategoryPojo);
  }

  async getAllCategories(): Promise<CategoryPojo[]> {
    try {
      const category = await this._categoryRepository.findAll();
      console.log("category:::", category);
      return category;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
}
