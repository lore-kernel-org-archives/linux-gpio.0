Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF984A092E;
	Mon,  5 Oct 2026 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210256; cv=fail; b=NRbo/1xflbffemJvaOsz0nphWub8iqu/zNh/AcOLEq7kLfYq1z9X/MR5ASEdyIMJCv7byV65Mt06jrnKmmNXeTwfEz9/iukxxHdzDDDxUvoy6IvMtPaV9Fzy9p2v3OGKpBba9mQNZTS4AGbK06ObWKdHHDjCohoaGbygUmy0Br4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210256; c=relaxed/simple;
	bh=lEXs3tZRqqvt7abO4f65AhVZaEQ0Zri9LiINZiDtUBE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KnRUUN8L5IQKbg6nAXN3S1AEBRltxlaBBwiiYjKMRGiKldb29IhEv+ZXtzMlcHesB6Pbac5w0HHcsH8P58v1m1WKSxzvkZr/VmFCkUe41UGVmA/p4MGGQsgn+O6xC/NNfOusxkYwktkZFTH3ZQPi2LD8Y41hLrnOPW9w6USEIeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HvT6lLZX; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HvT6lLZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acV2UQ4mn9kWA4zzWRERUfnEX51Cb2XbH3YmSoQv43c1k7ioGcYp+uMORu7sGGMKHXUPOf8kUb0iN5NDA1XMSH+SmussEA9M3Kn6MXJqxm3GNZXGa95maBrCmo88PaFOL2zgj3ZetBImOR9i1ZieDV17ppq1UgCA4uVfuoK/5VKYI0OmABqh79I27HX3ta19raCDcWNX+H9ISPaEfwM1ZX4n0Z549p4DBm2pQWtmBSXYUfGTvGe5eKO/jHWm7Hlbk/sxihXLc1Dhfxu86hd70qt7iygELIR8IV6S0MVinJxNZETCckjBRNFem8kWKcuKZ8Tasw/Fvei7f9Y7I84rcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc2rUHlJxtd8j+9V/3xuf7YY7Ft7HbFxWLj8K/tnbvo=;
 b=Abc2N6qFOqtocbElmObipICkLAL+goRxzhUzfLqARfMcHFfPj24j4E89PRiPB3deOfxPIRScQRlG8OlL8W1usD1WiHgGTf9JO0xbajQj1cfqbf6fqaAJSfqOH95mznfFklGXny0S/AdUQ3GyEn4q0pUNVhwFuueYEhcHaj+UBWFaBesMs8r4hO7O11yXiXZS1wlt3oq+GdiQYk1v7cqt0C8sdQeKi0m57Ls+abTUbdKgv6aBMCZm0p9xLmxz23o6+VuFcRcImH/Zk6BnQ2pFAlStp7e13ZCXgVD8uT2uXOGjAOX0jT5HLQPPDOrcYXmRR7rlmwAMfYlrKVNcqb5XHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc2rUHlJxtd8j+9V/3xuf7YY7Ft7HbFxWLj8K/tnbvo=;
 b=HvT6lLZXWdofJFEi84g/rs+zwL7buKLYG9Ze9CcbCIBGh5sszL2N/L/qTCzpsX6TU+6xzHloRPM7+2MmY0ykbu+U1v87CRCnbjvIUz0TocbG+oHpM6Gy9ZcOgQcBQvGk7vraMrdIkTQ0+ICswzRFiOMTMdDVlHYHuuojnuRFwigwuibk5ICorWOvKkT/NHbtggqbO+/dLElA9Nu2SF/AgnIOvEmK6UHfZwopQoSm5fO3YsnEV/I8I72cmcwXFJgERpkDAxgP8o6huo8USdqmiMnSNdHvZtW1IGPamX9SjgAOauiW45xfJMfCHm9VCqcXnjMx030yBmX5UKABuwltow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:24:04 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:24:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/9] gpio: mxc: bug fixes and probe cleanup
Date: Mon, 05 Oct 2026 22:21:21 +0800
Message-Id: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGGyw2oC/32NQQ6CMBBFr0Jm7Zh2VFBW3sOwwGGAGmmbFgiGc
 HcB9y5f8v77M0QJRiLkyQxBRhONsyvQIQFuS9sImmplIEWpVuqEjTcOu4mR31LawaOcb8wppXz
 RAuvMB6nNtCcfxY/j8HwJ91tnM1oTexc+++eoN+9PftSosCqrjK4slNV0t5M/suugWJblCzurY
 JLAAAAA
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
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 68045d94-074d-41ad-7e1c-08df22ec4e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2XYMujmO+qvA4bGqMSnQrPMZWil3YnjdL91q1A5Y3KLXouaBK6dZtTXVu286toX1IHtJPhvNYqkqrPhrXHp2n/DkooamFeMTPN0KUs0Tm88d8PAwftiFsliDTlREmhCjC3b6XX27BZDjZubNZzvEFGHeb65NYlvBhN2lzcMQuZWVEoOJpDeejAW5GPHSJJGGuBlBIZS4+enG4Nd0I/Oili6PqsusPpEO21FI697Ta5bas6W5fDNR+ByS5WYpS0oSD+rLxgF6qMdb2VmZTkDJqYky4c/ExaEOvx8TSfORYhOvG1dQ7D6DFJ3puwwhE1rCPHIYXIVtQ0yrZF1hatA7te/pJeQ9xBOn5DXM+FIBnNUaJPt2FelL1TCXxq2bI+Ej0rGRmhx69y915JAcEPonR86XkwMLV+zn8N7LawgZ3L9fSvlDlgbD+Z5pWc3KifCfOjeVlz4MjfrGbYW7eUQTMGaE0XyUDfKP0S5nWQHDXi2yL4BgHP4fMyKLkpJxzAMDRpiIHgEOsH42mCvRPUBDM6990DRaS7S121zhE+9+iErX/CNfOi7uMhApK/vV7JMy/NWuPledbt41Zo0i6Eiw4+SJe/G53pN9VquFKSoaQwswsB7yN76m1pPDJH94qbko
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJYYUpQaU5BU0QzMGJMVEllUERFQTBDaU55d0t5V1hpUkttMzlNNTNqWHlt?=
 =?utf-8?B?dllvcEpVUms1VG1oc2NEdXFOSmJyQXYxWklMdDRwWDUza3N5OW9Sd2pyZzcv?=
 =?utf-8?B?OHcwTzAxcXJSZS9UYVFhV1VOMCtpdTlhNUhxM1I4eDRlQldVYTRDUXU3a1I1?=
 =?utf-8?B?L1NNSEtvVS9lYWNzY2lFeVRrTGthQ1drSzdrQ1Z2RXJKcHNyN0lSTjJWdDRZ?=
 =?utf-8?B?MGlJRXlQTThGUU9zNmVEakN6R3RPbHRkL1RvaEg1Y2hITTBxSjMxUWNHK1Qz?=
 =?utf-8?B?NlBaTFFxc0xXak5NcTFYMnlmM0NsMlU5dmhEVnJwYkdiY3ZFZ0duZjg5dk9s?=
 =?utf-8?B?aHlIaFBSWkpsbnBKRWRVODlKcjNjL1NRODlteGJPSmlYZzBOd1N1VXZ3NVBi?=
 =?utf-8?B?RlBLUlI4bTR1T1V3emx2WWU0M2xGaXU0cDFwVndGOWtSc2o3TFJpQjJkTlo3?=
 =?utf-8?B?a0t5RW5GU3FHeUVpWjk4a2ZoNjhyTzgvRENZT1BUY1B4eG03RnVxbUYydU1l?=
 =?utf-8?B?YktKTmswZFNLRllGd1FndGpvMVV0djlLK0FOUk9UK05MaTFWamtBL1ZiNklP?=
 =?utf-8?B?emZiaERRNUVFVUpGUGxneHdBN1FIVktETko5SEpQclhXTXJHcHBzMkNOT1J1?=
 =?utf-8?B?RkNXZS9uK0RweEhvRzZvekozWEJyV0VObHY2Z0hNVHovaEpkN09WQWdDRTZy?=
 =?utf-8?B?azRrbDMxRUltWUtZeHY0SjBIVnk3UTBhcGQwUTdkZEhlYnpOaVp0bWYycFFm?=
 =?utf-8?B?cGQ3NSsrMUVlWks1YmJBK3FRQXBjMng3T3l2eXRwYU92c1ZkV0hDY0FWMzhy?=
 =?utf-8?B?aG5NOXBLUUZrNldENUFPdEFhSlNwWnl4UTZwTHZ5VmVqU3lEdkRvb0E4N2N6?=
 =?utf-8?B?SHZ6c3ZpL0pqL0o3VzJBSWRCVUxSRVN0bWVFTHQzRVBzaS81aGxaM1M2U0NG?=
 =?utf-8?B?R1dBUmZMRFFOY0FxQk5ZbkpXTzlTdHdHOEgwYVQ2dGo5KytWL3NsendiYXFt?=
 =?utf-8?B?RmxOeldROFgzUE1WcVozMmo5MWFEZGwrWjdHaUZRcWNXWndPYXQ4U3g3Ykxl?=
 =?utf-8?B?Vm1NZXNhRWVTRFlEaXNoNk42QW5jeGJFUWJLbXFHSlMvdzE3NWRLd0dPNkps?=
 =?utf-8?B?R0ZVSWloNjRPVDlNZHh3YThlbTNwUWhiTmtZZ3JkVnlhT3dFNEZPS3FlY0dq?=
 =?utf-8?B?aU8zVVRmaEVpc1JsdFVGb2RuVUlvZEN6NGY3R1VNV2xpUEgvQ2tvbkY0MGQw?=
 =?utf-8?B?bHY2eWpVZU1Ec0E5MmdYWjA5K2tNS1Y3YmhkOTBTaTN1RWNrVEJTcGltTU9F?=
 =?utf-8?B?Y2ZhRE5lU1VndmVaeUhQc3U2dDhiM1FmWEg4Z3MrbnZFdEZkK0NXUys3MDlr?=
 =?utf-8?B?bkxZSTRXdHFsYWhBS25PaEN3RW1Ramd0T3NXUzFsUGVZaElQMGExZFBlYmhG?=
 =?utf-8?B?Z2xSaCtDSm5vYWxWRHpFa3NhY0ZqSC92cHA2NDhlMnBnbUlLaWZFaUVIOHlw?=
 =?utf-8?B?cnRFSWptMG50MkpjT0gxRDVzQmF1bVozOER1TDBMdWtzMk9VMndlM3FLbEh6?=
 =?utf-8?B?YXMrdmNqbERsUGNlaEZwVmNKVHlwMFNzTmlTeXBPNlpMWXYwemNOV29rcU9X?=
 =?utf-8?B?MUdUc1E2MzVKZCt1U2lDOTI2a1dYazQ5MFdKSGhaM1NjamZhSi9FNFN2bDRQ?=
 =?utf-8?B?SEJTcmFxeFh6dm51QWpiZHlIYnNaMk1oUUFpTmxUT2xmUWxZU1l2MXhtWlNr?=
 =?utf-8?B?c3RkYThuZXZPd2E1cFBXOE94WjVLUzJlQXc2WC9ZV0YyNFBsRFpsaU1zR0U5?=
 =?utf-8?B?dEhPakJnbitmTXpCQTBnb0N6VEdKMmxXeTh3US9vUDFCOVJjZmhmYzdsTWww?=
 =?utf-8?B?VkdRMW9jZFlZa3lYOFNKa2hScmx1bWVkeWd2VFM5d3JxTk1PZExjeDNMUkRp?=
 =?utf-8?B?YUpEN1ZnV2F0b1FJUkNZOWtJd0xVV1gxOHJJVmo5MXpkUm9mQXo1VEh1WWpO?=
 =?utf-8?B?VjFSOXllOGZSazQ3TGVTVzcwdkgwTFFTTjRuZnFHUnpjTFhlcHBzem1VdHRX?=
 =?utf-8?B?eTZjelRNdm1MS3NDOGNRSmgyYVpUc2ROemZlc1ZpMzZManBSeFYvaWpZY0dQ?=
 =?utf-8?B?bjQyK3dHWWlqV3JoajFRZU5NdlAxaTZ0YWNEYU5YWG5Jb0svZTJYdEVzNVoz?=
 =?utf-8?B?aG1xTmhzbmFHQ0EyZENlakpFYUNBY0hBcExPVFFzajBESEpjaEx2RllVU3d5?=
 =?utf-8?B?RUxVdFVvZmx5TlJGUnV2SVRLNVNIWnhJRWtGOTAyRlFYT0xlZkZ5R1I5NjRu?=
 =?utf-8?B?cHNKZXd1ZDF5MXVZczh4ZXRndCtKTFpldTVvMlZpS3dSdnV0dXhYTHlEcVho?=
 =?utf-8?Q?3dxrHDKH3P6CKfFbE29LUiH5H1wt+p1hJUMeu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68045d94-074d-41ad-7e1c-08df22ec4e89
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:24:04.0541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmOJ1d4sNBOROrrkWsDfDcJPpHRq7gZmReRQ+paVJHFVNWGxcEuJZRmN7fdnWx0Uwg/LAnLqKFEB3u4/rovoCXw57HV7SsYUneKd6clzT4uvxDEzWClr/KIyUeSVsxX4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

This series cleans up the gpio-mxc driver in several incremental steps:
bug fixes, converting runtime state to static per-compatible data,
modernizing resource management with devres, and cleaning up
register access patterns.

Patches 1-2 are bug fixes:
  - Fix a race where the chained IRQ handler is installed before probe
    completes, allowing interrupts to fire on a half-initialized port.
  - Fix wakeup_pads bit operations that used wrong set_bit/clear_bit
    logic, folding in the assign_bit() simplification from V1.

Patches 3-4 replace runtime of_device_is_compatible() string matching
with a flags field in mxc_gpio_hwdata, keyed through the match table.
This moves all per-SoC differentiation into static data:
  - Patch 3: power_off flag and MXC_GPIO_HW_DATA_COMMON macro.
  - Patch 4: pad_wakeup and imx8qm flags with dedicated hwdata instances.

Patches 5-6 convert probe error handling to devres:
  - Patch 5: replace irq_domain_create_legacy() with
    devm_irq_domain_instantiate(), and the open-coded PM runtime
    sequence with devm_pm_runtime_set_active_enabled(), eliminating
    all goto labels.
  - Patch 6: switch bare returns to dev_err_probe() throughout probe.

Patch 7 introduces a local 'dev' variable, replaces
of_device_is_compatible() with device_is_compatible(), and swaps
linux/of.h for linux/property.h.

Patches 8-9 are cosmetic register access cleanups:
  - Patch 8: MXC_ICR_REG/MXC_ICR_MASK macros with field_prep/field_get.
  - Patch 9: BIT() macro for all single-bit shift operations.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in V2:
- Reworked compatible-string caching (V1 patch 3) from probe-time bools
  in mxc_gpio_port to static hwdata flags with per-compatible data
  instances.  Split into two patches: one introducing the flags scheme
  with MXC_GPIO_HW_DATA_COMMON macro for power_off (patch 3), one
  extending it to pad_wakeup and imx8qm (patch 4).  (Frank, bot review)
- Replaced devm_pm_runtime_get_noresume() + pm_runtime_set_active() +
  devm_pm_runtime_enable() with devm_pm_runtime_set_active_enabled().
  Keep plain pm_runtime_get_noresume() (non-devm) for the probe-scoped
  reference to avoid usage_count underflow on unbind.  (Frank, bot review)
- Replaced irq_domain_create_legacy() + devm_add_action_or_reset() with
  devm_irq_domain_instantiate().  Squashed with the PM runtime devres
  conversion (V1 patches 4+5) into a single patch (patch 5), since the
  goto labels cannot be removed until both resources are devres-managed.
- Split dev_err_probe() conversion into its own patch (patch 6) for
  bisectability — patch 5 uses bare returns with correct error values.
- Folded gpio_set_wake_irq() assign_bit simplification (V1 patch 9) into
  the wakeup_pads fix (patch 2) where it belongs.
- Used 0x3U (unsigned) in MXC_ICR_MASK() to avoid implementation-defined
  behavior when shifting by 30 bits.
- Replaced linux/of.h with linux/property.h to match the
  of_device_is_compatible() → device_is_compatible() API change (patch 7).
- Added return-value checks for devm_pm_runtime_set_active_enabled().
- Fixed stale error code returns after devm_irq_alloc_descs() and
  devm_irq_domain_instantiate() in the devres conversion patch.
- Link to v1: https://patch.msgid.link/20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com

---
Peng Fan (9):
      gpio: mxc: fix race between chained IRQ handler install and probe completion
      gpio: mxc: fix wakeup_pads bit operations
      gpio: mxc: replace of_device_is_compatible() with hwdata flags
      gpio: mxc: convert pad wakeup compatible checks to hwdata flags
      gpio: mxc: convert probe error handling to devres
      gpio: mxc: switch probe error paths to dev_err_probe()
      gpio: mxc: use local dev variable
      gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
      gpio: mxc: use BIT() macro for single-bit operations

 drivers/gpio/gpio-mxc.c | 262 +++++++++++++++++++++++++++---------------------
 1 file changed, 147 insertions(+), 115 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261003-gpio-mxc-cleanup-e49cc626c51e

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

