using ManageHR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ManageHR.Daos
{
    public class ScheduleDao
    {
        ManageDbContext myDb = new ManageDbContext();

        public List<Schedule> getListScheduleByIdUser(int id)
        {
            return myDb.Schedules.OrderByDescending(x => x.date).Where(x => x.id_user == id ).ToList();
        }
    }
}