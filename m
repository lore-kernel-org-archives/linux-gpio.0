Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0D941DEF7;
	Sat,  3 Oct 2026 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029367; cv=fail; b=QCCKlotQBQD/SLg6Q/JJ0Bt2QLaqgwGYNYnea9SMa4xFTqKpnr9sGHJn0J6Gn2L03IM4ua3hdY3tZ8Fo6msd7TzCDrAWljMjrwv5IEwPqsTzQUokoz4iBi5fCEunpt4CYHWiJjgE1zcmsyUlz3sR9nEhF4SpPEw1uXPu8V+ZDMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029367; c=relaxed/simple;
	bh=0tkmyGuP2QU6KrjjYoiycUYEGS0r4gv3y+hrr139GCI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=e5OAHU7wdgVf0XJWURmts1Lkr161x0LYh7hsaQMZGlYzMg4+I0nWzS2eYee/RptF7IHRPiavL4kWy+ozwzhDlrg22dJMcaS/IsKBP1y5GDNxcVnpdERlgFqxpKRWu4q30Y5t+lQQHMto98r4Gc6CY1Tt1lFQpCUo0+iY81CMZds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hks5eLve; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hks5eLve"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoF1rs0b8GCg+0wrbF0/D3+UPHnbE0ogMol/WQVYPQ/ExKVjtwx34dK6wU0049J81Wm5JTZwThxjU30z3OVosejHrGC9uhErWib2uPoI5AXbw+/M+Unyvy+bO9gaxes8zvN2oqfjJdCWPrDihGOBmjVPoXkswyeUxmIIQ9PFkz+hMqN4svJwpzDqaISSgcAqlhMQThOO0Yyus3pLEcby7aHjbRdNOFQD07CTMBhDTA0FkUVA/QwZu0/67pzyvIMUrLTLoYBq0JMzDGRdUeL3Wtl4nb5c9i8WQyj5YmQz+Mk98cuxLPhMMwlwemv0yJnRb94jQ6IZOUNTZ12XQt5ewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn4tgKa/1gY0XiPW5QOQcb+gqFFSEOIKNWuttitTVFk=;
 b=PzI+9PNUsGenpYrzjnJemQkc1qd48vMWc5hQEbfBY27ltUH16HpC0J+TRual0q+uZHhNSxJeR6QomABGHAIwpVOu94qEs2XszHgV33juBBOwmcod1n2QX7E1iJSAR64vyesecY/pDiNolT2t1SfBZzPbu+FtDnvG30eHZVRFN/aBl/SfyB4hVVLCnCxEd5JXnBRHprwbeSf6AXOVdgNEOI7XLnkD7BgXeNGWJfq+etCNaaEHpl/g+/VaspK3KOQyANwj4EMP+qCW2dvBe+ayAbt39QYfqakXiMk/RDEORZdC+UudqU0ShTMLhV9jv3G1M1EATMIkUJ1mjdMj/3Kyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn4tgKa/1gY0XiPW5QOQcb+gqFFSEOIKNWuttitTVFk=;
 b=hks5eLveyXHgzHdVSoz5ZRmaMZwZZR/fEFK5xEIHFsMHqCDRXJLj9yIIXXqRPvEs1ElVW+FA9Ks9bteRwunDEuoJBvZs+OWHGZeDAn5gKIZbKhXeifv5Rw9GbCopdsBhwOYHzSFjikXaygZXbpVWxhhM6E9jYZJvcAuHNmw1vgNDTawgff/KDN0adTTBNewbD2YwSqdT8eflMz7pDigWoxYdXZExn87DwKlp9aMtz9BxQhT8/J4FDWMerUEb8q4CJiB7ucs+5OFxjZBWIUxC0HWPZh9nd/R1W4uAvUcSL5+/D4WFzUh9GEyvh3n5mgDpsSwabnLCYI7f5J29pf8Ryw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:09:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:09:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/9] gpio: mxc: bug fixes and probe cleanup
Date: Sat, 03 Oct 2026 20:06:42 +0800
Message-Id: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLvwGoC/yXMQQ6CMBBG4auQWTtJW6SJXsW4gPEHx2hpWiAkh
 LtTdfkt3tsoIykyXauNEhbNOoYCe6pInm0YwPooJmect8bUPEQd+bMKyxttmCPjfBHxzktjQSW
 LCb2uv+Xt/neeuxdk+n5o3w/nUIz8dAAAAA==
X-Change-ID: 20261003-gpio-mxc-cleanup-e49cc626c51e
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
X-ClientProxiedBy: MA5PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 87119eed-d615-4957-9892-08df21472812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|6133799003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	zo+BHp9abOr5BhPGa8eP7OAyyVbCUf0X5B9fVC0lLyj4xTePF6FOVmxOl4sxjA5WqevFkUnCSsPOdt88085zbsQmPHSS2py3geQL5eVybD/rhmsvr9MJbgzVZQHBjgwytj0c3YrAFY9AwWbJbQG6C6Pk92nug8HsdoKAh4syjD+I3jUggjg1ptWTlt7nLfyGK4LK4O6PX/eSqGmS2bNma4bTyJAxhOz6+ahFvsLhAlmGBEyQOX5YFsYRL4GFS/3nTKc/9hWrXG5JFfQF36jSYx8ZZm5B/DMcM3GCnHRGKrn20J5etKeI9fZBBeKwL5JVgu0SX01jGs8b0wrAnOCDM+c+kkqcOe5ApzwCBiL9xQaOvOKBTyGdMAl+5EBDJ8GJRQoP+yXUTQ3auO7Jvnr4j3XZ4m4s8wTFuZApnl2GD9vgHTNe1m72bG8IF7SRwxgKKygRA1Q7tSAsyLL5llgvO2v/lmLLKcD6Qy4jOfA4nYUZiOBJ/tUEgEr2ZoczusrjK4mjkBZH7uL40teDd1MK+eZxRuB75VwjvNyGWtxUQ0JA292OwpR3LXCaXFWuDq069r0L8mt0yv630MBsrIHGRR6yRO/bmegHGElhroHkXVA/Yelpvh/deozjWCkjdU2BzqpvESsk1HntmKx0OJ9I47kldWINUUZzk3yDH96o5dc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzRGcUNtcm95b0poZnZuMTdPTHpvWUtBWU53OTRJZ1JXWXorZndEd1AxYzNr?=
 =?utf-8?B?TnhCSDJ3NDEzOXJaZWJlVW80Q0RJaHhBaFdLOEVrWWR0R0NvRWJOVVRLZmc3?=
 =?utf-8?B?NzBGN0ZSYURhUnpCUHFMcFhkRXNvSm9lTjcya1k3QjlsL1dIRUEraXBldkJQ?=
 =?utf-8?B?dUtVTkhoci9LblR5akhOSGJGZFhKclJsVTZpZ1UyVmhHdk1mbENwSldEODlY?=
 =?utf-8?B?SW55eEJEWmtCTnVOSUV0Y2pRTzJHZkczZXYrSk5Oa0k3L1FhcG9BMHNwWEtm?=
 =?utf-8?B?emRuYXFsT0xRM3dmTUp5U2dOYjg0TTRCQTBZeTQ1MUtML1V6WXN5RXpHeWFj?=
 =?utf-8?B?bWNTZmk2aWVRVnZXbXdsTG1CeE1BMTc2cU0yZUNCVG9wOFp0NnFlZlJWMnZR?=
 =?utf-8?B?dzc2c1ZmdnNvSE9WSFF2dnp6OUNCYys3QU1PZ0ZDbktqNFFzeEV6d2FnSVFD?=
 =?utf-8?B?b0FMVFU0dktGRzI5QnB1Q2JtV0pXdit4OFJGU1c4eWtHMzAxRStVczY3MnpZ?=
 =?utf-8?B?SWw0ZUNVS0NDTCtXcDlaMktxZ2I2R3lKQnVCMy9YZlNtZnlybC9RQ1YyTkxE?=
 =?utf-8?B?TWNMRFltUytCZTl4TEIrSDlRbkw2aHlTTHZYdmtnYzJ6WTh6QXd6Mnp6SUFz?=
 =?utf-8?B?QUhZNUR1NTg0WU9UTGpIUGFuZ20zQlREM0ZPRjNiY2pkNFN6eGJXVTczYzJO?=
 =?utf-8?B?VGFDeCtwTWJJRFBOUTJiT2RlMTFLUkdXQlpjWWkycWpLY1paYUQvOXFBVWg4?=
 =?utf-8?B?ZERUZkNnTWpMcDBFNktMSmEzWDRCWC9IUUlZVWcvV3VGdDFHeGZNN21uVitC?=
 =?utf-8?B?SU9QcUZQVVkxYmJ5cGd2d2UxQzhrV0MwYmJVZEZRODVsdStZSmRMY3JIWmJv?=
 =?utf-8?B?ZU55YVpaekRFUUg0ZlpzSVFqUXlvbjQ1cDh6MHdYMXYyT2JNY0VXT1dLQitP?=
 =?utf-8?B?azg4b1E0aVhERGJidVgvSW5DT1ZUTFZpa1NmUGgydlZ5eng4bjF6UnRVYkU0?=
 =?utf-8?B?N2E1YTl2S0ZKYlo5TnhZNXZqK3pIeDdnUzByNHk4N25CNEVBV2JnekxreUNy?=
 =?utf-8?B?U1hsOWpZVnlQb1Z6SGVFWENaMFpFSzhNSzk5U3FNSE5HTWR5YmRJNzk1cHpI?=
 =?utf-8?B?ZkR3azI4ZnhzbVVIamY1ZUk2M2UrYUNpNEhtcjZYb0loNkFQTFg3NzkreEdh?=
 =?utf-8?B?VWd2TW9mYTBXMnFzMzdYTDdpQjZxZElqcnJ4YkxpMWdBYzQ1OTFISE11ZjFN?=
 =?utf-8?B?cmpoMXBYSndpaHovSFFQY0pvMXd5RnhaUzd5OU9kNUg4RmU1SHB2ZXlqTDVY?=
 =?utf-8?B?R3BGU3gyVEZ5SzdiRksycmsrVEIzeFFNRTBlcTBrdzFCMmF2OTRja3RPZkJR?=
 =?utf-8?B?NiswRndNR09JYzRQakVyNVJMWHMxOCtvSDhydFgvK09aVFFZcGVjN0x0VXNB?=
 =?utf-8?B?TjQ5MWlxWXpUenhjQzQ4cFBUdmpnTFdadi94Nmt6MzRSQmNNcGp0Mkdma0t2?=
 =?utf-8?B?QnBFQTRUdVkyRmhHQjlXZFJibXZJVVhzR3RxM1NLOE56WnVadWRHa0FITjZN?=
 =?utf-8?B?Rm1mMFBETHo3VExlUkhwZmdxVkdlcXFMck1UMTZqZnlzeXc2SG9UendRdktL?=
 =?utf-8?B?SXlvTE1LUlBybnpaMUNiSDRldVRzSnNtalIwU2RiRnVzYVRZTkJ2cTdrYUln?=
 =?utf-8?B?aGpQSitUbmFHMExnRmJYVGZNMXBzR3EybTR5SFA1MGFxcHltNk0zWEtzREd1?=
 =?utf-8?B?WUp4dDhqeVNLWnU1RFZDZXZnbUNFOTdwWE1mZkVRTTM2Qkt6US9oSGhRZEVW?=
 =?utf-8?B?TUhwUXZOUWpXWGtlcnFEZTdzeWF1dUFjM2NrSFpleC9YSkNTMzRVOUFqaDF5?=
 =?utf-8?B?dDcycjRmQ2NWa1M1T29Ndis5VXZIQlhpcFZFMDY4YnJrbVV2TjRpT3hJbUVl?=
 =?utf-8?B?TkREY1NJb3VqbmpCQ2RvSWM2SEV3alFtbkdORXlCbWRKMTljcCt5a3ErU1JM?=
 =?utf-8?B?S2dJSnVxYWh5R0cwQVA4NHFTYzV4R0srSTIybEVsVzBFZVNUWXVJa2IxRjhV?=
 =?utf-8?B?K1lRSmFnK3NsUTJ6d2lYMUVFTHlEZnJIcENlVGFMR09YVHlnMlZ2eGNnaFBs?=
 =?utf-8?B?N0FCVzNKSXFZSEU2TmdCc2Q0ZmxGN3ZzQWZIQlhiSnl5dS9iVjJUNUR2SSts?=
 =?utf-8?B?YXVjNHVYSTlLTTUvZzZNdlBRdGxHQi9iSVNibjErc2dhMnFhS0ZUL2tJaG1n?=
 =?utf-8?B?M0pPVE1vTGhjUVlneUt2NmM5UWRtK1NUWDdOVUplTlpscGlWTEFWdWxQWkgr?=
 =?utf-8?B?NTZvU0FraUUzTWZGOXhVWmVrZWFIWVltZVREZFMweUtGb0REd2NPNS9ZUlIr?=
 =?utf-8?Q?LfLthy2XO6enGGWZW5iB1nLmq6hktGDZeWC/A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87119eed-d615-4957-9892-08df21472812
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:09:21.1419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTj8K/AQGwPrxZWfOHzP1DOIMhtunk+7RuEYiA+AzJwAJggWtsPzHiC6BQRN6T1Prn5YunP6KeAEErWFvggtZntxj2i0KL91uhMZX+RNIVoY4VSNxYXxNTn+FV8BxzJl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

Two bug fixes and follows up with probe modernization and bitops cleanup.

We not receive bug report and met issues during our test, so patch 1&2
are not critial for now.

Patches 1-2 are bug fixes:

  1. Fix a race where the chained IRQ handler is installed before the
     IRQ domain, generic IRQ chip, and port list entry are ready.
     Also fixes a latent use-after-free on probe failure paths that
     never unregistered the handler.

  2. Fix wakeup_pads being typed as u32 while accessed through
     set_bit/clear_bit (unsigned long *), causing adjacent field
     corruption on 64-bit platforms. Switch to atomic bitops for
     concurrency safety and fix the disable path to preserve the
     wakeup_pads bit on disable_irq_wake() failure.

Patches 3-9 are cleanups, each building on the previous:

  3. Cache of_device_is_compatible() results at probe into struct
     fields, avoiding repeated DT string comparisons in suspend/resume.

  4. Use devm_add_action_or_reset() for irq_domain_remove(), removing
     manual cleanup in error paths.

  5. Switch to devm-managed PM runtime and dev_err_probe(), eliminating
     the remaining goto error labels entirely.

  6. Introduce a local 'dev' variable and migrate to
     device_is_compatible() for firmware-agnostic matching.

  7. Introduce MXC_ICR_REG/MXC_ICR_MASK macros and use
     field_prep()/field_get() for ICR register access, replacing
     duplicated magic-number arithmetic in gpio_set_irq_type() and
     mxc_flip_edge().

  8. Replace open-coded '1 << n' with BIT() throughout the driver.

  9. Simplify gpio_set_wake_irq() using irq_set_irq_wake() and
     assign_bit().

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (9):
      gpio: mxc: fix race between chained IRQ handler install and probe completion
      gpio: mxc: fix wakeup_pads bit operations for correctness
      gpio: mxc: cache compatible checks at probe time
      gpio: mxc: use devm action for irq_domain cleanup
      gpio: mxc: use devres-managed PM runtime and dev_err_probe
      gpio: mxc: use local dev variable and device_is_compatible()
      gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
      gpio: mxc: use BIT() macro for single-bit operations
      gpio: mxc: simplify gpio_set_wake_irq() with irq_set_irq_wake and assign_bit

 drivers/gpio/gpio-mxc.c | 158 ++++++++++++++++++++++++------------------------
 1 file changed, 79 insertions(+), 79 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261003-gpio-mxc-cleanup-e49cc626c51e

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

