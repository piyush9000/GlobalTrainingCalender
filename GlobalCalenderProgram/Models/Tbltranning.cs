using System;
using System.Collections.Generic;

#nullable disable

namespace GlobalCalenderProgram.Models
{
    public partial class Tbltranning
    {
        public int TrnId { get; set; }
        public string PreRequisite { get; set; }
        public string Duration { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string UrlLink { get; set; }
        public int CourseId { get; set; }
        public int TrainerId { get; set; }

        public virtual Tblcourse Course { get; set; }
        public virtual Tbluser Trainer { get; set; }
    }
}
