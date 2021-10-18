using System;
using System.Collections.Generic;

#nullable disable

namespace GlobalCalenderProgram.Models
{
    public partial class Tbluser
    {
       
        public Tbluser()
        {

            Tbltrannings = new HashSet<Tbltranning>();
        }

        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string UserType { get; set; }

        public virtual ICollection<Tbltranning> Tbltrannings { get; set; }

       
    }
}
