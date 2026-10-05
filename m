Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C14A385E;
	Mon,  5 Oct 2026 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210266; cv=fail; b=pe10AqXHqoj4t4I3C20VEt7EdFbGyS2y1+TnYtrwDxQ0GVXpa89BP+d46h4tzPgrn5zpLX4I6/R0ZjTsdvt/E/yjyDCVOOXFqsAWW97CidM+o3sYONjY5co4fe/E9/poaHWZazC3dOUnXtUuxJWLumbN4yjsKS0KvMsy3S/rehI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210266; c=relaxed/simple;
	bh=mQjRL9F7+MlLyR9JRkAYbk4vofYqFN2AHsUZqaZe4cE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MaKEFfv4e58c1kufR/zLyd0iOghyJNMC70FHu+EzTRIBs3nMKLOpwuYgdhsDzUwYCUSPQcEvK3gVmQIjlWTq7s3ooOQwTLvT+TfYLtQsWdjCGHd3p72bgkECDQMOFdZciMXngicNzTAXOteph9122jhgBKnoNzj4//o1D8A6704=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HWqFYezQ; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HWqFYezQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9RTGsu9B0Ovch2Qlz1BK6PAnIFCXIfuV7PlTQ0nSSy2NqJEEhEl+8zAJz5MjcfpzHvqZcXgBxKh8CVrOswVcaiqYnpPdG5rTZRL9b6TyufnPh6kEL8VR42gnZ/1sbDRe3eWvCGH6o37HH0InyPetL62h7kGSl0Si4Ow73CcrSDWa3aVgEdYuKHUvvrSrjpeIhWOKBmZVh2EkohgW7qga64V7ioXbIEs6B2UgREJMaHcTaedNs+pL/V57PSDlRICoLQve+UdVVIoH4/6Bj3tf3+gHPyu5Ekkzh7jJJ56SuyQat2TblFT3HkoBzCWpSE4yiE+QNMl4+CUpUTqxA6Scg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=Wtl1UxVhqAG4Ka4ayeZY4Jl5HmjCnnzh5STYrbV3yXn5zktfJ+lT5S31cVLlHZgRxgjbfpq94J4ea/GaJpwXpl9e2T/S6nGqBRQhTugRw/riRMC7qXSEuD+n+LRDi/zn3ceMmYcGYwCFiQGLpqjvv3bMXHROfOt4UiNARJjfJZA60KdnkYJpp7OYf49GEV8yvRG79WOUC047lnd4BqATmVjkr39tq2pwGIvsFb4L6RQdNaC3zn1J9jpoDcTsd922pKvMDEJ6kR5WFDUfzO47dGZM50Jlyvqc9z5cAeoiF8hRQzaNy/ZHCzZ7zx3X8GiPavNIZz2+sx/D/sbm9aFC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=HWqFYezQhwVPRNPk46VEBKZfFjlko4R23ZFHY0kka8ZUOp6oDel9VOhvwsoKpZZwGWu+BK5F9UABJ9JOI4y/I771XkwK9mig9FzJ6bbwsVy5y4I+M17rfKAl8RmBIieiEHPP5JUyFITyAxFLj0iThezTifVx1iHJxbXFbsU0CGEAG2ns2UoKuDcW04YIDoJMgqntDofLsaKFg/RIuFl5vuu4TD2ikyB28PQqpX4a6XsZNZPpbH7mGITrVNYGk8v5TWig0KF9L+stO2wl/lI/JeTQ/njSUeQ60K6m2F8PWM16U6OC4b9Op9qWCV76la6ebX5GXVrkBjNmC3FHKbEy5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:24:10 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:24:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Oct 2026 22:21:22 +0800
Subject: [PATCH v2 1/9] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gpio-mxc-cleanup-v2-1-bdc3afbb35e2@nxp.com>
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
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
X-ClientProxiedBy: SG2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:4:188::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7a829d-a5ad-4e11-2e56-08df22ec5269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UICii0u7Twd54Hhb6d1IZH5V+L5GjeAnTGr0mtzRIEwrrdfAIoY0jeVTf3xqrzBUKRNA5aYJqDerPdswqf/FCiZG+c+UyKWRxGuJ9az0AeIdJVcZLUXn99nTgiNQuhVA9I0hfFxdRR/NqtmUcLGXaOdWc+4dESa2xf78l+eujawg00UAl87lM/X6iagm7G/4YMNxF6BUKdS6lkD4q08va/sMQnE35ceV/uV5IocJlGWW3pjinpGajRTi6DHHIyitIe87mYXiGUwQHkw+6zED/UYovpo9yBDWCUvD2i0y0wsvg7g4YJXX+u+5Nuv4zwekRXeau7Z3djjPqvBhJMt4tl8O8xkzALA5hZt7Xv2Qbyz6OOhbquTeYQGLlHxZS9S5Rudlr29yckMoBxitbJHcu07Fw4fsXkoHVGP//RmUNklv8UqI6HYQOUbV6DHxQ2MzUA8rLXcjO3QH1U7ZtIrt+XhR1KajEWPqb+tSlqMmr00xZOt4tOUliQn8scWOKOrrhVmoT3FqBPPYBnH/B4xz9Kdjpe/dk/d8E2o3ryD4zGA/HBL7lhPflo44BGJY7BvEfdjbbEsyLoe7vIiZXttkxZHoFCz3Bawk97JoQhkijRkE+qWi2YcWZ5GDEuJPZENBdSsBwnMF9iQ/XMyd9jyL2qa21j1RJ4vARDGQdQYWpRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXFRNTBPd2xBRnlVS09nbDNWcGE3cFF0WjMzZUxzcWVaZTg1elRaUmlGK3VS?=
 =?utf-8?B?QVMxS1dRQ3dkcGJlWnhESG9uNzhJNk92UDM0dW9OVjZwUzZJUzNycmFUS2oy?=
 =?utf-8?B?M2o3YURWdlZlM3M1eHFsRjh1YlRyVFBuYmVDOHA4MUZWZ0c0Q3VUNDE2U1NW?=
 =?utf-8?B?V3RYdVBCcnV1MTY2dzgwNm1kTE95bjVwK3I4UkZQVi9CTEJ6M2RaZ2ZBRnlS?=
 =?utf-8?B?R0hwRE1pdzlpVVlVbnozZXpVLzFhVk80a05qWkNpVzcrMWg1WmJQVHNiR1NC?=
 =?utf-8?B?Y3RreHF3RzR5UmhjbmtGWlBUWnVYOWQvUFdxcHAxWFQ4dCsvOTFiVFpNTEJw?=
 =?utf-8?B?dllJa1YrdDlDdGJiYTQ4UmZZNDZVSllXVXhwQVFoWm9zemswU1I5RHgvTCtV?=
 =?utf-8?B?TXE2Y0JWTnc3NGNWL0Rpanl0ekFwSHV5dUl1R2xNcVNKeFJYSXFrdDRET1F1?=
 =?utf-8?B?OEJHRGFCWHRpL0RtTmVFTEV2ZkF5ZXF0WStMSmNYbm5PeFAreG1mb3VVR0Mz?=
 =?utf-8?B?SEphYXc4MWE4T3VSZm9ZRENuOGNJWkVYbG0vS25BNERWOHB4SnVpQWcvamFy?=
 =?utf-8?B?QVJ6aTI4UUk5dlhSc2MrUFRCUll5TlBEakp5a2UwU2F0Vm9NRnlGVi9NYWZH?=
 =?utf-8?B?K0JqdTZRWFNnWlRtZXI3RnJ0L0xzMkQ5OVhrSjJ0R29jTXpyL2NxYXRITjBM?=
 =?utf-8?B?TUZ0SmVoSlZUMXd1S21TUG1ROEx4bVZMbzBhdDg2RFlNWWtwVndLbTVGY3hT?=
 =?utf-8?B?dzhueFh4UUp5cXNXdWRYNTVwRzRPZEY2QWsrb3hJckNpN3JML2pINExXdlRK?=
 =?utf-8?B?OENHUkRNRHpmT3grSlY0L0F0b3p0RWZsSS95UTFHejZLcDJUOFB0V0dvL0ho?=
 =?utf-8?B?czBsWldYQyt1eVhITXpWNFpRQzlaT1ZFd0VJSnpwMisyVnc1bnFjUWZNbmlz?=
 =?utf-8?B?MmJEcWxLZ2ZRbHZFeHBtUWNHRXYvVytvNDU4Q1crRlZ2MTFhNTlZaTZYdlpm?=
 =?utf-8?B?TWp2K2tCUjlITXZmZGVNVllBTnhCa0VwYStiYzJTL3d1cnFCc2RiVlp5eGFh?=
 =?utf-8?B?R25mL3M0dDUvbDBzd2ZQUXBBL05kbWY5bDBTdzh6bDJHYnFJc3VQUURNMm1B?=
 =?utf-8?B?QTk5WkVSTW1LeU0yYlNIdE9nb3ZBNnVKNjFUYU1PcGIzOStQMGgwYUV1VldO?=
 =?utf-8?B?OVdNcTNtVWtBaDl5dEhiakc5Y3dOak1qaHNxL2RiYzF3K3NjK3kxeDZlUGwy?=
 =?utf-8?B?K0o0NzNPWU94UG5JeE41QTRSdlpubGFZMk9WeTVLVmgwTGRNcktCK1ljblpy?=
 =?utf-8?B?Z1AvcHd5ZCtNSjgrT0tQV1lxSVZKV3FVSmowK1J0ckwzYUZKVm93eGtaSUp4?=
 =?utf-8?B?SHdISlVUaFZSZm96WFBpTTRLaW9WRlBFZ0x6bVlhTXBkTnR6YjhxM01sRnhl?=
 =?utf-8?B?aEhtMFFVRFBhcTFLQWE4cVl3R0UwR3AyN2UzRFkrUVZwaUdqdEhGeFdadEd2?=
 =?utf-8?B?b0JlNDBNRVVJWU1RcFpBamFpSnhEYndIcVAzcEs4cmZwUjdPeFQ3MkRNdTh0?=
 =?utf-8?B?MC9mUHpoUUluSjVsbzQwRndqMytrZlBNZkNZUXZRcVl4K2hiQU5DaTBwc0xt?=
 =?utf-8?B?dW1BNUpjM2xva0d2Mzkyekp0aTFSK3FGbllpeVJRTHRVMjFud2hiZUxxcmcw?=
 =?utf-8?B?cjl4SGN3MzVaQ0taOStBSlB6ZVZlSWVqSTNMV0ZZdUMvLytOUklObkFaRnVB?=
 =?utf-8?B?akpqWFN6dkJxNUdBTFFWSDZsd3RBM01uQkNJZDZtb0xhN01kY2cxbE1UMFFm?=
 =?utf-8?B?Tjc1Y3k4Q2Qrc1d6WUlYSE11Y0VNMUVYZDBFaVRQVTFzRURtTm5rRWs2ZlZk?=
 =?utf-8?B?OWx1Sm9zUUhPNkJMdnQrbEhCZXJNcGtFTURVbkp3cGQxTkp6a2pBU0dGTnlp?=
 =?utf-8?B?V3BIenlwMDRZckVVU3BxaldDZ2w3WnNhaWVabXAyclowY2hueVhYWSs3Um1l?=
 =?utf-8?B?U3c0aVNNNHBocHlNbGc1VzZlZDVLcTFwWXNXM3pZUDBMOVdPbENyRmZMRTIz?=
 =?utf-8?B?NkQ3M1FKNGFDemRSMmJRQjJiUkdJQmkvd0tQOXRjWGlQMUZMU1FiYWJUSnJ4?=
 =?utf-8?B?N254VWRTbFdCYlZDZ1dEUnpkeUNJM3E2ai9JYVVLbFdNSVNjdzVxTHE3a3pv?=
 =?utf-8?B?aUhMTWtjdUdiVHVMemdFMzNWYTlCUGlqMzFaME04SkdjM1BpVkRxMmlTcVdB?=
 =?utf-8?B?TW0ydCtDMldzU3I3dlR0SjNUb29vREQ2RmF1cVV1cFBnOXNxdFRGK2dNcHRr?=
 =?utf-8?B?SjZUUlJhcXRrMVlrRHdtNkRNclE2UHpJaFE3Yk9zcFJLbWpBcHFiUGc4ZjlI?=
 =?utf-8?Q?33pCpe1xewSzBhWHv83SrcWrUqV+VEwHpPJww?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7a829d-a5ad-4e11-2e56-08df22ec5269
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:24:10.2709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4PmzWotPG6EAjIgYefPjHwhC5vl9yjlV/lB6I1OYrzjHjLJFyLblmJUx3uI9f8PTkL23LqWSwJ25D/qXhbFBEOh13qWsqvLdyfkUJHrOk7cgU+OUQZHlFXxiqJz+nyw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

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

