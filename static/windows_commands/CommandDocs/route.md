# route

��ʾ���޸ı��� IP ·�ɱ��е���Ŀ��

## �﷨

```cmd
route [-f] [-p] [-4|-6] [command [destination] [mask subnetmask] [gateway] [metric costmetric] [if interface]]
```

## ��������

-   `route print [destination]`: ��ӡ·�ɱ���ָ��Ŀ���·�ɡ�
-   `route add destination mask subnetmask gateway [metric costmetric] [if interface]`: ���Ӿ�̬·�ɡ�
-   `route delete destination [gateway]`: ɾ����̬·�ɡ�
-   `route change destination [mask subnetmask] [gateway] [metric costmetric] [if interface]`: �޸�����·�ɡ�

## ����ѡ��

-   `-f`: ���·�ɱ�������������Ŀ��
-   `-p`: �� `add` ����һ��ʹ��ʱ��ʹ·����ϵͳ����֮� 䱣 �ֳ־á��� `print` ����һ��ʹ��ʱ����ʾ�־�·���б���
-   `-4`: ǿ��ʹ�� IPv4��
-   `-6`: ǿ��ʹ�� IPv6��
