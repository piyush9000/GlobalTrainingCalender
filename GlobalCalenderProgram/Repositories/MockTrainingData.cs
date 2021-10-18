using FluentNHibernate.Automapping;
using GlobalCalenderProgram.Models;
using GlobalCalenderProgram.Reponse;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Providers.Entities;

namespace GlobalCalenderProgram.Repositories
{
    public class MockTrainingData : ITrainingRepository
    {
        CalenderdbContext _dbContext;
        public MockTrainingData(CalenderdbContext applicationDbContext)
        {
            _dbContext = applicationDbContext;
        }
      
        
        public IEnumerable<Tblcourse> GetAllCourses()
        {
            var Courses = _dbContext.Tblcourses.ToList();

            return Courses;
        }

        public IEnumerable<Tbluser> GetAllTrainerNames()
        {
            var TrainerNames = _dbContext.Tblusers.ToList();
            return TrainerNames;
        }

        public IEnumerable<RTraining> GetAllTrainingDetails()
        {

         
          
            var getlist = (
                from R in _dbContext.Tblusers
                join G in _dbContext.Tbltrannings on R.UserId equals G.TrainerId into RG
                from x in RG.DefaultIfEmpty()

                join RE in _dbContext.Tblcourses on x.CourseId equals RE.CourseId into GRE
                from y in GRE.DefaultIfEmpty()

                
                 select new RTraining
                 {
                    UserId = R.UserId,
                    
                    TrainerName = R.FirstName +" "+ R.LastName,
                    ReservationDateFrom = x.StartDate,
                    ReservationDateTo = x.EndDate,
                     Duration = x.Duration,
                    PreRequisite = x.PreRequisite,
                    Reservationurl = x.UrlLink,
                    CourseName = y.CourseName

                }).ToList();

            return getlist;


        }

        public Tbltranning Insert(Tbltranning objtraining)
        {
            Tbltranning objtrn = new Tbltranning();
            if (objtraining != null)
            {
               
                this._dbContext.Tbltrannings.Add(objtraining);
                this._dbContext.SaveChanges();

                return objtrn;
            }

            return null;
        }
    }
}
