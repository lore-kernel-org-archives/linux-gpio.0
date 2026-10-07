Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8FC48E0E3;
	Wed,  7 Oct 2026 10:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370124; cv=fail; b=De3yWjrFMfKsvAvIrvMC46Sc/CEajz9mOTl/RXS8XCiKDdC56+AQgPIDo/Zu8AZm08l0u+zf2t8M4il+V/Jkha7gnCAj7CBQuXM/m76cL2Ykw+PkLGmRn+R6csKrUKKzURwSMw0B0RsuzjTg861QUoVzhDPvu8SrJct0cXEp35Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370124; c=relaxed/simple;
	bh=mQjRL9F7+MlLyR9JRkAYbk4vofYqFN2AHsUZqaZe4cE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gb45Zz4Tq7bHYXmeUqM6WqzLLc8JiUqDaG6U0nHI3X7V5bCYNkpqlRVMi5+KUnA0Br7LJqABSRYez8dCZxexYecQ+gE+Yog+85JqmaPLvNTkMJ84SF2WMXgG0Q/OFINiSqYgRAkPDuzQbuapnyDPeSWP9puK7f51I5FXrLxM2LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RUxM9zJH; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RUxM9zJH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzjV1VZVyVEyPheorZYloOkluuRbwJIyeDNK8PjNquIrW+XACi+waX5t0ny60gMJurKoes6wuwv2EpjzVGKvweGbwqmO87sslUTdZsXoNDoX12Axl2qJKwsApM9axntoqzgpDuuNHFpZuSzetbqi600v/C7nhJxhlKcteQxIBqy6W7hvS9kJ4FU8QqeM4ycfqN+/73U6meYnWm6NfNqTZJbzAtnvC7Y+6xTA4UZb8g3Tv7Fr8gBgXTssw6/8ENyMTw9AksV4lS1mgpraSiI349Gg7qReZ1MMKa7yIqeKZyuNgkY5aVtFJDok2YpNA8ge1GmyqM/PgJZeEaY5vPnhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=Kqy982mkCFpAGVgbLr9BkY9lgVlyokmxEZ8MbUMukTA5WdPDkL+ffDyz0UNqDpY+lOLdZu+WzE/R1fzvjQP+8W8cL9FPqI/IvWIbFejR15BiGaUDmzA2LZ7BRk/iGyYA3Zg32wi62Py0IXwKxs92ivf0HdTdfNuQLdqxyjd5InfqnVa7i1GTt5kI+wZYiSExSeAp5lM9ncTks+4lPypL+YRaohHEyHG2RmUkUEoGK1F4nggFf2LQnZgWaCt+QDoEnCIItIlMHhbOcvdpRH7S56vt+0YiOIeEO/M1+8/nx2NuFsJqKlODkS0FH9PJjff52uc6GPYIIvh1dbZN/LPvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=RUxM9zJHohk/ihYge057NIVxKnnTPBQ7sObzqNSHN7G+pWDadd64shjsQcY247RwJw7U1UMHN+eLaTLA6YywxvKFyBnS1+TQ89KDcvdQqiu5IvNwrkExuehNC4rPDcr7DWChsJbalpfzsy9SfxjE2SlViNTbACItDJPuF8GoorHwY+Xq80L1cVtWr7kytwQO/mqDJEdNLd/+ZROfUeIQNMtrn1wZAy4x+R1p4hfTKBX3M+dJW00tdBe7QYycftGBzsrHeVLS/xaXQ6WGBBioUIbgOvTWdnBMF8Un+zTgm4UB5Uo8bY8NRZoiYyO4klAxp+AF1SE5PiFEkfDJVXtdgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI1PR04MB10028.eurprd04.prod.outlook.com (2603:10a6:800:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 10:47:10 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:16 +0800
Subject: [PATCH v4 01/10] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-1-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI1PR04MB10028:EE_
X-MS-Office365-Filtering-Correlation-Id: fe890754-1986-408f-f848-08df246056e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|7416014|11063799006|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/0w5X3IWxnrxBbzdD6MuLieJWwLCHw0CCj4mwY6lAS3j6HRdXl9hI+N8rbCzM/j4bbGwKDq46k8je3j/hAweEpQ8k05o9C4eEpzjbWtXgOKtk910ppCMbT1RnTeZ3HcWgoeRw3sXD71U8HicXJx/FVWZtemEUoRGXoYzxyhMXGb3GiSn+rOfMaI+jO2S9Ecb4oWFdfXcM9WqQO/jSfvQMSAj7szPO1iwG+kQrNPoUQdiuc4SvxbAYHzcr2tETsXYPcG8eKrNcYUXuFemLQgNSA8F4SJrH0slx4ZZ4npKCzUS5n/wWqLPNDtp/cbEdkmVKfVw9FLeCXRQFXtxohYEZFDxTD40/EiDYyaky7/4HsvkuC5pKMrekgi3Rk3ESkZnFIOXRfL9tZ+BNxojGZNZjCPsU8sJx+iwI9oyDwaXU7hufW3NR0Roinn1JAyPJPwKJ6Lb+sBKFWnTHqGXIupePu61vHDTQpGrZfMtX0PhVo9CkBHW8RhlQzKKEDCh9UTf+F7RO1uT4IyufczKbEyjX9QSHBU8dDsGTsiRUMNj4QjQqd5dfBgJgQoPIXQdCdpFa7VZOgBoqU7DLZW9FDPSxbjZKib/phwcGsVyLPU4gyj3NL4TZARz62DVBjn7ivGmgih/mtArLMQbIZcAIRgZ+9BO/jhuk60g4rfvwqCAbw8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(7416014)(11063799006)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3pMREVabzFxR2VnMXlKVW1Wc09pdzYwMW5Nd1ZrOEkySGc3LzlWR3EyTlFQ?=
 =?utf-8?B?L1lDdWYxeExiTVVucVFHei9nc0ZDc1VEMng4Q0RwQVhjejhWY29uQ2Rpcm1E?=
 =?utf-8?B?blNoTDdjdk95SjRWL3FrSGt6aTYvMklScXU1eWl1MXUxc2t5amtyVjJ0TDRt?=
 =?utf-8?B?dFF6SW9xTUN2ZXdzcWJhSGErQXd3WFZ4ajZmcnFSMlZ5d1FHWDVobVAzL3Zu?=
 =?utf-8?B?bjN2YUx0N2ZmQ2M0RldhaVRtZFpzckxReGVzTmx2SW1TRFhzbUFhUkNEOVJU?=
 =?utf-8?B?SlY0VHBscnZkcFhJMFlYVzZuQXJScXRUWnpJOGFQQ3VNcGdrakMyL21tSXVn?=
 =?utf-8?B?aWo0QlNZUkVaTFEvcE5OVWV6WnI3eUxJYTY0YXk3RVZDVGpiZHZNbEdPeEt2?=
 =?utf-8?B?ZnFtOUpER2pwVjhiV2V3SHQ2WXVLNDBIdElXcjZqWGRaUnNOU0NyL0x0QUEy?=
 =?utf-8?B?THRHd3A4L0NINVBodXlVZkVXcStCU0pBOC9lem1LTUltamJoMGFLSXBGWldE?=
 =?utf-8?B?KzRUMzdDWDg0aWFkN2hDcHNtSGVwWWZjNTk0UFFTRS96M3BPMTlKWW9yOGY5?=
 =?utf-8?B?eGs5QU51UVZRVSsrL2hmaGNaRy9SQXRQeGN0R0VsTnU5ckhFTWQ3Y3ZCQVNZ?=
 =?utf-8?B?S3lvT24vVk9JQ2dRR0RtbnZLMW0xODA3dE5GL3hoK3hGaWk0TGN2elUrNjcw?=
 =?utf-8?B?VnFQMDUxdG5TTzI4aTFZMmNjWEJFSk1OSllSRExaWS96NEhjbHVZVm00MTd2?=
 =?utf-8?B?ME9pYjNsOGJJQmR1SzVTZXBIbWxGS1R0NnlmWXBQYkJPUXZtSW9MTEJYWE1U?=
 =?utf-8?B?R2NONnRwZFdwU09pRWRFcTNXNGpYbnE2UitzODF1a0E3MENicWtxME82MkRs?=
 =?utf-8?B?b1JMRjVya3NpTHQzdER0c2lZSG9KTVJsbEV3Y3l2YVJQR2VNUDB0aUNDd0s3?=
 =?utf-8?B?MWRtM0I0ZTN1Q0JRdzllQU5RL29nZEx1anErbVo3R0UrTkllNDNTQ1I1KzRZ?=
 =?utf-8?B?alpuVGFZN0hoYkdlSkszZGlmVytXTXlVRE12S3l2QUtnRE1GU1BmMTJNK2VX?=
 =?utf-8?B?eVRnNHB4NGw4aFh2c1FPK0JZdXZCWTRuREFib0ZUYXJOcjdHK3EyaWtYdC9s?=
 =?utf-8?B?dDQyWUc1WnVQQUI5d2tGdjZmMnBhR3dtNGs1T0w0WDkza2FNMENSU3hTZ1lo?=
 =?utf-8?B?U0RuNXJKNkFvVUQyZk02MkhqaWlWa0hiWGRCelcxSktpOEtyRDhWWUVQMU0x?=
 =?utf-8?B?ck1VNGppeDdUVnE1SzQrb2xQK0s2dExBMExQYjZ4T2haU2FkVFdndlNuNzdz?=
 =?utf-8?B?Yk5Vc3dkWTVYQnNqUjNlNHArYldvQ2NtZGJkUTFvK0ZlWXJ4VGR3SDFEQWFy?=
 =?utf-8?B?OUtMMlB5a1ZQenBtd2R4R00wQ2xlVmI5UEp5c1NYTjZ4ak8zc01wdnIwSHBi?=
 =?utf-8?B?bE5vTUxCdUIyak1wZUV4bW9aS0trUG9jY0VFU1dTMExYWWlENWJOYmlhTldF?=
 =?utf-8?B?R0tqakFMSlh4SG5IMDJYcHlyODZPaGtsMnZoVUJMUlpsc0lkbkQydVdjV1BM?=
 =?utf-8?B?RXI4emJ1dk1RaTNKcmxkMHg4MHRDWm1TY3JUZWlibjJVbC8ramQxeFVqaHI1?=
 =?utf-8?B?YWl6Wmhub0tGVVIzYlp3c1lPMGlhZkJpaTkyenNlc3hNNHRhK0V6ZUJZcmgz?=
 =?utf-8?B?aHRJK3FPc2QvUDAyS244N3k5bm5Va3NzNE1IYWVVelVjL1pmRG8rbWFXM3hP?=
 =?utf-8?B?NlB1bUpnQ1p2ajg0NXQxUTVzbEo1NTFKcjB6TUhqeS9hRldVQit4Y3lWRm44?=
 =?utf-8?B?d2ZTSFNUdjB5QmRwR0xocnptdXJYMkx4ZHp6aGlVeE5mci9KMkRYRUxZOU9Q?=
 =?utf-8?B?eE5yWnRNUkVrbE82NDBOUjNjVVJRSVVrc1RUeExhV2llaHd5T0dYQkxUckZX?=
 =?utf-8?B?alBwY2hiRnpyUzhhSFd5L0JON0NiWUVtckF1TldZeHR6Z2dYU3g1NzFLY2hz?=
 =?utf-8?B?U2NaMHVZTmxRS2hGdTlyLzdJOEgvOEMwUTh2NlhGV0JVRGZYRVk2NWJ3dVBr?=
 =?utf-8?B?WHUzbzBCVWNmZGF1cWNjUGc1K21peEtkbzRWTERJVms3eG94YVJQVThXdlpQ?=
 =?utf-8?B?emxrSkxHV3ZYbm95cjhoUjRjaW1uQml0eXJFdjRhbWtKRDRucFRtVkZaM0I1?=
 =?utf-8?B?ZHZVTGVCT0tGSE00VjhJOFQ3SFF2Mmx1d2FaMUR4VlprcjdReVhjVUNyZTJK?=
 =?utf-8?B?UWhIbDcweVhsWnozN3NJdkhOdEptcnFONzVSdU5Ramhja3VyeG9RWDFKMTQ2?=
 =?utf-8?B?Sk9sd0pUdEg4TWg1RG1FdmhxTmRJRkpCOHhYZndDZlNieUt5ZGZsVkxyaGhD?=
 =?utf-8?Q?LntvymIQC077HMYWiVNEcEJvPtyXldTGlkL48?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe890754-1986-408f-f848-08df246056e6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:10.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +59l2LUogHroQy8+R10pmt5kFMunQQjJXJy7HwdWt2UL+Mz566a5CBUpI2vrwIBOHDLCYMtgbD1MtlgPi5e+hECVc8albA1YKFYhRWbL6e0vCSMZYUfIQKc5EoVSdZqT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10028

From: Peng Fan <peng.fan@nxp.com>

mxc_update_irq_chained_handler() is called before the IRQ domain, the
generic IRQ chip, and the port list entry are set up. If an interrupt
arrives in that window:

 - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
   port->domain still NULL.
 - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
   been added to the list yet.

Additionally, if any of the subsequent probe steps
(gpio_generic_chip_init(), devm_gpiochip_add_data(),
irq_domain_create_legacy(), or mxc_gpio_init_gc()) fail, the error
paths never unregister the chained handler, leaving a dangling handler
that points at freed memory.

Move the handler installation after all its dependencies are ready and
after list_add_tail(), so the handler is never live while the data
structures it touches are incomplete, and is never installed if probe
fails.

Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7e2690d92df6..e05f276a50e8 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -474,8 +474,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
-	mxc_update_irq_chained_handler(port, true);
-
 	config.dev = &pdev->dev;
 	config.sz = 4;
 	config.dat = port->base + GPIO_PSR;
@@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
+	mxc_update_irq_chained_handler(port, true);
+
 	platform_set_drvdata(pdev, port);
 	pm_runtime_put_autosuspend(&pdev->dev);
 

-- 
2.51.0

