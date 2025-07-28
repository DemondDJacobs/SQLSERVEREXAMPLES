use pr

begin try
insert empdata
values('William', 'Johnson', '2014-10-8', 1, 1, 3, null, null)
print 'record added'
end try
begin catch
print 'FAILURE: RECORD WAS NOT ADDED ' + char(10)
PRINT 'Error number ' + convert(varchar, error_number(), 1) + ': ' + error_message()

end catch