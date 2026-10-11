Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB9442399;
	Sun, 11 Oct 2026 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719757; cv=fail; b=Ue0312rjvgNJ6/q2hoo/rbC9kcuVQHV9YgXrOmfszutlagIiCzZPRfODTPnEaTlzkaBQ3zIbk+t6EEjtfBZFV3vw0ZmHWiyg+Ffg+y3KqitRYXlZkMEGPuFJVDdMMceepSdVNf65Ej6wLGyfcrnYogJUqVSaV97bD5gtKbJjYwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719757; c=relaxed/simple;
	bh=KTpdXV8T80HY+LeUisuHD8Y2Lxk2eoOjQNg93ktD2SY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CRimo6lORNEZ+toEz17xaYAlhWl7J9KQmyjkmUeuJ6Pv0ru34pg3UoB/ISy8iwtz05un7Y8rX4YEBm/Cs+10sWy7EW4VW6m10zodvV2+hvG2n3NsPyezBqz/mwyzr3hp+6KW2OX70iyUIo8TvqhgG+i65Lly3Ni98PVRs3mpZ1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aQ1//9to; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aQ1//9to"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3uFYFgx1n3ZCzTB5G2XFBPT5PAedZ5F0+k0NQrIEpgAEdbfxqjWRVy7EaaCtoQsX34PBnt72VDcNCPTDmMe9S+NlGE/d6dqGB70C9HzVIWTwZpbltt00nSjwmkcLz6Oaph+1/6rmZBjb7i1ABhfqd2aasZVzH1HEJ1cruRRUfh0WGoeUOyrLNsj11WMHo3PEvvzqzFbD6BHjHO9RFrkwOZ1n8i5e46ZVeEr2sDgZ2qKS8nHDhtI+ZVvKgkYCZArG0cE6ml2j//Bm5sdCRrYlN46m/onN4Hco9SjEU0AF4f4dJQ27i3Np0NAVkntUlBltON7u7A16fdNNtFWf5LaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXmvS+fmez2Q2H0DAcWFLy6Ashsrqihb64Ewn5+wkRQ=;
 b=GdIjABt1wkYmwiyrODNwUTZkfnQHkfuJupn044qt/hcF7hlAZqL3UazlCNt9u8OEY1wzjraK2d6WglqWAeHlibsG7DzLcBIB5fNMFw8S3HNCpos8xSIffiqqVOgDW34b9cQWJMgBz93TGf30NacC9ikpjPC5ykajAxAbGw3vUBYgPjKvcjDZ5ZhkLlQelYhPM6LhlHieUdpr9esk4VozTbVh9MwaSR8t4MAXSsdMiQo5X5u4QbhkkjsQoNjz10h/mOgmnm2UCHVzhvSlTfY+Rz3bPfcXLPbycmVuvfgy+DXTk2owjMocKEmY6L/lVn8Bp2zTcA3i5mJ9Tzv4KtN+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXmvS+fmez2Q2H0DAcWFLy6Ashsrqihb64Ewn5+wkRQ=;
 b=aQ1//9toCDNDoKHshnyhBppovtLUYMuLVYnYb8b3MFvlYAbU8Nukx+bJOsFot3NH1DKUaL42+vXKmX3Denb6RtdrMb3IOELTZJgV66xyw73eFF+vXLXX84/U9GKmYxkNZcs/bdX7ZA6FPcj6XNIqZxYFnYiqPeFYR4L/AED5rBMVC4PwpMvcsOvqE3J4yoxab2hqpNC21+o1aGY2sjRVluJO42S/4IYpdHw7snpkelhvwO8ufN1FxmuKGHEnMaxCedbUjZtRL/fTFvSYiwJpXOyrfaaBHXsCXlADTltAQqEZ65TDz7HYawG+vGhgwPSvKJ5zOPKOcMpWkRatkG+aeA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:55:00 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:55:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:32 +0800
Subject: [PATCH v6 11/13] gpio: mxc: add dev_err_probe() for error paths to
 help diagnostics
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-11-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f162b9d-76de-4d6a-dbec-08df278e7a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	m0cuN10XT+x65XzrnfmWxQChrmmNFvyFnhP6HJrO3OtTAiPlw9gvoDE/az8dYctFtYC8ev0E2wFSq8RSa13ku4qKOKzsjmbRpeaC0JGUgPTNUUMVlSrKs8N1Hxqu6K0WPfM8dfAaTepFOsniH2ST4LjxMW0ODAE+jCXxX3oPygvk2BZp97vxOrNCVFSTWlWOdd2CV8rO5wq/r9MCCRFdtGD5oab1qZm/0oWXcZ/12x9F7ySRWfaQIAtQXyHwYYYx/OBi8tywmLVacZemeKP+uNrcXQaMA5e0jronItO2DN84Ml/tADBQa86m5ZClHY6jMOJUTJPKJaq88rWTqb3uMWEJ1iT+vbeL3q4V09sA264Jrf8QOMcx4xJlz5rxF00l6EoA2ZbfoIrJciPD/AwnJzN538j0kjTnLRKSbGkVgodr0x2pBtodFMlQEqWUXw+5Omk0F5RKigATaDBSFf6aJCt8GcySBycL+nsWAKcPeLGQa1KCuMD7m5hzDLZAJOFv9Wuk4gHEPs+5Zd//i/+mCbEl+9d1Jt1IBbVVv/iGsjhWBhS0r8gTR8ARxdqBIfh4VVFGJEbVHp9rrjmYh9LQ3vqd0t26RYV+25+iZuD961JbLCtfuxdqGXZwsQzFAVOqSpSQh1SxSFbSGenhkDDZcyQ0qsbmurhOb+UvuCp069U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2FRalU3TnpNaUNWWXpWamJnempvUkhwVTlYWDFtcFBkd3RqZkNwdk4vNWxO?=
 =?utf-8?B?U21yUk5Uc25KT1EzMFVYNEpydHg3b1RTbHpSNXhHR0ZGdDF0Q3Jjem51MEkz?=
 =?utf-8?B?OHB2aU1EbFBpaXZ3ckR0RitXOWNBNFdkUm9lZjJxNE91eU1TYzVDdzdWMFBM?=
 =?utf-8?B?NVNMdEc4ZE9XK0RRNE1obXFMakpTeFZ2dlZYaXlaQ1lvNGMvcmFQU2dyNVl1?=
 =?utf-8?B?bWdSUWxaekFqcldiakd5eWhMWGVsZDRFb0c4REh6U2R6VEo5Sm1CTTVobWFa?=
 =?utf-8?B?anFLck9aSVpvdUVUS1pMT2k2WHJCYmhSYW1aWStpU2hmZnlaWURjOHVBMTNH?=
 =?utf-8?B?dHBTdE5XaU11enhML013L2QveXRuN1M3ZGFXZDVtcUVrTTRyN2pBbWVxWEYw?=
 =?utf-8?B?SkI5S0k4bFQ3dDYvaEFNajErZkRGOGg1alIwUWhTTk1KSWNKN2kwTjNXb205?=
 =?utf-8?B?eU9obVR5OXY0elVBVEMxK3dQOFVBdTJ2a1RNM1JSam9UVFhXOFluelpWYXBu?=
 =?utf-8?B?eVVCd1E2WGNZaElUNW9vTE82TnlMU2taVnpqNHRQeTdVMDJMUC9YajJqUnAr?=
 =?utf-8?B?ODJDMnJ1ZEY3NnlaRCtXcmY3R2VPTHJkYVo2WGVza01hV21wS2lJK3NHdWFT?=
 =?utf-8?B?WStiZXU0NFY1czZZdjV4dUhGaU9FR3hFMXdFT3pNR3cyQTdmWWJqUm9GV2xx?=
 =?utf-8?B?aGYwcWhmb2tWOTZVMnRGOUQ4M0xQOW9PSEt4aU8xR0xtakZDcmJSUWkyS0pL?=
 =?utf-8?B?MGxRdjZVWUlmZ1RBNUp2cCtBeUFBdHhmL05zeHR2STRpdHNjTHU5bDNuUlkx?=
 =?utf-8?B?amxKZnQxczdHa0hxOWY5MURHandoa0NwRjNkRWNvYUpxcEZ0WWhhajUvb0RO?=
 =?utf-8?B?OGhCMlEzRWg3bDBCMExWMlUwN29OeXA2blduKzc2L1BocmtKc3NqUTFHdGpQ?=
 =?utf-8?B?ZmJTOEo2R2hBM3RQbGhSYmR6VlcxRFZqMzF0S1RlUkhXeFk4SFJyNnFQMGtP?=
 =?utf-8?B?d21pWTFqdHlyRzhwdW5zdFRteTNubmlOMlZnQUJhNFJqa1B1Si9vK1B1WUZv?=
 =?utf-8?B?S0ltMnE3TUJiR3lSSitRU2ljQm1TU05Xb1BOakpDclVqTEFnVkxYeDlCaDVN?=
 =?utf-8?B?d2RkZlllT3NiOW5iVjFZM0JFMGUvY0lTdXYvMGFZQW0wNU9qaGdBUVM1eVh1?=
 =?utf-8?B?OCtQSVdzQk8wS1FtN0RsYVVWbUFtUUUzOFJ5aUlUeUxDMitLWTRLRUhrc08w?=
 =?utf-8?B?YXMrdEJoaUU2dzRZMmwyaUFEWEl4NzNQNnYwaExiTUMzSWlUT2xvaFdZL2I1?=
 =?utf-8?B?S3B3U0k1RFU4SWFLbDRoT0RscEx3VGRXT285aVBWUzJqRWNYRm5wMGZTdUhG?=
 =?utf-8?B?TVpiMUpYMWQ0N1RuMXhaemJ1SVVibkM2czVuTTg0bjZhMHljZ28vQXpSalU2?=
 =?utf-8?B?SDZTQVFhTG0xdkNUMzQ3Z3djN2VzVG90REd6d2hpZi85S2JhOHRCUE9aOEVK?=
 =?utf-8?B?eU5LNjJOd3ZxcXA0UFNhWnc3VFBZZlZrVmZ0U2xhY0VneXA4eHFxc1U2WnRw?=
 =?utf-8?B?Z05uNmF4TFNjOUh0ZGhuQ0NJUE02Q0NGWWp3ZXY0QUt6RElxanozNVhGR3Iw?=
 =?utf-8?B?YjIvYkNvbmFGQ1NTUlRqa0tjWElaK0UyM0Jyb0tFcHBZMlFBblQxMVhCakRw?=
 =?utf-8?B?VkZmWVhGV0hRNGE2VjZ4aE93akpPNTM5QTVrK0ZqWHRhZkVkLzRRblErOXRU?=
 =?utf-8?B?dFVXOVlJZHBSblJFdDlZN2tQMTBuSUFvQmF4WXg3LytodkFpWFlpUnRKQ3Bq?=
 =?utf-8?B?Z2F4SlFPc05kVlhSUzU3WWt1TDMzMTVNQ2NlQ2V1YW9xZjdjTnl6Uno1cnRn?=
 =?utf-8?B?dkZvNHl6NmJmWDA5bWREU0tJN0taWDlqTzQyaTJvaGp4RkhCUW5wMzhMa043?=
 =?utf-8?B?ZjVvNUlwR2VoejdOMy9kRVdhRmxrZTJtbWlSdFpwamRyZWZVVGZ3RG1WOXhO?=
 =?utf-8?B?K1gxaDBRYlpmb0hWY3c2T25raFkvZGZMQWR5SmM3eXE2QmJqMjFtTWtYSThX?=
 =?utf-8?B?WWU3VmpOT0d1K1lZdWZoNkNSUG5NM0twYVJMOFRKejJiMkxPcjg2V3JXcDB0?=
 =?utf-8?B?UWhGbU9FUnFYWUpYSVpwOWlpYWEyVVdXRmMvZ1BKQmthbVhRdy8vSTh5bGx6?=
 =?utf-8?B?aldFNytBVWhVaUxud3E0Mm11R2FaMGU2SjY1WmVCWGZZL3lYRjE2TDdkZkpk?=
 =?utf-8?B?bE9JazlpOEFCNWZFSU9qbTBWd2xwdmlzaGk0bEovVHA0R09wMnFWMkhpM0tP?=
 =?utf-8?B?ZGJpTlJRMDFLS1hlODIxYUNGUVA3dmhFVnVHeUxCTW5wejMyUHYxaVBMcVRG?=
 =?utf-8?Q?RvIBuFIMg27Xcp+O0HMCZ2Fyy8Q9E3hHs4whf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f162b9d-76de-4d6a-dbec-08df278e7a53
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:55:00.2031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BZMpvsmh7ICjUc5OrQhjBo6ayj2cdmlqdrUAAZ8U7iLALVCY4qFONfhbG0jbwddB3Yl9k7avDFx67Knbl5vJQoPuL3oPcWvLmV8snC108n6EVICQwBjkquI4TS1Xzde
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

Replace bare return statements with dev_err_probe() across all probe
error paths for consistent diagnostics and deferred-probe support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 09acb186c84c..2847304640f1 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -520,7 +520,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		return err;
+		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -536,11 +536,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		return err;
+		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
 
 	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0)
-		return irq_base;
+		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
 
 	d_info = (struct irq_domain_info) {
 		.fwnode		= dev_fwnode(dev),
@@ -553,14 +553,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	port->domain = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(port->domain))
-		return PTR_ERR(port->domain);
+		return dev_err_probe(dev, PTR_ERR(port->domain),
+				     "Failed to create irq domain\n");
 
 	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		return err;
+		return dev_err_probe(dev, err, "Failed to init generic irq chip\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 

-- 
2.51.0

