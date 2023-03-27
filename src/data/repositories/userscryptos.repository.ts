import { UsersCryptosPojo } from "../models/userscryptos.model";
import { connect } from "../config/userscryptos.db.config";

export class UsersCryptosRepository {
  _db: any = {};
  _userscryptoRepository: any;

  constructor() {
    this._db = connect();
    this._userscryptoRepository =
      this._db.sequelize.getRepository(UsersCryptosPojo);
  }

  async getAllUsersCryptos(): Promise<UsersCryptosPojo[]> {
    try {
      const userscryptos = await this._userscryptoRepository.findAll();
      console.log("users:::", userscryptos);
      return userscryptos;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async getUsersCryptosById(id: number): Promise<UsersCryptosPojo | undefined> {
    try {
      return await this._userscryptoRepository.findByPk(id);
    } catch (error) {
      console.error(error);
      return undefined;
    }
  }

  async addUsersCryptos(newUsersCryptos: UsersCryptosPojo): Promise<number> {
    try {
      newUsersCryptos = await this._userscryptoRepository.create(
        newUsersCryptos
      );
      return newUsersCryptos.id;
    } catch (error) {
      console.log(error);
      return -1;
    }
  }

  async updateUsersCryptos(newUsersCryptos: UsersCryptosPojo): Promise<string> {
    try {
      newUsersCryptos = await this._userscryptoRepository.update(newUsersCryptos, {
        where: {
          user_id: newUsersCryptos.user_id,
          crypto_id: newUsersCryptos.crypto_id,
        },
      });
      return newUsersCryptos.id;
    } catch (error) {
      console.error(error);
      return error.toString();
    }
  }
}
