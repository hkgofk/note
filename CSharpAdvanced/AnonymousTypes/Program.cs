public class Author
{
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
}
class Program
{
    static void Main(string[] args)
    {
        IList<Author> authors = new List<Author>() {
                        new Author() { Id = 1, FirstName = "John", LastName = "Willey"},
                        new Author() { Id = 2, FirstName = "Steve", LastName = "Smith"},
                        new Author() { Id = 3, FirstName = "Bill", LastName = "Ruffner"},
                        new Author() { Id = 4, FirstName = "Joydip", LastName = "Kanjilal"}
                };
        var result = from a in authors
                     select new
                     {
                         Id = a.Id,
                         Name = a.FirstName + "\t" + a.LastName
                     };
        foreach (var data in result)
            Console.WriteLine(data.Name);
        Console.Read();
    }
}