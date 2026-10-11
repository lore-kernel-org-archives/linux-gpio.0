Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F42C4477F5;
	Sun, 11 Oct 2026 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719731; cv=fail; b=LTQPgz1Jas+f2VIp+koFQZ1Rl2Qptj9aMojsU0QGFa9DrB4TgrVtKNHDbji+o9oeeFmf+Yi9jRPa6gT5ZYDBmXoB67sibzD6hfsNjeE0unVpz/UzYnvUP+KcYmLdmspAF6K5q6MVp/qsix4jzem7VAkzH1q4Bj901Lo/AfQYOx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719731; c=relaxed/simple;
	bh=14JIEec55KB/U/52rn3zBUWoIJCr2IZg8ZM9BW9rH3A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=p9/OXNmIUchGgktx+Nfao1Pk/Ery3NAHqjs0rIevZsJa5CblscPqSvESP6hIDYuKE8P7PjmoK8PLlAYC6oZX7CINSy03zhV2yvDlvAiYzptlhmacp9d8VwvfnIWvrURxlgAIKhwsWGMQy7azneJA2W1MV6f7tN8TyWawEXIOzys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TOjBAS1V; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TOjBAS1V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhVDTPpoHXMn5i+FFMb7erdCkB+IOM2BH7uTkbdKW5TlRrHlkkse08SfW802vs8CpAf9dsL0LjO7A7wFlEiz40RhJvUNG5MuLoP2NMoXYe0aFMXcQObeiId8KRPtoWTKDP4HvG/uTQS/n5q0IMF09ImENrLrEnzQGkd06yvz+S0hXjXIZDx9lRH30mKcViAn0/rypE6Pgyf948OMk+Ze0uAQmZg1/8jipI+Z1OUxJEGSp6Yx+I01HgVN/Nbknzyb4J8x8cVt6VMZ5ElF2pxFApHuoo8o0sXVafcERHkCEpmSJfO7Ptu3SD0qXrfKDRkgQwCipEPaVgxXr2MmOgO8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKBzXjbuTLKRfdcW90d9ScGIJs1oDNnn359IhzQcG5g=;
 b=U+mIzqhU/GOPxY+Y7Pb7g55Ti7fl2hewOl22JJQFvhgO8HEzcxxPdg8qMaqo//oh5y0OoonfqLx8Ic5/lAL13/I61iXhNhB4A9qsSO3PI/YjgrlerWG6VdkgX435dWvesqlyOmBMYrYj50W62Ivslu6qcpsepXgxZlu9lOKYQMbMcpFgjcY7eq1Ed/PD7YJNdTN1rOVHsTAbtoNTRPTqfgcyc+5QM0fgcGNBUeEuYyBdfmlE60/rdTrRME1PUEzQ2jSJa9JrCOS/kRM6uHc9LJ5rghm0UjgLaBkJewGevCRpHh2vpMa7KuTtF6JbuMt96H70tYQYVWiG2ZUGkWofZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKBzXjbuTLKRfdcW90d9ScGIJs1oDNnn359IhzQcG5g=;
 b=TOjBAS1VKNldp59gip1MXikmtLqziCgIouxWIT5/UhxpgBLHt7X+GI+t+2wBhMLneWXYRUj+cnbj09wXdk1CHcqEoO3LP/IlXTmsE4v6yrLi1Zo2XU4jXAfiNuJYXvcSC6Kxh0INxZJxV+kyZfSawTFgiGjzeQ0LiKEVEGh0RAPuJtBLqa2HfQrceYSTDh+QasHrp56iM7R6EF3nNnkhHAL1teCKR2tSljhyh4vWWHf9yDOeVcXyRnZYVgtXigkZauTPBXGwJbyMSVULeD638IUVGPkXfm3RiA/r5+mbRXqBJ6xXlvdP/tzQVihrYJOpqCT/IZN1aJCWDDfKVzMtaQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:30 +0800
Subject: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: ae357588-7d99-4504-8a3b-08df278e73b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	D24MdauhH6Y6bZg7AEuTwRLJQlTYjB3TRJ5SpKIvyYUfaD/8NDYWpOpxxx7xLWe6zs+cFVV/GXevZ03bOZeCxr3asmckfmHczatt0IJv6X8BNNwfRFd7nK1n9iP449NK4NoXxf0Ya8RlgHxdPpcolGZJh0pAc2ducFqEYdXJaB/uUJvYh1oi0mjeb/2cpAUrIp7iGYwHEP7DrdtP5UDl7j7Wi8KLz9G1P2onSc/WlRASUL4XXKRn1mVbfhhi8oVRXGkygzA3rd8ieqqqya95L/Ug+SRW7N2detdrI3WNbea1Q85ET8r5U4IAvcB4BZ29EF/JM2G0rhoJSP7u6gdtHZvvlN1HWYKCbwCeAiDvfKkejARCI5x0zBaOHyXqTr3f87Zcn7Zss0GDbTmBTwBOx1WVEQDUo1ekUFOkq0ET+S/wmGZigOSTjD/Itgz6F8VdGoPzs5MP1oJJWjVi7ipRo/gB6sE0K/opwpjzRJvbvO6qAXdmlLWz7yLwqbegdhxf+oCuH8wcd3eUa9jEA5OhFwbF9fgb/nUot8YurlA+8X9mb2jL7vBtAQKD+PuleyNH0hwf+OUHGygGlR0fj+zUGZnPCE00BivqgpyVvKlKSBM8yCSR19tF3OBulH5Bqk6Y6lhjM+/SOI3yruDgjsxTcJHkNPQFojqxvqYrny89dDE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmRORGlId1h4NHJiWEo3cjBRWkJOVk1XdHRTbFU4NGh5Q3l5b3BQVkllWUhp?=
 =?utf-8?B?UzhDeVFKTmloamRUdG1SQ2tEVHVUanF5VzJENU1EY2FKeU1OM1B2elN5THk4?=
 =?utf-8?B?L0xRcENFYzF5bWp0cW5IenlHZXlsdlVHY3dSNTU0QWE1TXg3Tk1scUE2T0Vt?=
 =?utf-8?B?SzczRnFVSDlxR2tlQTZTK3NFOWZWMUlqd1ZNa2huSG1HWW16RVViN1Q2cmVl?=
 =?utf-8?B?NVpGM1k2ZEc5bGlqdGdFa0dVOXh1eU12VkVLVUNIZ2U3b0ZLbXQxNXc3RUZS?=
 =?utf-8?B?dFZkL3NYTllPMEJtbGJSZzFrVDRyd2E1QllpUUdVWS9hVnU2L0RrWTZ1Rmpq?=
 =?utf-8?B?R1loeUVOWDI4elEwdEp4akVSSkpHREZXYlVzdzI3U3RXV3lyUnBTS3VwcmFW?=
 =?utf-8?B?STdLdENsYmtTaHpEVTNEMmhaaHREcmZWcnRtTHoreXBlK2dtN3ZaKzdQZGtj?=
 =?utf-8?B?RVprdVBxYWxvQW1BRU91MVg2TkQxNitZazNxMm1qUmdZOGFsVEVpOUFnYVJG?=
 =?utf-8?B?czY4eWdhZlVOTkpDY0dkZk1YK0p4Rzl5TlpDUDVYbU1JNS9TakVBS0I4RTBK?=
 =?utf-8?B?UTZsUDduTkloSkhXUTNJWi9FZ0hHOHR6bVRVcEpMdTR6VzhpVzlPU3JSTVFp?=
 =?utf-8?B?SkVCckVPNlRaMzIrUHFRTUVkYlNaaWNablhLTDVRTFMwdVdqdzk4WURoVzBX?=
 =?utf-8?B?SWVwYnZxNEZZY01HdU5rbmt3LzhHaGhFazIzM0xEYmFEd2w1d2FKTnJ3blVU?=
 =?utf-8?B?Y1ZCeHgyZGxIN1I3MzArTGVOS0VqZ2czTWtxVFVkYkFCZFVQdnNEU2ErYjY0?=
 =?utf-8?B?b0RtWW1uMUNVUjhLWnVaaFVCTWhSVVFkdENrbGRtVGl3M01vcDdKcFV2V2dk?=
 =?utf-8?B?cm9tQUtiUk9XZ0Zrc3AwTnNOWkNnUHE0S0dJRURTYmp0WGtXN3JKYk5BQnEv?=
 =?utf-8?B?QXdLMFpWbEt1b2FHby9TSjcwR0k2OGsvOWRzVmt5ZkEvOTNYcFVXOVpLcWFT?=
 =?utf-8?B?TncrUnp3MXBZTVErUVNmRVRyM3dCL2FpSlJnaG5aUDBOSjVuRUdJaldKbE9I?=
 =?utf-8?B?TUJsZWpKcTdjOWM4cytFNTgxaXVCVkl2UE8xeDFpTDJydkZ4THd6RkFtQmdh?=
 =?utf-8?B?M0lvdmdIZ0IrMlY0ZDlBWkpnVVlJSWkvZlM2ZDdkeG5URkRsNE5hbm9iYTJV?=
 =?utf-8?B?NkYvaENibzM5bFIybjFWbnNxYmRBbVRyc2ZpS2o2N09lTjBQOVpEbEppeVJ6?=
 =?utf-8?B?OGpYblN1cUtkRERSWG13eTg0Nkt2NWo3eDEzWElJUVdTTjZCMTNXUG52NlhZ?=
 =?utf-8?B?SStTLy85K1M4dkZramZxUGlnMmZWL21ac0ZtYXVXTFk2TEU3OTBJTTdxTzJL?=
 =?utf-8?B?SW1pbk5PNTVWRnJFTWl2SE8rNCszT0FBaWoyZXpQRDdFYW5PZ1NJeXhBN01l?=
 =?utf-8?B?QlNFbHl0RDJhTFNWVXFiMTl0dHFuQ1dseXFuQ1hUYVRyaytibHJMclhQNi9m?=
 =?utf-8?B?ajVxeng5VnZkVy83c2ljTHFCSG9XU2h4bHZHMC82bmF1SmNFcFJ3eS8wam9w?=
 =?utf-8?B?bE80OFJuRTFlZzFPMjFiS3NJRFBzR2NGZnE1MTh2S1Uxd2RWVHAzSUxvOTZD?=
 =?utf-8?B?c3R4NHArZUFhK2VIZk1WRjJrSFFDWHV2Lzd5RXJiOTZ6N0lVeHVzZHRBK1BK?=
 =?utf-8?B?STlKSzAxa2F4UVVCbG5sY2ZmSlRiYTJBVEQxdlQ1UWh1OWowWnR5REI3dyt2?=
 =?utf-8?B?S2hIT3FLM2ZtTm9NTDlUT3BpWDF5MEtLUTM1M1d3cFVJc1NhWGlFeWMzVi9o?=
 =?utf-8?B?Y0RvMzFTZWloVndJNXJVODRyVVk0ZDVJTTBxREhTMjYrcWl2NzlXeDJKTFVT?=
 =?utf-8?B?U0Q0OEpCcjlsVjJETFZIUThDa3B3L3YrM0hreGVXWU5EbURMM2Y2dllYTnRH?=
 =?utf-8?B?bUFaaWQ3TmVYK2dibHNPb0FINnkwTEg5cExKeVFKNUpGZEJOVGtvSjNmakpm?=
 =?utf-8?B?dDNSUFNBanZkTVJVcndrOE8zUklkMTNlWTV5Q0RGaTdBTlZYQ1pQenVYZDFi?=
 =?utf-8?B?b01YY0FYNENaWm1yK1JGSHlpTnVoRGc1UkgyU2R3a0F6NkZTQWZVTjZGSmJu?=
 =?utf-8?B?RlIwSEx6TTd6Q09qSmpXZlpxN2V1OWh3b2lBRW5VdkhGTkw3c3JlMGI4d2hW?=
 =?utf-8?B?d0h4OTlNdldpRWFUbHNJR2FGQjd4Q1lJTUY0cnZnYXY1dksrc3pkNjNuMnA4?=
 =?utf-8?B?L08reWFWelFXNVhNbTVUcDZtU2RtaEUzKyttQ3NoaEdURVp0RUxreU1xSEZS?=
 =?utf-8?B?K0pxUTJ2N0Z0YitDZUlRajVrcVhmTWtOTE5MYjRpT0RMUTlFenF1dWhrTnU5?=
 =?utf-8?Q?wXsg1XXp9AI/ecCnFbW7Q6BGSxVM7YvZIH0by?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae357588-7d99-4504-8a3b-08df278e73b9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:49.1323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BytQaqWfkGQcofG1nOjXgVd9Yce+FBF14JC9jMNCMwwOb8QnRc7BLwIHv7m0GVcIq1l0Sn8MeJ+qiRWIGPAYFWtdgk4KheT1lyLt+RevX0rGlJiyw4Duilhbg/soJGiF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

pm_runtime_get_noresume() in probe must be balanced by
pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
on success. devm_pm_runtime_get_noresume() cannot be used here because
its devres action (pm_runtime_put_noidle()) would fire on unbind in
addition to the success-path pm_runtime_put_autosuspend(), causing a
usage counter underflow.

Use a __free guard to automatically call pm_runtime_put_noidle() on
error paths, and disarm it with no_free_ptr() before the success-path
pm_runtime_put_autosuspend().

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 5ae9cdee6424..8dcfd05e658a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -445,6 +445,8 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
 	}
 }
 
+DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_put_noidle(_T))
+
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
@@ -486,6 +488,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(port->clk);
 
 	pm_runtime_get_noresume(dev);
+
+	struct device *pm_guard __free(pm_runtime_put_noidle) = dev;
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
@@ -556,6 +561,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	mxc_update_irq_chained_handler(port, true);
 
 	platform_set_drvdata(pdev, port);
+
+	retain_and_null_ptr(pm_guard);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -564,7 +571,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	irq_domain_remove(port->domain);
 out_bgio:
 	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
 	dev_info(dev, "%s failed with errno %d\n", __func__, err);
 	return err;
 }

-- 
2.51.0

