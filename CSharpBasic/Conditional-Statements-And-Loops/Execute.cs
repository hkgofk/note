using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Conditional_Statements_And_Loops
{
    public static class Execute
    {
        /// <summary>
        /// So sanh 2 so xem co bang nhau khong
        /// </summary>
        public static void CS1()
        {
            int number1, number2;
            Console.Write("Input number 1: ");
            number1 = int.Parse(Console.ReadLine());
            Console.Write("Input number 2: ");
            number2 = int.Parse(Console.ReadLine());

            Console.WriteLine(ConditionStatement.EqualOrNot(number1, number2));
        }
        /// <summary>
        /// Kiem tra chan le
        /// </summary>
        public static void CS2()
        {
            int number;
            Console.WriteLine("Enter number you want to check: ");
            number = int.Parse(Console.ReadLine());

            Console.WriteLine(ConditionStatement.EvenOrOdd(number));
        }
        /// <summary>
        /// Kiem tra am duong
        /// </summary>
        public static void CS3()
        {
            int number;
            Console.WriteLine("Enter number you want to check: ");
            number = int.Parse(Console.ReadLine());

            Console.WriteLine(ConditionStatement.PositiveOrNegative(number));
        }
        /// <summary>
        /// Hien thih n so tu nhien tu 1 den n
        /// </summary>
        public static void Loop1()
        {
            int number;
            Console.Write("Enter number: ");
            number = int.Parse(Console.ReadLine());

            Loops.DisplayNaturalNumbers(number);
        }
        /// <summary>
        /// Tong tu 1 den n
        /// </summary>
        public static void Loop2()
        {
            int number;
            Console.Write("Enter number: ");
            number = int.Parse(Console.ReadLine());

            Console.WriteLine($"Sum from 1 to {number} : " + Loops.SumNaturalNumbers(number));

        }
        /// <summary>
        /// Bang cuu chuong
        /// </summary>
        public static void Loop3()
        {
            int number;
            Console.Write("Enter number: ");
            number = int.Parse(Console.ReadLine());

            Loops.MultiplicationTable(number);

        }

    }
}
