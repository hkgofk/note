List<Person> people = new List<Person>();

people.Add(new Person("Hieu", 10));
people.Add(new Person("Phong", 10));
people.Add(new Person("Linh", 10));
people.Add(new Person("Phuong", 10));
people.Add(new Person("Lan", 10));
Console.WriteLine("All people in list:");
foreach (var item in people)
{
    Console.WriteLine($"Name: {item.Name}  Age: {item.Age}");
}

Console.WriteLine("\nAll people in list after remove people index 1:");
people.RemoveAt(1);
foreach (var item in people)
{
    Console.WriteLine($"Name: {item.Name}  Age: {item.Age}");
}

Console.WriteLine("\nAll people in list after insert index 1:");
people.Insert(1, new Person("Insert", 11));
foreach (var item in people)
{
    Console.WriteLine($"Name: {item.Name}  Age: {item.Age}");
}