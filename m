Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013024.outbound.protection.outlook.com [40.107.162.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7155647F767;
	Tue, 13 Oct 2026 06:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871455; cv=fail; b=p/8+XVbM3OgLyPAIkqLtHEKtTE1tX/QevymCUVRZOY7GLRWCfn3ysj4hlVuG9Wy9stqN71XqPK4ZI/I6zyAi2mAVE/hzkYuH/Mc0rEz66A3CcVIx7dmjaZgYFUkWK8E924/zZx9HKg8luAdtiPGu3bzO+LI0MdTG8Ys3ljsPOAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871455; c=relaxed/simple;
	bh=EBiEhPd2vcdIu3AEpD9DD0yO7XRRM7XadwSkZ1QcBPI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rFt+G892IicTA3X4uAOk50RHkZs1YIlLumFO1QBotquC0USuKSg68yWZBaQsP8qqS7l6SLGo6zy8ho20rYzMJTBUe+YmJzh9Q7/FlS/o3k3gTOrSbg4PkNLFqD4pQtYLCi9Cz7zyiwGL+2i13sHI6Nly37gOhfrocUh7Ivk06YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i3mE0ENz; arc=fail smtp.client-ip=40.107.162.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i3mE0ENz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP9flCHe/gOYfaAj32YeGXgRZ6Z0EmsDO8NFtU9DX8Zmkb6wJ/GLhJXmQlK6QPeS62kSFVQhetRROI9zmwvz2M6PlYL/joes3uMyZG6EEmh7tx+9Yd/OaO8cZZQoO0bncIZv2SpXsfvonnL8lLOd32DuciguhoQ1u6EIijMUo4YxOwq+K0u1HcDU4LhV77/QHqIHrxDXcnWyL1Z3RGlrAEh3mUdkjeMK092+WE+QCjinNPq8q31vQXocAOYNyTwMLwinCoSbAEC8Yy6taciqKu5qz/MQEtrIEPP4Vgc+QnrvrG1DELRgDHxK/Ltqn5tXyUoTLvtdASMoYMYX52oO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqxtrSbNRRSxgCEWllTQDkLH29ky6SRDgBzifkm6Frg=;
 b=vJvY3B1tQR2wKEDJz02qdJVe9GYTmvzO+vQB+Yuj/exvGKteZGgelKYD01OWMPx75KaJawef1I7kzqilif3LmHejVVpWdabU4un9wIU75m8iDdpZ6QhZRj7YHJcw7MNbfslnozeI5j7GyeWwmpXcVr7U0B+4HpBn7/IkCqDsJN6Tw39kNpGp7z0AdZZLKlxBMROh/k6dMVivshN8183iYDbsftHP+ecWoYYu1AfCbs+CpUim7Ph4XkLmAfHuO96zdoPLbGsTv87zqtrzRWxtsi1ktjPLvZY2JrRIG3Qew5mLLEIi/d74/w0ZtXJYT3mLtuvrDy1skt+AzpJImYmutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqxtrSbNRRSxgCEWllTQDkLH29ky6SRDgBzifkm6Frg=;
 b=i3mE0ENzxFR5KJLKCnRaHEjDUzfUVdOXnQLUVTrUsG+c1Jvt85LVftL+EkMlaOEO2JVCocx5ojJ0w1l4erYi4+gqiEmN4saZGiuAng6gLdDlEYIHfGx6bksxMdpVCWsr9Ku5ddUFTLahf0Oj3kr7Aa5nDtFxRWKpbZYafC9P/Nu3TS+77w9O55bHW3MLjTECsyPZ0NbUGmeWpgEfktZQgeI0rIcKo66UUH4XSnImA/RVv/aaKtQqgnmsoHNpv6nOkfmxZQxRTAwzROcf0jaDc4SLoTvLpzDjV543694kIFKwD05m49XPPUtmcMi8ZfvnUrHabxlfW0TbMO/4rt7e5g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8470.eurprd04.prod.outlook.com (2603:10a6:20b:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 06:04:11 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 06:04:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 13 Oct 2026 14:01:12 +0800
Subject: [PATCH v7 4/4] gpio: mxc: fix race between gpiochip registration
 and IRQ domain setup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-mxc-cleanup-v7-4-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
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
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: a03df6a1-02c1-41a7-74e0-08df28efcd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|10067099003|22082099003|56012099006|11063799006|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	0tAxHB+5btYdi1J/ihX/r2SFMc1rf6fo5ZeY4A0sjRGDLQz59m1DUSp7ubczzaq68UxWFgL0qxZ+1s2UzBv9ZnDyeDy6qB8mwhns8TkoXnoef1IwcYTLvJ6gETz5l4Q7MMri2FllNEyHiRqMnlC41jDA87hOO9qjb6PJfCvMr5OA995+X5ZdNrBgtUhujgDMENpgiWmWIi/N4MkcSQFBZj1wV4kfzD1mc9IxXtTbGVKOFzpfiSLu6mhHPjAzj4SKnKrwXuOOlLaN6rWxdW0kj+8Pa02b9i0CAqV+KwLq9Iia0ws19rm7ro9vFFEOjE5cnKXDP3a6Xntb3lAAL/+agEj8v49Kk5lC6dowo7WjYnEsuYBiZRE11H1OR+SjIowU2/q7s1kDRLolL/w3raxWy86MyPEYRR3iqrfjQFZtV+2pUTLTD75YqCpGMVI8/KM3iqaq1hwFwA8BC1TvrX+VKAYvbBuKDTo7uxrKBD/bE5zPuKa0BkXZUWGc1frP0RcxzHSlt4812XpEGFdTk79pSzoxteY14ITUqJgVgTlotZaACqWzwLdHJ+V5A5VDiETMrnnqCJYU6kwpGf8mThzUHZVUHeGy7dkYQkxDt3AyRIM5sA7scdp0I7ibb8detlEHvV417Hx8SZgR+zoa+qgY6nYnppIIMNxBpvpAzEer/KM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXBvbDlvQ2RaVXVITHk5VUJqVHRxblZyR0puRXRmWUJ0UXJUdkFGYnMydEpk?=
 =?utf-8?B?VWY2d2hzeTB5a2dkYWpBR1RTVHJTa3dSeEp6ZTdQV3U0dEdoYjdOU1UxMHpj?=
 =?utf-8?B?UEY4aTNFZUxkTmpCNldvVDVTRlV5cURqcTlOUnJjdE82ak9tUXNpcDRrNHZT?=
 =?utf-8?B?WllJZ0xoTnJ2OTg5MWJJeERkOWZCaUoyUm1NVFFRcmtYSnBtcUZJRmJYNStl?=
 =?utf-8?B?Y3pMMWViUGlISTdlS0V3M1FXRm83Qmh1Qzd5eWxEQlowUG84YXk5RDJyNklI?=
 =?utf-8?B?YXU1dmJKWm5IRG8yUktuMy9YckpsVFcxbXo0UlB3UjRRZjZhKzgyZEhKSUhD?=
 =?utf-8?B?emsyczBtYlYwMlV5T0crTSttclBjLzlNa2hwY09hTzQ1UWlSSnBtc0VDdlAv?=
 =?utf-8?B?a2puUXI1VmwvYUlIWk1EMVZVYURpendHbEV3Qm93eHM0aVlPeUxZQldVL25i?=
 =?utf-8?B?am9kTVNwSGovUUg5eGdPUTlrUGovK3pBZk1XM1BHNzRVbmRGVWNrR0l5SlJz?=
 =?utf-8?B?aXRRaFd1NjMzNEE0R3VZb0c3Ym1ac1ZUTkcvUFE2SFE4T0NveWhLZk5oR25j?=
 =?utf-8?B?b0gvWVhUQ3MrQ1p3MmxTQk8zZmg2YU9lQWU3aXF6azBkL1hEQ2N5eEVjN0kw?=
 =?utf-8?B?RTlqMGxESjZYek1JaUVIazN2Q2dxdkpiRWl3b3V4ZHNHeExsUTVvVWpENnB4?=
 =?utf-8?B?VDdZbFhFM3p6ZWV5NUpLMzlyaWFZMG5OSWdYUkhNaEtyNjdBcVVJNkt0T1dI?=
 =?utf-8?B?eFduYW5EUlIxNEhLdEJSMGRqZU5kbzRWNFo4NVZaRXhJdnpPbHd6U0laZUgw?=
 =?utf-8?B?L2orYlRUdWorZ3dFK3lwcDZ4WTl2OWVsSmxnRFh4M29hZml1bC9tdWhiaXQr?=
 =?utf-8?B?ZVBuV1FtU0pNZGNBT2pLaE15Y25rNDN2SDhPUzI4czdpT0JQZS9hZC9JMG1a?=
 =?utf-8?B?b3czOXI3dW41dnB5R0xOWG1pRTl6czNHT2J4d0JrRkZ4OXpDa3YrTG90N1g2?=
 =?utf-8?B?YzloRFozV3VUcTU4c0RzVW9uWkxiZDVoeVZEZ2tSK0tFcisxdHRIb0xTUWcx?=
 =?utf-8?B?K0lpamsrRHl6alZqVzZxcHJzazdyMEhpb0RGSHVRakpBUHFVWHllejNjMHQ0?=
 =?utf-8?B?bkRnTjBEYmhDYm9UeVlDSkIvL2hsSnlpMXByeE1qeU43dStTWUY0VWw2dnZB?=
 =?utf-8?B?SnVJVGRST1dTTmlxUm55VmFRT3U1dTgwZlBVdnQ0TU5FUVRlRFhiYU56dDlI?=
 =?utf-8?B?L0VGN0RBUW9KWllqcnJnMHRYWkUvTzNSKzVUU2lhcHlaWWI0aGM4a3QwTVdD?=
 =?utf-8?B?ME9rSUlmalpOenE2dmhCcnFEY3k4UExKT0N3OFcrRGRTVjFGQVNTRWhuTytE?=
 =?utf-8?B?QUNXbmhXVmJZMk0reEVyckdmMzVWbVgzT2hMdFZWbkRxZ0ZTckptd0ZteTIy?=
 =?utf-8?B?TDI1b3IyVzdZMWRvRXRFY0ZPb0hrZFlTWGtZeWN1eDNIV1JkcmpBVHh2ZUo4?=
 =?utf-8?B?VXBjWk9WTm9lZEVCY0p2N2RDZ0VRVmdMTWlVK0Z5enRSclpKQjJmRnQ1c3Zr?=
 =?utf-8?B?bUQ3V3ZuNjNQekhuSXlDa1ZhTmxiL2dpTExwRkpab1ZaUTh4Y0R2TWRSQ3dx?=
 =?utf-8?B?N3hNYUovZElPUjhxUC9TRFB2eHVTS2ZuM0k2KzRIWXFXUVppREhYK0l3TVB1?=
 =?utf-8?B?Sm1yd2Z1MDVUZ1hCdmFTdEYvaUI5NnR5UWFsOWdyakZPWkN1d0dGRmtHVWxs?=
 =?utf-8?B?elVCU2VXVXZEbWg0MUFNUncwNUdzVW41WXQ3VzhLbU9HdituYWtUbEQ3eG1x?=
 =?utf-8?B?R3J2cU04SFBtMVlFQnM2TTRIT2Z1V3NaQ2tOVUx6ZFhGR1lKYTNwTTN3czNN?=
 =?utf-8?B?dkgxV2c5S0trT1QzWVBWTWNtcFVoaTBiVE1RS2VCUEF3d3VTamZpSUxERGVH?=
 =?utf-8?B?SU9pMXRLS1djcWNScXhTQUFLTDc5WVhzNDdVSVlldkN1NnVzNUdQckZGWEk0?=
 =?utf-8?B?b1hpZjRwQ2NuTGNZc1Exd2szT2lQTU9ZTWFGWUtKOE16bytjZHlBSjFDQXZ2?=
 =?utf-8?B?OTdRSEEyRmpMdm1uREh4WW9xWTh4R1poVXZwbjRxait1ZDR1Y3ZiSGdLeDE4?=
 =?utf-8?B?ZlRHODlYUmNyWGNhamJ2WU1zc1VwTERkanJpcDdSUGhwZTNlUmhYdnhKSURt?=
 =?utf-8?B?aHNWVFg2R1kyeFZsUndVZVFLK3BBdHptSmpmY2E5c3krRUZKa09OVTlnUG12?=
 =?utf-8?B?RWRnWkZSdFkrNUdwNzNrb1lJTzVVdHk5TVFqVkxyVUtidVpndEpQN2doZXhh?=
 =?utf-8?B?ZVVpU1FOMDVURXJJZlhpSFNTM3hTQUtDcjMrTmhBdUdLUm1tbHNLclY4emUy?=
 =?utf-8?Q?t9TFdkjwQ0XczZe08wpKjPjp9TREPul6eEKgn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03df6a1-02c1-41a7-74e0-08df28efcd16
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:04:11.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+Hz/JBVGvQU6ENPeoOxM3ucM1kR9D9l+12j8UWeV6bSMsrikcDjPIX4cICohmw/wb8LikcQFY3t9MaUrpxvwaGXKH3YfpWAdXOqgjGKLdHhxd1GKdy/IQuF6epVLFt2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8470

From: Peng Fan <peng.fan@nxp.com>

devm_gpiochip_add_data() makes the GPIO chip visible to consumers
immediately. Since the chip sets .to_irq = mxc_gpio_to_irq, which calls
irq_find_mapping(port->domain, offset), any to_irq() call between
gpiochip registration and IRQ domain creation will operate on a NULL
domain.

Fix by moving devm_gpiochip_add_data() after the IRQ domain and generic
irq chip are fully initialized, ensuring port->domain and the irq chip
handlers are ready before the chip becomes visible to consumers.

Fixes: d37a65bb4663 ("gpio/mxc: Move Freescale MXC gpio driver to drivers/gpio")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index e3a80f17d041..32ded7b548fb 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -500,10 +500,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	else /* silence boot time warning */
 		port->gen_gc.gc.base = -1;
 
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
-	if (err)
-		goto out_bgio;
-
 	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0) {
 		err = irq_base;
@@ -524,6 +520,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto out_irqdomain_remove;
 
+	/*
+	 * Register the GPIO chip last: devm_gpiochip_add_data() makes the
+	 * chip visible to consumers immediately, so the IRQ domain and
+	 * generic irq chip must be ready before any to_irq() call.
+	 */
+	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
+	if (err)
+		goto out_irqdomain_remove;
+
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
 	mxc_update_irq_chained_handler(port, true);

-- 
2.51.0

