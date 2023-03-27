import { AuthorPojo } from "../models/author.model";
import { connect } from "../config/book.db.config";

export class AuthorRepository {
  _db: any = {};
  _authorRepository: any;

  constructor() {
    this._db = connect();
    this._authorRepository = this._db.sequelize.getRepository(AuthorPojo);
  }

  async getAuthorName(): Promise<AuthorPojo[]> {
    try {
      const author = await this._authorRepository.findAll();
      console.log("author:::", author);
      return author;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

/*   async getCryptoById(id: number): Promise<CryptoPojo | undefined> {
    try {
      return await this._cryptoRepository.findByPk(id);
    } catch (error) {
      console.error(error);
      return undefined;
    }
  }

  async addCrypto(newCrypto: CryptoPojo): Promise<number> {
    try {
      newCrypto = await this._cryptoRepository.create(newCrypto);
      return newCrypto.id;
    } catch (error) {
      console.log(error);
      return -1;
    }
  }

  async updateCrypto(newCrypto: CryptoPojo): Promise<string> {
    try {
      newCrypto = await this._cryptoRepository.update(newCrypto, {
        where: {
          crypto_id: newCrypto.crypto_id,
        },
      });
      return newCrypto.id;
    } catch (error) {
      console.error(error);
      return error.toString();
    }
  } */
}
