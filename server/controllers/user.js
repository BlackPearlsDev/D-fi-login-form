import { hash, compare } from 'bcrypt';
import { saltRounds } from '../config/index.js';
import Query from '../models/Query.js';

export const register = async (req, res, next) => {
    try {
        const {username, password} = req.body;
        const datas = {
            username: username,
            password: await hash(password, saltRounds),
        }

        const query1 = "SELECT * FROM account WHERE account_name = ?";
        const user = await Query.getDataByValue(query1, username)
        if(user.length){
            res.status(409).json({
                msg: 'User already exist !',
            });
            return;
        }
        const query2 = "INSERT INTO account (account_name, password) VALUES (?, ?)";
        await Query.save(query2, datas);
        res.status(201).json({
            msg: "User created (+) !",
        })
        
    } catch (error) {
        return next(error);
    }
}

export const login = async (req, res, next) => {
    try {
        const {username, password} = req.body;
        const query = "SELECT * FROM account WHERE account_name = ?";
        const [user] = await Query.getDataByValue(query, username);
        if(username == "" || password == "") {
            res.status(401).json({
                msg: "Please fill all fields !",
            })
        }
        if(!user || (user.account_name !== username)){
            res.status(404).json({
                msg: `User does not exist !`,
            });
            return;
        }
        const isSame = await compare(password, user.password);
        if(isSame){
            res.status(200).json({
                msg: "All infos are correct !",
            });
            return;
        } else {
            res.status(401).json({msg: "bad password"});
            return;
        }
        
    } catch (error) {        
        return next(error);
    }
}