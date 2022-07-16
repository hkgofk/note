using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            localhost.BasicWebService basicWebService = new localhost.BasicWebService();

            int number1;
            int number2;

            Console.Write("Enter number1: ");
            number1 = int.Parse(Console.ReadLine());
            Console.Write("Enter number2: ");
            number2 = int.Parse(Console.ReadLine());

            Console.WriteLine($"{number1} + {number2} = {basicWebService.Sum(number1, number2)}");
        }
    }
}
