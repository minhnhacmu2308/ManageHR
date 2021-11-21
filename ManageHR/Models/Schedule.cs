using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ManageHR.Models
{
    public class Schedule
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_schedule { get; set; }

        public DateTime date { get; set; }

        public int id_user { get; set; }

        public virtual User User { get; set; }
    }
}