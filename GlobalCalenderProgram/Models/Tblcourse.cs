using System;
using System.Collections.Generic;

#nullable disable

namespace GlobalCalenderProgram.Models
{
    public partial class Tblcourse
    {
        public Tblcourse()
        {
            Tbltrannings = new HashSet<Tbltranning>();
        }

        public int CourseId { get; set; }
        public string CourseName { get; set; }

        public virtual ICollection<Tbltranning> Tbltrannings { get; set; }
    }
}
