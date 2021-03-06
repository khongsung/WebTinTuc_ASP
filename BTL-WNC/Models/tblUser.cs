﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BTL_WNC.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class tblUser
    {
        public int iId { get; set; }

        [Required(ErrorMessage = "Vui nhập tên")]
        public string sUsername { get; set; }

        [Required(ErrorMessage="Vui lòng nhập mật khẩu")]
        [DataType(DataType.Password)]
        public string sPassword { get; set; }
        
        [Required(ErrorMessage="Vui lòng nhập tài khoản")]
        [DataType(DataType.EmailAddress)]
        public string sEmail { get; set; }

        [Required(ErrorMessage="Vui lòng chọn quyền cho user")]
        public string sRole { get; set; }
    }
}
