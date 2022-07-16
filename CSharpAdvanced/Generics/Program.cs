public class Programs
{
    static void Main(string[] args)
    {
        Generic<int> g = new Generic<int>();
        g.Field = 1;
        //...
        Console.WriteLine("Generic.Field           = \"{0}\"", g.Field);
        Console.WriteLine("Generic.Field.GetType() = {0}", g.Field.GetType().FullName);

        Generic<string> f = new Generic<string>();
        f.Field = "Hieu dep trai";
        Console.WriteLine("Generic.Field           = \"{0}\"", f.Field);
        Console.WriteLine("Generic.Field.GetType() = {0}", f.Field.GetType().FullName);
    }
}

public class Generic<T>
{
    public T Field;
}