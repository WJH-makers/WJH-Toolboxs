# taskkill

��ֹһ�������������еĽ��̡�����ͨ������ ID (PID) ��ӳ��������ָ�����̡�

## �﷨

```cmd
taskkill [/s computer [/u domain\user [/p password]]] { [/fi filter] [/pid processid | /im imagename] } [/t] [/f]
```

## ����ѡ��

-   `/pid processid`: ָ��Ҫ��ֹ�Ľ��̵� PID��
-   `/im imagename`: ָ��Ҫ��ֹ�Ľ��̵�ӳ������ (���� `notepad.exe`)��
-   `/f`: **ǿ��**��ֹ���̡�����ʹ�ã�
-   `/t`: ��ָֹ���Ľ��̼����������κ��ӽ��̡�
-   `/fi "filter"`: Ӧ�ù�������ѡ��Ҫ��ֹ�Ľ��� (�﷨ͬ `tasklist`)��
