#include <stdio.h>
#include <pcap.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <libnet.h>

struct mac{
	u_short b1,b2,b3;
};
struct eth_h{
	struct mac ma1, ma2;
//	struct libnet_ether_addr ma1, ma2;
	u_short eth_type;
};

int main(int argc, char *argv[]) {
		int pktCnt=0;
		int i =0;	
		struct pcap_pkthdr header;
		struct eth_h *eth;
		struct libnet_ipv4_hdr *ip;
		struct libnet_tcp_hdr *tcp;
		struct libnet_arp_hdr *arp;
		const u_char *data;
		
		char file[]= "httpGet.pcap";
		char *err;
		
		pcap_t *pcap = pcap_open_offline(file, err);
		for(i=0;(data= pcap_next(pcap, &header))!=NULL;i++){
			eth = (struct eth_h *) data;
			printf("\n%04x\n",eth->eth_type);
			
			if((eth->eth_type) == 0x0008){
				printf("ip\n");
			}
			else if((eth->eth_type) == 0x0608){
				printf("arp\n");
			} 
			
			ip = (struct libnet_ipv4_hdr *)(data + sizeof(struct libnet_ethernet_hdr));
			tcp = (struct libnet_tcp_hdr *)(data + sizeof(struct libnet_ethernet_hdr)+sizeof(struct libnet_ipv4_hdr));
			printf("test : %x", *eth);	
				printf("Pcaket No .%i\n",++pktCnt);
				printf("Packet size : %d bytes\n",header.len);
				printf("Dst Mac : %012x\n",(eth->ma1));
				printf("Src Mac : %012x\n",eth->ma2);
				printf("Src IP : %s\n",inet_ntoa(ip->ip_src));	
				printf("Dst IP : %s\n",inet_ntoa(ip->ip_dst));	
				printf("Src port : %d\n",ntohs(tcp->th_sport));		
				printf("Dst Port : %d\n",ntohs(tcp->th_dport));		
				printf("Win Size : %d\n",ntohs(tcp->th_win));
				printf("Check Sum : %x\n",htons(tcp->th_sum));
					
			}

                return 1;
        }

