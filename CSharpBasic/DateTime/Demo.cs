using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DateTimeExercise
{
    public static class Demo
    {/// <summary>
    /// format ngay gio hien tai theo cac kieu khac nhau
    /// </summary>
        public static void Exercise1()
        {
            DateTime time = DateTime.Now;
            Console.WriteLine("Short date: " + time.ToString("d"));
            Console.WriteLine("Long date: " + time.ToString("D"));
            Console.WriteLine("Month day: " + time.ToString("M"));
            Console.WriteLine("Full short date: " + time.ToString("f"));
            Console.WriteLine("24h: " + time.ToString("g"));

        }
        public static void Exercise2()
        {
            DateTime moment = DateTime.Now;

            Console.WriteLine("year = " + moment.Year);

            Console.WriteLine("month = " + moment.Month);

            Console.WriteLine("day = " + moment.Day);

            Console.WriteLine("hour = " + moment.Hour);

            Console.WriteLine("minute = " + moment.Minute);

            Console.WriteLine("second = " + moment.Second);

            Console.WriteLine("millisecond = " + moment.Millisecond);

        }
        public static void Exercise3()
        {
            DateTime moment = DateTime.Now;

            Console.WriteLine($"The day of week for {moment.ToString("dd/MM/yyyy")} is "+moment.DayOfWeek);
        }

    }
}
