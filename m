Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60848641C;
	Tue, 13 Oct 2026 06:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871438; cv=fail; b=OcgUdCDA4tpkCmrQCbgPfF7Tl+RFoyFzb6+dP79G4rng98pO5Q11yEJNAIBWTUhtaZmp/Wu7gCx/FBeRQdSBgDpL8LO7x2OHm8Lae16/XfcwxQ1wZ2Gjkq/CJ4su//o2jz1ns8NtoncTXuV794P13ksm1q9yOkYOEB6eDXcLLZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871438; c=relaxed/simple;
	bh=C3BIh9NUo13YY8YkUh9aZDMdvk5UvTlHig6YXgBDeZI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PBApAEciKHz274IusloJRkMQmP3dnQEbq+jrP2NHvACS4NOU0AdDLPDKsGgxl4bGG6As0rLwwgvFtJCOebZcm+MjMocMwM3m0voDTgSUCbgnpzc1O6VKBnnuvLSxksMDQgGey013SKniLRcy2haB2wdNU8YCmRHZIqKUCJHGqT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mOR6GROh; arc=fail smtp.client-ip=52.101.84.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mOR6GROh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/qKDBWdd4FvkWX4I9M5xIfrw3FQbee3j43/pthsPjG7o++20nMzrXtCam+VQviqmhcz1/FH7kKbCa2Aa+lw4fvddSCYQ030ESdeaTAeM8KaBSLgzoxwUOuRc6YhaIokT9zfSQNOvQWcNLXkrkHj9J/5LtMdqpsqCgRSHnWe5DQKydvDOLN0ffWlmZcPzSRHJMvHa3Row1XqSTv6xZladi5vIewR3gXZrO1AvSBDkQK5bbZz3xbbU5eh/6B6UWbD2FIsvqIeae6BKAjT0LeqOMJJb814BwEuENDfO4mIf8Pl5QPd5w8hogJ72O3mwlq9tSz4kNRCQKPERAGsOuSCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn6Z2tEpiixfSud4+mHjQArCwyr2AvInnPP/lKF5bTU=;
 b=XnRz6V32y515Ntelp+bKYRm3ClbYgyT80xirv4mMsfskbfgJK9NU3GGzJQFFRZIzTgNLqs/GI6Avcm+GbJmk/G7Ce8S1YbF6vBmRT5YkJRwBBrGqkx9SX7toOa6ZFoZDor9jz25Ge7JwfnWNLiLOeorwWcc5aHYGmGUS3mjYG/XThyZ+12njXv49MlpH91IQ0v7So2K8SnaFWRGTtmDeGdHaIYQum8ZORELPiVCfZQP4VdH5z+iv1mNEBTGCAJtrgEEgDV0p0AEZUCE28my73FbsUcUnTtGzg8catpGCEW4lS45u+Xs9JPYCk4Cz4LA5hwiTmfgFHT3ScLPWVRQGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn6Z2tEpiixfSud4+mHjQArCwyr2AvInnPP/lKF5bTU=;
 b=mOR6GROhuLv7mxtSzUdIcw70LCoVaPs3Ae7cV58U/ZS0m9Zng5lJVAP+9mIjriVuJT+Qf7FOVbF9OLwAm3Y0RKLMWSbTAtjY9dpbWdIyRpFSjkRJothYDRsPQa0CXbIdKCdh+yqsQGYWt/A0vf4QggoX9jYPZ94zuPMZm/h3r7xGmzCsuvPd+JJCYqO3nEezxVlc1xB9/BhjJc6TRIezCxw+moUvD2hppo4D3L8DQ6eeBp+TEzYARtdcVaPPzcAKVIRNFYp0g9u94V2cufQ2Ns98MF6qnL4LXzxp/xEEKkTZ4BjAcIG3gj7S0X08JQaeyYTJMWysQgPBAy8FlVO2TQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8470.eurprd04.prod.outlook.com (2603:10a6:20b:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 06:03:53 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 06:03:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 13 Oct 2026 14:01:09 +0800
Subject: [PATCH v7 1/4] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-mxc-cleanup-v7-1-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
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
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec57819-1a2f-48ec-464e-08df28efc293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|10067099003|22082099003|56012099006|11063799006|18002099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info:
	UeO7QkqlXaPYwcw+uf2UpG4qAgzYBEzx/0Dhc0+/MZ4KRLsb662/Wq1cvlmOhKLd/nq1ozasVwHXAo7UPL0HR46WPfk7+Ymku9i3COuDXBr2/MOq1hnIbAz4RgC7mh3RXIFQFb3OzwyApcVBlm6Gm/aTisARqeGu3Trf6WZ5uFHkinYTRaaN3OXhWH+dJiq8cA+MPMYxsxISO1o/KjwpEK3BsdhMZ7D2mmt023LnIunMCO1xlEeFsqwMYNLQsjEQLhARte+xBuPXnuINB6eVRD4sYgMPWTeG7gwSx91SxS0xPoscXcGGOUZucxnHONvmGjvPdh2BRSshPBfAGIWIhlQfGbxKvSc6vNHl4hIVsDKurqBsYZOOJuCFvDItXY1j+cFxyNFRu/excSdAuPSpUR62nhKbeHV6RKRppshZQIPAqZOgWtRAyoh46shMAcNIsctxUuFLfDUPBqNJx1qC84vB7WWMflm8Iippysbc1jAbYj8naSMAy52vUZvHcWXidQdS13XnP/JzyaQIbd4xgT4IqjEY991bU1ZWUMtVQSsVktVvks+CHk08KDKNXELryP1O5EMobcecJY4ODBf6aVPkKsPsm4GL8QqRoBYPjGJJaVqgTCrL03R30R2DEPqgpSWtL6D1IK0pM50EFBylofzu0AMRnLWU6D6FKdSeols=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHhxV2wrK3c1eDB0VXVlU2JxQWZGQ0NvQjY1ZnJqTFJzNzBXZjFUK3pkbU9C?=
 =?utf-8?B?bUU3SGc4YVp5QmhVMlJGOXoybHpXNmQ0YlVEYWJPQkJJVUpqVjNKN3dCbU5N?=
 =?utf-8?B?NWtHaWdLZlJOOTI4Syt2aEd0VXB4SmFDbmlhUVFnMjNtclM4Z2wzS0REd1BS?=
 =?utf-8?B?UWM4VFo3ZWYvNFI1cVo5ZWdJSW54a214b2tWMUprMmJFTnA0TS9mQXJQbHNV?=
 =?utf-8?B?Wm9NTys5dEFRQmFqd25DaVBtMk1WbXZGc3dZMkZUVHQyQXFzRlo1V1Y2cEp5?=
 =?utf-8?B?bXhEdjA2MWJiUy9WQ1R3ekM3bFZnS2ZkcnBmeVAremI2bDdZVlVWMGhPajJ6?=
 =?utf-8?B?aDlrd3ZIV3BPS09kTDFKYzVtUEdnNkhvK3Fib3lXWndCbmMxb1JZVHJvakVU?=
 =?utf-8?B?ZzNvVDZWei9rSUdIUm1oVHphaUg2QXllTFFjWm53bjNyK01sWU90MkR1ZTRT?=
 =?utf-8?B?K2pLcmVNdVJJNitMbFQ0azhvU2daNzQxZnFtZVZleDBsZFlIVk4yV2hLQnY3?=
 =?utf-8?B?V1o4c1kwUXRIZ0ZpVXZzSjVKL2VlRUs4L3hFcTllU2dJR3dlTFdnMkpwejN4?=
 =?utf-8?B?bDJ0dThuTHltd3oxOW1WMUNIZVNZSGJocXE0b2F2UXBESklhdzY3UTUyaTRT?=
 =?utf-8?B?RFQ1aW90cW9HNDdUUnR1eGZiMUhvYWh6b1RpTXVhQUdFY0Q5OUJWUktiOWtk?=
 =?utf-8?B?SXBlbUhGejMzUkpNYmZDU3ozNGRCcmduN2ovbHBYd2xEVHEvdkRtNzRYUWs5?=
 =?utf-8?B?c01VVCswSTRGTk9hTVBKM3J6RDcxaFRMNkw4Vlh0YWVMVjlRVEFONmNKWXhQ?=
 =?utf-8?B?SnF2ZkJSR2hnamxSbTNYVkM0Y0RVa3B5WU0xQzRGL0w1Q24zY3FPMGMyNktr?=
 =?utf-8?B?a1liZTNVa3I5V0Q4OFdsZzloVE9mM2NCcnV2RmhTZDZzZmI3WjdjdlFJZFJQ?=
 =?utf-8?B?ZGwvSlRKR2FDUGdEOXR2QW9RTnc4VGlhUlF0WEZ0RG9EbHNBNkNmRG5Ra0dG?=
 =?utf-8?B?eUpGMVFmOTVBeS9UQkdWV1c2bmI3V3dGaXFuelFwNWdYODB5eDYrM2gwQ3Ji?=
 =?utf-8?B?cFc3RDZkaU1UZHEwc2wwd3JZVGhzK0UzRVd3SmlnRGZNMHFCMS9JSXJjZ0NJ?=
 =?utf-8?B?NWxoaUsyU0VlV2VWY0RVSFBWRzg2TUpSSTJOZ2FRWVp5V3pSL092Y01KVDA2?=
 =?utf-8?B?UmdRb2tXSDZXaEJ1bDZyTERWVDdBUXRzNjZsVzl0NzZHSS9GcVJyN0NlZXdt?=
 =?utf-8?B?bDlra24yeEh4T2o5czRMQmNBbVEvemUwRVd5d2lOY0ducGpFbmZYNjIyWEtD?=
 =?utf-8?B?QnpYN05rUElTMWtFbnc3S1VvWWUvaTBldXFuN3prZ3VCZGxBY1doWWdDbkVu?=
 =?utf-8?B?MzI4cnB3Q2l5Y21GSGFyam8rVkVxMzEwVHR4SmlYeXRmWWtCVlRtdmpQUDNU?=
 =?utf-8?B?ZlhLYWlWNndYOXQ1UFFjQ1NQNzJNQVRjSExHVnJuVkloZUl6OTM1YmxXTXU4?=
 =?utf-8?B?bXFpM2g1Zlo0K2I1anMyNG9ZdURFTStlZUJtam9TM3FhSXE3SjVIMDlYZ1E3?=
 =?utf-8?B?YzJSUFhEMi9OdG9BVTlZWlFpWklObmhSSmlOTHBvb2ZwQi9rWi9LSEZLajRU?=
 =?utf-8?B?ZSs0UmYxNXpOVDRSV2JFYnZrRFV0VGk1V1gwamFub1l4Z29Ca0k5TlhaY25v?=
 =?utf-8?B?d1NNM2VxZFF3azhMOTFXZG9jajZpaFNIWjdQZU1ZWWJRUkNhMm0wWC9qMkxO?=
 =?utf-8?B?TmRRdXFiNXF1dGhHbGpZMEt6c3JNTERrK1NhaE1MQW1obmNzd3NwNlpRdWFh?=
 =?utf-8?B?SE5nMjdlbVF2NzhScHpXaW5yai8zUzUvY0wyYy9jRFV4YUNIcG9ibVFZRVZP?=
 =?utf-8?B?alhaK1A1TDh1OFl0c2dnNVA4MG82NnQydU1SRE01ekluV1ZvZzl0MW5nMjVE?=
 =?utf-8?B?UklCVU5MZEpHYWg1V3d3SGl0SDhHTG9DRTIrNTB2MklhL1ZjRXBDV3c0bHdP?=
 =?utf-8?B?QXB6S0JwNkFLbHR0TmIwVmhpN1JKczREcVpHK2k4cmMyYmZKa1AxTVY1N3Nh?=
 =?utf-8?B?MVQrOW9samtUb2I3YzgwSjl3WXFRMGNraDhLRkNIY29lZW5WSEg2S3U3VHY4?=
 =?utf-8?B?dVF4MnNUZVdqNEJTQ3UzOVZCOWNnNld2cnFsMS9lMjhsSEc2cjlSbXNPR0VR?=
 =?utf-8?B?enBuMXlaWi9Nd09RZDAzYy84YS9YVGZ0dXRHaEg0M3R1WWVKRk5GQURVTWRH?=
 =?utf-8?B?RXlRVklvQ09HcWNkTWVkKzRKcHlDN20wblJ5Z3kzQng2U29pT1Rlb2NXS1hq?=
 =?utf-8?B?aHd5bWJieXY2VzZFUk41RHI1ODlxeGlWMGxxZjEvajNpWUlhUXpOODdnbmN3?=
 =?utf-8?Q?Cz4C+2bNuka/15Bl9H3pgyBtf56a0ud21eI7k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec57819-1a2f-48ec-464e-08df28efc293
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:03:53.8056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WvwI688+urAfzDsYMdb43QWbYIYfr0WSLXA8KJAfhEQfKClhBmbw+ipXfXY1qrb0m0qviKsPXGf0EDKOX28U7XV0h+lTxcVIpjmaPP3SloWnRLooXjY8jdSprtXZG+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8470

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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

