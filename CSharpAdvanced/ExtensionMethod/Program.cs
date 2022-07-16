class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine(1.Sum(2));
    }
}
static class MyClass
{
    public static int Sum(this int number1, int number2)
    {
        return number1 + number2;
    }
}
