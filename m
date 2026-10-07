Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE1B47276E;
	Wed,  7 Oct 2026 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370091; cv=fail; b=m9lJ/j/LzZI2YCf2xHASLxur7Tj/m3F6BlMs7zGiTBTfTNYWDYgkWTcpp0gCQxk4E1b+gJMzsJYksedQBh9ydfFmm+MnRmR856H4wK+YUWt4dBKUmoqhDOxWjBKvTaK2RxOD1xYKSFABOHuQ30NuMIIv/GLAViBlKP/7IYlQhbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370091; c=relaxed/simple;
	bh=KF5BGdibTVvKMWOwRgJ8WvqSCoanCvnrAhr9dtQLK3o=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=tRJ87SnI2Q8KuAjkq2j7PP584Zm8IMlmwJ5G+fMGWLfPRIJYUeoGnTHMBsPlSOpLTmk7iQQPTQQo9BbZ5tA8WxFu+eroJi+UYb0RJQCbbnEjdvP6OKIs73oIdTovGmyinatDmUDosYjXekbbUzelazID9OlzjVCJaDZ774cjgSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KSppdllJ; arc=fail smtp.client-ip=52.101.83.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KSppdllJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTk+pn3/YAWJ+603wWq3hKNzaJtRQlag1zUTS538zzh6rgLGSm5Ow6GGgJ8yx5y/l4pouK0zI/TdwqEx6CwFO1PTZaU5bYfZ5d1WdnA52kKn9zcyA8qP8WNUNZdGKpzHpfBf3hu4YMlqCEJcpAn9N8x+rQ6T+uZVGvyUI0OlsAOOGZKyIwICtSRwI+nJLD1g/SdGi0L/sP6TfK5JPlq11pMOdn1YThQoeLohdeWUYdhsA6ey3FC59BUbudxj3bEKRfdIsAWvd8xu5f3tTEnX2hFGBIkzJeXr+Cn/yupo0jEcCZB8gBP85jNlP9OcAuzjaz+6s1AoL5XDwQgZb7pzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjszH0YvNimKtLck02bqB8mSBStqwZuQQRvWPl3z9zI=;
 b=DNiYfypsqiJr2zSeBgFmQMaFwHf1J59ucKEwV87ByVx9w4jaGmW7EyYaETHhrV4QjEQeFZmP5khvHs1Gx4DPtrsK6t5KE8xyyCf3XwmpP/IGbLqx8LxQ+iTYC2dXeyPUs20ZOylQN8+LlNJxladsRaAvotebmYQYPbkXQCKZduKztuJxrb3H7nBsAlDIPJ7CWOpE/nzhIPZxuGgbVnDczBhHIAPI+8ba9J3S3uUmdiYlgwAePK+62ZlFCKFb0EMXL/kMRDhtRjmB4Bl6iiQ2j07aWywR1Db0t1SOE0OOgjNv4bEcAcOqa9litxWf5yN50L5KGmJ2cOrRyTsUkmJjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjszH0YvNimKtLck02bqB8mSBStqwZuQQRvWPl3z9zI=;
 b=KSppdllJxrQL/JZy520EwT2FcMJkTBk0bQ/kPdLtqE8T5PL+AnswTk6DxTcB8bVhFRwImOF0neySzRSnCT6HaEnzDbxk4zQ4a1yxHqaoGm6Pv7NY9CnPxZI/Ih0hbk4GCimHrYCoMyqvDP5anb6Cv+jKhYWvtzgnlXBs6cP3MiqVlkB+6TsjCI2a6N7/kf9bTtXlQoQ7CSEhuM1L90HGoYdUia9tEVxLEv3ShaM40OszukRM83ia8kY6M/2YS6iU75dMFGkdXGnMXp2Q5HVg5KZ7oqyW4aeokBmgtyxYqV46EhwDWYAFNJcSRXTVOxTd7w05WJVRAAlC26hjFX/BqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI1PR04MB10028.eurprd04.prod.outlook.com (2603:10a6:800:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 10:47:04 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v4 00/10] gpio: mxc: bug fixes and probe cleanup
Date: Wed, 07 Oct 2026 18:44:15 +0800
Message-Id: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH8ixmoC/32Nyw6CMBBFf8V0bU07vNSV/2FctMMANdI2FAiG8
 O9S3LAwLk9yz7kzC9QZCux6mFlHownG2RXS44Fho2xN3JQrMxCQSyESXnvjeDshxxcpO3hO6QU
 xhxwzSWzVfEeVmbbk/fHlMOgnYR87cdGY0LvuvX2OMu7+5EfJBS9VWcAZCYoKbnbyJ3Qti/ER9
 nr2Q4dV1yUmqtI6yWinL8vyAWNHQBv/AAAA
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
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI1PR04MB10028:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb92ab9-cde0-409a-603f-08df24605348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|7416014|11063799006|56012099006|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	UUpa0idSYctXgD5FKYGa9cTS7JXQg7gJUakwSiXLoOaPMl1ZsLiiaQqEeR5Uspf/u5ORbO3++OAfCfd3RsqlBoEzxGwAs6V+szAL1W3JaAoffH75UOJ972WySs4S7OStL7jI0u0q/P0vdp+g6A1nwSJ2JdATJdGIT64Sh9ERoON35EZxG/+73dWl0GeG1WykEuawfpnP6L3Ri8wDZ4CO3J9odtbGg9nb/bTKsY1T5i0xP0RE8n5Vfkf5FZRia0loaMArUSgDaFUT4yUpY0lQO2wxd78Ghysh+VvWu46w67zi+YLkBbaZ3cQ/nRwxTFCjtRui9jNeWqJSzGdS7sUjQyHQtUR7ulFnsV67NtGVBHDMwvgYWVCPxILF/mjYA+JyYy4HCKBtdFoDlCKpwsjzsdcQfldc96z0wyxATmHV17blCGdRNqFisoYZlNR7qFwI+FM9CaBK6nIG+JkZaDE7LMKtXlUw/tSeL1n+aaKZ4MP+4v5rWEBQYCv1o+ruQqg1GwE/Awut5Ys7StzUjQuAlAHsupcStzhr0WaAflLx8hF4Aa2CAUuFmvMowpQSxUIy3LzMLqFDWklGuSlW+bTiJZp0bEP+tVD5C6lOV28OKAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(7416014)(11063799006)(56012099006)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1E5ZWpoZ09NZE04MEEwN1pNUExmRm50L0dOTzMwd2lmOEFDUWZUb2dhSVVV?=
 =?utf-8?B?c0VqWUpsVVdqUHFDd0t2MnUwNVhwL2sybENwSEhkU3FZbkpYdEFLZDN4dytx?=
 =?utf-8?B?S3J4YkxCUk9FeVp0SFRoUVVja1htWG8ySUQ1QVhzbGl2U0ExVlpCYk1Ic3ha?=
 =?utf-8?B?Qit5Zk9lQ3ZIOVlyMjdMREgzS0J3Q2FTSHhCSDBEWVFxUjdxV09idmlLMDB5?=
 =?utf-8?B?NzhJemxyc09OdjNEcC9LRjFhNWN5aWdJd01QVmZYODhpeFcwZ1lZaGhMbkE2?=
 =?utf-8?B?SGVYZzlnZVllaGp3VHZOZHhXYVh1RSt2K01UalIvcHkyM2hPQ2pwN1JTQ3NS?=
 =?utf-8?B?UHF3TW1SVUl3dElpanZmUFc2bGx0MS9CVUt0VitOZytVakVLV1JmdlVwNGVk?=
 =?utf-8?B?UE95WER5YXRJazJHUzluMlNLbWZseFF1RXdEREFnTDdlU3JReHdpZ2xSSmhT?=
 =?utf-8?B?YXUzejdvbFQ0L3g4UlU0MTRXRHMyUnVGbjQwOUpRSEZ5MFo3bVl0a0dKSlFJ?=
 =?utf-8?B?SUtPZldldWdyS2lyb2JUMHRQVVUrZjlQekdwNWUxSnZiblliQm0yczVlcnlV?=
 =?utf-8?B?a0FhNUxoa1kwMjg2Wm1nVmJsK2FNK1UyOUc1WWhHWWNqM2c1NGd1c2xmVUhu?=
 =?utf-8?B?NDZZaDdyWHVmcTFzR2NSbXRKV1BTWGpQYW9QcExaTjZsMytML1RlYVJCdDYy?=
 =?utf-8?B?OUp4cDV2K3cyR3R1SUt5a3QyYXVrdmtrU053UVQ1YUlQT3FiU0ppRjNUN3U1?=
 =?utf-8?B?WDkvZjB2eGRtRmVuSkxPNmkrSUpVNzNFbjFUVHhZRHprVW5YMitQUnphSitq?=
 =?utf-8?B?MFI1OVhxeDQydXB4dXN3Kzl3b3RUT0RMaHFPeHNxbjA4bm1VbnJwSFgvMjJj?=
 =?utf-8?B?TnlLN0czekVMcTg0OWViZnRXdWN5Rjh3ZzJmRmhYVk52NzlBejBJN1VxR0xW?=
 =?utf-8?B?Rm5JUXo2UjhsYnU1SVZUSHhkQmJxdlZsMEZHcHZmaGpTTjErMm1NamVOOXNU?=
 =?utf-8?B?QjVPT1g5eEx2bnZ2dkVTZDR2cVYwRWVjNURpeURyOENCUWROYkxqSGxWMjE3?=
 =?utf-8?B?eTBBZDkzK1hUNmdSTjEvc1FlRzJWaTFDbHgrdjVSZVR1ZXVWOGxmOUpWMlNm?=
 =?utf-8?B?WFd2SmlMTDdYSUpwMUVLUXRxb1dUWVhZdk4xdHZDeXBoUmMxaXJmS1pDUnZw?=
 =?utf-8?B?YTdOaTdHTGJhWlFIOS9ZbFZjSUlabHlqRjVuQ1l6UmJPeEhjS3dvSU5YS1ZD?=
 =?utf-8?B?NDRtU0svbENsQzI2d3pqaWNVVWVlN2dFMUpRNEczT0FoMkwwU2tzS20zcW9y?=
 =?utf-8?B?ZndrQ2d4ZEZnWjkrNmdZcnYzV1prcTFGNERFdXczRjl5d2k3NktVVU1tT2ZJ?=
 =?utf-8?B?dXNIb3dwWFh5RW9pMk81NGs1OUxiVVlFTFRGSmpoL3FRWmlhQkdjU3FCWXNj?=
 =?utf-8?B?ZDBZV1c3TWZUMGxHeG12WTlXOTZBNTVzanNNZTMrM0pOcVcwbVBBaG9nODlY?=
 =?utf-8?B?MEYxUEl0NG8wL3dzajc4QzlobFd4dXIweEdVaDYwRWlJSEdkQjNxMHUzQzZt?=
 =?utf-8?B?V0c1eG1YR0IzSkpCdnlwVEZXTzRMdlIxTmpRZWUwNmJ6OEQ1VE9OWkhjbURI?=
 =?utf-8?B?aXlGZzE4eTNzcjRTSUJPWCtKZTNwa0Mxb1E1MnAraGpPY1dFTXRJMXg4bHR0?=
 =?utf-8?B?Z0tQZklkN0NxeDQzakVJbGtIdGhXeW16WXBoeUlMNTN3VlFUOUJOc3dCTVFG?=
 =?utf-8?B?Ym9uLzNQeS9SM2N6YWp0Q3NiNFo3NWRWRkJkOWJpbWN4MHZTeWdsNDNZQ0N6?=
 =?utf-8?B?V3ptQXhZeWlSelBoaUJqUXRvWkJlUnM4d0RxRGVXTXdiY25PVCtKVWgyeWpz?=
 =?utf-8?B?U1VpS3BoSmZsU0c0ekpNbC9KTXhmUVVZWDd1dFIvVnN6Ry9JOVMwU3BWbHNW?=
 =?utf-8?B?MDBFeDZ5ZDgrNWhJcTd0TU5wKzZieEQ0U2RRTW0rOGI3UHBwaEY4dktBemcr?=
 =?utf-8?B?VlNCVlFsNEdhT0VSZ2JmWEdhYnRYaVlsYS9TMFBjTWNqa2prdTZscE9renJB?=
 =?utf-8?B?K2s1RFBlNXJkdWZkWmIrR09peDNxQlh3NmdnY1RlUXh1L0FrZkJhc2ZrQUI0?=
 =?utf-8?B?T2M3cmN5S3R0dGdXWndna0tPei81MFJzdGgvZ3Y3ZDJET2h0QzFia3RFUzNB?=
 =?utf-8?B?bWI3d055WHg1VGJ3Vk1rNHVHQVZ5YytqL1JGVFIzUUxPQ1Jjb3hpZnY4WW9V?=
 =?utf-8?B?KzBuc0x1S0VVUWprQWlhMkxzZDRuZHFxbUxsRWt5aVNqY3VqWEl3Sm5sWTdV?=
 =?utf-8?B?cUdXTUY5YXZwKzluTldPaVhCMVI2NUhTdDJQcUI1bFFSYTM2djdzSUE5b1Zn?=
 =?utf-8?Q?sKrx32/WkeHGzDljACT30ouiQxD2Pu3l0lDWN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb92ab9-cde0-409a-603f-08df24605348
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:04.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHyUkI0x2//oKXMJncRaAINU6SKN6yh8NJTKhsnjxpzCtjmlTdfNYQDdWOFofjO6hq9rM+Tkv1aC9Z8fEhHDOexdHIQmGGxm256YJB3b655IJ5CAqTJ4L1I7bU6l88pk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10028

This series cleans up the gpio-mxc driver in several incremental steps:
bug fixes, converting runtime state to static per-compatible data,
modernizing resource management with devres, and cleaning up
register access patterns.

Patches 1-2 are bug fixes:
  - Fix a race where the chained IRQ handler is installed before probe
    completes, allowing interrupts to fire on a half-initialized port.
  - Fix wakeup_pads bit operations that used wrong set_bit/clear_bit
    logic, folding in the assign_bit() simplification from V1.

Patches 3-4 replace runtime of_device_is_compatible() calls with static
per-compatible hwdata flags, eliminating repeated string comparisons in
the suspend/resume path.

Patches 5-6 convert probe error handling to devres and dev_err_probe().

Patches 7-9 are cosmetic cleanups: local dev variable, MXC_ICR macros
with field_prep/field_get, and BIT() macro for single-bit shifts.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- Just a resend of V3 with below changes.
  Add R-b from Linus for patch 10.
  Update commit for patch 2 and drop empty line and separate
  for_each_set_bit changes into a new patch Per Andy.
- Link to v3: https://lore.kernel.org/all/20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com/

Changes in v3:
- Patch ("gpio: mxc: convert probe error handling to devres"):
  Replaced pm_runtime_get_noresume() with
  devm_pm_runtime_get_noresume() to fix a PM usage counter leak on
  probe error paths. The non-devm pm_runtime_get_noresume() was not
  balanced by any devres action, so any probe failure after the PM
  block (e.g. -EPROBE_DEFER from devm_gpiochip_add_data()) would
  leave usage_count permanently elevated, preventing runtime suspend
  on re-probe.
  Dropped the explicit pm_runtime_put_noidle() on
  devm_pm_runtime_set_active_enabled() failure - the devres
  registered by devm_pm_runtime_get_noresume() handles the balance
  automatically during probe unwind.
- Patch ("gpio: mxc: use local dev variable"):
  Keep of_device_is_compatible(), only focus on switching &pdev->dev to
  dev.
- Link to v2: https://patch.msgid.link/20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com

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
Peng Fan (10):
      gpio: mxc: fix race between chained IRQ handler install and probe completion
      gpio: mxc: fix wakeup_pads bit operations
      gpio: mxc: use for_each_set_bit() to iterate wakeup pads
      gpio: mxc: replace of_device_is_compatible() with hwdata flags
      gpio: mxc: convert pad wakeup compatible checks to hwdata flags
      gpio: mxc: convert probe error handling to devres
      gpio: mxc: switch probe error paths to dev_err_probe()
      gpio: mxc: use local dev variable
      gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
      gpio: mxc: use BIT() macro for single-bit operations

 drivers/gpio/gpio-mxc.c | 256 +++++++++++++++++++++++++++---------------------
 1 file changed, 144 insertions(+), 112 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261003-gpio-mxc-cleanup-e49cc626c51e

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

