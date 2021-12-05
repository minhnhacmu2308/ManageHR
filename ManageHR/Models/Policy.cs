using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ManageHR.Models
{
    public class Policy
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_policy { get; set; }

        [StringLength(255)]
        [Required]
        public string name { get; set; }

        [StringLength(1000)]
        public string content { get; set; }

        [StringLength(1000)]
        public string format { get; set; }

        [StringLength(1000)]
        public string note { get; set; }

        public int id_category { get; set; }

        public virtual Category Category { get; set; }
    }
}