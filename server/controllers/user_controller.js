
const bcrypt = require('bcrypt')
const UserModel = require('./../models/user_model');
const UserController ={
createAccount: async (req, res)=>{
    try{
        const userData = req.body;
        
        const newUser = new UserModel(userData);
      await  newUser.save();
      return res.json({
        success : true,
        data : newUser,
        message : "user create"
      })
    }catch(ex){
     
        return res.json({
            success:false,
            message: ex.message
           
        });
    }
},

signIn : async function(req, res){
  try{
    const {email, password} = req.body;

    const foundUser =await UserModel.findOne({email:email});
    if(!foundUser){
      return res.json({
        success: false,
        message : "User not found!"
      });
    }

        const passwordMatch = bcrypt.compareSync(password, foundUser.password);
        if(!passwordMatch){
          return res.json({
            success :false,
            message : "Incorrect password!"
          });
        }

        return res.json({
          success : true,
          message : "Login success",
          data : foundUser
        });
  }catch(ex){
       return res.json({
            success:false,
            message: ex.message
        });
  }
}
};

module.exports = UserController;