using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP.Model
{
    internal abstract class Employee
    {
        private int _id;
        private string _name;
        public Employee(int id)
        {
            _id = id;
            Name = "No name";
        }
        public Employee(int id, string name) : this(id)
        {
            Name = name;
        }

        public int Id { get => _id; }
        public string Name { get => _name; set => _name = value; }
        public abstract void ShowInfo();       
    }
}
