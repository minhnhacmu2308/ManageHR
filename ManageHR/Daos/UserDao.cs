using ManageHR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ManageHR.Daos
{
    public class UserDao
    {
        ManageDbContext myDb = new ManageDbContext();

        public List<User> getListStaff()
        {
            return myDb.Users.Where(x => x.Role.id_role == 1).ToList();
        }


        public void add(User user)
        {
            myDb.Users.Add(user);
            myDb.SaveChanges();
        }

        public void edit(User user)
        {
            var obj = myDb.Users.Where(u => u.email == user.email).FirstOrDefault();
            obj.email = user.email;
            obj.password = user.password;
            obj.username = user.username;
            obj.address = user.address;
            obj.gender = user.gender;
            obj.fullname = user.fullname;
            obj.phoneNumber = user.phoneNumber;
            obj.username = user.username;
            obj.birthday = user.birthday;
            obj.status = user.status;
            obj.id_role = user.id_role;
            myDb.SaveChanges();
        }

        public void delete(int id)
        {
            var obj = myDb.Users.FirstOrDefault(x => x.id_user == id);
            myDb.Users.Remove(obj);
            myDb.SaveChanges();
        }

        public User checkExistName(string name)
        {
            return myDb.Users.FirstOrDefault(x => x.username == name);
        }

        public User getUserById(int id)
        {
            return myDb.Users.FirstOrDefault(x => x.id_user == id);
        }

        public bool checkLogin(string email, string password)
        {
            var user = myDb.Users.Where(u => u.email == email && u.password == password).FirstOrDefault();
            if (user != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public User getInformationByUserName(string email)
        {
            return myDb.Users.Where(u => u.email == email).FirstOrDefault();
        }
    }
}