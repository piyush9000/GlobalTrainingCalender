using GlobalCalenderProgram.Models;
using GlobalCalenderProgram.Reponse;
using GlobalCalenderProgram.Repositories;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace GlobalCalenderProgram.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("AllowOrigin")]
    public class TrainingController : ControllerBase
    {
        private readonly ITrainingRepository _TrainingData;

        public TrainingController(ITrainingRepository TrainingData)
        {
            _TrainingData = TrainingData;
        }
        [Route("GetAllCourseDetails")]
        [HttpGet]
        public IEnumerable<Tblcourse> GetAllCourses()
        {
            var ListofCourses = _TrainingData.GetAllCourses();
            return ListofCourses;
        }

        [Route("GetAllTrainingDetails")]
        [HttpGet]
        public IEnumerable<RTraining> GetAllTrainingDetails()
        {
            var ListofTraining = _TrainingData.GetAllTrainingDetails();
            return ListofTraining;
        }

        [Route("GetAllTrainerNames")]
        [HttpGet]
        public IEnumerable<Tbluser> GetAllTrainerNames()
        {
            var ListofTrainerNames = _TrainingData.GetAllTrainerNames();
            return ListofTrainerNames;
        }

        [Route("AddTrainingDetails")]
        [HttpPost]
        public Tbltranning InsertTrainingDetails([FromBody] Tbltranning objtraining)
        {
            var ScheduledTraining = _TrainingData.Insert(objtraining);
            if (ScheduledTraining != null)
            {
                return ScheduledTraining;
            }
            return null;
        }

    }
}
