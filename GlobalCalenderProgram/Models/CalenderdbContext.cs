using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace GlobalCalenderProgram.Models
{
    public partial class CalenderdbContext : DbContext
    {
        public CalenderdbContext()
        {
        }

        public CalenderdbContext(DbContextOptions<CalenderdbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Tblcourse> Tblcourses { get; set; }
        public virtual DbSet<Tbltranning> Tbltrannings { get; set; }
        public virtual DbSet<Tbluser> Tblusers { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=DESKTOP-TNRQL0O;Database=Calenderdb;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Tblcourse>(entity =>
            {
                entity.HasKey(e => e.CourseId);

                entity.ToTable("tblcourses");

                entity.Property(e => e.CourseId).HasColumnName("Course_Id");

                entity.Property(e => e.CourseName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Course_Name");
            });

            modelBuilder.Entity<Tbltranning>(entity =>
            {
                entity.HasKey(e => e.TrnId);

                entity.ToTable("tbltranning");

                entity.Property(e => e.TrnId).HasColumnName("Trn_Id");

                entity.Property(e => e.CourseId).HasColumnName("Course_Id");

                entity.Property(e => e.Duration)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.EndDate)
                    .HasColumnType("datetime")
                    .HasColumnName("End_Date");

                entity.Property(e => e.PreRequisite)
                    .IsRequired()
                    .IsUnicode(false)
                    .HasColumnName("Pre_Requisite");

                entity.Property(e => e.StartDate)
                    .HasColumnType("datetime")
                    .HasColumnName("Start_Date");

                entity.Property(e => e.TrainerId).HasColumnName("trainer_id");

                entity.Property(e => e.UrlLink)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("url_link");

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Tbltrannings)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbltranning_tblcourses");

                entity.HasOne(d => d.Trainer)
                    .WithMany(p => p.Tbltrannings)
                    .HasForeignKey(d => d.TrainerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbltranning_tblusers");
            });

            modelBuilder.Entity<Tbluser>(entity =>
            {
                entity.HasKey(e => e.UserId);

                entity.ToTable("tblusers");

                entity.Property(e => e.UserId).HasColumnName("User_ID");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("First_Name");

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Last_Name");

                entity.Property(e => e.PasswordHash)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Password_Hash");

                entity.Property(e => e.UserType)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("User_Type");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
