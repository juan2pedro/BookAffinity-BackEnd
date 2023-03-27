import { CryptoPojo } from "../models/crypto.model";
import { connect } from "../config/crypto.db.config";

export class CryptoRepository {
  _db: any = {};
  _cryptoRepository: any;

  constructor() {
    this._db = connect();
    this._cryptoRepository = this._db.sequelize.getRepository(CryptoPojo);
  }

  async getAllCryptos(): Promise<CryptoPojo[]> {
    try {
      const cryptos = await this._cryptoRepository.findAll();
      console.log("cryptos:::", cryptos);
      return cryptos;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async getCryptoById(id: number): Promise<CryptoPojo | undefined> {
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
  }
}
