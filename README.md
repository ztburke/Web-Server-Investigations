A few scripts for investigating Web Server Compromise

Consider additional triage options:

WINDOWS
Select-String POST C:\Websites\Wedsite\logs\w3svc4\u_ex20240514.log | select -exp Line
Select-String GET C:\Websites\Wedsite\logs\w3svc4\u_ex20240523.log | select -exp Line
Select-String ps.aspx C:\Websites\Wedsite\logs\w3svc4\u_ex20240316.log | select -exp Line
Select-String IpAddress C:\Websites\Wedsite\logs\w3svc4\u_ex20230712.log | select -exp Line

LINUX
grep -riE 'curl|shell.php|ifconfig|hostname' /var/log/
grep -iE '(GET|POST)' /var/log/httpaccess.log
