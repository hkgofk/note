using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Conditional_Statements_And_Loops
{
    public static class ConditionStatement
    {
        public static string EqualOrNot(int number1, int number2)
        {
            if (number1 == number2)
            {
                return "Number 1 equal number2";
            }

            return "Number 1 not equal number2";
        }
        public static string EvenOrOdd(int number)
        {
            if (number % 2 == 0)
            {
                return $"{number} is an even integer";
            }

            return $"{number} is an odd integer";
        }
        public static string PositiveOrNegative(int number)
        {
            if (number > 0)
            {
                return $"{number} is a positive number";
            }

            return $"{number} is a negative number";
        }

    }
}
