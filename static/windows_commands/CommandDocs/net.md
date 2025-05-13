# net

�ṩ���ڹ���������Դ�������û�����¼�ȵĸ���������ʵ�ó���

## �﷨

```cmd
net <subcommand> [options]
```

## ���������� (����)

-   `net view`: ��ʾ���б���������б���ָ��������ϵĹ�����Դ�б���
-   `net use`: ���ӻ�Ͽ������� 빲 ����Դ�����ӣ�����ʾ�йؼ�������ӵ���Ϣ��(���� `net use Z: \\server\share`)
-   `net user`: ���ӡ�ɾ�����޸��û��ʻ���(���� `net user username password /add`, `net user username /delete`)
-   `net localgroup`: ���ӡ�ɾ�����޸ı���� 顣(���� `net localgroup administrators username /add`)
-   `net share`: ������ɾ������ʾ������Դ��
-   `net start <service>`: ��������
-   `net stop <service>`: ֹͣ����
-   `net pause <service>`: ��ͣ����
-   `net continue <service>`: �ָ���ͣ�ķ���
-   `net accounts`: �����û��ʻ����ݿ⣬�޸�����͵�¼Ҫ��
-   `net config server`: ��ʾ����� Server ��������á�
-   `net config workstation`: ��ʾ����� Workstation ��������á�
-   `net statistics [workstation | server]`: ��ʾ���� Workstation �� Server ���������ͳ����־��
-   `net session`: �г���Ͽ����ؼ��������֮���ӵĿͻ���֮��ĻỰ��
-   `net time`: ʹ�������ʱ������һ̨����������ʱ��ͬ����

## ��ȡ����

-   `net help`: ��ʾ���� `net` ������б���
-   `net help <subcommand>` �� `net <subcommand> /?`: ��ʾ�ض�������İ�����Ϣ��
