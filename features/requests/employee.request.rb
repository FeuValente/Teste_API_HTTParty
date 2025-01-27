class Employee_Resquests
  def find_employee
    Employee.get('/employees')
  end
end
