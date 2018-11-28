//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LoginRegistrationDemo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class User
    {
        public int ID { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage ="This field iis required")]
        public string Username { get; set; }

        [DataType(DataType.EmailAddress)]
        [Required(ErrorMessage = "This field iis required")]
        public string Email { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "This field iis required")]
        public string RegistrationNumber { get; set; }

        [DataType(DataType.PhoneNumber)]
        [Required(ErrorMessage = "This field iis required")]
        public string PhoneNumber { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "This field iis required")]
        public string CNIC { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "This field iis required")]
        public string HostelName { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "This field iis required")]
        public string RoomNumber { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "This field iis required")]
        public string Degree { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "This field iis required")]
        public string Department { get; set; }

        [DataType(DataType.Password)]
        [Required(ErrorMessage = "This field iis required")]
        public string Password { get; set; }

        [DataType(DataType.Text)]
        [Required(ErrorMessage = "This field iis required")]
        public Nullable<bool> IsValid { get; set; }
    }
}
