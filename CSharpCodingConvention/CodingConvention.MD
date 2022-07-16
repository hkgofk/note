# C# Coding Conventions

## 1. Khái niệm Coding Conventions?


+ `Coding conventions` là một tập hợp các quy tắc được định nghĩa ra để quy ước quá trình code trong một dự án.
+    Thường được xây dựng sau khi quá trình phân tích yêu cầu hệ thống, dựa vào các nhóm chức chức năng của một hệ thống.
+    Project manager sẽ dựng một bộ khung `Coding Conventions` cho toàn dự án cũng như team leader có thể dựng lên từng bộ `Coding Conventions` cho team mình dựa trên bộ khung gốc.
+    Nhờ có `Coding conventions` , những các thành viên trong dự án có thể hiểu đọc hiểu code của nhau dễ dàng hơn
+    Thuận tiện hơn cho những developer khác khi họ tìm hiểu dự án các dự án cũ để phát triển thêm
+    Dựng lên một bộ quy tắc để thống nhất chung cho hệ thống hoặc dự án.

## 2. Coding Convetions trong C#

### 2.1. Quy tắc đặt tên

+ Có 3 kiểu đặt tên thông dụng nhất

|Kiểu|Mô tả|Ví dụ|
|:------------|:-----------|:--------------|
|Pascal Case |	Chữ cái đầu tiên trong từ định danh và chữ cái đầu tiên của mỗi từ nối theo sau phải được viết hoa. Sử dụng Pascal Case để đặt tên cho một tên có từ 3 ký tự trở lên. 	|CodingConvention|
|Camel Case| 	Chữ cái đầu tiên trong từ định danh là chữ thường và chữ cái đầu tiên của mối từ nối theo sau phải được viết hoa. 	|codingConvention|
|Uppercase| 	Tất cả các ký tự trong từ định danh phải được viết hoa. Sử dụng quy tắc này đối với tên định danh có từ 2 ký tự trở xuống |	System.IO|

+ Sử dụng pascal casing(PascalCasing) khi đặt tên cho class, record, struct

```C#
public class DataService
{
}
```
```C#
public record PhysicalAddress(
    string Street,
    string City,
    string StateOrProvince,
    string ZipCode);
```
```C#
public struct ValueCoordinate
{
}
```

+ Khi đặt tên cho `interface` sử dụng pascal casing với thêm `I` đằng trước
```c#
public interface IWorkerQueue
{
}
```
When naming `public` members of types, such as fields, properties, events, methods, and local functions, use pascal casing.
```c#
public class ExampleEvents
{
    // A public field, these should be used sparingly
    public bool IsValid;

    // An init-only property
    public IWorkerQueue WorkerQueue { get; init; }

    // An event
    public event Action EventProcessing;

    // Method
    public void StartEventProcessing()
    {
        // Local function
        static int CountQueueItems() => WorkerQueue.Count;
        // ...
    }
}
```
Use camel casing ("camelCasing") when naming `private` or `internal` fields, and prefix them with `_`.
```c#
public class DataService
{
    private IWorkerQueue _workerQueue;
}
```
When writing method parameters, use camel casing.
```C#
public T SomeMethod<T>(int someNumber, bool isValid)
{
}
```
When working with `static` fields that are `private` or `internal`, use the `s_` prefix and for thread static use `t_`.
```c#
public class DataService
{
    private static IWorkerQueue s_workerQueue;

    [ThreadStatic]
    private static TimeSpan t_timeSpan;
}
```

