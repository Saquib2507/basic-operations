terraform {}

#Number List

variable "num_list" {
  type = list(number)
  default = [1,2,3,4,5]
}

#Object list of person
variable "person_list" {
  type = list(object({
    fname = string
    lname = string 
  }))

  default = [ {
    #key = value
    fname = "Saquib"
    lname = "Bagwan"
  }, {
    fname = "Danish"
    lname = "Bagwan"
  } ]
}

variable "map_list" {
  type = map(number)
  default = {
    "one" = 1
    "two" = 2
    "three" = 3
  }
}

#Calculations
locals {
  mul = 2 * 2
  add = 2 + 2
  eq  = 2!=3

  #double the list 
  double = [for num in var.num_list: num*2]

  #odd num only
  odd = [for num in var.num_list: num if num%2!=0]

  #To get only first name from list
  fname = [for person in var.person_list : person.fname]
}

output "output" {
  value = local.fname
}

/*output "result" {
  value = local.mul
}

output "result1" {
  value = local.eq
}

output "result2" {
  value = var.num_list
}

output "result3" {
  value = var.map_list
}

output "result4" {
  value = var.person_list
}*/

