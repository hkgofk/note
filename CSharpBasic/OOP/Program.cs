using OOP;
using OOP.Model;
using System.Globalization;

HiredProgrammers myEmployee = new HiredProgrammers(3);

Programmer programmer;

for (int i = 0; i < 3; i++)
{
    Console.Write("Name: ");
    string name = Console.ReadLine();
    int id = i + 1;
    programmer = new Programmer(id, name);
    Console.Write("Skills: ");
    programmer.Skills = Console.ReadLine();
    Console.Write("DOB: ");
    programmer.DateOfBirth = DateTime.ParseExact(Console.ReadLine(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
    myEmployee.AddNew(programmer);
}

Console.WriteLine();
Console.Write("Underage: ");
int underage = int.Parse(Console.ReadLine());
int count = myEmployee.ShowFilterInfo(underage);
Console.WriteLine("Under age: " + count);




