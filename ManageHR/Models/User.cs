    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ManageHR.Models
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_user { get; set; }

        [StringLength(255)]
        [Required]
        public string username { get; set; }

        [StringLength(255)]
        [Required]
        public string email { get; set; }

        [StringLength(255)]
        [Required]
        public string password { get; set; }

        [StringLength(255)]
        public string fullname { get; set; }

        [StringLength(255)]
        public string address { get; set; }

        public DateTime birthday { get; set; }

        public int gender { get; set; }

        [StringLength(255)]
        public string phoneNumber { get; set; }

        public int status { get; set; }

        public DateTime startDay { get; set; }

        [StringLength(255)]
        public string identityCard { get; set; }

        [StringLength(255)]
        public string bankAccount { get; set; }

        [StringLength(1000)]
        public string request { get; set; }

        public int id_role { get; set; }

        public virtual Role Role { get; set; }
    }
}