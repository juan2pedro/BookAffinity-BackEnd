import { CopyDTO, NewCopyDTO } from "../types";
import { CopyRepository } from "../data/repositories/copy.repository";
import { CopyPojo } from "../data/models/copy.model";

export class CopyService {
  _copyRepository: CopyRepository;
  constructor() {
    this._copyRepository = new CopyRepository();
  }

  parsePojoIntoDto(copyPojo: CopyPojo): CopyDTO {
    const copyDto: CopyDTO = {
      id_copy: copyPojo.dataValues.id_copy,
      visible: copyPojo.dataValues.visible,
      price: copyPojo.dataValues.price,
      status: copyPojo.dataValues.status,
      id_user: copyPojo.dataValues.id_user,
      id_book: copyPojo.dataValues.id_book
    };

    return copyDto;
  }

  async getAllCopiesByBook(id : number): Promise<CopyDTO[]> {
    const copyPromise = await this._copyRepository
      .getAllCopiesByBook(id)
      .then((copysAsPojo) => {
        let copysAsDto: CopyDTO[] = [];
        copysAsPojo.forEach((copyAsPojo) => {
          let copyAsDto = this.parsePojoIntoDto(copyAsPojo);
          copysAsDto.push(copyAsDto);
        });
        return copysAsDto;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });

    return copyPromise;
  }

  async getAllCopiesByUser(id : number): Promise<CopyDTO[]> {
    const copyPromise = await this._copyRepository
      .getAllCopiesByUser(id)
      .then((copysAsPojo) => {
        let copysAsDto: CopyDTO[] = [];
        copysAsPojo.forEach((copyAsPojo) => {
          let copyAsDto = this.parsePojoIntoDto(copyAsPojo);
          copysAsDto.push(copyAsDto);
        });
        return copysAsDto;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });

    return copyPromise;
  }

  parseDtoIntoPojo(copyDto: CopyDTO): CopyPojo {
    return copyDto as CopyPojo;
  }

  parseNewDtoIntoPojo(copyDto: NewCopyDTO): CopyPojo {
    return copyDto as CopyPojo;
  }

  async createCopy(copy: NewCopyDTO): Promise<number> {
    const copyPojo: CopyPojo = this.parseNewDtoIntoPojo(copy);
    const copyPromise = await this._copyRepository
      .createCopy(copyPojo)
      .then((id_copy) => {
        return id_copy;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return copyPromise;
  }

  async updateCopy(copy: CopyDTO): Promise<number> {
    const copyPojo: CopyPojo = this.parseDtoIntoPojo(copy);
    const copyPromise = await this._copyRepository
      .updateCopy(copyPojo)
      .then((id_copy) => {
        return id_copy;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return copyPromise;
  }

 
}
