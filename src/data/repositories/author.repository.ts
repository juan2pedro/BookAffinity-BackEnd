import { AuthorPojo } from "../models/author.model";
import { connect } from "../config/author.db.config";

export class AuthorRepository {
  _db: any = {};
  _authorRepository: any;

  constructor() {
    this._db = connect();
    this._authorRepository = this._db.sequelize.getRepository(AuthorPojo);
  }

  async getAllAuthors(): Promise<AuthorPojo[]> {
    try {
      const author = await this._authorRepository.findAll();
      console.log("author:::", author);
      return author;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async getAuthorById(id: number): Promise<AuthorPojo | undefined> {
    try {
      return await this._authorRepository.findByPk(id);
    } catch (error) {
      console.error(error);
      return undefined;
    }
  }
}
