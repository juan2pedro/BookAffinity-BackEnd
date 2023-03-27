import { CopyDTO } from "../types";
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

  async getAllCopysByBook(id : number): Promise<CopyDTO[]> {
    const copyPromise = await this._copyRepository
      .getAllCopysByBook(id)
      .then((copysAsPojo) => {
        let copysAsDto: CopyDTO[] = [];
        copysAsPojo.forEach((copyAsPojo) => {
          let copyAsDto = this.parsePojoIntoDto(copyAsPojo);
          copysAsDto.push(copyAsDto);
        });
        //TODO : Llamar al repositorio
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

 
}
