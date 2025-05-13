# diskpart

���� Windows ���̷������������˹���������ͨ���ű���ֱ������������������������� (���̡���������������Ӳ��)��

## �﷨

```cmd
diskpart [/s script.txt]
```

## ˵��

-   ���� `diskpart` ������������� DiskPart ����ʽ��ʾ�� (`DISKPART>`)��
-   �� DiskPart ��ʾ���£���������������������������̡�
-   ������ DiskPart �������: `list disk`, `select disk n`, `list partition`, `select partition n`, `list volume`,
    `select volume n`, `create partition primary`, `delete partition`, `format fs=ntfs quick`, `assign letter=X`,
    `active`, `clean` (\*\*(��� 棺`clean` ��ɾ����ѡ�����ϵ����з��������ݣ�)) �ȡ�
-   ���� `help` �ɲ 鿴 ���п��õ� DiskPart ���
-   ���� `exit` ���˳� DiskPart ��������
-   `/s script.txt`: ʹ��ָ���Ľű��ļ����� DiskPart��
