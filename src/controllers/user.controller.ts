import { UserService } from "../services/user.service";
const userService: UserService = new UserService();

export const userController = {
  getUserbyEmailAndPassword: (req: any, res: any) => {
    const email = req.params.email
    const pass = req.params.pass
    userService
      .getUserbyEmailAndPassword(email,pass)
      .then((result) => {
        res.json(result);
      })
      .catch((excepcion) => {
        console.error(excepcion);
        res.send(500);
      });
  },

  addUser: (req: any, res: any) => {
    try {
      const newUser = req.body;
      userService.addUser(newUser).then((result) => {
        res.json(result);
      })
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },
  getUserById : (req: any, res: any) =>{
    try{
        const user_id = +req.params.id
        userService.getUserbyId(user_id) .then (result =>{
            res.json(result)
        })
    } 
    catch (Error){
        console.log(Error)
        res.sendStatus(500)
    }
},
  getAllUsers : (_req: any, res: any) =>{
    userService.getAllUsers().then(result =>{
        res.json(result)
    })
    .catch(Error =>{
        console.log(Error)
        res.sendStatus(500)
    })
},

};
