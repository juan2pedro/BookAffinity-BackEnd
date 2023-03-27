import { UsersCryptosRepository } from "../data/repositories/userscryptos.repository";
import { UsersCryptosPojo } from "../data/models/userscryptos.model";
import { UsersCryptosDTO } from "../types";

export class UsersCryptosService {
  _userscryptosRepository: UsersCryptosRepository;

  constructor() {
    this._userscryptosRepository = new UsersCryptosRepository();
  }

  async getAllUsersCryptos(): Promise<UsersCryptosDTO[]> {
    const userscryptosPromise = await this._userscryptosRepository
      .getAllUsersCryptos()
      .then((userscryptosAsPojo) => {
        let userscryptosAsDTO: UsersCryptosDTO[] = [];
        userscryptosAsPojo.forEach((userscryptosAsPojo) => {
          let usercryptoAsDTO = this.parsePojoIntoDTO(userscryptosAsPojo);
          userscryptosAsDTO.push(usercryptoAsDTO);
        });
        return userscryptosAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userscryptosPromise;
  }

  async getUsersCryptosById(id: any): Promise<UsersCryptosDTO | undefined> {
    const userscryptosPromise = await this._userscryptosRepository
      .getUsersCryptosById(id)
      .then((userscryptosAsPojo) => {
        if (!!userscryptosAsPojo) {
          return this.parsePojoIntoDTO(userscryptosAsPojo);
        } else return undefined;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userscryptosPromise;
  }

  async addUsersCryptos(userscryptos: UsersCryptosDTO): Promise<number> {
    const userscryptosPojo: UsersCryptosPojo = this.parseDTOIntoPojo(userscryptos);
    const userscryptosPromise = await this._userscryptosRepository
      .addUsersCryptos(userscryptosPojo)
      .then((user_id) => {
        return user_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userscryptosPromise;
  }

  async updateUsersCryptos(userscryptos: UsersCryptosDTO): Promise<any> {
    const userscryptosPojo: UsersCryptosPojo = this.parseDTOIntoPojo(userscryptos);
    const userscryptosPromise = await this._userscryptosRepository
      .updateUsersCryptos(userscryptosPojo)
      .then((user_id) => {
        return user_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userscryptosPromise;
  }

  parsePojoIntoDTO(userscryptosPojo: UsersCryptosPojo): UsersCryptosDTO {
    const userscryptosDTO: UsersCryptosDTO = {
      user_id: userscryptosPojo.dataValues.user_id,
      crypto_id: userscryptosPojo.dataValues.crypto_id,
      amount: userscryptosPojo.dataValues.amount,
    };

    return userscryptosDTO;
  }

  parseDTOIntoPojo(userscryptosDTO: UsersCryptosDTO): UsersCryptosPojo {

    return userscryptosDTO as UsersCryptosPojo;
  }
}