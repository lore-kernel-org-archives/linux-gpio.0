Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990364052A6;
	Tue,  6 Oct 2026 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290041; cv=fail; b=L/HvS3avUntHyOn0QJ6l1biLi6jGz+/PEKZ7m9AmziVMiIFLlhY7EtimqACr31JRAfDjwI1qkNrC72KKW7/xln5XqsnQ/MKLFCSYdRBwZA1GyZwkcpu2Pv1VN1N2OqtMKP3rTEwP1Ef5ZKdg5tR5fX9/ql4cuG/KeAs7jJaDITk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290041; c=relaxed/simple;
	bh=+cDciLQyVcJaM9wExKFptrxtk/pEQIRDOJiY/um/VKE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Y2VlJcd2zcb/U6hDO5I25i53bXe/HCNqAQt27pta6LnsXvIIt72htFXFcoojJvFLBtPRis00VUjRfrmV2vKmTwfDAAwPNLixYkTFfFbJDqrVsaWTth07GovNL20pb6bXjK7XnuGfGhQ6iFu3LSQCuQXCw3hHEMf+U0UnepvqFsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s2S5HT5s; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s2S5HT5s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzztNjql2ngym2J9hME3pbflWp47Vf6i8XSkAAEsPOHzGMMimtNtyMaaoMKFCQHmwIFYSaIjUXuL8KrNbj8HGpg0rxGu27sfODuF4gOhM3QaxrisodtJ+oDDD5j/m2unMg0qHyAv7ohN+QFRIIx8M4MMqqUWtNWEtE+GyW+QfMjWSLLt6ha89QZEkl3PC4GhpUBQxNC0eG4+jiwghPEQhVEbzD7FgZjjuPCAqHYyKCET9Mv27fpHq+E5D26ZKxlpWw9D8onMWDNVGdsUma7HqujhNyNxBsGwzRct7sOlYnTd+ZubIac9EfizbFcXf3p8nwjTLFTii72oNmqb9Ns/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHReZPXA3FjFOBXAfrxJXfuSmLqNKi2pbSFwGBm1+Rw=;
 b=hQe6h1L5t6cAhJDiv1u+0hdS8x3rx8ewZ6aIgZjKAncsNiMemuJed6/v5gy9pEV5cWJr82qL4ThpPCERiOPfZ2kxdCKyNKGFkEulF36NItX0Ru5A/plulSTxnfJnWUtdMvIsQrOOOuCEh4002ugcai5q3hrKuGn8xhbWRgKoKkA6Hd0g6wCY2Mifr7y4Rq++xRDwNyzrqRmcwHN9AzhE6ncFhSB/3iaLd+Klvm8LnBtIELv0E8ed6+Z06e0eiea2tB0KEiSALbeWjNHOtnw8WBG9pKHq38fqmXSMPuZnYtSsr9Wtv3+ye39J+3wEqyA4rTpAPHtQIecpB9we0fIpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHReZPXA3FjFOBXAfrxJXfuSmLqNKi2pbSFwGBm1+Rw=;
 b=s2S5HT5srX8YAXtpLA9nEdjEAaYj+GpAM9pH2xHHyNEAO+A1uNbEnb8WgKDYuJN3l2El+zLUQj5wv0IKY8MHkR614ViID35dbrIiIqsuIFvAghzR5ijjqW/Fr68S4DZobyoZFAdwBbhFqGheX9DVQo72lYj03n+1RSoeNkleZ4MCqR9sla5t9sJe8kOobpQRJUfbujo18wyv8/+msFHAPUn0PXS1S9YNs7E5hg4bGjfFyMULALwjIdwUnESU6CFYbtnJIwVSYdzM5Ny3gUXl8BJLcyMmCevHPITjfv+V3mGJoGrg63mwbBGdL/Li5uktYdzUoKFWpuX6MbDR3lqn8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:33:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 12:33:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/9] gpio: mxc: bug fixes and probe cleanup
Date: Tue, 06 Oct 2026 20:31:05 +0800
Message-Id: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAnqxGoC/32NQQ6CMBQFr0K6toYWAXXlPYyL9vcDNUKbFhoM4
 e62uGFhXE7yZt5CPDqNnlyzhTgM2mszRCgOGYFODC1SrSITnvOK5XlBW6sN7Weg8EIxTJbi6QJ
 Q8QpKhiRq1mGj5y15f3zZT/KJMKZOWnTaj8a9t8/A0u5PPjCaUyVUzc+AvG74bZjtEUxPUjzwv
 V7+0HnUpYJCNFIWJe70dV0/mVadV/8AAAA=
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
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRWPR04MB11246:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4b3c39-e279-4700-8802-08df23a6129e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|7416014|376014|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Fb76Ib5KC5wUrCIjy0NYl5yy9UMhMXqpf1W5b1zA/jaB4Vbmt1Q1o5YIZLuKKg81HdBBuZvkEXHqPelLEJLtUvL46kqSxJQcWEmiEpy5M6AWrPXIHOm5P7K8vVJqDA8gkorRG9gc7U1ShFtnAV7nRuqT7hqxEUWTSgwbf2mNcakuQ3j2CMa/1u5uU6lL4BHsF0x7+MLbgthy4jwd3tnXVtHpS7otqbUEmkX4H+8LXbk5wQ1pChUS8eJloefHcu23wnd3MUAY2mM8KBDNQgap3vQw9qj6uEGQRMkZ2Pim3SvkyX5XMf7MOLrx9T7ySo7aAXLKqhjroa1QEE93t5glFA2zsFFdofYvss+iPlOnKfL4un4m8KOq0A04XdhDcgcf87OLGPFQnHtqjDVtrtkJ3pWwD6lHa+SNtH3rA6lMQXHOV8O2NRBaPeoFVjeQP9XMMkWJd2op6QQEFLyVczPUuHo4V9CnHQFPMBV1m09osHa7NmhNvs3oQfe1hbtfmCYjjldq3UTD923wWduhj6G9+ZqjpvgtBMRgqCME8N1ccsXjlwjJNkMcm5mvly5LHoDAeI0Jm3p7Efk5zX1UY8IQoar7LQaB/spdzVT7qwdT3Cg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(7416014)(376014)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFI1Rk0yQ1FXb05UbHo3ZUhMdEFTZ2NxZ2JhVU1qZSs0Ukkvcyt1MkRjRzdw?=
 =?utf-8?B?WFc3MVp1UWtFdS94TDBSN2NNZTlZRVQ0Tis4NVhSK0duTUpYMzFiNkFxN003?=
 =?utf-8?B?Z1BqM001N1cvRmtCT1R0YmdscEszK2ZTQjYxaThNNktVMktHTGJzdDgzMTVS?=
 =?utf-8?B?SHM0Q2QzazZyQXU3bndubjRXTVFkUTVlbUpjVnRGVnVUbHhjUllGOGZsV0Uz?=
 =?utf-8?B?dXhYKzNvbjV2eXAyVTdoZ0hjRnBJS096bXhVeE8zaGpkUzdPRU9pajYwZUNV?=
 =?utf-8?B?MXdoYTRGc25HV2hySWt3b3NpOUc3NitQRUVoWmFGTytJN2dXelRTb2VqYTRI?=
 =?utf-8?B?TlhzdkZKWjUzdFJXTFltZmxtK3krTS82MVZxZEZuaFNOV2lMMjBtQlAzc09v?=
 =?utf-8?B?UnJoZXZDNzZjVU8vM3RMVnBhTjd1QWlQRXJhWk1ZZUh2eUxHNWpIUmFRaFlG?=
 =?utf-8?B?Zk9EcnZOOVh2dU9ET1pZc21XZjBFeDNlV3IwcDhqRjNGTU1kSXZRSkFsajJE?=
 =?utf-8?B?OXdORjRTTWNFVW8vMDM0Q1N3NTZqK0t6NTU2bGV5aStBMTlKLzZrVXpWQVVv?=
 =?utf-8?B?QzM4dWgxTkFqbkNBNWp2L3lUVnlaWkZ4bnRrNEI2UFY4L3JjZmh0Q0RtVHZo?=
 =?utf-8?B?elZwSStMSFdYeWx3NVR4ZjNxMDVDd1pONHhueUpuWDlCMFhVNFA1b0tPTy9Z?=
 =?utf-8?B?TkZxb2pCL05adWhVdW1BOGxoL3Z6SDFmZXp4eHRVRHNXOHRaWUhsYWthV3ZT?=
 =?utf-8?B?aFVtRlZ5RklsU251NDBGd2hhaUQvRUhoMkF3dEdpRGZMQUFuV3R6ZXhMN3pq?=
 =?utf-8?B?dWQ3RmNKRlhmYlRLWTJjL0xlMGtUbkpOaW9leXh3S1BxQlYrc0tMSW9sZDRS?=
 =?utf-8?B?RmFyR280TkZKSTVjUHFkejVqaElFMmorUzkvZ0NnbVEvbEx4UEU2cmtLRXBo?=
 =?utf-8?B?L3FlTTJhbW5iYlAyY2RGdXh2TzFHMHptMzF3azFuUVN3NVc1ZjVESVFhSnJK?=
 =?utf-8?B?aWYwRVBVOEI1VnpyNFlGVWprNFVKT2JaaVVDbmlMUXlkR24rUHdib3AyVjZ4?=
 =?utf-8?B?NWNIV3luaFZGZ2V0QnZITElrT3N0Y3NsMzh4aXhhc3JiQmtDV2l6RWZaYkY0?=
 =?utf-8?B?VDZkZGhGYWM4dVRJcG9jNlpwUmZRZWtRQ21LT2FnU3d4eU55d2NLSStPQXB0?=
 =?utf-8?B?M1RsZ1FNdkRJQThlcHl6UkdGWE5FYmFRYlpiaTRTZ3hLRnVneERyTDY1MVJZ?=
 =?utf-8?B?Z1k5L0lhb0Qxdyt3QWJuUmZmTnhXeDZHYUI2YmZ3SlZDWFNlTjg3UVZCVTZU?=
 =?utf-8?B?NU1iQ1ZydzJPdHhnb0ZSUUpnL2VkdzRuRkxPWnc4N3dPcmlXVE9rVjNabUhy?=
 =?utf-8?B?Ym90TTJscU1MMmlKUlpZSFVxVkdLanVvMXZBWEMwcjArcWl2VXJ4bWtGVmpW?=
 =?utf-8?B?dW5ReFhoSjAxM005c1FyTElvbEp6T2JWQnVQY3liSVhOYkd0TDBQNWNCWFFo?=
 =?utf-8?B?NHJxVHAyNVNWU0dhUmhUYkkzNmJpSkd6S01YN0xsZjYvTDREdzR1TWFrb1Bm?=
 =?utf-8?B?aE0za3ZXTUVBb2Y4R3VKZndJRFhoL2NWclNOd2NlZGs1SWFyRzRWTE43K2Nx?=
 =?utf-8?B?MWxmeWQyZDg5V09zTWY0TXRkMmtJOHpEQTBZa0NvSlg2S3YrTVVTdG41U29r?=
 =?utf-8?B?YkNxYmg0ODRaZlRYUGpEL1JVc3luZ3R2NTQwOTVHak5lTytrTzlweHNVSEFC?=
 =?utf-8?B?R3hHcjFzSGhjajRZZVB5bTBwZ1RxTVU3MW54Nm5yc010eVBGZ2ZnVkU1eE5C?=
 =?utf-8?B?ZWJ4dW14SDdyODNUMXVRNlRENW1QNFB2ckk0eHNXbVMxOHFKanEwNGMxTU5n?=
 =?utf-8?B?S1JoNUxiSlQyd2VlUGpaWENVckdVcW9LS0R5bzVhTFIrVDBrVHhHdm1wU2Nv?=
 =?utf-8?B?U0pxbittYmFlaUNRMlN1U3BWWlZYUkhoTWZneGI5eDZSejczZGxHR1pCK2tm?=
 =?utf-8?B?cE0yTWpMUWozSmxJUEJZQlFXREE4YkVRQkljeFg5clVPU1JBdEF3eUNRbnBK?=
 =?utf-8?B?T0ZLdEo5Sk1rS0VPSTZ4YUhWQk9JcStDWjUvSUEyZmR4OFJkbFNTNHc2c3lM?=
 =?utf-8?B?SXBvbGFJNVh2UHVobDhGZTM0djJCMzFta1ZwVkZOMHR2bmE2SWRraGFXdHBR?=
 =?utf-8?B?VUtvUXFCVzNKM0lhS1pJWjdLSmlFazdSbnpOTzlOT3lRSGNvQkJ0WGZLSE9l?=
 =?utf-8?B?NUxKRFh2N24vcm5naGVqWEQ5UnMzckMwcWUwcm84aXZGWGQ4RG00S1ZlT2dY?=
 =?utf-8?B?Uk1HdEFmN2FveGtSMzhMSnlzbVZZbERXdHcrQUhQbXlSL2hjWjIyaG9XQlB2?=
 =?utf-8?Q?+IXPm1n6tr0xoVlXvuNhDwS4AGFaTJAv33gJa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4b3c39-e279-4700-8802-08df23a6129e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:33:49.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF0uhcrxa2ZnOOHAsPnu5BSITwG9PotdRQN+6yT0YC+h9qs1stYFXCxLNWEa17ybjNoWB+Hvoy8iICJ13uzKdic+RS6gbNPe1qGGtAKuwvFPwmKMWJskVJ+FV0zeTZ30
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

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
Changes in v3:
- Patch 5/8 ("gpio: mxc: convert probe error handling to devres"):
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
- Patch 6/8 ("gpio: mxc: use local dev variable"):
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

 drivers/gpio/gpio-mxc.c | 257 +++++++++++++++++++++++++++---------------------
 1 file changed, 145 insertions(+), 112 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261003-gpio-mxc-cleanup-e49cc626c51e

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

