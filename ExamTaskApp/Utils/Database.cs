using ExamTaskApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamTaskApp.Utils
{
    public class Database
    {
        private static DecorationContext _context;
        public static DecorationContext Context
        {
            get => _context ?? (_context = new DecorationContext());
        }
    }
}
