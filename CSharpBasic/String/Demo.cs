using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringExercise
{
    public static class Demo
    {
        /// <summary>
        /// Nhap va in chuoi
        /// </summary>
        /// <param name="str">Chuoi nhap vao</param>
        /// <returns></returns>
        public static string InputAndPrint(string str)
        {
            return str;
        }
        /// <summary>
        /// Dem ki tu trong chuoi
        /// </summary>
        /// <param name="str">Chuoi nhap vao</param>
        /// <returns></returns>
        public static int CountCharInString(string str)
        {
            int count = 0;
            foreach (char item in str)
            {
                count++;
            }

            return count;
        }
        /// <summary>
        /// Chuyen ki tu thuong thanh ki tu hoa
        /// </summary>
        /// <param name="str">chuoi nhap vao</param>
        /// <returns></returns>
        public static void LowerToUpper(string str)
        {
            foreach (char item in str)
            {
                if(item < 'z' && item > 'a')
                {
                    Console.Write($"{(char)(item - 32)}");
                }
                else
                {
                    Console.Write(item);
                }
            }
        }
    }
}
