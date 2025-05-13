# powercfg

���Ƶ�Դ���ã�������Դ�ƻ����������ߺʹ���ģʽ������ϵͳ��Դʹ�������

## �﷨

```cmd
powercfg /<command> [<arguments>]
```

## �������� (����)

-   `powercfg /list` �� `powercfg /l`: �г����е�Դ�ƻ���
-   `powercfg /query [Scheme_GUID] [Sub_GUID]`: ��ʾ��Դ�ƻ������ݡ�
-   `powercfg /getactivescheme`: ��ʾ��ǰ�Ļ��Դ�ƻ���
-   `powercfg /setactive <Scheme_GUID>`: ����ָ���ĵ�Դ�ƻ�Ϊ��ƻ���
-   `powercfg /change <setting> <value>` �� `powercfg /x <setting> <value>`: �޸ĵ�ǰ��Դ�ƻ������á�
-   `powercfg /hibernate on|off`: ���û�������߹��ܡ�
-   `powercfg /devicequery <query_flags>`: ��������ָ��������� 豸 �б� (���� `wake_armed` ��������Ϊ����ϵͳ��� 豸)��
-   `powercfg /requests`: ö��Ӧ�ó������������ĵ�Դ����
-   `powercfg /energy`: �� 60 ���ڷ���ϵͳ�ܺĺ͵���������⣬������ HTML ��� 档
-   `powercfg /batteryreport`: ���ɵ��ʹ������� HTML ��� 档
-   `powercfg /sleepstudy`: (��Ҫ InstantGo/Modern Standby ֧��) ����ϵͳ��Դת������ϱ�� 档
-   `powercfg /aliases`: ��ʾ���е�Դ���õı�����
-   `powercfg /?`: ��ʾ������Ϣ��
