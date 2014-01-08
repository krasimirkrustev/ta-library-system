using System.Collections.Generic;

namespace LibrarySystem.Models
{
    public class CategoryDTO
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public ICollection<BookDTO> Books { get; set; }
    }
}