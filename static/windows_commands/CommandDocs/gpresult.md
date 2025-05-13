# gpresult

��ʾĿ���û��ͼ����������Խ���� (RSoP) ��Ϣ��

## �﷨

```cmd
gpresult [/s computer [/u domain\user /p password]] [/user targetusername] [/scope {user | computer}] [/v | /z] [/f | /h <filename> | /x <filename>]
```

## ����ѡ��

-   `/s computer`: ָ��Զ�̼������
-   `/user targetusername`: ָ��Ҫ��ʾ�� RSoP ���ݵ��û���
-   `/scope {user | computer}`: ָ������ʾ�û����Ի��Ǽ�������ԡ�
-   `/v`: ��ʾ��ϸ��Ϣ��
-   `/z`: ��ʾ����ϸ��Ϣ (���п�����Ϣ)��
-   `/h <filename>`: ����� 汣 ��Ϊ HTML ��ʽ��
-   `/x <filename>`: ����� 汣 ��Ϊ XML ��ʽ��
-   `/f`: ǿ�Ƹ��� `/h` �� `/x` ָ�����ļ��� (�������)��
