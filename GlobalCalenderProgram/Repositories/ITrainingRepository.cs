using GlobalCalenderProgram.Models;
using GlobalCalenderProgram.Reponse;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GlobalCalenderProgram.Repositories
{
    public interface ITrainingRepository
    {
         IEnumerable<Tblcourse> GetAllCourses();

        IEnumerable<RTraining> GetAllTrainingDetails();

        IEnumerable<Tbluser> GetAllTrainerNames();

        Tbltranning Insert(Tbltranning objtraining);

        //Tbltranning Delete(int id);

        //Tbltranning Update(int id);

    }
        
}
