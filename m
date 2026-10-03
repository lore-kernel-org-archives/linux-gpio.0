Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A2C426408;
	Sat,  3 Oct 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029393; cv=fail; b=WYqCTVSGJUSBKhFXy7IBVUHpuCJr0oN39F8/c+2rgPbjKbBDN64acDGXwlAP96clo4lr8XEqxItjbT0fBQlVL/D7aMGc+wtlcE/Ev7QpOdXCpOri1vQF5LWXdcZbqwVxdL0mD0iOBp6nJBNNZwPyjvOJvaMGbIziCTR2I7W0OsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029393; c=relaxed/simple;
	bh=TNWeQSwZu4xy6e3Nt6hd5RQCohDayFHM6z1HcUr2Iyo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iV03WmAMPheD3hHU6Ri35mqdwaDpH9OQMcEv5X0LmutaKJqdIgjNaJJFifliyl2h6vbLF2zXkYa2Lu13ojOC++VORTvNgdU6KNCnod5WZ/PtN3ueMhVC/3pt+xuO6DEJdv5/wfoiIt3rUFCi7tvqr7qg8DYhZQZxlThX0kfI6aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D0ItJnXY; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D0ItJnXY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvVOdUBTgHTJaxwZdMdaZF5f+QGaNV11stsSOv4t8qK8Ys9vA/qErhGqLCIW37/gUPG1JGVdVkjwFFu6DGd/W++nI8mXcq3no5/beJfK4Qop+Wd7kB0LUd0RTwUS+PwtQ/VgfPaZxGTXLygD6kCu6XXX27To5xwMW6XHy7tQi/ECWB0/jzY9fEgg4VEXOofEHT741HQy+0ntl9OX6LA9jPTHHmB5H1RuOb2fTvrZazYrqBYCtIDPMla7cWXmc9+Ql/gYooJYgN4SFRt3FabFagFhyufcFx//JBfzvE7q1fTcNR3PkbnlrNrKUwvAYDMau69zcpf/xBCDbp0/QkC7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHSIp33bJe51Ar0V9RMu7PynSBLWqPAb6bBfIuNd4UM=;
 b=TM7IimckyCaa/0cE1pQohBKuo8gJz02wozpr7dcQrRZIMxw6x5QwKMtyiXtuVsULrDRZCbE6EPVti1niQKZuFWAOHjxzbYlwZg/wLqY9o2XbNdYRNVO1JGNt48RaB0ihuuWMHfdMNVyftlv2ZOHgWIRIh3Qb0vysrjKw1ja5TK/2gEyhBhh7zt6BfWRB1uphDjzJ5ZyJIT6XMNsAKAqPet46nNgKQcQhXej1Sjq/RCIwznBJzdTZWBGruhKmmMy05RXN7/1rzap7eiUCZYEDP4gWNu9VVcZOvXNleUsNWGnMNx6L+o/BD7bTkZmeedkBJUma+VX4FC+c8SYYrlgOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHSIp33bJe51Ar0V9RMu7PynSBLWqPAb6bBfIuNd4UM=;
 b=D0ItJnXYVrXZil2Ae9LFVBy/mqSRv5g/PyXFSP+SAjzt2KPELK9DiFXGiM3b333CD3Ofmi9YsWN3z5/vpK1k4L/nubzoyAARB7bueHXuTs/Zg3RvWyu+xRBMJNMCasBcSeyK69+Ekq4Biw2tDghizo/mftLqKeA1EPCOkqhT+pKyr4GtlO34aehu9U4VCSNeOWhmQkujy4wSuVscU/WlBTc+haBTp3BefJ0C2sVqdqm1KEYm3jvzCOLfX5UCbEVB0xWVj8FMtmCc35TWn8YMJAP9iK4R2cxAOZaIo1zJ39KUSMFyBNtjCU5As9ZexzxRpr3TtL2Vc2TZOCBdqqdANw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:09:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:09:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:46 +0800
Subject: [PATCH 4/9] gpio: mxc: use devm action for irq_domain cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0248.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 24319cb0-fd28-42f9-cf69-08df2147392e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	FA3tmD1dwTOX24Dz6linpXRaT1CynnRIRIs+jRFgkfpR7+3EOY96NIUrOMFeMHDFzoWj+MQWTtLsNQCqdwDPst1Q3BRqFDp/w4Ja/kp69sCaqZOvToSIGfvOjoHV4SzEFqNO7seBIwgtB5aQv/JB+EZCuGMwTQN7dSYDuCmL2+DYzg92eqlt8ni19OsI/5d4/D3VZxwsduldxOsDmCZ2I5Fd5x8aZ4RN4W84z7mAAox73ro37KWN+5sBStEs8bzGg2oriEJoc9luiV4x/nC8lWnddDcTxk0GX54A3IrF8X+q7cVHbLVM6+Q106jWL/0R5l2ouG+P+z21wmH0nPwhRQi0AYFx+cn0cUgKCpWswtAje47oFlrdcDbpBbOnBC5EYBdsN41/fr1LP92TwN2xhqUOig/k+OtOhS9Qj2xfUGEBmRAvyiTKq3jMm2b/2B2xCcBLYmH12XsmwKFGAMeB6FtSUukIdHjUaEodyUCFyCYvbzCPU8Qb4SapfJHDfDzLmDA39zo8tWMNCTtRvYc96osdNrVzESDvyYTy2QN+qjrX49EvXnISHVBbnIhDW4IZ01mw6u3xpPWDny/Nbxq02DlYERpEz2tIsJL2f9bvtSgczfFjpcOLRuJWgxv0ZHu4jPSr83s+jM2YCQwZjTZjm05jrYVVi+nnUyuvxnWiCvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXQ0YktOVmpQbktZa3FCeWJjV1RaUkwrcmRqTkhIUXd0NGVlOTlWSG1TRUhs?=
 =?utf-8?B?a0F4bXlmRW94eDlHK0dSMjNmSy82RmwveFhIYzlhaU9rbXg5OW5TNlZ5OTU0?=
 =?utf-8?B?bm92WktGMnJpTCs5OU84eUJodG9yTlUwYlF4czEvMnNEdk8wRXZZQmdyMEk4?=
 =?utf-8?B?b1BTMk5kODM0OUFBNlVzRlJQUjNzbE1ud005WVhxTTQrN1VIN25wZEhqYzF6?=
 =?utf-8?B?SEV4SkdNY3hacm5IOUl3OHpPbUFXaU9RODRMRjNTUVU5SVNVOEVCQnpiL3p0?=
 =?utf-8?B?Z0p4Y2k0VnUxZUpkR1lDNEFrQVV0UWp3ZXVMUHVwN0xIV3hnemJvS2NDUFd2?=
 =?utf-8?B?QnVYWnZoaVovLzloTkV6YUh5My90dkptQjFsUk5LSnpXUWo2OVJKYWNZdGZ5?=
 =?utf-8?B?TnJCUlNDL294TzIzOUt1QUxGZkNhR0xtanpuNTVJRkN6TzVLZ1dvcnlWSjZt?=
 =?utf-8?B?N3JXbEczbnJpWjBaY1YxNGVwYW8vU1ZiVEU4czBmNXAzTzBxbkwxSjdCQzdI?=
 =?utf-8?B?NCtPNjFtdjVqNTZqcW5VbTRIUTk1OWIwZmg5azJhRk9EbmNKNVBsZ1NpL1g2?=
 =?utf-8?B?MlBwMlpUVWpMOXArTUtLOEN3WWJMWW0wSjZMcEl4L0FMK1FNdzdmT3lxZFRY?=
 =?utf-8?B?NGRwU25OdTkvakFxakhFbDVRRlBzUmRWK1MrV04zTnVPcWpEOHhxSFBVdCsz?=
 =?utf-8?B?eDJtdnB2S2Z5RTN3OXRiWTdKazJ5eGdNemZJUXRWbm9kcW1PRWtPL1JaNDVC?=
 =?utf-8?B?VDl5Y0NsMjNKSUd2bnJKTnhvWThRVFRyTlpsaHBOMUFIVHdiUHZ5SUtNVnEz?=
 =?utf-8?B?cFVvd3ZoZjViaDdtMExsYWtLT0NyQzUrSmhpbmk2UVBIVzdCMVB6dVIwaTRz?=
 =?utf-8?B?K3FERDBkT2Nrc2RWNDVLOVorejZGUFgwck45R2tqdVg3bmplOENjdEVpSTZD?=
 =?utf-8?B?dDRXZzFSTnRLRmhlTmNTdE5pK01oRWsrbVZwN2gzcFBCaElURUhMKzQ0YnI4?=
 =?utf-8?B?TkYxM1hmZW1RSmFQNUJNMTYraCs2OUt1Z1RtNDhhZFF0Zi9ZOEtBMlltYUdw?=
 =?utf-8?B?RWVFdC9xbDA5TTN3ei9OTlBDdU56VlVFWmYxUzg2dlFMNDBHdHdNdXZJTXpV?=
 =?utf-8?B?R1RUNDYrWWI4N2JtRDNEdndMZkhFSVQ5bUhhaFZjVTlBcFM4ZS9RMzVWSlIz?=
 =?utf-8?B?QkZzaW92eEQzaVM3TVBiNWV1Z1A1M3kyOHNQWGE4bkhRVzRtVFVhZ2l3cENa?=
 =?utf-8?B?Uko2RVAyWHdoUlAwRWpDaW8vNG52Y2pYTER6TmU4ZWhmcnA0S09zT2J0VUJW?=
 =?utf-8?B?Y3ZEOHpMYVNtRGU5UkFVWkxZRnd6R0llQlJrMG9ycEFFTjEzSDkrU2t4dTVo?=
 =?utf-8?B?Tjc1SFRoNk9ORXJLRi9sem9DWXRSSlF1VHh3SERiWlBvTVY2LzFDbGFjSnJQ?=
 =?utf-8?B?eDQzVkNPKzZ0a3Z0K01LNkJ4SXllb2RtS2VTS1BPR1o1TlNUMWNmTmJkbkFa?=
 =?utf-8?B?V1dCRjdGK3dRYTJxblp6Z2Fsa3BQR2grVEg0T0ovcUpmUXZleHRHOU5hb1pr?=
 =?utf-8?B?M2JYQWhUaG5IRFNhdjBnK3dQb0FmNCtSTEtweWREZGtmWmlZOHBVM1hveE9U?=
 =?utf-8?B?WmRQczM0ZVRTcUpIbEV4aGlBSHFwOWxCTEk0ZUF3V29UMUIveC9FZDhNUUtk?=
 =?utf-8?B?MWhWU3kvVGE5Y3UyMUYwdzlKZFRnVG91N3ZkZlRTcFBjbFYrR3hDQVh0ZENF?=
 =?utf-8?B?RUJtTy90MTBaM0ZkZTJMd1owbWNXMllQc3A4ZFV4bVNzd044azBkWFJUbVE4?=
 =?utf-8?B?dEZOQ2k2eTE4K0dxcUFudVk0dTdkd1NBdE81RC9KM0RRK3VxY2IzV0p5TVZx?=
 =?utf-8?B?ZjFXT21mQVhacnYraGJJQnc5Q1hiUk9YNE00VG1ybEhZWlllZjVFQm0xckd1?=
 =?utf-8?B?QlhNbSswTnZsaTRBTHgzNWJ0SHFhMEptTFZwRUtxMS9IWml5VzE5RnB1bjdN?=
 =?utf-8?B?cDRuMUFyd2c4ZFZsd0x3NEx4bUptWkQ2dDNiYWZ2VUFGalYrUVByWU1UTmRD?=
 =?utf-8?B?OFNudUx6emJmM2ZITStKb1ZWSHdTaU1vcllPQlBxSGo0N25JbllqenovbERs?=
 =?utf-8?B?QnhRZXQ5dWdMRENBN2laaGw3ZHRlNFFGQVNZTGMvN2NmWVBnOUI5RW9tcmVj?=
 =?utf-8?B?dy9DKzJqanhzbHhOdm9TTWpxdG9EK3BJaFZ1Ris3T3hBeHoraEdTYnBrdDZT?=
 =?utf-8?B?Z3FlYnpkdUVFODVYRmFhQ0FhdlFibzREdVVsR2poekZ0S3hNbVViUzNVUXFD?=
 =?utf-8?B?c083R0h3cXNFZFdheXg5bUJ4RUpJcHhJY2ZHT0swdG85YjJPZnlXelBNS1Rz?=
 =?utf-8?Q?WEwAcHA9Vm5x5xznJB9kwSXT9zTqsK1Molv8d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24319cb0-fd28-42f9-cf69-08df2147392e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:09:49.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT5JNyYAxsSjf2FrcWmOywbUb83vjio2v/6BtgMFr/ZVZ8a/XeoLZI922QvFTzPw/4mNzFglZN6f7TQE7Rfj/P586GN6JTss2JyUYjRJPXEDlLPFnzcFRNtp0fNT1ikX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

From: Peng Fan <peng.fan@nxp.com>

Replace the manual irq_domain_remove() error path with
devm_add_action_or_reset(), so the IRQ domain is cleaned up
automatically on both probe failure to eliminate the
out_irqdomain_remove goto label.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1c27232f6a80..3c395c82d7d4 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -417,6 +417,13 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
 	}
 }
 
+static void mxc_gpio_irq_domain_remove(void *data)
+{
+	struct irq_domain *domain = data;
+
+	irq_domain_remove(domain);
+}
+
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
@@ -526,12 +533,16 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		goto out_bgio;
 	}
 
+	err = devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_remove, port->domain);
+	if (err)
+		goto out_bgio;
+
 	irq_domain_set_pm_device(port->domain, &pdev->dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		goto out_irqdomain_remove;
+		goto out_bgio;
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
@@ -542,8 +553,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_irqdomain_remove:
-	irq_domain_remove(port->domain);
 out_bgio:
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);

-- 
2.51.0

