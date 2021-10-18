using GlobalCalenderProgram.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GlobalCalenderProgram.Repositories
{
    public class MockUserData : IUsersRepository
    {
        CalenderdbContext _dbContext;
        public MockUserData(CalenderdbContext applicationDbContext)
        {
            _dbContext = applicationDbContext;
        }
        public Tbluser GetLoggedUser(Tbluser usersrequest)
        {
            var Log = _dbContext.Tblusers.FirstOrDefault(u => u.Username == usersrequest.Username && u.PasswordHash == usersrequest.PasswordHash);
            if (Log != null)
            {
               
                return Log;
            }

            return null;


        }
    }
}
