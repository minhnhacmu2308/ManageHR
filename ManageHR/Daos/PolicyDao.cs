using ManageHR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ManageHR.Daos
{
    public class PolicyDao
    {
        ManageDbContext myDb = new ManageDbContext();

        public void add(Policy policy)
        {
            myDb.policies.Add(policy);
            myDb.SaveChanges();
        }

        public void delete(int id)
        {
            var obj = myDb.policies.FirstOrDefault(x => x.id_policy == id);
            myDb.policies.Remove(obj);
            myDb.SaveChanges();
        }

        public Policy checkExist(Policy policy)
        {
            return myDb.policies.FirstOrDefault(x =>x.name == policy.name && x.id_category == policy.id_category);
        }

        public List<Policy> getListPolicies(int idCategory)
        {
            return myDb.policies.Where(x => x.id_category == idCategory).ToList();
        }

        public void edit(Policy policy)
        {
           
            var obj = myDb.policies.FirstOrDefault(x => x.id_policy == policy.id_policy);
            obj.name = policy.name;
            obj.id_category = policy.id_category;
            myDb.SaveChanges();
        }

        public Policy getPolicy(int id)
        {
            return myDb.policies.FirstOrDefault(x => x.id_policy == id);
        }
    }
}