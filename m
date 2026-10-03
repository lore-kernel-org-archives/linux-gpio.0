Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9023A1688;
	Sat,  3 Oct 2026 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029415; cv=fail; b=RiDtOTlzMFmMXo/N+C2akrisKg5RSVsMnry9FNOMJ2jmgR17uUipJTD9xIIllhZxdfZFJDChgQFjDJ9Tj0LRYsurQoUOnkZ/5S25UCQIEh/2ZzP4a28eeulRseYM6lP710d51APuIiGSrnhvZTkUJoxjBmqLnN5Cz8DNqIGw4NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029415; c=relaxed/simple;
	bh=9gyNL/4hGIGunck3CgImm/SP61o2BzRWCIovEPQx9Ws=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DQLk2XlMpxElZS8RgeaerSG0GYcCGObIN8kHlSlgAdj9IEWuwhkRp934SVBMigBsJq1fXTVl8CLhUDDZMabXEIbyRrJnJVTeoiT0rNtF0DWkMqsYDRQnb+rTfDHPBoc+Uh1L4UIJ4b8Bf/VroXR4PBBPCWsm6XEv74FgMBgQRVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M/UznDmJ; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M/UznDmJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWrVqG8JSrGtsf02ossYkvg/RYfkHQ5za9rRN3ODvJQxc0ybqAisAcVQBSKqLpkmv52DZ96I7C6PXFafp4tQnl2JA4rK+kdzXTvTxAcCbq58+63VrzjlTlAkTX5qwyNXCWYgsIQ/0sBRi7Bqp3q+SefXx2zw9USyi58fM1NlFv0SZ57XObK0KF/XeBLJ8ro2oRCa7kTcICtlb9GyiBTRIw5sHqg/o5sAIGiuAjvLgDLn1+7oHG6MqEAbd5AqhEt0RMSOf8m3O90e2qgU6PHTmRRtN6OJyB0bO7aZEcqNE+jJqs3yynEZ6xT7POEDR7QCY0ergdrmq0rCWVp4weDqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2Qa8wB7Z2kPqRHxxamW7hIaTks9IQto75T1UEdRMyE=;
 b=j0yh+IZ6+suRWFGA9A6Vsio7z/YQlOV1EsL9QMQyVg4ZUbEgWyXeALgbKtW6dfAVLMuzgHeYi0cQSZ1dWxhOnyrSVsApObCK/VwnyWecPaSFPlJxguxh635MOAw7+fgQvmW3XYyitwPPgny+KlZpySORtIO+eLHTWP8HY39aPDkTn1bLFlt6XsFvugOjEekkLtK3WQYt7LlpuULAWv8zJKfHnjRHbYhItlI2vpFXdwY19RiMS9V5et4qqvs+YjN/d86TRUM3asnOgy06rQ3qR2I3xWR3MAiDeexNiuctenndq2JyFWhQyKohGR4rmqfMNArYTsFXt61Miz/UkgmeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2Qa8wB7Z2kPqRHxxamW7hIaTks9IQto75T1UEdRMyE=;
 b=M/UznDmJrePyWdzoxaTOz7Rofb9DF3VkBauRRc+ier6CVhTRf/N5vTs+9YD0nDGyW28ukNtDnJjHnG3z6XghIjFfkqt/+ZbwAujs9m64zebwxgZAtGbjq8ZWNWXtfgo8qUU6uwARSsDuBLHIInudLlnMKvFPRMC2+YMUO7Ncf6418EogRKLrIPPUbEMD9aYpzJc4vKfZqm7/HRisuRR/bIYhdbLjlhPjC8oVowhbtjde6DcSc4hbK3IsfIt398vEb+bXRLDGPC7hG8Ie/ePGdLA1kpuiofhVfXIsn+MHh/l6E0aWG2p/jrRoG+E/zNSOhkm6GFXLoNt6vRKaJeVe3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:10:11 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:10:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:48 +0800
Subject: [PATCH 6/9] gpio: mxc: use local dev variable and
 device_is_compatible()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: afb89a8b-e8e0-4b53-bcbd-08df214745dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2l+1cFGeUHbP+Kh1ez0a/hng/mao18hzmQX4zBZGNeYkP1UqboO+Csv6lKHbPKT/1OWCjDToRzx83op/OMOH9COvNcsWh4YCfE2cr7EbG+EyvRI3eVAzvSeSlO1b0ikHKqVFuPWEb93964hMB50MtSm2dzmXXowmrzcnYI/0AsB21nReGr3V9XUwB7ej7/hHMxssUdow3plPsh2mMvppT/sp7It9bul6ppmP2FJ42QTuy0VJBOqOdoXhMkPNEANWOxIFASjHr2MNYz6eQzn8c81MeWg38Xm5YNIbHe2zwEHb+A5AW332gHIXxi9gKCh3qpkdER9oMYXvrp/Z5tRzvzAxA80v5MFLR3vY5O2OzYo9PqoALyZZV/HZwR+sI+HB7rJMm1hnJxq7Ss4CnpLCOCcm5RQPRLf2VaVdJsTfsHWV6HWpXDBMfWwbmyNh3Nl39DPx0sgl0JuHpSheKr6C3Fq70KnkZgya87gy5FeER5jzT3oODYTv/WBpuEgfY0tMG87PDjG7rNPeI4e5t2+kN9a/WDY5TzUYGJyRmt99m4DPgqeEJQBsuE2PZ1lRwuwquLWAk70vjEN/ZUVX9x/hrqqcSWjG2MvEoBAc3kK+aDZiJJZtNgUS/55M1VT6D+KyQ5cjYzWCMt8VIVNBLOP8qtVjHK/FTrmr8pQPbU39Sjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEFISHgwQXJaYWZiWEhEZkdwQ250bDRPVlU2aCtJcDJGZ0J6ZkhMQjNXWnFT?=
 =?utf-8?B?M2szOTJJOWpOTll5ekFZZjBGNm5oY0UxUTkySlcydjNNdzFJeXNZZ1ZDRmhW?=
 =?utf-8?B?TlZ1T3NtYnJlSFd0MWJxM3B2ZE1uSVdoWUNtd2xIelNYWDVtVldYZ2RWSmRG?=
 =?utf-8?B?NCt4QjRWMmpkOFc2RnVaa05MTVgzbmhyWUprNWlKUE0za3d3QXZBWUlxWlV1?=
 =?utf-8?B?RDB3aGxNcnNyK25pRWVWeGJHQjJPb1BVeHdUZkZJVFlIYlZxWk5mZFRiMWR3?=
 =?utf-8?B?cWdlYTVqZWlEb1RXME9uY3BwSm1zb0s3T2NEdG02ZHo1Q2M1MjFTdmNmdEk2?=
 =?utf-8?B?ZTZrMU9yU1dpYUMvTXhUcU1OcTJ3YmJGYkRsRUd2bDRucmJCYjlwNUtNa0dJ?=
 =?utf-8?B?SVE0VEtjUGhFRlRxNVZydTk5dC9rWjhMUkxicVJ6SHIyK3pXVzVKUElxSXM0?=
 =?utf-8?B?VVQ0eDZnSzBvN1RSVHVrT3VyWHBubmJRUkFweW9vTVROK3NHZXRkOUxSQkR6?=
 =?utf-8?B?eHlzQms2c3Y4TUY0bDNPeTJqajVQR1g0SWtVWXlTdlFWd2hxV2cwTkgzRzYy?=
 =?utf-8?B?Zk1Od2VtNzV6aVhwMGtCMjlzUXlnVC84UWxmVUJwbzFCS05LSUV0UG02c1FC?=
 =?utf-8?B?MDFNaU5WR1VVanF3YU1YR0phZnQ4dXZrK3hhRkh4d3U3NDhnK296ZXJXRVNq?=
 =?utf-8?B?ZzVaWEhUUVRWRFBnSHJnT3VZUjVwK0lJaUxXRnpHNmx1R1Fjb05UNGJWVHFm?=
 =?utf-8?B?bHNyZFJnS2RBRE5kQUplNGg1eGxoN0pBRWFmZldiSXNqZmVsV2RLK1praUdG?=
 =?utf-8?B?dU9jTG9KMGtZcURRdmFyV20zNTl6VUlSa0hiUDUyOVN5eFRnUGpBUDZ2aUkz?=
 =?utf-8?B?MHp0OFhDZVN6UDFNT3NrVG1nZ0d3bklKcWVqbWJnSjZsa2RPZEg1MG12WjBK?=
 =?utf-8?B?MG5XSnQzeldXU2lpYjlFNHdyNDhNUTR2TVArazlLWitEdWpWbnlRMG5ZdWJj?=
 =?utf-8?B?YTJlcDc4VDZ3dUdMam5nSDIyN3k1NTBtdVk5R2RhUzM3aUMrN2xoUXcxV2VO?=
 =?utf-8?B?S2E0QmhZQ042aVRNVllFYmErZ2x3WXZjSzNtZVZxRU02dFhVb09ydW01VERo?=
 =?utf-8?B?YUtvRUd5UElpdFc4dk5pWGU2N3BPYXFQWmtMVklYaVZ5U0ZsQjVsQ3huY2Qr?=
 =?utf-8?B?YWlnWnhOdnc5UUVqSDV6d29KUTJGSnpVNnRsVVRGeDE0dWdLdUpFeHNiVkN3?=
 =?utf-8?B?MUM4VGV2SytJdGRKaWkyaFo2bno0MTVPcm9uWVV3WC9ldXNWdmtERFlyRW8w?=
 =?utf-8?B?Rzk3aGJjREh1OUxEVkVSdW9PbUsxcTBlcUtaNEtmcXQ5QW5tNWZhdFhaY0dS?=
 =?utf-8?B?aUorSUNrYVdjRENPL25xK3FEdmZnWWkvcmh0OXMyRHhqNXhSMjMvWWFrWVk2?=
 =?utf-8?B?ZkZSei9vZjlsNHBvcUhmSjAzRlQ1SDhoa0E2MFFQdXdCcVU0a1VRalU4OGJT?=
 =?utf-8?B?WWUwN3d2UjlSUGZRQWZySngwMWNWSWYwRFpESEVzUUN2NExaTGpKS2tQbVdF?=
 =?utf-8?B?NWhRVXAwN0NHVzk4aytsQ1p2ZVprVzJRd1BFL3JYNUVLK0RyMHgyL1l5eDRR?=
 =?utf-8?B?NzIrQzB5RXloRGZpb3RzM1I4ZW51ajVVN0VHa1dCaDJOS0lNYjgwN1NyVjkx?=
 =?utf-8?B?UnN5Tyt6YWJkeEkwWHlDNmZ2bUdlN242dU1sOFduSmhjMHp0VGJDbE00QWFT?=
 =?utf-8?B?RERqQTVSM0hxT1VoZlh4Wm5UQkYvRkVIV0RldUF5bDNwY3RDWk9GQlY0bytp?=
 =?utf-8?B?QTNrWEk4ZFp6WlAxL0xKeGNXWVlkcjlDQlRxVDJiQS9qYnNnckxuSUxzaDRP?=
 =?utf-8?B?QlVING1ic01qMkJxSUNqSzlXS0dtTWljaExRVVN6cXFhTDluYUFFSHRiS1pq?=
 =?utf-8?B?NU5kR3k0bzA0RUdHQnl1cDhPSmxsMHUzSzV6bHRLUjg3S1FLc09sTHJWV0xQ?=
 =?utf-8?B?K2YvWEpvUTFmVWtheWJ3Z2IwMjFlSDJha1QzVTByM1VFaEQwVDVMZVk1emVa?=
 =?utf-8?B?U3J1NHRtQytBU0NUYzIzcXpEWnFLTDFDa2xRTTNsVktRM1FIZnlvdWpWT0Jr?=
 =?utf-8?B?d2lXOGx0SVdDUWlnQVAxNVc3bzh6cEZVNGhFVzNFMUxzQmxNK2ltZlVESHFO?=
 =?utf-8?B?L3JHTGtjRVRRbE5NVFhJaU9OTmxpNlpSSWdwclN5VjlRa094U1F2ZUhJS1hv?=
 =?utf-8?B?SEcrNlczai82OG5LbmZ3OEkyWCsyZ010R3NKbmwzcEk2YzRzSHh1UjQ0VHlV?=
 =?utf-8?B?Tyszb1kwKzU2S3NSWHVsY1VLbU5PZGF3Umk2T1ZPcm5kdGNDcVRUQXNUVlE3?=
 =?utf-8?Q?k7/4Qn2COoYBczkqx5gIUyddeYahkQoux9Y7S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb89a8b-e8e0-4b53-bcbd-08df214745dd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:10:11.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtKvVtNqui0c2/KIDwY1BKifc0JZABg8+EDP0YOMUXLOnE5/SJYjLWJeL1WeBoASk3Y7VihZ+b5jJI4+yqZonZD1r8Wc8xm3m8uld9+QZPH4rrWY30wvrDggvT/0eXH8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

From: Peng Fan <peng.fan@nxp.com>

Introduce a local 'struct device *dev' variable to replace repeated
'&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
readability.

Switch from of_device_is_compatible(np, ...) to the device-model
device_is_compatible(dev, ...) API which works with both DT and ACPI
firmware backends. The 'np' variable is retained for
of_alias_get_id() which has no device-model equivalent.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 53 +++++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 73e19d2bf235..a3274be7126a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -428,17 +428,18 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct mxc_gpio_port *port;
 	int irq_count;
 	int irq_base;
 	int err;
 
-	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
-	port->dev = &pdev->dev;
-	port->hwdata = device_get_match_data(&pdev->dev);
+	port->dev = dev;
+	port->hwdata = device_get_match_data(dev);
 
 	port->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
@@ -459,30 +460,30 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return port->irq;
 
 	/* the controller clock is optional */
-	port->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	port->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
+	if (device_is_compatible(dev, "fsl,imx7d-gpio"))
 		port->power_off = true;
 
-	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
+	if (device_is_compatible(dev, "fsl,imx8dxl-gpio") ||
+	    device_is_compatible(dev, "fsl,imx8qxp-gpio") ||
+	    device_is_compatible(dev, "fsl,imx8qm-gpio"))
 		port->has_pad_wakeup = true;
 
-	if (of_device_is_compatible(np, "fsl,imx8qm-gpio"))
+	if (device_is_compatible(dev, "fsl,imx8qm-gpio"))
 		port->is_imx8qm = true;
 
-	devm_pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	devm_pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	devm_pm_runtime_enable(dev);
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
 
-	if (of_device_is_compatible(np, "fsl,imx21-gpio")) {
+	if (device_is_compatible(dev, "fsl,imx21-gpio")) {
 		/*
 		 * Setup one handler for all GPIO interrupts. Actually setting
 		 * the handler is needed only once, but doing it for every port
@@ -493,7 +494,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
-	config.dev = &pdev->dev;
+	config.dev = dev;
 	config.sz = 4;
 	config.dat = port->base + GPIO_PSR;
 	config.set = port->base + GPIO_DR;
@@ -502,7 +503,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
+		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -516,36 +517,36 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	else /* silence boot time warning */
 		port->gen_gc.gc.base = -1;
 
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
+	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
+		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
 
-	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
+	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0)
-		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
+		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
 
-	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
+	port->domain = irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base, 0,
 						&irq_domain_simple_ops, NULL);
 	if (!port->domain)
-		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to create irq domain\n");
+		return dev_err_probe(dev, -ENODEV, "Failed to create irq domain\n");
 
-	err = devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_remove, port->domain);
+	err = devm_add_action_or_reset(dev, mxc_gpio_irq_domain_remove, port->domain);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to add irq_domain_remove\n");
+		return dev_err_probe(dev, err, "Failed to add irq_domain_remove\n");
 
-	irq_domain_set_pm_device(port->domain, &pdev->dev);
+	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		return dev_err_probe(&pdev->dev, err, "Failed mxc_gpio_init_gc\n");
+		return dev_err_probe(dev, err, "Failed mxc_gpio_init_gc\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
 	mxc_update_irq_chained_handler(port, true);
 
 	platform_set_drvdata(pdev, port);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }

-- 
2.51.0

