using GlobalCalenderProgram.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GlobalCalenderProgram.Repositories
{
   public interface IUsersRepository
    {
        Tbluser GetLoggedUser(Tbluser usersrequest);


    }
}
