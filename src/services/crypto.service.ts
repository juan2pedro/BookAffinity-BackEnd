import { CryptoRepository } from "./../data/repositories/crypto.repository";
import { CryptoPojo } from "./../data/models/crypto.model";
import { CryptoDTO } from "../types";

export class CryptoService {
  _cryptoRepository: CryptoRepository;

  constructor() {
    this._cryptoRepository = new CryptoRepository();
  }

  async getAllCryptos(): Promise<CryptoDTO[]> {
    const cryptosPromise = await this._cryptoRepository
      .getAllCryptos()
      .then((cryptosAsPojo) => {
        let cryptosAsDTO: CryptoDTO[] = [];
        cryptosAsPojo.forEach((cryptoAsPojo) => {
          let cryptoAsDTO = this.parsePojoIntoDTO(cryptoAsPojo);
          cryptosAsDTO.push(cryptoAsDTO);
        });
        return cryptosAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return cryptosPromise;
  }

  async getCryptoById(id: any): Promise<CryptoDTO | undefined> {
    const cryptoPromise = await this._cryptoRepository
      .getCryptoById(id)
      .then((cryptoAsPojo) => {
        if (!!cryptoAsPojo) {
          return this.parsePojoIntoDTO(cryptoAsPojo);
        } else return undefined;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return cryptoPromise;
  }

  async addCrypto(crypto: CryptoDTO): Promise<number> {
    const cryptoPojo: CryptoPojo = this.parseDTOIntoPojo(crypto);
    const cryptoPromise = await this._cryptoRepository
      .addCrypto(cryptoPojo)
      .then((crypto_id) => {
        return crypto_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return cryptoPromise;
  }

  async updateCrypto(crypto: CryptoDTO): Promise<any> {
    const cryptoPojo: CryptoPojo = this.parseDTOIntoPojo(crypto);
    const cryptoPromise = await this._cryptoRepository
      .updateCrypto(cryptoPojo)
      .then((crypto_id) => {
        return crypto_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return cryptoPromise;
  }

  parsePojoIntoDTO(cryptoPojo: CryptoPojo): CryptoDTO {
    const cryptoDTO: CryptoDTO = {
      crypto_id: cryptoPojo.dataValues.crypto_id,
      name: cryptoPojo.dataValues.name,
      value: cryptoPojo.dataValues.value,
      icon: cryptoPojo.dataValues.icon,
      asset: cryptoPojo.dataValues.asset,
      stock: cryptoPojo.dataValues.stock,
    };

    return cryptoDTO;
  }

  parseDTOIntoPojo(cryptoDTO: CryptoDTO): CryptoPojo {

    return cryptoDTO as CryptoPojo;
  }
}
