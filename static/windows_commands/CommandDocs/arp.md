# arp

��ʾ���޸ĵ�ַ����Э�� (ARP) �����е���Ŀ��ARP ������� IP ��ַ�����Ӧ��������ַ (MAC ��ַ)��

## �﷨

```cmd
arp -a [inet_addr] [-n if_addr] [/v]
arp -g [inet_addr] [-n if_addr] [/v]
arp -d inet_addr [if_addr]
arp -s inet_addr eth_addr [if_addr]
```

## ����ѡ��

-   `-a` �� `-g`: ��ʾ��ǰ�� ARP ������Ŀ��
-   `-d inet_addr [if_addr]`: ɾ��ָ���� IP ��ַ��Ŀ��ʹ�� `*` ��Ϊ `inet_addr` ��ɾ��������Ŀ��
-   `-s inet_addr eth_addr [if_addr]`: ���Ӿ�̬ ARP ��Ŀ���� IP ��ַ `inet_addr` ӳ� 䵽 ������ַ `eth_addr`��
-   `inet_addr`: ָ�� IP ��ַ��
-   `eth_addr`: ָ��������ַ (MAC ��ַ)����ʽΪ xx-xx-xx-xx-xx-xx��
-   `if_addr`: ָ����ĿӦӦ�õ��Ľӿڵ� IP ��ַ�����ʡ�ԣ���ʹ�õ�һ�����õĽӿڡ�
-   `-n if_addr`: ��ʾָ���ӿڵ� ARP ��Ŀ��
-   `/v`: ����ϸģʽ����ʾ��Ŀ��
