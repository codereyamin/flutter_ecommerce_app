const { Schema, model } = require('mongoose');
const uuid = require('uuid');
const bcrypt = require('bcrypt');
const userSchema = new Schema({
    id: {
        type: String,
        unique: true,

    },
    fullName: {
        type: String,
        default: ""
    },
    email: {
        type: String,
        unique: true,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    phoneNumber: {
        type: String,
        default: ""
    },
    address: {
        type: String,
        default: ""
    },
    city: {
        type: String,
        default: ""
    },
    state: {
        type: String,
        default: ""
    },
    profileProgress: {
        type: Number,
        default: 0,

    },
    updateOn: {
        type: Date,
        default: Date
    },
    createOn: {
        type: Date,
        default: Date
    }
});
userSchema.pre("save", function (next) {
    const user = this;
    this.id = uuid.v1();
    this.createOn = new Date();
    this.updateOn = new Date();

    //store password with hash
    //  
    const saltData = bcrypt.genSaltSync(10);

    const hashPassword = bcrypt.hashSync(this.password, saltData);
    this.password = hashPassword;
    next();
});
userSchema.pre(["update", "findOneAndUpdate", "update"], (next) => {
    const update = this.getUpdate();
    delete update._id;
    delete update.id;
    this.updateOn = new Date();
    next();
});

const UserModel = model("User", userSchema);
module.exports = UserModel;
