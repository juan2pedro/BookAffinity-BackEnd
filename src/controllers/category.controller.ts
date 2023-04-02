import { CategoryService } from "../services/category.service";
const categoryService: CategoryService = new CategoryService();

export const CategoryController = {
    getAllCategory: (_req: any, res: any) => {
        categoryService
            .getAllCategorys()
            .then((result) => {
                console.log(result);
                res.json(result);
            })
            .catch((excepcion) => {
                console.error(excepcion);
                res.send(500);
            });
    },

}
