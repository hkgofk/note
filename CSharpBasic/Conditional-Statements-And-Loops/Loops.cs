using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Conditional_Statements_And_Loops
{
    public static class Loops
    {
        public static void DisplayNaturalNumbers(int number)
        {
            for (int i = 0; i < number; i++)
            {
                Console.Write($"\n{i + 1}  ");
            }
        }
        public static int SumNaturalNumbers(int number)
        {
            int result = 0;
            for (int i = 1; i <= number; i++)
            {
                result += i;
            }

            return result;
        }
        public static void MultiplicationTable(int number)
        {
            for (int i = 1; i <= 10; i++)
            {
                Console.WriteLine($"{number} x {i} = {number * i}");
            }
        }
    }
}
