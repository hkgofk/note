using System;
internal class Box
{
    public double Length { get; set; }
    public double Breadth { get; set; }
    public double Height { get; set; }
    public Box() { }
    public Box(double length, double breadth, double height)
    {
        Length = length;
        Breadth = breadth;
        Height = height;
    }
    /// <summary>
    /// tính thể tích khối hộp
    /// </summary>
    public double Volume => Length * Breadth * Height;
    // nạp chồng phép cộng
    public static Box operator +(Box b, Box c)
    {
        Box box = new Box
        {
            Length = b.Length + c.Length,
            Breadth = b.Breadth + c.Breadth,
            Height = b.Height + c.Height
        };
        return box;
    }
    // nạp chồng phép so sánh bằng
    public static bool operator ==(Box lhs, Box rhs)
    {
        bool status = false;
        if (lhs.Length == rhs.Length && lhs.Height == rhs.Height
           && lhs.Breadth == rhs.Breadth)
        {
            status = true;
        }
        return status;
    }
    // nạp chồng phép so sánh khác
    public static bool operator !=(Box lhs, Box rhs)
    {
        bool status = false;
        if (lhs.Length != rhs.Length || lhs.Height != rhs.Height ||
           lhs.Breadth != rhs.Breadth)
        {
            status = true;
        }
        return status;
    }
    // nạp chồng phép so sánh nhỏ hơn
    public static bool operator <(Box lhs, Box rhs)
    {
        bool status = false;
        if (lhs.Length < rhs.Length && lhs.Height < rhs.Height
           && lhs.Breadth < rhs.Breadth)
        {
            status = true;
        }
        return status;
    }
    // nạp chồng phép so sánh lớn hơn
    public static bool operator >(Box lhs, Box rhs)
    {
        bool status = false;
        if (lhs.Length > rhs.Length && lhs.Height >
           rhs.Height && lhs.Breadth > rhs.Breadth)
        {
            status = true;
        }
        return status;
    }
    public override string ToString()
    {
        return string.Format("({0}, {1}, {2})", Length, Breadth, Height);
    }
}
internal class Program
{
    private static void Main(string[] args)
    {
        Console.OutputEncoding = System.Text.Encoding.Unicode;
        Box Box1 = new Box(6, 7, 5);
        Box Box2 = new Box(12, 13, 10);
        Box Box3 = new Box();
        Box Box4 = new Box();
        /* phép cộng hai hình hộp cho ra hình hộp khác có kích thước 
         * bằng tổng kích thước của hai hộp */
        Box3 = Box1 + Box2;
        Console.WriteLine("Box 3: {0}", Box3.ToString());
        Console.WriteLine("Volume of Box3 : {0}", Box3.Volume);
        // so sánh hai hình hộp
        if (Box1 > Box2)
            Console.WriteLine("Box1 lớn hơn Box2");
        else
            Console.WriteLine("Box1 không lớn hơn Box2");
        if (Box3 == Box4)
            Console.WriteLine("Box3 bằng Box4");
        else
            Console.WriteLine("Box3 không bằng Box4");
        Console.ReadKey();
    }
}
