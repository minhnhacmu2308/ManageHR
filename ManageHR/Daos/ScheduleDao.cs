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

        public List<Schedule> getSchedule()
        {
            return myDb.Schedules.OrderByDescending(s => s.id_schedule).ToList();
        }
        public void add(Schedule schedule)
        {
            myDb.Schedules.Add(schedule);
            myDb.SaveChanges();
        }
        public bool check(int id, DateTime date)
        {
            var obj = myDb.Schedules.FirstOrDefault(s => s.id_user == id && s.date == date);
            if(obj == null)
            {
                return true;
            }
            return false;
        }
        public void delete(int id)
        {
            var obj = myDb.Schedules.FirstOrDefault(x => x.id_schedule == id);
            myDb.Schedules.Remove(obj);
            myDb.SaveChanges();
        }
        public void update(Schedule schedule)
        {
            var obj = myDb.Schedules.FirstOrDefault(x => x.id_schedule == schedule.id_schedule);
            obj.id_user = schedule.id_user;
            obj.date = schedule.date;
            myDb.SaveChanges();
        }
    }
}