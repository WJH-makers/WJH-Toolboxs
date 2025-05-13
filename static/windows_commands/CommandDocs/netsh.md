# netsh

������ǳ��� (Network Shell)��һ�������нű�ʵ�ó����������ڱ��ػ�Զ����ʾ���޸��������еļ�������������á�

## �﷨

```cmd
netsh [-a AliasFile] [-c Context] [-r RemoteComputer] [-u [DomainName\]UserName] [-p Password | *] [Command | -f ScriptFile]
netsh <context> <subcontext> ... <command> [parameters]
```

## ˵��

-   `netsh` ͨ�� "������ ^(contexts^)" ������ÿ���������ṩһ���ض������
-   ������ͨ������ `netsh` ��� 뽻 ��ģʽ��Ȼ��������������� (���� `interface` �� `firewall`) �������ض������ġ����� `?` ��
    `help` ��ȡ��ǰ�����ĵ����
-   Ҳ�����ڵ�����ִ�����

## ���������ĺ�ʾ��

-   **Interface IP ����:**
    `netsh interface ip show config` (��ʾ IP ����)
    `netsh interface ip set address name="Ethernet" static 192.168.1.100 255.255.255.0 192.168.1.1` (���þ�̬ IP)
    `netsh interface ip set dns name="Ethernet" static 8.8.8.8` (���þ�̬ DNS)
    `netsh interface ip set address name="Ethernet" dhcp` (���� DHCP)
-   **Windows ����ǽ (�߼���ȫ):** (��Ҫ����ԱȨ��)
    `netsh advfirewall show currentprofile` (��ʾ��ǰ����ǽ�����ļ�����)
    `netsh advfirewall firewall add rule name="AllowMyApp" dir=in action=allow program="C:\path\to\myapp.exe" enable=yes` (
    ������վ����)
    `netsh advfirewall set allprofiles state on` (�������������ļ��ķ���ǽ)
-   **WLAN (��������):**
    `netsh wlan show profiles` (��ʾ�ѱ�������������ļ�)
    `netsh wlan show interfaces` (��ʾ���߽ӿ���Ϣ)
-   **Routing (·��):**
    `netsh interface ip show route` (��ʾ·�ɱ�)
