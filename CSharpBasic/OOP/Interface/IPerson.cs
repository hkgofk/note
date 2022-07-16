using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP.Interface
{
    internal interface IPerson
    {
        string Skills { get; set; }
        DateTime DateOfBirth { get; }
        int Age { get; }
    }
}
