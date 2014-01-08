namespace LibrarySystem.Models
{
    public class BookDTO
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Authors { get; set; }

        public string ISBN { get; set; }

        public string Website { get; set; }

        public string Description { get; set; }

        public string CategoryName { get; set; }
    }
}