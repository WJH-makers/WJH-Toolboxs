# reg

ע�������̨���ߡ������������л�ű���ѯ�����ӡ�ɾ�����Ƚϡ����ơ���� 롢 ���������ػ�ж��ע��������ֵ������ע�����Ҫ������������޸Ŀ��ܵ���ϵͳ���ȶ���

## �﷨

```cmd
reg <command> [parameters]
```

## �������� (����)

-   `reg query <KeyName> [/v ValueName | /ve] [/s] [/f Data] [/k] [/d] [/c] [/e] [/t Type] [/z]`: ��ѯ���ֵ��
    -   `/v ValueName`: ��ѯָ����ֵ����
    -   `/ve`: ��ѯĬ��ֵ��
    -   `/s`: ��ѯ���������ֵ��
-   `reg add <KeyName> [/v ValueName | /ve] [/t Type] [/s Separator] [/d Data] [/f]`: �����������ֵ��
    -   `/t REG_SZ | REG_MULTI_SZ | REG_EXPAND_SZ | REG_DWORD | REG_QWORD | REG_BINARY | REG_NONE`: ָ���������͡�
    -   `/d Data`: Ҫ��������ӵ�ֵ�����ݡ�
    -   `/f`: ǿ�Ƹ���������Ŀ������ʾ��
-   `reg delete <KeyName> [/v ValueName | /ve | /va] [/f]`: ɾ�������ֵ��
    -   `/va`: ɾ��ָ�����µ�����ֵ��
    -   `/f`: ǿ��ɾ��������ʾ��**(��� 棺 ɾ��ע�����/ֵ���ܵ���ϵͳ��Ӧ�ó�����ϣ�)**
-   `reg copy <SourceKeyName> <DestinationKeyName> [/s] [/f]`: ����ע����
-   `reg save <KeyName> <FileName> [/y]`: ��ָ���������Ŀ��ֵ��� 浽 �ļ��� (.hiv ��ʽ)��
-   `reg load <KeyName> <FileName>`: �� .hiv �ļ����ص�ָ����ע������¡�
-   `reg unload <KeyName>`: ж��֮ǰ�� `reg load` ���ص�ע������õ�Ԫ��
-   `reg restore <KeyName> <FileName>`: �� .hiv �ļ���ԭָ����ע����
-   `reg export <KeyName> <FileName> [/y]`: ��ָ���������Ŀ��ֵ������ .reg �ļ��С�
-   `reg import <FileName>`: �� .reg �ļ�����ע������ֵ��
-   `reg compare <KeyName1> <KeyName2> [/v ValueName | /ve] [/s] [/oa | /od | /os | /on]` : �Ƚ�ע����������Ŀ��

## ������д

-   `HKLM` (HKEY_LOCAL_MACHINE), `HKCU` (HKEY_CURRENT_USER), `HKCR` (HKEY_CLASSES_ROOT), `HKU` (HKEY_USERS), `HKCC` (
    HKEY_CURRENT_CONFIG)
