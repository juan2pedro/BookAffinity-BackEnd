import { AuthorRepository } from "../data/repositories/author.repository";
import { AuthorPojo } from "../data/models/author.model";
import { AuthorDTO } from "../types";

export class AuthorService {
  _authorRepository: AuthorRepository;

  constructor() {
    this._authorRepository = new AuthorRepository();
  }

  async getAllAuthors(): Promise<AuthorDTO[]> {
    const authorsPromise = await this._authorRepository
      .getAllAuthors()
      .then((authorsAsPojo) => {
        let authorsAsDTO: AuthorDTO[] = [];
        authorsAsPojo.forEach((authorAsPojo) => {
          let authorAsDTO = this.parsePojoIntoDTO(authorAsPojo);
          authorsAsDTO.push(authorAsDTO);
        });
        return authorsAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return authorsPromise;
  }

  async getAuthorById(id: any): Promise<AuthorDTO | undefined> {
    const authorsPromise = await this._authorRepository
      .getAuthorById(id)
      .then((authorAsPojo) => {
        if (!!authorAsPojo) {
          return this.parsePojoIntoDTO(authorAsPojo);
        } else return undefined;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return authorsPromise;
  }

  parsePojoIntoDTO(authorPojo: AuthorPojo): AuthorDTO {
    const authorDTO: AuthorDTO = {
      id_author: authorPojo.dataValues.id_author,
      name_author: authorPojo.dataValues.name_author,
    };

    return authorDTO;
  }

  parseDTOIntoPojo(authorDTO: AuthorDTO): AuthorPojo {

    return authorDTO as AuthorPojo;
  }
}