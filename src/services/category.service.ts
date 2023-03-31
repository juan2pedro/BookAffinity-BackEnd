import { CategoryPojo } from "../data/models/category.model";
import { CategoryDTO } from "../types";
import { CategoryRepository } from "../data/repositories/category.repository";

export class CategoryService {
    _categoryRepository: CategoryRepository;

    constructor() {
        this._categoryRepository = new CategoryRepository();
    }

    async getAllCategorys(): Promise<CategoryDTO[]> {
        const categorysPromise = await this._categoryRepository
            .getAllCategorys()
            .then((categorysAsPojo) => {
                let categorysAsDTO: CategoryDTO[] = [];
                categorysAsPojo.forEach((categoryAsPojo) => {
                    let categoryAsDTO = this.parsePojoIntoDTO(categoryAsPojo);
                    categorysAsDTO.push(categoryAsDTO);
                });
                return categorysAsDTO;
            })
            .catch((error) => {
                console.error(error);
                throw error;
            });
        return categorysPromise;
    }
    parsePojoIntoDTO(categoryPojo: CategoryPojo): CategoryDTO {
        const categoryDTO: CategoryDTO = {
            id_category: categoryPojo.dataValues.id_category,
            name_category: categoryPojo.dataValues.name_category
        }
        return categoryDTO;
    }
    parseDTOIntoPojo(categoryDTO: CategoryDTO): CategoryPojo {
        return categoryDTO as unknown as CategoryPojo;
    }
}

