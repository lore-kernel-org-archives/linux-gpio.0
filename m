Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1075743DEA7;
	Sun, 11 Oct 2026 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719705; cv=fail; b=AUmd7DINw7r2j2jFGpQjRdlnSpb5ldrzrxp7nb80PE6FobqBHy5Tz7F31EgkewyKp5PeISNf/AIwFu5y/yp2fLYjWWuhpAzkzpLK3+bFd4ln4i/DIKoMmA4bk68y1Q9tYATLIIVxCdxx7TjkkBu6J9aqPKS4HrrUuKFxr+AtW00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719705; c=relaxed/simple;
	bh=GDD9/Adbb0FnvhzFsGuRmSeT+wocFNRcVChjEHwQSxE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qCYIatBoK/h5UU7TVN15vwcS+uMttMpuHVUcyrh45BTCn4JbLcoEhtXGJEWY8epP+qP8i7LVTnNBh1ncuVvzlmZ/lgIsDtoFA2vBzjeZlYz0k5+5MHoFw2xj7IiFH+7C5SVibUr+wQxHiOIs0bb+WYSv2t3vGSvIHKxnjk2HGbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q421NK6F; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q421NK6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THLgb6UiR+7NaoqpzvS89mCPEzooTyspZLP7aAc1TzAk9OL0ujzXW8Y/0B7JZKlbln8rxnjmXpyI5d/tL48c6XttTkpsLc7pA82kLiJFnOa2zFID8RYfK0jiOxkqpU0+xCX5AUY4ivL9tz3F9ewbMVFbswJB58Jd4azrEBCc2DZ5n9Qw3sHg2ZzQjPZTzXeKjBs9Fz9VPK5a7hvEMW1rqpSScunR/Egkc3Z/U0ZP4/kOV2OtgqIGPkCifZ/3lbscPKr/IN3ueBO5Fz0Zkoqx+Ep/Nsb4PUvLEoMfYAx6Rbe+H55icNCfzqH/yNEeaCMu4OYe8Ntv/nCPIL2+gl5G4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ijo5+M2fHLAGQeoZk6Bt/mZc4THGf/JnteITJdfknE8=;
 b=avJAa0RTsfE0Y7NMZlVxI+QpbEywptggrreZolzxPdXKTxzveqv8Zk677Qb+g1DYKe2OAEpXiYuVXnxORmPJ7X2cnxoErrAn/qGEhQUqO7FeSz1qyyqQonPLwn51M0BBJ8zHGV2j6AsFmhfjo9fEDtMGhlIG82tDoJVWvgkZeZ8vyjz3wQqFJOJtCddogmzxX1yy9z9iLF2Na3zdffngsh63ZMox5J4/E8gQswvnfAutnT51yxNSVYHbZmSC+QOYfLWFuOAUmTTKcDNNwumUhzZUvF/AOy0qidf/qA6cX1X0wshHuCFHHFJAsD0c3rlA2/+3G8oRHd2TOYBvEHq3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ijo5+M2fHLAGQeoZk6Bt/mZc4THGf/JnteITJdfknE8=;
 b=Q421NK6FNah10SV41l8HKn2RdVbk3e2WJbVSBPx9kO290OK64SIElrPIxk4qeIv5eLwhVRw3zuVfUfANfOx8gBs/L1jvMS7tdadXG4t4yo3/JUPpu1RmvqCHu4EhDsDXjSqkYg5+OIPiTlWRv85h2yVaDLGIdj33cKONseepsisfTClMKpTpLC6hlKSN0odY7l+b+W6J495NwpNs4cUXN8PsfqSuOveoKTScqpFdvnmTJnxKTCEVluiXt2F7K+j2udqYu4yVj/esuHfnFZzvzRLZ4qR3EVGJkM4LFKwN5XaWReeX2DRZHP7JqRb0DhXwJTee+i/Iak2rzQWNt1pNWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:38 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:28 +0800
Subject: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: f01eff21-aa0c-43b9-931e-08df278e6d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	hy/COouf3oBCLmNnt9NonIO4hcl7npFd/BctJSehgA7A+VVxAtC99xwkJiDdI6RX5dVNDFiNrSVfRO8YOeImXC98rz3KECB9qH4Wq6xnAdD3ExYHKhRkpF3AqtqqBUMhGvWE0CtrqufH0o8c1i9zXogBSnhNsdXQZsXPyJRwkGwGsu4ovqcuCAFYZLYeDcUNrsI1OQWCGrSIESte0LlQWD7bTDhysbj+0NDTtMcj3LSuSDcpRcY7MJ3MrXEmpgaRhanYcarLiR7P6DJKZ/d4j0kcjf/ZkQGjuS3bahH3u7yZxOCYWHU02SL2JsnFiwF8ifmTgkdlZgd92FIELgb3ml16OEmH/brQ+YosMwww7kHEWHaHSgP7nHIVDRMxHzuDv0JJVj5KDLW3BwFgOellMyB5HnMQtTjdzad/CPte4MV3up+eC3RtzWSHvm9yXqSkNbqMKTBo6YyFJJgKaIGkTadhdCf3sHdSbt2BWFqyBD0Zb1MduPtegmUayFcC6kk+luhx96dICk1Ygx6pDPNRreSoqwHEEBQbOrje1kteqcfeCmLPxfybWd9plX61TXtr02TicVB65YqYdnDbyAPFX+p2wafq+5jLB2o8aNGO4hQqD/CdgQXX3pfYYOkPnADhY1EFbLDqrgTUWnWaaVNiUeRpxiijTEmhP4nTVh+jOds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2NMMlVibGtwRmIrZHJLODlnZGg2dnRuZm82RW04d1dqTWRwQmZxSlYzNnFJ?=
 =?utf-8?B?MzMxRzM5RDFkOHBpTlR2RkNldmtuVEZvQUJDVWdROHg5bjZ0YlJhaldFOFFx?=
 =?utf-8?B?a1VlWnU5ejlQNDRNNHlVbWc1NjFFMXJFZ2MrWHFKS1FJWFdENHVReGh6QmpJ?=
 =?utf-8?B?d3VVTkg5ZjBxbCtJRElPNGorRDVEc3ZRb1pERk9xbUQ5dHV2c3VEMndQTkx4?=
 =?utf-8?B?SFdZTGxPYjdJMkhjbUpuQ3BTMjhBenF1a0Z6VnZkMXJJaDk2cUJ6ZEEyYkt1?=
 =?utf-8?B?bmVHTy9vUlhDanhQRXQrMlNobTFPdlV0TStUQllmSzZ5M1YvMXVvT0xzMWZm?=
 =?utf-8?B?cWdHeVBETXdWWnVWU2xCMlZDdHh6VzBtdERJTGJHUTdOdGJQU3F1YnMxZlI3?=
 =?utf-8?B?cVcxRXZoUGxEUnNuY0wrTjdYRmRtdjF3TXN6aVdyeVR2YjMvd0U3czlqWk94?=
 =?utf-8?B?U21zVGpPd25YOWYwZWljQ3JwOHVwWTdyR1BPdUlEc1JodnlpbHJDQzVTNXdR?=
 =?utf-8?B?WDdtaE5OejBQTStXbU0rdHNwRytMcHdHdCtXSmNZSHp5RUFDWnpkL2kwOWZz?=
 =?utf-8?B?cEpneEJFYnYxRzQwN1U3SUc2dHFLR2l1cmhhRmluTi9HSmVsRk5nVnFXaUFv?=
 =?utf-8?B?ZS9mYnkwMzY0THhDSUtYNDdqL281VkR0K2VxeDhQK3Zmb0daYy9EaDF4MEti?=
 =?utf-8?B?SGFXU2htY0paUmNMeEZqMERTQ2d0cVFvUmZybFFMZkFFRVdQMnBERWhFOXEw?=
 =?utf-8?B?a2NMcHN3cXZ6WStHU3JuVEFwejc5dVJKejgwRjNuMGdyUjYwTFZROEgrOUxH?=
 =?utf-8?B?OFZWZXNzSnV1eHZLcjlmOUR6MG1oTk1RYWl0SEVOWmt5cjAvcGozSWtCL1Zh?=
 =?utf-8?B?WXduQTlrb2lkYm1jOVFWS2w1dVZqSFg4YVNzTFhlTTFrZ3lCQ2pnOEg2T1I5?=
 =?utf-8?B?VlNqRHFIRWVVL2lxNDh2am1RUTYyVkxmeUVwVlZPeHYvK0ZKNEJlZENXQmJI?=
 =?utf-8?B?eXVpSWFTSmo1RkljcEZGNCtqT1lJZThVSk5xVHJVeDJCSTJoTDEzUkxhYTBl?=
 =?utf-8?B?OWpDMkhkdnJyN20xSXdLT09TQmhSU2thbVJTQmFXbmtWL3Yyb01FUEVYdHY2?=
 =?utf-8?B?ZEZoc1BhNzEvRG9RYWhXaDhjL3VoOFozYXJJZm0zVHBMY0dUT2VSa1FjOHJN?=
 =?utf-8?B?UGhaci9Xb3B2dGd3YnJ3T01nWXdrWVlYcSt2emRuWFp2Z1JHMjAxWVF6bDZw?=
 =?utf-8?B?N3NwczNMWWU1ampob0g2bHJZWlY3ajVGaTV0UENTV3dXc1NQQjhnWGFadHVD?=
 =?utf-8?B?cGV4U1Vucm5FYmQxY3lTc0dIV3lQa2t0RDg2UzMwNXo5bndrVndkOVVpZmxN?=
 =?utf-8?B?ZEZsMHpDT1lIYnRReHczL0wxVE14NnhXTHhiZkpITFEwdHV5SFVhcFV0ZG0y?=
 =?utf-8?B?L21UL1YyMTFoTnNRWUFlUlA1Rlo4Z3hKZzlWUjJDeTJ2QW9SZ0YwQzgwQys0?=
 =?utf-8?B?bEdDQldJQVU4bFFmSUd6SW5YbzliWEVDUHRFOGduWW5COFRTNXp5clBRRW5s?=
 =?utf-8?B?MTlldS9sb1R1RGQvM3hNUEg0bDdSa0w2M25wUndoM0RWMUQycTFxaTJXQnA2?=
 =?utf-8?B?NDltM042d1JCZGkzUlRxS0hoT2Y1emlXcFIxck1UcklxS2gwNzFCVWJ6a1Bv?=
 =?utf-8?B?ek9IQStFcnVOdEhzaHZmSFVjYjN2ZDkvVTZGTWZrZmVJK0VQWXBYVisrc2Ns?=
 =?utf-8?B?bHBndjZpWG1TRkNXRnRHTGdpaXFDRVQrTjB4QUVNRzdKT3BpVzdVVm0wQStV?=
 =?utf-8?B?c1ZFTDVPVzk0MnlQd1VjdEdrRCtibHVQSHFEclZsWU1XSHhZaDQ3WlUzamZp?=
 =?utf-8?B?ZUMweUp5VGpYTmUyRElUOHJiWUZERUJjV3YxM1NiWkd1a2Exb0tiTEROWVdv?=
 =?utf-8?B?UWZnRG5WVXZtOElzQTk2alR1U0x1TzZDQkhsSVMvS1FzK3dOVUpmQTY1WU93?=
 =?utf-8?B?ZnZRNTNFQlAveUR6TEtaZXBuU0FrbXRCQ3E5ZkpJby9tNGRxWGxMMjJHRThZ?=
 =?utf-8?B?SnFZWHB2cGsvTVExbnBQalZDc0lsRFY3ek5OMFZqbzI4YVF5eGVLcnlIV2g1?=
 =?utf-8?B?dmdvcm5ReWt3KzB3M1V1TlVlSlloQS9hZWlCTHUydEZMS05Ybm0xc1hLbGVM?=
 =?utf-8?B?M25PNTU5aFliSlR5bFYwVjM2OHg3Zy9URzc2akNBWFkzQ2lGOHd2MlhNWklN?=
 =?utf-8?B?UHJOY0sySEV5QTJQUGErdFFDdU5ISVRyTWVNUmVMRDRZd0NJTURVeWhaOE40?=
 =?utf-8?B?Qm9SU2xPbmJFMWh6akVZYW1SVTFsdFBzR0RXWlp3T29zbVNFR014SEw3bGJ4?=
 =?utf-8?Q?uI9kuzDMq6zrsKkKfkiyL6I0o9dsxYxb+Cx1Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01eff21-aa0c-43b9-931e-08df278e6d7b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:38.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oS5WD/wKrjhnnPsjnJyitqHD+zQ+ddNYVzFPZrZbOtg3uDc6S5XctObKyhyLheJLCzXGmfdMiQ5wnY01arGM0Z9x9abB4CgfwZ5GWxGT4QMHXnYDhyQWuDsyWfUpp3hz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
of_device_is_compatible() on every invocation to determine pad wakeup
capability and i.MX8QM-specific behavior.  These properties are
invariant for the lifetime of the device.

Extend the hwdata flags scheme introduced in the previous commit with
MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
This replaces the repeated device tree string comparisons in the
suspend/resume path with simple flag tests on static per-compatible
data.

While at it, clean up mxc_gpio_generic_config() to use a local ret
variable for clarity instead of the == 0 comparison.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 46 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1a35b23747b4..70fa139338c9 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -34,6 +34,8 @@
 #define IMX_SCU_WAKEUP_HIGH_LVL		7
 
 #define MXC_GPIO_HAS_POWER_OFF		BIT(0)
+#define MXC_GPIO_HAS_PAD_WAKEUP		BIT(1)
+#define MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN BIT(2)
 
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
@@ -132,6 +134,26 @@ static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
 	.flags = MXC_GPIO_HAS_POWER_OFF,
 };
 
+static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static inline bool mxc_gpio_fall_edge_wakeup_broken(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN;
+}
+
+static inline bool mxc_gpio_has_pad_wakeup(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_HAS_PAD_WAKEUP;
+}
+
 static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
 {
 	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
@@ -158,9 +180,9 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
 	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
-	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
+	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx8qxp_gpio_hwdata },
+	{ .compatible = "fsl,imx8qm-gpio", .data = &imx8qm_gpio_hwdata },
+	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx8qxp_gpio_hwdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
@@ -575,15 +597,16 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
 		unsigned int offset, unsigned long conf)
 {
-	struct device_node *np = port->dev->of_node;
+	int ret;
+
+	if (!mxc_gpio_has_pad_wakeup(port))
+		return false;
 
-	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
-		return (gpiochip_generic_config(&port->gen_gc.gc,
-						offset, conf) == 0);
+	ret = gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
+	if (ret)
+		return false;
 
-	return false;
+	return true;
 }
 
 static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
@@ -591,7 +614,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	unsigned long config;
 	bool ret = false;
 	int i, type;
-	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
 
 	static const u32 pad_type_map[] = {
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
@@ -612,7 +634,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 		else
 			config = IMX_SCU_WAKEUP_OFF;
 
-		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+		if (mxc_gpio_fall_edge_wakeup_broken(port) && config == IMX_SCU_WAKEUP_FALL_EDGE) {
 			dev_warn_once(port->dev,
 				      "No falling-edge support for wakeup on i.MX8QM\n");
 			config = IMX_SCU_WAKEUP_OFF;

-- 
2.51.0

