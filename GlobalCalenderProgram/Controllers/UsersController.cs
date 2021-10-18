using GlobalCalenderProgram.Models;
using GlobalCalenderProgram.Reponse;
using GlobalCalenderProgram.Repositories;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GlobalCalenderProgram.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("AllowOrigin")]
    public class UsersController : ControllerBase
    {
       
        private readonly IUsersRepository _UserData;
       
        public UsersController(IUsersRepository UserData)
        {
            _UserData = UserData;
        }

        [Route("Validate/Loggedusers")]
        [HttpPost]
        public RUsers LoggedUser([FromBody] Tbluser objusers)
        {
          var GetUserdetails =  _UserData.GetLoggedUser(objusers);

            RUsers objReponse = new RUsers();
            
            if (GetUserdetails != null)
            {
                objReponse.IsValid = true;
                objReponse.FirstName = GetUserdetails.FirstName;
                objReponse.LastName = GetUserdetails.LastName;
                objReponse.UserType = GetUserdetails.UserType;
                objReponse.UserId = GetUserdetails.UserId;
                return objReponse;
            }
            objReponse.IsValid = false;
            return objReponse;
        }
    }
}
