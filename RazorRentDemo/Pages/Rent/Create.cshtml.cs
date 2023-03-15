using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using RazorRentDemo.Data;
using RazorRentDemo.Model;

namespace RazorRentDemo.Pages.Rent
{
    public class CreateModel : PageModel
    {
        private readonly RazorRentDemo.Data.RentDbContext _context;

        public CreateModel(RazorRentDemo.Data.RentDbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public Reservation Reservation { get; set; } = default!;
        

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid || _context.Reservations == null || Reservation == null)
            {
                return Page();
            }

            _context.Reservations.Add(Reservation);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
