using OOP.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP.Model
{
    internal class Programmer : Employee, IPerson
    {
        private string _skills;
        private DateTime _DOB;
        private int _age;
        public Programmer(int id, string name) : base(id, name)
        {
            _skills = String.Empty;
            DateOfBirth = DateTime.Now;
        }
        public Programmer(int id, string name, string skills, DateTime dob) : base(id, name)
        {
            Skills = skills;
            DateOfBirth = dob;
        }

        public string Skills
        {
            get { return _skills; }
            set
            {
                if (value.Length == 0)
                {
                    throw new Exception();
                }
                _skills = value;
            }
        }

        public DateTime DateOfBirth
        {
            get { return _DOB; }
            set { _DOB = value; }
        }

        public int Age
        {
            get
            {
                int year = int.Parse(DateOfBirth.ToString("yyyy"));
                int currentYear = int.Parse(DateTime.Now.ToString("yyyy"));
                _age = currentYear - year;
                return _age;
            }
        }

        public override void ShowInfo()
        {
            Console.WriteLine("Id: {0} | Name: {1} | Skills: {2} | DOB: {3} | Age: {4}",
                Id, Name, Skills, DateOfBirth, Age);
        }
    }
}
