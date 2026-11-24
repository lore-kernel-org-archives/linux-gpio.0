Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795512042;
	b=jVXhbQTDMrsawvoMLjP70QNBLabN6Se8KUyIyn8tSY5b/6h8Ijc+W+a1h6l2j3j2jeCA
	 2lpH/Gzytg84unbfzT0BytObNwYS6eqmrF+oJhjNxetVCWs39szO1R33p85JphAKz3R4s
	 FsUKDmKSBknPQ8k1JZVeDxwkr1aP3uHgl1tx004kNA681O6Yk8n1K/0n4yj2ytdqHNP92
	 zWspksltY01GbBeuQlhjOQnX2nkIruELZ2Vc0Vz66Qipy+5tl6FhCXKcof4+JkSrEJuNM
	 k781zIqj95mj+G6Cu4abBgdiCxddO7LwCKKDNZSRXhVwgbZMh4caw7skwlJKOiEvW2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512042;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1qwQsrPowRkgI7/Ko7f64R0yHgXZhLB3L+EAvIfWg3g=;
	b=r2LMigpi6Z/A97d+X9zEQGT6hNidOLkMhHzBb48RGxNPlMHUKv8f8Lvwvs4MKPHkaqHv
	 DfuGZZEetGfnceTgwz8ldTYw0KKJj3TgG57GTu8c+Yn8fGMll/ikzLcxBUQ+VUASTKfmt
	 nZOmRa52CK0CMjwkoLmoWzj+9G5GlVtTSJyB+xXJNpt0SSgUEU/KI2fGV603LvoORhHyt
	 KSyqsNm1hmPo6VL18q7Zj6PaJiBvMMlunCQscRTTPLcVnhcGA1qXzS9em7Le5M6z88WtF
	 Q7JGdQHF1+ylBwcwzqBf8JWTcevMwY+jblzrC4+IM10IonX/6yw0O+wxq8d1EkKK5Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l0vEfvlx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.57
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF524606A33A;
	Tue, 24 Nov 2026 09:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF524606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l0vEfvlx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVqffldYVvH66RzhaOlBXHEiWV4mSRJrEVLlzBNY7hLcFBtKMW8uexXJo/Mpy49QcbkPxuPvW2/Monb7417noiaW3gXtrp+xpcRE14Ai6cHMdMnPwIuifvpMbKrybvs+pA77VSwAZg1tLdabkOrcn6q697JQyfJRRZskzuIqIauDLdGR4ACQyu5jzx/YR/ORxGv1OJMaoENs4HRL57VCVwsa4oLtOpo2FsZgbVIBRRCfG68rFEuSLai+kz6rXn1b789fNQ9AJZg+Wme14+ssfq6/0Tyj46wY+AJp0eaCfW/aILyd6/BSEnmfSyab0KM1F7vYQCyLqE7lpGF+FjLuwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qwQsrPowRkgI7/Ko7f64R0yHgXZhLB3L+EAvIfWg3g=;
 b=ZFSMVRlx97EixHEBNsCwl8u0mRN22v16kz3FGX/tmT7A5VnfkW7jZUiZ1Hqr0Rc4EqS8J2MdxYvTlAtRo7uLfVdSwjJeodlfDLb8w7W7qsmlXyzOm+1LfunN/vWGjfOCDlrLF+ijXDBgZUoBeQYbt6QbeoXSZI9FYIjjyCEixDfxO4FqdFEiA7BnfPADKYtPd6T32TXv+ai+caB1/czNqxEwhi2EjF7p1H+qbHfFlgz9sA0NvloIr2oAFKQ3cFI5TEhPLT0F3YDT+13xzDzUaLbH7Y16cqV9LHdYDNG023E6nXlj4gvyFbdWDtmLQi/jN3FUC5SyqdaiGvEFniSfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qwQsrPowRkgI7/Ko7f64R0yHgXZhLB3L+EAvIfWg3g=;
 b=l0vEfvlxispGJdG6xO2pnN7eIXMoJ/3a17v5rjXcCTiu/UVT63HoxvZXBTT9EfcTfvVXWgOE5GgDe9UoHCmK6VEzCa60Gu0W5jRqIRoiMXCmTnFvKuz+QJDrOAeYHDQN6rQGeqtJ/aUyz491K73ftuGAryLzNtzLMTNvAYue3F8uZi3CXy7UbB2F5TE9DN1RmeVahS0QU3Ahy6hxQ7YhWyue8I2zeOaPppbNI7l5rtZMlie1GeTLq86DwQ/l1wM4SbwxM2QkUDlyM454EjWYy3S6LEtevi38011jxf1GkZklEu7EN+4cq09LPbsNZqXW0xpvBWk8niLbsibFIiBvGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 24 Nov
 2026 09:20:37 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 09:20:37 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kent Gibson <warthog618@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/8] gpiolib: fix chip removal with lines still requested from user space
Date: Tue, 24 Nov 2026 11:20:31 +0200
Message-ID: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::18) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ffaee0-a6e6-4617-04bf-08df4a0c336d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|261022075727099003|261021123027099003|261102123227099003|11063799006|261026121527099003|261026140227099003|261021121427099003|261028144727099003|56012099006|261022105027099003|10067099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	33iWeCcoD/Q/Jtt7FxOI/3O5V1PW5xHW6bWs/0RHFW0zbKxlmwndzWPmdlhL8Nyh7iyaC3TCQugi1x9HqBssHLIJEWN6ocKfYuRTrPPD6JRWUvu2adhx9FXwmQYK4v21qTM8kx/rCZDkhAkjISjF7MDs7RiNSFNpxucODSbMz17XGUOqSdQB5YndBsSlsOLWtxk6nbx12dkldSuhIbtN4rxLWB53hft9NSiuuvuMgTp0n7AflwWg/eO7xpjDRkiVLopd9HGjhSIeaY73fa0D7kMbPXO7m7d7xi9iAJbwT674Zt1XGtFTM3ZXTpp2AZC/JPnSOGWk5aX4bjwgXr8xY7no2Y21OCsQtIS1Yf3lk7se+ZCzb0LEZr1BnOKWtfcWoCR5T1SyGEaDLxsDrl1mCLbLx2rWvMkIy/EjFY0gCq5uiNQgcVvTmb6oLQYvAI1kydnVU4LH3DKJbFpsGwIhDL1k1X1gV2LNwJDpBJ3QDqh2Vj0sg574yi17zMMm1jouC6rVsko8yBVPYWKiIScDyjk+VE4CW078EYIroy9+FYIofOeYhlm4iUxZa6SLGwAfFyvhuHkPhdGQxk27Z6tZ7DAeNp1OuPLsQazeAy3VTYea+kdHqtneHvxgdPNlhAdE0nbQnowSwFC//oENyg7Zxvm6gHT/5yTl5QMGkLh625U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(261022075727099003)(261021123027099003)(261102123227099003)(11063799006)(261026121527099003)(261026140227099003)(261021121427099003)(261028144727099003)(56012099006)(261022105027099003)(10067099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tKXrT4b6orWv0EEZYMFm5P3pBqLf20cHae3CBMHLlBZA83jqceCYKp/Hn/uQ?=
 =?us-ascii?Q?9UV7MMh5gUhw4CDyJrJitgV+a6XkUmFs+Vvz47UJ2MXSP/4cY1A+yZ9D3RhE?=
 =?us-ascii?Q?ENswb05GlfQXGfrS6JsTbpWsQM1mjkveDgiaNbU0Ampho2U6S07h2Y/Yq/ns?=
 =?us-ascii?Q?VyvRSMxblh0whI/a2t4XtAghHk4JWMLka/uXE2bcrSCbIMJi7kZ9X0rPBlrl?=
 =?us-ascii?Q?y1HZMQ8lx6ssf7FoXbs82LNIdiZ1B8JuhUVezmVZ+YBjPjItQMpX/sp56o7P?=
 =?us-ascii?Q?jeiYMXY3BkzpN8jUMzpTNSYOVGnDrVoEtdpepv8G9tFCbEG0/7nxHFiFq9lT?=
 =?us-ascii?Q?YLu1wdmxd1fqHMOTjR65MVqJCEmLAmdg6Y9DQ5tEi4AwrhgAhu3M3KVsxBVp?=
 =?us-ascii?Q?b6xXicVgzdjpAI1Y72A6U6kvEL1MXoPSQrQDSlMnajSz7COvDwYvoM7VRkqe?=
 =?us-ascii?Q?Tb4isIkWwAbb+jCR3YiLo9FdM5SpjzO/6zAHUcudTSwXh2QyI5r7jvNQGfbO?=
 =?us-ascii?Q?xiAn4NRdVbuiOLKauG9dEYPi2sq5HuhgZB7Aw+FGuCavOU2fFSZh8n7LT1qB?=
 =?us-ascii?Q?YHhTif73mya+AzgrP5ANaWfSAy/4/1ppjIT5a3AFmfeCQ95a6jPmQTKngNPh?=
 =?us-ascii?Q?6TjlRFC5+LRjJ0BcPvclKKwZR1icLHt4B1TLcEabC4XYoqFaP47ww06vPgt7?=
 =?us-ascii?Q?IA5aMYlzPz4aWWNVYueAosHjCzp3YeY4mX5R+JRXIKx7AVGzdHnLkK9OHOUn?=
 =?us-ascii?Q?pp/0z3rGgRUIHqXX5lx0ZHL6j52vv1HS9zi8ddvanO3KK8GLDhQnWFSD61pt?=
 =?us-ascii?Q?HklLTkGjlgaHFchZTecNu7uDCqn1aYrqV5CIwwQomy1lZROsVyKSc6KCZHBR?=
 =?us-ascii?Q?XaWsYMGI0m5I34R5FXWYuJwBc9T0WkRZ+8g/5GdZePQN2O5wbEfOaB0K7FnW?=
 =?us-ascii?Q?neKXwypTxXIJ13Dz7DvcnTCZVUjLezVqylUT4KC4jqaKAGe/dpC7FLJLNI/0?=
 =?us-ascii?Q?dZd6c0uRnRrcSvRhYpqBjCkk7RTE75kceoIZKh+Mjj2S5LNiqBEf9q+fwVcr?=
 =?us-ascii?Q?CuW+jJGB0c/6cTeWikOi8YK1U5IxVkv+4bcM3y2yNm9KdouL2KYFIivRcT+N?=
 =?us-ascii?Q?cnlXIg8tQDezvxGGzawBaw8O1iEEo5CuM3wA4ocZs6XowUfuF+KE/zx1IITk?=
 =?us-ascii?Q?b8ue5T8ByEcSvkop2pCC2N+MsrBD5vZJ5zFDVMTBxlgjuSyP57AMn5b/Yybr?=
 =?us-ascii?Q?yBxwLefEWLk9SBRVfTw9rjXMQoR9pKrUuQVzJEuHshQNyQcFwxsvAiwm3phl?=
 =?us-ascii?Q?1dRBdw0ARcR5bBiBjbl1jogMuX2P+Oo2onuvr2QC8Jjzp/YaL9cGbbR6EFRW?=
 =?us-ascii?Q?C1gxmY5siC33saOyIp049FZAcXxSpPqNsMblqPe1stAWwKi8NHTZYdHPAAjl?=
 =?us-ascii?Q?bh1dSmxG2UoWAm5sDUYtUlNZbhDzTsqga7phTq1AybAc5ZEwuW3cmIxArny4?=
 =?us-ascii?Q?LclHLKot+ZUc9i7ZmQZgwdqRHpjBYY3dBgXBX2PMIObe7qEPjTe/i5KyJ5e8?=
 =?us-ascii?Q?zRU7VqEmY5YNFE+mJG+4xrW5+9OIo1UQ95ymWYC1XJZnprxx/NBslzH66MZF?=
 =?us-ascii?Q?LU7REtUU2Z8c7bx0IIjlq46t/ELkgv7yjowU2IJG5BwOG3g84wkNcDtRMVjj?=
 =?us-ascii?Q?xeCPCG+B7OLjpsQI68BcwVN9KF3SltMAF+WDaxDuBbCE8jU7OqXtQZ7ssIEI?=
 =?us-ascii?Q?c2GHdb+qHg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ffaee0-a6e6-4617-04bf-08df4a0c336d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:20:37.6900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jz2eZikkugRVnQ2HbzHRTPlA5nYo7FfUw+qI4NSAMqN9vGotqBeEwJx9psJinCH98wbXo9zCWysmM2T2zqS3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415

Removing a GPIO chip while user space holds a line request, as when a
hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
a blocked read() stall the removal (patch 4). Patch 1 makes
gpiodev_release() wait for pending label frees; without it,
cleanup_srcu_struct() can warn, more often with patch 2.

Patch 7 also affects in-kernel users: their remaining IRQs are freed
after the chip pointer is cleared, when gpiod_*() calls fail. Patch 6
drops edge events whose line read fails instead of reporting an edge.

User-visible change: a read() blocked when the chip is removed returns
the queued events, then fails with -ENODEV.

For stable: patch 2 needs 1, 5 needs 3, 7 needs 3, 5 and 6, and 8
needs 7; patches 3, 5 and 7 fix a 6.13 commit also in 6.12.y, patch 8 a
6.19 commit; patch 4 applies to 6.12.y.

Tested under QEMU (x86_64, arm64) with gpio-sim, a shared gpio-sim line
and a test chip on the hierarchical irqchip, with lockdep, kmemleak and
KASAN.

Prepared with Cursor and Claude Code, using Claude, which helped analyse
the bugs, write the reproducers and draft the patches; I reviewed and
tested every change.

Changes in v8:
- Patches 5, 7, 8: note the patches they depend on; the stable note
  above lists them too (Kent).
- Patch 7: say why config_mutex is initialised earlier (Kent).
- Link to v7: https://lore.kernel.org/r/20261120-gpiolib-chip-removal-v7-0-aambrozewicz@nvidia.com

Changes in v7:
- Rebased on gpio/for-current (over the line state workqueue fix).
- Patch 7: drop two redundant desc checks in linereq_free() (Kent).
- Link to v6: https://lore.kernel.org/r/20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com

Changes in v6:
- Rebased on gpio/for-current (patch 2 over the flags rework).
- New patch 8: remove the shared GPIO proxies first (Sashiko).
- Patch 7: cite Herve's proposal as [1] (Andy, Herve).
- Dropped the Assisted-by tags (removed upstream).
- Link to v5: https://lore.kernel.org/r/20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com

Changes in v5:
- Rebased on gpio/for-current.
- Patch 6: describe driver ->get() errors; new Fixes tags (Kent,
  Bartosz).
- Link to v4: https://lore.kernel.org/r/20261029-gpiolib-chip-removal-v4-0-aambrozewicz@nvidia.com

Changes in v4:
- Rebased on gpio/for-current.
- New patch 6: drop edge events when a line read fails (Sashiko).
- Patch 2: the NULL label fix was applied separately (Sashiko):
  https://lore.kernel.org/r/20261022083343.3905973-3-aambrozewicz@nvidia.com
- Patch 5: moving irq_label above irq in struct line moves the 4-byte
  hole rather than removing it (Andy).
- Link to v3: https://lore.kernel.org/r/20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com

Changes in v3:
- Rebased on gpio/for-current; shorter commit messages (Kent, Bartosz).
- Patch 6 (now 7): return early when there is no ->to_irq(); drop the
  lineevent_free() comment (Kent).
- Sashiko's v2 6/6 finding on gpiochip_setup_dev(): separate fix
  planned.
- Link to v2: https://lore.kernel.org/r/20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com
- Link to v1: https://lore.kernel.org/r/20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com

Adrian Ambrozewicz (8):
  gpiolib: wait for pending label frees before cleaning up desc_srcu
  gpiolib: free the label of lines released after their chip was removed
  gpiolib: cdev: do not free line IRQs again after the chip is removed
  gpiolib: cdev: don't sleep in the SRCU read section in read()
  gpiolib: cdev: don't leak the IRQ name when the chip is removed
  gpiolib: cdev: don't report a failed line read as an edge
  gpiolib: let the character device free its IRQs first on chip removal
  gpiolib: remove the shared GPIO proxies before freeing the remaining
    IRQs

 drivers/gpio/gpiolib-cdev.c | 157 ++++++++++++++++++++++++++----------
 drivers/gpio/gpiolib.c      |  38 +++++++--
 2 files changed, 146 insertions(+), 49 deletions(-)


base-commit: e6e2181c6920ff59ded349a100f80cf85d074601
-- 
2.43.0

