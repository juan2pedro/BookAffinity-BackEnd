import { CategoryPojo } from "../models/category.model";
import { connect } from "../config/category.db.config";

export class CategoryRepository {
  _db: any = {};
  _categoryRepository: any;

  constructor() {
    this._db = connect();
    this._categoryRepository = this._db.sequelize.getRepository(CategoryPojo);
  }

  async getAllCategorys(): Promise<CategoryPojo[]> {
    try {
      const categorys = await this._categoryRepository.findAll();
      console.log("category:::", categorys);
      return categorys;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
}
