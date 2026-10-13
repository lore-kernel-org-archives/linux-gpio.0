Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2BC30ACE6;
	Tue, 13 Oct 2026 06:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871432; cv=fail; b=dnMmJlBvmpgwd28JrswKdkYYvRbs9SfINKfNjREHDbO1KS+v8ccnMccYJF1Aq/I4nHQBrey8KjOpu1DoNSozAW5MMaoiymLtScpYuwJM3ofdnlmpZGg+QCYVtOgowoQyyquRxGwjnngGk/kWGOtr8I/lSjWxpzElukL7mcfW7Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871432; c=relaxed/simple;
	bh=I2VRB4C2PrSlYg6uhvvCSP8RuXcYgm8iuhpggxBEtos=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=kpUycy2/MlAZi5cfDspq9OSDpEjuYrWqxh7IKATs1cqceN5A7WwMBdzK2tWrHud/UcCBH7FrPMT1v/M29G71px/n9a7p6TpnV3Jss7luBpk6GI0AE5dcJ8k3FL8fJRXtndn+RbVWXbw/aAQupuSc+x+yE2e7A9hU9MZfiWbcOUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PE8BSwWj; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PE8BSwWj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHSMFEzVP/V2tADCcwQ2onXSQcbWQD+Fv8zgHLT+PGiFCxJoLPxDTixdLnZ4nxDnIfPM6qnTIPLMAdM13+655mMfw5YCTMmptnsukFMipVBQ76YI/A5/t7UBknLs30aIKGp4LoVJ1hchP5XRO32A3AHMl3iQXLlOg8LLGNgdnVsl1ULS/HJUHdWlKHtWiR/jA/lV1WyMjs/nh56y5cnu1xi24nYqnwRrexvFT9aPmcJwYmUv5meoViB0kJbHv04YA6IAjWazlu3VAtk77QL0bA6fi3iMjQkJwWk0wjxQw/XYQGWYEuKqpXDK1E+4YeZxEc8KMh8Svl/s629tUrEQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nnL+CEegG+elKLth/TGTw1iq1h97JicJOawwIVICoc=;
 b=JX+bx4hHcSkjgRWjwZMQcDlrJd18604KADD0Hh7BC4T3ZmZbUZKIfPbcjC3ifRsjUqR1KaSpHFyhZZ7diwuc8t/MamV0AxBOzcjzugegQfEebHZaj9YuZN31hgt5peEjHqzNvfxmtT+6lFALyiBSsc0swjhLeLmCdzCi344bs4vusPtB4+Ea+kSIzH0jEb9+UHSN7CDsgeUUo5JiFOJXb8HABmLEEJTeQ9/t+6EN6Ox6hlwGhIDnaz3ZQUr3DI9pUO5VlJnN68RyAcJEW0CpBAOMI0qbYddikOykHS9H7y0hSM/+WwQVYey+6n+u2OvH+pOkJo1kZvAQ6AAb5JTy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nnL+CEegG+elKLth/TGTw1iq1h97JicJOawwIVICoc=;
 b=PE8BSwWjXEDLvqm5zHa/lIQ1K/7mrWjT8ADAtnFy+3miaiZHJPC5Kxy6XCPSleMFdk5pxJiobh2coPZkjZ0D6vDI0bWvkC/eH8Npzign755Ju1pS8iZ9QToiG3YNW97JZKO9nteAB4nq40X/zRXOZuhsWEfAP9E8zBZGSmFTzhbPDQKSnQaLf37nNN7+RwYTORcrl7p3cwvvXOGAyjI8CwgoWp72M4oJyGGD0DAW2LrcFkCO3Ze1WXvsEUyeqNPL3nYK1pO6F0agDUH3LMx89Teg7cpF6la8md/rZQYvySHhIbATdPFIsje8ZEbYJRXWAsLJ4Y1ItCLnuw+BV/YsWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8470.eurprd04.prod.outlook.com (2603:10a6:20b:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 06:03:47 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 06:03:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v7 0/4] gpio: mxc: misc bug fixes
Date: Tue, 13 Oct 2026 14:01:08 +0800
Message-Id: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACTJzWoC/33QwW7DIAwG4FepOI8KSAzJTnuPaQcwpqVakyi0U
 aYq7z5oD0unqMdf8vdb9o0lGiMl9r67sZGmmGLf5WDedgyPtjsQjz5npoTSUoiKH4bY8/OMHL/
 JdteBU90iaqURJLHMhpFCnO+Vn1+PnK7uRHgpPWXiGNOlH3/uOydZ5l7UT5IL7q03qkFSJqiPb
 h722J9ZKZ/UmsMGV5k7j5UNzlVA/3i95maD15ljG8A2DoQP7TOHFZdig0PmkqAl7X2wQjxzveZ
 yg+uy3dUmX54/AM0fX5blF7/MxZm8AQAA
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
X-ClientProxiedBy: JH0PR01CA0180.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e3ab3a-b089-4940-be4b-08df28efbeb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|10067099003|56012099006|11063799006|18002099003|261009223027099003|261009221227099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	dgDghUt+9uFfs9AmE3eB4+FsYd3Du9S2ZUDFATwLnz83abZG8SlMSNFtpOIXDJ0l1SjdrGZnnOdzbR7GiQR/6H9VD9rnt4U0FbsUfw7+krKj2DRqCg9D6V7iXsI0MUEy+uEei4WVZzcvZc+0PKhT2+8pfxyu6cZ6FD5o7Hh55YQykGlDmpuqEAM6PRWo8lun4y2kac3knKqi/fcM+Vqa6tvYk7tKYX4gIN+vGhGX+fmHWTYpkCwA/BUkvW7Ok14QcM6eDSGgIgmqCHa11Fqz2heurfLM86fTy+VWZqg3MGBxRvjv3JZ4SWhlCJiTYiktwUo6NnOamhfBH4mSEMQJjZeuusktzyiGupWAgwVWmO0V1swXK0NzBzYhYWWkJnbGbEDMPKdIrxQLLisa+mysKPqP5BHl7dwivSyWW5nvo/P0qRQewoPTJa0K5iPnGAFn7cHu8OrCz9/iHFn5s5odfcCz4IMYm2aXCAsUQfzUppiLvAwduGlhkQ+xzagIqDiBREzhcI97Zg+88dbbgmVu0BQuAaWD2zFKWA6bfc7jTXzsuBcpCdVVKmR/OJ8+X+gnUu1xNkYXTGZybmnuyW888QeLKOkaBAiyQP7rO4jtpx8phws+6Mlcd1cwSReeVJ74
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(261009223027099003)(261009221227099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVJaOGNQcnA3UDhhMTBjdmF4OUxKVkJTYXc3M0JzKzFFMXJCbVh3bVJPU0lk?=
 =?utf-8?B?QVpiLzJCSXlFbHFmZE1SaGZhU09OVXZSdnJnd0c2dWo3K2tRVEZnQnJSbTNa?=
 =?utf-8?B?NGxZRWN4c2tzT3h2NWhSSy81ZnQxSXdudVM1a1Z0WTVzK0JlcHcrblo0elZH?=
 =?utf-8?B?eCtjQ3B4S1NRa0h2RkhHVnp4bjB5aFY1dU5NL1EyVWI4eHdxNjVZR2dKUzNW?=
 =?utf-8?B?R0xienJDOGxwaVU5WVh4dHR4bUNnQm5FVmpScDhzV1FLV0trQ25oanQ1OFlY?=
 =?utf-8?B?OHo2M0RuNCs2YWpUUXJKQmxjL2lPVDFjNU5DdVYzaUR6MFRwcU5tUWxlN3VU?=
 =?utf-8?B?aHFWVm1aWjdub0s4SWJSYUNoWlJBdFJTNWttRWdqT0c3ZUl1NU9JYkhITXFX?=
 =?utf-8?B?ak5mRTN0ck1KdmFQSnJsY1pGeHNZeUJVQVNGeFViUVVjc1htd1pjVFhzQzRx?=
 =?utf-8?B?WmpFdm9LTmg3aXJ4SktPMFNPempnMTVBQzZ6T3VEeDlicklEWWg5TWFwODZS?=
 =?utf-8?B?L2ltR2NlaUpUMG5BcW96bndLKzk0ZGFDRTV5a2Y4VTJvcWZWSW5CTWwvdGtZ?=
 =?utf-8?B?T3RweCtKSG1SZWRNckJiZ1BzcW80WE1RY1BHcmR0aW0zWTFNSStjOWVVSm9u?=
 =?utf-8?B?R3ZhVzFOREZybk42YUxxcFNKKzVtazlBT3JGMW5GS1M2RHBZL2dVeElaSk9J?=
 =?utf-8?B?WEQ5N1Rrb2JDMUFiT2RsdDN1T2pHOWlvTHhNemI2VGJFSk02WW94bHB2UEFK?=
 =?utf-8?B?T0p3MjhZRkl6R3BOYWhxTDdodmROcTBXRFRENlNTbFdPMUM4UmhQTnZ3SUgv?=
 =?utf-8?B?VGUrZ01FVG1aZnE4bGVHNzFTT211dDgvRlM3Q0J4bC9YT2JPeTRUNTNoazJS?=
 =?utf-8?B?MjQ2RDVHK2JqNGRjYUs4UVBINytNTGhCcjBnNGR5SDRNYWJsUXhsRmhmMWZO?=
 =?utf-8?B?MUovQi8zSmlheSt5bHF0Vng4Q2svL0RlQjBmOFdTNEhhRzNQdTdwaTRTY0pU?=
 =?utf-8?B?dmIvcC9uVWR1Z3Erbi9TR1RWTVU3UFo2MDg0K3FaMFFUZldEelljOWpBTlMv?=
 =?utf-8?B?Z2VPemQ3VDE1UW8raHdzaXZydlhGamlJakR0ZjBYUVoyYU5BeE9lUzg4UlJC?=
 =?utf-8?B?Q0paLzZxSHc3dzhEaDErM3puYlJBQnhXeExHY2hGWGoxOHJPV1ZPUU5PMjRz?=
 =?utf-8?B?bnpmaVdOV3dhdTM3OEdtaHJVaXdYKzVjVnoyM0t5eDlORDVYcUpFUUhmSSsx?=
 =?utf-8?B?RVZWaEtrbkdKVXpJbzhOd0NPYU1tcHljcTlxSWR2NjNSYjlTOEwxRnZYYUpn?=
 =?utf-8?B?UE1GaVNTd0wvTzZjb3pRcjJtV0NPVmk2VmRIUEx1SlhZOXllcDg2cHh3d0E3?=
 =?utf-8?B?bG9RRUNuQ0k3S1VjemNTWWVhUm92eTk4cXc4V1FsNWtRckNJODg5ZE5yR3N4?=
 =?utf-8?B?L3ZDRUFmd2hXdDVUNVY2UVpqbDZqN2NBQmNTNVpKU0dhc3EzT3ArMVh0MzBh?=
 =?utf-8?B?SW5PeUw5RTVzUUc5dVB1emVnek5hblVlK3UxNU5BVHhzQXZiUlpBTXNiSXd2?=
 =?utf-8?B?bVI4RWRkQzFhb0ZKYk50eG13T2VDNHRydHkxTDhaMjVmSFNLWmNRL2pIODh1?=
 =?utf-8?B?bHh1Smg3cXFtK2tWaG5nVGdWZlo1eU5OS2g1RzdONm4rcTBMaG9yT1NiclNC?=
 =?utf-8?B?SlBXcGJrejlEcUFHVlhxTFlKNkY2N3ZjdTZ3TVVNVm04eWFkaStvb1o0RENG?=
 =?utf-8?B?N1g4aVpoeTRWdUJ4dkp1QWd3Z3BqelhNVFBlVmZIUUlIRllVTE53VjhOOEF1?=
 =?utf-8?B?elExRmk1Z05nYmw2ajluRVBOb2MxV1ZHY2xtaUpPZjJ4dHBLZTdHb3duYlY0?=
 =?utf-8?B?T2pxb3ZXMWNKUmRnS2NudkxLT3gxTXlhWDhsVlJ0d1U2UGtrdTZIeTlvU2gx?=
 =?utf-8?B?L081ZzNKS3Rwb0dBY3E3clFQdUFhMUJidjRrTGkwdzRJVzFyQjczUEhEeHYw?=
 =?utf-8?B?M21YUE4zOStOTTZNa2NwMDNNY1lZY2J2dS9MakVFdGY4VEpnNW4xL1p0VDVl?=
 =?utf-8?B?aGg1UHFSdVRSUGNMb1IrZFhpNTI4YytjRVBQc2FndlJVQXR3NEtSeFFpaHVW?=
 =?utf-8?B?WEgwZm12cnRISWJYT20ydmt3KzNyTlhGN0pFcEZSU0xLdlVwWk1rajRnTy80?=
 =?utf-8?B?SzIyS1RBdmtxR1pMK2o1UFpobXBQdUhMTUxGNHdnOUlFa3BpSFViU0dtODZ2?=
 =?utf-8?B?SmtoY09oSVR0elJEbmx6UkJhQlVkSGtEemovcmtTTVYwVjlxVjJEMWF1ZXc1?=
 =?utf-8?B?KzErUFJhUlROdStzL0FOeUJuYmZPcUsrZktpcERuVjhwUGZ4RVFKL09OY3I1?=
 =?utf-8?Q?TYVwZCIroK+TAuhm3Mj1x9yzYVnVX6Zxat7yd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e3ab3a-b089-4940-be4b-08df28efbeb1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:03:47.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fe8hCYxq0txjGnW0qGJdzr1XAuedJnTkiGq8p9j9ZjfcxBfKN+mLC/QODQyUG6QK3hoYuPmgyVGc9O6S18Y0C124IbSk+Y7JHmMh6jbyA1n2no6194pRTs2yL9Emhf0w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8470

This is a subset focusing on bug fixes, that separated from thread [1]

  1. Fix a race where the chained IRQ handler is installed before the IRQ
     domain, generic IRQ chip, and port list entry are ready.  An interrupt
     arriving in that window dereferences port->domain while still NULL
     (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
     install after all dependencies are set up.

  2. Fix non-atomic read-modify-write on both_edges.  gpio_set_irq_type()
     can run concurrently for different pins on the same port (different
     irq descriptors = different locks), so the old |=/&= on a u32 is a
     data race on SMP.  Switch to set_bit()/clear_bit()/test_bit() on
     unsigned long.

  3. Fix non-atomic read-modify-write on wakeup_pads, same class of bug
     as both_edges.  Switch to assign_bit() on unsigned long.  Also fix
     the bit being updated unconditionally even when irq_set_irq_wake()
     fails.

  4. Fix a race where devm_gpiochip_add_data() makes the chip visible
     to consumers before the IRQ domain and generic irq chip are set up.
     A to_irq() call in that window hits a NULL port->domain.  Move
     gpiochip registration after IRQ setup is complete.

[1] https://lore.kernel.org/linux-gpio/20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com/T/#m49d6a5a14a64774eda299bb711c8d316681e652b

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v7:
- Only keep four bug fixes, split cleanup patches into a separate series.
- New patch 4: fix race between gpiochip registration and IRQ domain
  setup by moving devm_gpiochip_add_data() after the IRQ domain and
  generic irq chip are fully initialized.
- Patch 3: rewrite commit message to clarify the writer-vs-writer race
  and explain that reader-side atomicity is not needed (Andy Shevchenko).
- Link to v6: https://patch.msgid.link/20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com

Changes in v6:
- Patch 9: use retain_and_null_ptr() instead of no_free_ptr() to disarm
  the pm_runtime cleanup guard, as the return value is unused (Frank Li).
- Minor commit message rewording for patches 10-12.
- Collect R-b from Frank Li.
- Link to v5: https://patch.msgid.link/20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com

Changes in v5:
- New patch 2: fix both_edges race using atomic bitops (set_bit/
  clear_bit/test_bit), prompted by review feedback on the BIT() patch.
- Patch 3 (wakeup_pads fix): split the irq_set_irq_wake()
  consolidation and for_each_set_bit() conversion into separate cleanup
  patches (4-5) for bisectability.
- Patch 7 (pad wakeup hwdata): renamed MXC_GPIO_IS_IMX8QM to
  MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN to describe the property, not the
  SoC.
- Patch 9 (new): use __free cleanup guard for pm_runtime_get_noresume()
  balance instead of devm_pm_runtime_get_noresume(), which would cause a
  usage counter underflow on unbind due to the double put (devres +
  success-path pm_runtime_put_autosuspend).
- Patch 10 (devres): dropped devm_pm_runtime_get_noresume(); the __free
  guard from patch 9 handles the usage counter balance.  Fixed stale
  &pdev->dev references that should use the local dev variable.
- Patch 11 (dev_err_probe): fixed &pdev->dev references to use dev.
- Reordered series: moved "use local dev variable" before the devres
  and dev_err_probe patches so the local variable is available.
- Link to v4: https://patch.msgid.link/20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com

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
Peng Fan (4):
      gpio: mxc: fix race between chained IRQ handler install and probe completion
      gpio: mxc: fix both_edges bit operations
      gpio: mxc: fix wakeup_pads bit operations
      gpio: mxc: fix race between gpiochip registration and IRQ domain setup

 drivers/gpio/gpio-mxc.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)
---
base-commit: ef2a32fc6a059affb32848b8beb27a05d79b9856
change-id: 20261003-gpio-mxc-cleanup-e49cc626c51e

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

