using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GlobalCalenderProgram.Reponse
{
    public class RTraining
    {     
        public int UserId { get; set; }
        public string TrainerName { get; set; }
        public DateTime ReservationDateFrom  { get; set; }
        public DateTime ReservationDateTo { get; set; }
        public string PreRequisite { get; set; }
        public string Reservationurl { get; set; }
        public string CourseName { get; set; }
        public string Duration { get; set; }


    }
}
