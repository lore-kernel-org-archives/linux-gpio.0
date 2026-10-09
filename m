Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138F64F393F;
	Fri,  9 Oct 2026 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569304; cv=fail; b=kMh4zhjTAupIfAxg1KX/4G3L2hFeWNWndGGTyQ8N2guJI9GACVf6hbtUfZd+YyvT1zSNt4nxix7v+hH1MVYU+JyXd20nehDnZMUC6WwEZ6YFu3yuFuwz31Bq1iCkyd4PxS71IYoH3PDEjjNr84TsJMiYEvwUGUDGlM66X6+BkCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569304; c=relaxed/simple;
	bh=6zXPBEA1d5Twu9Uu9+ugt0PS2VmczpEiYYhAN4fhifk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=n74Rgnl5aiz43a2g7e4SiC2EcwcofmnubDwAIWE0RS8VQQGNzPkBzeUw8b5xU2ALHK80AgeMHLAoPiJy3ljl4zl5qNRB0882XF01i8mFJnrtcx4qUT3pATvLV7IGb4TEGxgISK1Y0JpfeGNqF0fq+gbA+a9SqkM4oUQvKGqaKe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xybgU3Bp; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xybgU3Bp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pW3yMYuvDn/4ztzlD2zCXG46T/ZUchkHvTCmzMwDiB6fYx5R+JioJLk0Fc/9FOWWZ8XGyRC5gqbVvX27ql5dg+yG8EH+gKhJ3tQEzCylsvpK3rUsLpBJEL6GvMmAe0j0svjItF/DDxpCJoOJQ+83Q4BBv9GoG6pd1CpnrYuqf6Wfpj18bFxw1gZYMnTGBNLHEX0wJOMQS0eOr6XptreIilejY/XIHAxhjB9iaVaB72oEMblZuC11BKMR590Pd+k5CWneO/6dxITc+jGAGfsGZ3F/UwxLulSK1rn75ajDCu4FhpLWhVGmnF08ERLh3hECxNiP46ZGj75Ejzx1pIhHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lD9BzSd8SD2zQm0Kl/3ss/CJbzfaDIP+VIfzHz0PWgA=;
 b=wkk2xEsimAv3DK47+sqnCC8yroY/D+jCi9MDe7vetr4nkBLuJSKjoqOBv1JpzVH/CKxMre4o20mGodQ8sE+jRrQ7NHkzTk0z+kIP5IxQisg1O42GU2UZiuJR6FjwKMo15LK8drrk7HxADMZ8JAK1fNdsc8svAIq3Q/eivIpE/JLqc2o2zGsCmLa65WvtdWBALghjrfIscZMVLSEZuDgpy2BwMvTP8AZf67M94cT9nErNp96Dw47xJMnQgP86s43yMHVHVhV6vvozbnPX0i4j6Abf7LKn7GY9Y8sAGHw/wjQatGQR75tZWmZ3eBA9Rvl6N/K1SaX3UQfZXSphRc6zTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD9BzSd8SD2zQm0Kl/3ss/CJbzfaDIP+VIfzHz0PWgA=;
 b=xybgU3BpPJGxxoabteX+v7uRAoo6TXkx/+ZBx0gWcbTnjkO2LgSVqXDmRoCRANzH5fIWVUuv26Na697VWeG+xohY4zf32uq9aXC22hHhtmJiiotdh3kWACjbB6JiKO59rkSvrW6Knz32b5wcRn5RVG40j+i+lC4u7DA5qNt57lWm0LpnWrwJwHwk57MJr+JH9R1DjmBG7+C2KMEsyEqQKU8gu6t7Dahjth2QgnHvQ/sXwhOBtMfJ0gqGK9KWdUG8Z+RuEr4nlR3BPJefdkWfj3O1JSnCbYrS6hiBmSUAotNaHWzejbF/bGVMD0AVS9oZzMXUKWESuZyb/A4nowOReA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:08:19 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:08:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v5 00/13] gpio: mxc: bug fixes and probe cleanup
Date: Sat, 10 Oct 2026 02:05:21 +0800
Message-Id: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOIsyWoC/33Nyw6CMBCF4VchXVtTCuXiyvcwLtrpFGrkEgoEQ
 3h3Cy4khrg8yXz/zMRhZ9GRSzCTDkfrbFP7IU4BgVLWBVKr/Sac8SRkLKJFaxtaTUDhibIeWop
 xDpDwBESIxLO2Q2OnLXm7f7Yb1AOhXzvrRWld33Sv7ecYrnd/8mNIGdVSpzwD5Knh13pqz9BUZ
 I2PfM/FAeeeKw2RNEpFAn94vOfpAY89h9wImSnBtMm/fFmWN4NTJaY+AQAA
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
X-ClientProxiedBy: MA5PR01CA0242.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: adee874c-7938-4e7a-c6cc-08df26304c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ov7ADCQ9at1+/l18PW92sJwGN3Ahc4AoJkq2LtwYpX+Xu4B1PhebFYZ8stRCnw4iEhKhCYDMikjuFiTceK2Gi9KsDmJQyq9YV4ijA+7vekSxy6tlrWCUTs2kqa1LVVnyNFzxQaUCIfBb8Nj0lhLtKECHGrOvs1kqNpN4eeUOqxZBTqE+RBLt0iOcnYEGOhgqhgrxd4DvGj1pv8M7Zvjo4GoXWVuGbq5jLj7z4BqBCUcZCMA+AB7m5JUw6q3EqMfFF73WKgWWP3tR9IYhmoBMVeZ2lW5Ljazkw3OHTw1uTgB8XOUm1BFvGxcL+NW4aTNGXRKC0iwd7oCKxiw0DsZZpX88VgHnB7I7fKRSoo7ZNc2MrgzIyD8pdDSFN/mLCWwZi/cDHg1Tpbi3oKNdfq3r3d0rGAUNWxFvUvcE7DwyBiV3t6jm9CeZQgBlY3ak28beiOtr2rT7zz8BKzm7gPL6R3nS0HfXgR+TVYIpHKBkmT9IEgVpyRWzI2RRKJNeHesBAZOczGd/++mX+47KsrfQW6O7+qk4ORs7edtvpudzR3WfzDOO1TqjGGK96le03gTWQS4Ja75bEJmKxVrzcyhklcnq4vw8u8SeVccNYt1zjARU9RBGsTEjpFuzcTMMupP+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWYxS1BGcVBWRW03MmFUM1JtY1JobWJGWkVoblIrdk1KakdpSDN1YnhGb29Z?=
 =?utf-8?B?SDZzRDgyQ2Uzb2hnS1pIOThseFhoQTF6RDJRU3NmZDkwWDYwc0RGOHFIS1Ny?=
 =?utf-8?B?NFZUelZoaDh4ejBGTlA1WUhBcnZNSjN4UEhxUHlHa1YxZy81V0tzWFlSNVpp?=
 =?utf-8?B?dUkxSTNvWUNQbklDMU5VZ1lkelU1VnJCTVp5ZmphREtRdUNKVG5ITGZIUU1M?=
 =?utf-8?B?ZDZmZFVsVjUvMTNSVFZUR2xUVzV5a0YwK3BMbWI0Q0V4b0x5KzRjYnZ2dE1K?=
 =?utf-8?B?Y2NqU1pFTWxjZDJtQ1Z3UWtSRkMwK0lyV1hKWHYwTWpXNUxjNjNFM2lJMmcr?=
 =?utf-8?B?QUNKZHBIcTErL0pWSCtvZ2p0TDFqM2J6SzRsT3RKVXRkeXc4Q2ovRGE3ZVB4?=
 =?utf-8?B?SU1VOG5LQmMyNkw0MDV5U3FOelh5MUtpUHdET2RJbGJFMVovazVyL1p6emZ0?=
 =?utf-8?B?NHRVVkNmcVpDcmw1czV6MnZZUGVHREdpZ0hsRmYzSXNja3ozY200cjVrMkVU?=
 =?utf-8?B?aEM0aDFZRnZKSks0QnIxRTlya0dyVlBGeEdhY3M1ZWt3bnBYZS9RR2dXaXlt?=
 =?utf-8?B?RHZnci9vdlRraWtRc3p6c1g5QldCMjN5dWVnTnFGVG15NWlVT3hTQjVjbXJ6?=
 =?utf-8?B?UVpHRzRrMHVLMEp4eFFHMENXS3dxZGNxSTgwaE9uMkI2T2F1ekZaWGdHaSs3?=
 =?utf-8?B?NnZ6eDltNm9PTy9naW5hd3p4dHRDZ2RyODlrK2dEWmw3MmdvM09qYjNBU2Ry?=
 =?utf-8?B?NWI5Tm5QVUR1M0owYVlGdG02ZmF6S2d6UkVJbm5FSVNPZnZhbVp4RU1QSjNS?=
 =?utf-8?B?dkFwMU1nTGlXblpwNElOSDRsc0dERW0vbUQvb25DYzNUVW1uZzJJQUZRMjJT?=
 =?utf-8?B?c3MzUWZ6YkR1VjdFOG1EMVl6bEhReVp0cWZBa0Rkb3ZlejhqZkh5a2FpRVN3?=
 =?utf-8?B?bE9EcFhjNStycVA4Y25PNTRVbFVWNVM5VkxuL0psNXlQd1VOMFdSenpxa2k0?=
 =?utf-8?B?R2ZyOXRHOThJWFBMMHlxNGxYMzI1OVc3SmpaT0dtbDdIRFQzb0NpSG9QZm1Y?=
 =?utf-8?B?YUN3Q05LZHgyUjFHN0lZbXZzaG9SSU9majZpN3J0YjVOdkUzVHk0ZDl5WEZ1?=
 =?utf-8?B?bXBrdUk2eS9QWExVZTJJVThmem1CMFRvU28rUVNRdU5TdFBvclV6VnFrNUgz?=
 =?utf-8?B?STVwdlNFSWlqRUhCVlF2ZWZqZEkxRDV2U25jSUFlVE1NVnVJeFh5WS9xSVAw?=
 =?utf-8?B?aTZVeXFYcm1hdW5QTWxxMnl6emNCQkxCbWNkUkFoY2t0TEI1VHJMdUdQcHNv?=
 =?utf-8?B?MlowQlVuU3BxZ0IwREp5RDlBSWRlS0kzeldCL3pHTTVZRFBEbmRYV0VoMDlZ?=
 =?utf-8?B?RGxGMko4MGh2SEhLanlCOTBqTVlxL3RqWDdZdmNXeEJXbUhMdW9jMThoNlhB?=
 =?utf-8?B?R1Z0N09yNzlvK2JZeU5mNHhIWHdqYVU4TXd1RkRnaDB6TVZucUw4T2w4YjZu?=
 =?utf-8?B?eVVQNXVKUDh4Q0s1SnhobTlUN3lwR2J4YWpTbnNPWEhOaythRWIyeWNIR0w2?=
 =?utf-8?B?cUUvV3lzT3VFRnNaa1FhWVFZbEhUMlYrUGpoTFRPejBSeS9hN1JGY2dvcjMr?=
 =?utf-8?B?SDVESTkzTm9HZENJbUZ3SXRpSkhES1pWcUVVQzd5QzR6dGxLNkdEdG5QS1E1?=
 =?utf-8?B?bUN6Ky83eDJhT2thbTAzczZCbG9kQ0ZpNkhETG53cHN5eWt6aStLeHdwVCtV?=
 =?utf-8?B?UnZqWjk4NlNTMVR5OHhtVGFqbDIxU0VCa1JiZE1DWXJrZk5ES0FZYnFHemlI?=
 =?utf-8?B?UkJRb0FkcjRnblZmaERGUGtWQWdqUmhicWFaYmtlbVZ5cG5sSExsaE15OVJ1?=
 =?utf-8?B?MlNVV00yZS9LWG0zSU5GaUIybklESk5CelFadHVFR3FCMkJjT05aRGpkNVYw?=
 =?utf-8?B?a2FrL0Y1MCtKZ0N2c3BsUlVnbEhkTHpJdS9pS3pERDdjVFBLaENWRi82ZmtU?=
 =?utf-8?B?dW9lcW9mRjFHaXIzdjBtdW5PSkRnYWJRaW9jaUMvOTdVWUpKdDl1WUlvTmY2?=
 =?utf-8?B?VnFmVTlaU3lZMHB2M080c2UzRW4vdTRjWHRkL2JCdUM3SWFsYnV0b0ViaDZT?=
 =?utf-8?B?RXh2Q0haTlNCUFdWbDFobzF1dVlkK3JlWHU3VExPek5CSWpIQzhxaFFkSi8w?=
 =?utf-8?B?NE9FZmtyajZkVHpZVDdVVU9MZkcwZ3h0Yi9vMEVsSE9ISHdZWlhaeGVtMjdz?=
 =?utf-8?B?bDdQMm01VFFGckkrSmVJR09leEkrbGhldmwweEl6eU1lb0FZd3d6QzRPWHpr?=
 =?utf-8?B?b3c5Qkd2OG1EU2E0bjdnTkcweFY1M21CR2dmam02ZGlrUWMybDFYVDFYSUph?=
 =?utf-8?Q?12K5NjPI74CWrR/MAh7OrZL+nox0oLul5Ox0p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adee874c-7938-4e7a-c6cc-08df26304c63
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:08:19.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm2C2rsMuJjS+A1V+sMNCDpd6MNDWErfcfxaL7V4VskVkFHapGynx6MyEJqO0L5mkIXIms64Kom3DkOaaUx7kanvNY8r7HFBNX64CjqA13A8keZtjQAbiz3c2R5GJVcq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

This series addresses three bugs and then modernizes the gpio-mxc
driver's probe path.

Patches 1-3 are bug fixes:

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

Patches 4-5 are wakeup_pads cleanups split from the fix:
     consolidate enable/disable_irq_wake into irq_set_irq_wake(), and
     use for_each_set_bit() for the pad wakeup iteration.

Patches 6-7 replace runtime of_device_is_compatible() calls with static
per-compatible hwdata flags, eliminating repeated string comparisons in
the suspend/resume path.

Patch 8 introduces a local dev variable for readability.

Patches 9-10 convert probe error handling: a __free cleanup guard for
the pm_runtime_get_noresume() balance, then devres conversion for the
remaining resources (irq domain, pm_runtime_enable), eliminating the
goto labels.

Patch 11 switches probe error returns to dev_err_probe().

Patches 12-13 are cosmetic: MXC_ICR macros with field_prep/field_get,
and BIT() macro for single-bit shifts.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
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
Peng Fan (13):
      gpio: mxc: fix race between chained IRQ handler install and probe completion
      gpio: mxc: fix both_edges bit operations
      gpio: mxc: fix wakeup_pads bit operations
      gpio: mxc: simplify gpio_set_wake_irq
      gpio: mxc: use for_each_set_bit() to iterate wakeup pads
      gpio: mxc: replace of_device_is_compatible() with hwdata flags
      gpio: mxc: convert pad wakeup compatible checks to hwdata flags
      gpio: mxc: use local dev variable
      gpio: mxc: use cleanup guard for pm_runtime_get_noresume() balance
      gpio: mxc: convert probe error handling to devres
      gpio: mxc: switch probe error paths to dev_err_probe()
      gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
      gpio: mxc: use BIT() macro for single-bit operations

 drivers/gpio/gpio-mxc.c | 280 ++++++++++++++++++++++++++++--------------------
 1 file changed, 161 insertions(+), 119 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261003-gpio-mxc-cleanup-e49cc626c51e

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

