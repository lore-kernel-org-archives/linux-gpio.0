Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BA84F55DF;
	Fri,  9 Oct 2026 18:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569401; cv=fail; b=Zp0jQ3w4b4FdtfBQjxC4atvNSf/hTEXbX17sXt6GVRcvH4LGXhRmJl4jSDTrmSQx2N64WDhLajl6JJhnr2CMPjLq1iVXQN2P+mRG+wF7Nel3FgoX2bx+MXx2J97b4yTZMSePHGRcTHiC9Pj8AENRdtSk5726DG/mMGt5yIz39xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569401; c=relaxed/simple;
	bh=wyizCdQ19rUDaNR4OtXfkndqfrVGHkPzbErXyL3xUD8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ICAUjvhTnLHCAnt90Zo8cEEKRPbu7WnNPIZReVZXLbt7JE3ucMI+Jj9FgnpEe7j6qmdRoGUTpetcIqWAWEEuQZ4qXPdDIKPUJ9sCUGF9lhywvjhTgZfjudevyWJOhrkeN58+Wqb6hJOpI95sgli/DEStUyRsnfSJrknL1TYYcgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I8DsbBK7; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I8DsbBK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3CDyIQfGFXH/KhrLmJcmJwQTxZGlvgmHOft9t7uU82M7GfJefvXOYQ79M/tyLb/dsh9JQd/nCGOjMkJfHnps84upIyOOwBQpY4GwJZ4UVQemd6yHnPpm9ThhtsP8uikamqlfGOSVkRpoBf8Wi1rpBVC5uty93pcSmGd7l4kPhJVCbZfNHihJbabOQceBjUqLGL/29ZweQ6dQg3gGLfcfw+ZfroAq9ydxX5pul1OEyFuLwAwbsbl6uOxyoBV8AoUT2JK6xNcm2w/qONFTCG9P19UgVltFK4cvzlcCIoeI9dVBYk6/9FW+ZOpWjOfubJ5eyEPL/XbfwtdEZPcLjl+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt48CPl1GFbvyj8Oej54KHQS7920JWtdgTxMvTpc2c0=;
 b=bTFi3QCFMW5xNK4zxxvauLwu4cx6Uh8Jz1lv5bEi5LVQVug66Cpcd/TW53mbNmVobczJDnFZ8XJ18uzhXyPrFya9FB13W1ptOoKbYDSkQ612TUzr8qR3LMvrDFnOLUPhwOG+k2WhT9iOWl/OkVCwgwcJDS2B9/4dvqt03LYq0kAtpoI2AR87to1JE7dliupdi4l3vEliIpE9YbuvRJpyJqE0KAd166TCZ7FFWsbbAGuThvuWeAeA0BpNDjjo3sJ3olJrcVWZfmiJMf4EwEZNzAf5064YYg3OIGOXF05lDNRaMx1/TOYPlpR+q7+2lqeLTObiSOcSRzGnqmiIcrzU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt48CPl1GFbvyj8Oej54KHQS7920JWtdgTxMvTpc2c0=;
 b=I8DsbBK77T77GoHx9Z1u7dJ6t2vSiKEBZdJwedwxnNkwNjs/U6b35fzgQXOvx1e96lVJqNx60mWaCwhmcKS2hCPRlRGR6PR5fL751WNri2IVXzzTkwOEM7urBfgL18PHux/0rkK4FcrDfXX5vBF2ARy2q385/wYJNIrmMyS6HitFB5z23YeiqELCSjSFSXr7h6gkJAhv/9VH65RAVbf4esXI3x2ydHfiasSelMp3sxjsYKmViFfXHpjqE0mJkxPqkqcmTll9OdVGVt1Y8tEEuUaxEV+cWQBG+sUOrv/wCMBAIiygQPtoRcACbDuJXLztapP6IpvJ9jsH6MzFloK/uA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:09:57 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:09:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:34 +0800
Subject: [PATCH v5 13/13] gpio: mxc: use BIT() macro for single-bit
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-13-1e59e6ddfa00@nxp.com>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: cc306328-25c4-4b9d-32fd-08df263086dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|7416014|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1VPQYgQh3YGwHCpVsQ3XQlpFO9hIXkzRQ2I2IAUjIqD8GaPwndrDR8e3+lf6v8xe3D7iSwzyLIiVUxwACCnBVO1gFcWyS7Jr98E00eSBfhMhhgmpvgRxWUJHl5xBAaZcUH7HuUME5xh7EZDrHLzGYQKLmmQWr9ZEXwRlRL5X9VsWE4vRCScsHd+wXDkc/C5yDr5OTZh5n8pTGlDhkXwroz9CDxR2I5pKsh5hZWcq9zG2ftNcsRCf3ewYj72zW+hEsf7krFp8ZD3VoHZaqgae7hGReb15YjL7H0Pfe6u6KKOr+V3r6BFDsWHzdtJgvKsk34idKVCWFANqaZm0pzQR++9ihZWZpiQ+p2RRWFRY/1ZOl3gDGlr+O6Xs/4Zo/BooLPtCVJ4lnvubxLBLQtFBpchzevRjcpBFupx+l6vlhfIovkO9QxvSuyZReMWyPWqPb14eq7OBx+FAvXoGAhAfgRQstTuTe3DOODWJHeGkP4FaApBdkC7x1bxj6bnDt4sMhnGrXvO9QWvnryHYR44OTDmdws0OSDWIaq8FyLGKPhV8VWbsh9SIPxEu3gUCW/Apre6JMN2yqP2sEi1x4T/dZGh5TerBwicxFGuK5VMiFsxAzuyJqhB58TiJN84lHEUe16Yu1No0spwn1NBI+YFodtqV2XbPLUdIkGeALTVNz7U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0NNWWNuYzVYN0JDMnZtYjMxbXdwWXI0ck01OHcra0d6dTByUWFSRjNBOTE1?=
 =?utf-8?B?Q2tFWk5COThybFpXZ3pPb09XRHhxUlVSa0lwUEpRL0pWM0QyeStJZjJSNE51?=
 =?utf-8?B?S0V2U3cvQlREelIydmxGQ3NIQ1N3NUp2VHY4eE5VVXJKb1NRdzVSRlp5RC9S?=
 =?utf-8?B?bjdoVWVqbHVYTkdtTUQ0cVlsYVR4V3hlUDRjYXVvZm85aHc2UkNMUXlmVkJO?=
 =?utf-8?B?cjhsTEJDZzNBaTNVMkdUT0xUcTRSdGcwUWxSL3FZM3lhNnRNN2t1OWdQUk9o?=
 =?utf-8?B?OFpYZTEzQmhGQStsTE1meEc3SEhzdVB5NTB1eE5CS2hrRzR5Q0xCYXN2QXYz?=
 =?utf-8?B?STBtZUJta3pPelV2alNGbVVhMkc3MkNGb3pibUhDSk5jSXVkWlB3U0ZPT1hv?=
 =?utf-8?B?VER0NUtRYzJLQjNvbGVCQzV0ajBTRTZ6a0ZMTEM0aXRRM1hBUHdwUzJhL1lZ?=
 =?utf-8?B?VXMzekJEZ3FRQzdKSEJmSktSM2ZaaGlwTXgyaU5YczJuZk95aTRnVzIzc1dw?=
 =?utf-8?B?dmpaZWl3enlKN1pYN2FZOURIdVhqWlFpRzJYUzlCWUdRaUZSUTJSeURlU2lj?=
 =?utf-8?B?R0xKVTY4cGpOVnlhbnhMcVdCYUlXalprREpkTk1OMWpqTDVKcjRIbWpiVTk1?=
 =?utf-8?B?dkRoQ0xmYU5MVGYvZW5SOXNEUTVXV0loSUJCYVZnWW5ZQlUxZkwwZk9ObUNl?=
 =?utf-8?B?Y3BUZUlsN0Frc3NadlZCNStQeElOc3RXN1hWSDlnYksrTCtEWWdTNDhWSXVK?=
 =?utf-8?B?bjhKMHhSdlYwT2RPempSTi9kc3d0bVhZRlpPWWlyZ2YySVAzbUFud01oZUMw?=
 =?utf-8?B?dG9mcHlGbzVrMFpRQXNFSnV5QTlaQ3A2VzdsWmtMN24yLzdESkE3WEM1VUl2?=
 =?utf-8?B?MTh2NUtOOXZEVlVkZ2RITy93ekg4bVlaY3k1L0ZJNHdpei9yYk5CTHhlN0Ix?=
 =?utf-8?B?dnc0d0ZOTGRjVXFycFZxekc5S2FmNDcyOVRTdGpBN1VBeDE3QWF1b1AySE15?=
 =?utf-8?B?enNGTmlTaWlxeTlzbDB6SlI4L0h6UWh3YUxUUTRyQXNUVVZaV25jWlJwQ3BJ?=
 =?utf-8?B?ZkV1bWdUY1hwQ3BYZmNrOFhkem9LeStUZFBHcG1Nc0FUblY0azhiZVVHUUFm?=
 =?utf-8?B?WUxrMm84WGN5ck55UnFSSXBsM3Z5cWMyb2RON1hQRnRlZDhEbk5acmFCSzls?=
 =?utf-8?B?ZE9yRUg1Z3dCWVNSaEdRdEJIYnVsTDR5bk9SUW1ycHlUWHl6M2JEOXcyK2Vs?=
 =?utf-8?B?OTFGKzlPVnRVUDBtVzF0ei90Mm1WVXMrbnhOaWozVk91WFRCS0NNeDRJNGhG?=
 =?utf-8?B?Vko0WkRQWUNZOE92MHNzQWhMOVowUjZQZ0VXVk1qd1FmM01kWi9DL2JZdDNM?=
 =?utf-8?B?YU1CZCsrRTJKZTMwbmxpajFDTFQ4bjhYWFhMMGNPQmUxU0QzQWk3Wm9JeTZ3?=
 =?utf-8?B?QmxsQkg2bXIwWWw3aTM5eTBpWGg0ditYU0lreDQxSUdhSlBTN1hEOExmcGZq?=
 =?utf-8?B?VWZzdHlTZk96YUcrOUFka0JSQktOQldRUWc1WEVwdHErQlM1RkU5eGZmTnRz?=
 =?utf-8?B?T0Q1Z3UxZS9yRFRjWXQvRHNaMWxtWVpnVFUxK3lkNm1HeVcyL3VxWWFCbjc3?=
 =?utf-8?B?MjRkSHN6bWdqbUxOTmlEYjB1aGlxNmtPNXBjY2RMUDVJTTc5dUt0SFFIMGNo?=
 =?utf-8?B?ZW5RaTdNL0JBd043b2k1bkpYdDdmZXZTSnhuTFNqS2RUN3dZRXVjSTlRcmFj?=
 =?utf-8?B?OFFKd00yMmpyVlJMR1l6YzRZdU80ajI0M05XajlRVnMyRWgzQm1ydW9kR216?=
 =?utf-8?B?bTlGdTRKbXhYVkg2SnJNeFJGamdFbFpFbXFncVFnZWhVaXhaS3dIMUllRnlK?=
 =?utf-8?B?WTU1NElCemc4YnUwR0dOc2t6WXpqdmI1YzFOMzRjMk5aUUw3YVQzcXdoek0y?=
 =?utf-8?B?bTFGNkFmYnFINFhYc29mWkVFUmRKRDhTWGlqMGI5cVROZFdmMzBsampLcG9w?=
 =?utf-8?B?YWNBSU9UUm9JQ1M4MXk3Q0VuQ21FN21LdE11MVM4RUk5YnBSZW9RWXpHVXJU?=
 =?utf-8?B?RHZVS2FXNkszR3YxTVlqL2U5cnFIQnl2VHhUVjlXZ3FlakRGY1FjVndrLy84?=
 =?utf-8?B?STAybFNPN2tOdW5MdlRLZzduaTkvamtMMnhJbld3YkVtcUNHVjBSRWhFUzNs?=
 =?utf-8?B?TmRPZnlUaGJTVWpNNjZuNm51RlNoVklCM1pTa3YvaTVtQVkzUVdnMnJ5VnE3?=
 =?utf-8?B?MzZsWG55RTJyd0tzYldOenM4L052UzduTUpIMDFTWGZpNTdmdDc4amYySWRz?=
 =?utf-8?B?ZXpTRjRNeEVnQjFrTjllNitTK1RZVHJ1dWhpdmhITWdRK0o0ZjhYTEZYd1VR?=
 =?utf-8?Q?q5dE8bGY84tVzFi8C6/GuTbW9hcOlufAntVFc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc306328-25c4-4b9d-32fd-08df263086dd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:09:57.3904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnfux/QpoEqO/yQgJkdjeNQrqw3HWMGlqN1aywTjW+m6ZmPRMz1V6NTdlnpHRkcl6si2XROdimPlt+7j++yQPCBcUBu3zN2xPMmC9rJfnn9jhgAS4O+kHjkHiyAb2KQ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282

From: Peng Fan <peng.fan@nxp.com>

Replace open-coded '1 << n' shifts with the BIT() macro throughout
the driver for consistency and to avoid potential signed-shift issues
when the bit index is 31 (1 << 31 is implementation-defined for
signed int).

No functional change.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 97147a5d747b..4140fb2359c8 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -260,17 +260,17 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		if (GPIO_EDGE_SEL >= 0) {
 			val = readl(port->base + GPIO_EDGE_SEL);
 			if (edge == GPIO_INT_BOTH_EDGES)
-				writel(val | (1 << gpio_idx),
+				writel(val | BIT(gpio_idx),
 				       port->base + GPIO_EDGE_SEL);
 			else
-				writel(val & ~(1 << gpio_idx),
+				writel(val & ~BIT(gpio_idx),
 				       port->base + GPIO_EDGE_SEL);
 		}
 
 		if (edge != GPIO_INT_BOTH_EDGES)
 			icr_update_edge(port, gpio_idx, edge);
 
-		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		writel(BIT(gpio_idx), port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
 	}
 
@@ -309,7 +309,7 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
 
 		generic_handle_domain_irq(port->domain, irqoffset);
 
-		irq_stat &= ~(1 << irqoffset);
+		irq_stat &= ~BIT(irqoffset);
 	}
 }
 

-- 
2.51.0

