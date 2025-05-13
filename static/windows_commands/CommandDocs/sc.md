# sc

��������� (Service Control)��һ�������г��������������ƹ��������Ѱ�װ�ķ������ͨ�š�������ѯ�����á�������ֹͣ��ɾ������ȡ�ͨ����Ҫ����ԱȨ��ִ���޸Ĳ�����

## �﷨

```cmd
sc [<servername>] <command> <servicename> [options]
```

## ��������

-   `sc query [servicename | type= driver|service | state= active|inactive|all]`: ��ѯ����״̬��
-   `sc queryex [servicename | type= driver|service | state= active|inactive|all]`: ��ѯ�������չ״̬ (���� PID)��
-   `sc getdisplayname <servicename>`: ��ȡ�������ʾ���ơ�
-   `sc getkeyname <displayname>`: ��ȡ����ķ��������
-   `sc start <servicename> [service args]`: ��������
-   `sc stop <servicename>`: ֹͣ����
-   `sc pause <servicename>`: ��ͣ����
-   `sc continue <servicename>`: �ָ�����
-

`sc config <servicename> [type= own|share|interact|kernel|filesys|rec] [start= boot|system|auto|demand|disabled] [error= normal|severe|critical|ignore] [binpath= <binary path>] [group= <load order group>] [tag= yes|no] [depend= <dependencies>] [obj= <account name> | <object name>] [displayname= <display name>] [password= <password>]`:
�޸ķ������á�

-   `sc description <servicename> [description]`: ���÷����������
-

`sc failure <servicename> [reset= <reset period>] [reboot= <reboot message>] [command= <command line>] [actions= <action>/<delay>[/...]]`:
���÷���ʧ��ʱ�Ĳ�����

-   `sc create <servicename> [binpath= <binary path>] [type= ...] [start= ...] ...`: ����һ��������Ŀ��
-   `sc delete <servicename>`: ɾ��������Ŀ��**(��� 棺 ɾ��������ܵ���ϵͳ���ȶ���)**
