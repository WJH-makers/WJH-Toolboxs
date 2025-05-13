# tasklist

��ʾ���ػ�Զ�̼�����ϵ�ǰ���еĽ����б����������� ID (PID) ���ڴ�ʹ�������

## �﷨

```cmd
tasklist [/s computer [/u domain\user [/p password]]] [/m [module] | /svc | /v] [/fi filter] [/fo format] [/nh]
```

## ����ѡ��

-   `/v`: ��ʾ��ϸ��������Ϣ��
-   `/svc`: ��ʾ������ÿ�������еķ���
-   `/m [module]`: �г�������ָ�� DLL ģ������н��̡�
-   `/fi "filter"`: Ӧ�ù����� (���� `/fi "IMAGENAME eq notepad.exe"`, `/fi "PID gt 1000"`, `/fi "STATUS eq running"`).
-   `/fo TABLE|LIST|CSV`: ָ�������ʽ (�����б���CSV)��
-   `/nh`: ��ֹ��ʾ�����С�
