Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F604F5E0B;
	Fri,  9 Oct 2026 18:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570823; cv=fail; b=gDniVUVORpX3FXYJcXdbfwfc81x0YBtOHNDlzWlmiICB9oZ9WJ0lorz3lJzcOnvmZUnqm6Tigu37hAhdTjjkiE9GfPRQw8RZauJhQdTDauU/ppw7XD6Nqa/FMFA2Q/eX7a65654UYjjDGC+ibeAvKJswlTg+bsczExNbhghzLlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570823; c=relaxed/simple;
	bh=PyYNTk76chGA1GEnUTPc/DQIyNCeJ2lhRnYVzducTDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iHV/vYLzoU4tBkzscqJYFE4ih+t0xS9iw/6HiUSFnlAayZSy08z+V21A/Z7btSeQHMNuxLuuCB0WZ/wsXV/7ci39Ttezhi1q/ccO2R3lw/x4/DYwiv3pD7Hmuy6OEsv9N/hOoLDjAyLZEJ06z4YVZGQ98MQvxKAshiCyqKyTU/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PlUuvtQC; arc=fail smtp.client-ip=52.101.72.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PlUuvtQC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+UvIsHvUXBZ03q57HIctyMvRNhLh+YiikBFozsqEZN8s/ReU+/r5DRYUWP5Hcgl5VYEtRl5I6FFg18TE0PXRAUVl+Ctvef03yJdREYundk4iCbN+Cd4s5LONNiq2Z6p8s7LUth2Ndb2ox01KHrlm7/BzTQFafaFaVHmIXhqNSUaEG6vCm+ilbK+CWdlYj0ZkDU1sYvXIYNcFL/PiKFDtlU25oeaDtZOaezJRVCKUfZCPx9F+ur7jHqdd/A111rk8iOsXyLdo2gkhuuLjoXYFEUG4xhRQSS7FuJwUcqx9rWJ7A1G/7Z3loMn6k2Yjx47KYiG8E+fuRGz9K2v13HOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFtuLVU2uWLPpYx8+zeYgBxfEyTeL/q8xvHUGwSES30=;
 b=vUlcnXRdAFdoK6tSqAYwFVIq8FWAVYuvxOZgmOdnrxX9Q3LEt38ZmY3DoWyo+pljOwCoWgMNvgfOvYYkGcJ2YGkppJ41oR54+//HeRxjUiLH8u3Vu9rhMz9yrFvi3k24KIIkROufmggPztLNV0CxDYDDJcAeOsfJCCRXHzZNlzElt5xj5D0HqmUADjPhxPzJCGCmeJ4yLi2hmxtmWjO0tHNBNegd6jiQm+fza4Xc+04UEjgF1WGd00a7gvsvvccV428NTVMBNVGJz/H5Oe5zF2aJCWUzaWwW2l+oa2URrYSXGlopgYHxdekSisiLBn0l6Ml9Ov/uXSP/zh0ymq1YBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFtuLVU2uWLPpYx8+zeYgBxfEyTeL/q8xvHUGwSES30=;
 b=PlUuvtQCbgZSJJi3T3wIFSnfxVbIZzn9SA/8+bjkbWPDzR0BazYr/3y0GW9xym4RHlmSe7qGAcmso9gJ7od0APXAuLstCXJVReTKOiqsRKLIoeYcU6UHb904MRqglqSTE1P4cw2aX/quPMuXN0BxB825IQG+T6Qxh8QQhZIi77GGKhQDSGWXu9U6v9RlUoYcvBOhZRJ/hw4xr6FZ0Sg342AXAY7hCP2cqDogMmum242d4aBkNqZJ/GhmOQkioK5xXQEaOcPdDb3cWW56NpYVgTPD2kc5ja/bW0wOPJm6usrBhrC0T4WhpUQmff+ohmwYe6IJOKwcOvPCzwz2brBgvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8534.eurprd04.prod.outlook.com (2603:10a6:10:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:33:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:33:33 +0000
Date: Fri, 9 Oct 2026 13:33:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 02/13] gpio: mxc: fix both_edges bit operations
Message-ID: <askzeVZ_hqfOgftP@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-2-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-2-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6e8ad8-a189-4079-2e69-08df2633d2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|19092799006|1800799024|366016|56012099006|4143699003|11063799006|22082099003|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qvCM+UKV2wVo3fA8MFSh58wkUSmlAXXQsXEffWbnpFm8321nUqlVCRerpH7ZEb6VSQMZr0qlZIU0lOL5aMnuvoIioK2ozX6tW3V1Tq0H1c55sRmWlIAIFGH6P1mpOfXNUKqCUxj/hgNepLp0q8ItOqubQzeHHJDbz29XmFDnB+OXxkmGdOXjRVknmIr9pjSsTbKFV8vg6DYSf8LG91gKDw2LPU/0tpRwdGN86hTN5KWPvOoidTecaOXTcVCgEglXnNtTzTP2fFg9KmUpIInACgZ2B4PKZB5Ct6kSBIiOAe+szwl/TXpgYYEfywKqMG7Eg+UPRQWZAqwBPKO8X+BZZ7NW9qdlsvDTCMjBRNhOvLkEJWfUMlejY6AD3ysZhbj4wFEagliKJAS/RgVV9WYhvz42qheAXyenylUObF+ZiDNpmNu6Z92Py3stQvl3sTwTMtxoxTdjFc9rEIxaKr0XYrntXKyiesiJQf/GaaS0BfqPPrC8jY0eoeI7UzUKK5DIMZuCrJf3HChG78tfK68Y6fpK4iGxuDp7zGLnBcY6MQLl02Jb+JOQO6Zk5Gn/T2asQFnRcS+QRR61EEcBbYEKVdm5ECsUDZhQorHEpyobP1wi6OhErylHNLyhUH3QW7A8WViaJgFwzQGnjY0ncDiSS9QJNZrV5waGHFfWAcnAZ4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(19092799006)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(22082099003)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T524dMouUyDTzdoWN/hjUEkURx7BtWoB3E5/lPGAOtX6ETWB1a3e5zBPEQtj?=
 =?us-ascii?Q?lcfbhtdhVvwwSWcyhflQBT++l+SytBOU7wjiZhbOv5REgtgfm0pNectcj+0X?=
 =?us-ascii?Q?ywA/W2AQC8q/IvBVWt+vZHuMLuYSnJKoJE4oEmwRsB/edUcaARteuqazlJ1N?=
 =?us-ascii?Q?Y6P4lwQE08yiQCXeheth5b4QJOC+Z2xa8krRSO2T13YVCqvAYEUZT+ZHVC9P?=
 =?us-ascii?Q?wA/I+7IgHvaQmpVIHlhoSdMlGSO95tJs1yPgFOnaWejEsVNSnUE07BxZGJFz?=
 =?us-ascii?Q?Qd1aZhkJLLWFJN0FikSkOmCj4FIEv2CYknLOcUeGr7dQQCAEnA8jsi2pudUE?=
 =?us-ascii?Q?GlzXwlNMw4R1Wx7r/CHuI2Z/TncsLIENYYkVnZynhUK6MFmxk8dERZlmXZiO?=
 =?us-ascii?Q?8+91+erdY13LOmT3kP9fq9nxkNYeySE7NRJe+CxgM2ErvPcKC3lL4gyBA1H0?=
 =?us-ascii?Q?vAm7ogYZf1N1H2+zbhs1olSXveBFb3GeCS0cRz6GSQ7uX/h85HYT6RlohD23?=
 =?us-ascii?Q?7B00cuYe4y2lciUagQ54ePKxUiFgdwLx6wxXJFxOZNTmiNxnmdWFaRuqBBXt?=
 =?us-ascii?Q?TFvXlFuAxnv6FBj5NsZNOE+qLzto/9szLdA0HNYhS6sZpCNmm94FHSx/7K8L?=
 =?us-ascii?Q?O7tNGFwQGRocv6YQ7eDAvl+fZ7T3AZGiZA9mVMNr5r4ZYOaeEPcEy7gthqig?=
 =?us-ascii?Q?T5BK2KTEjpfKAV9QXFHh5WtleEnOTrDGYKntzRQ2eXZhR911pG0cXxIB1Jo9?=
 =?us-ascii?Q?GC2mnMzirDTzMGQ3saCKMiFE2ehAN8uOjAxw8fVTNv4M5S4VxXYNpsqOlmRr?=
 =?us-ascii?Q?2IJ9ayL29uwSdrStrkOkdVXpHI1Qv/oi5jOWDykzTPFXQstmlmxV4CEnH1C5?=
 =?us-ascii?Q?IZMOFLY0Fbe5h/zkEe26gWEHCL/Nv1+2MVAkaP7A5kwtMrEX3u4x4X5dLCb8?=
 =?us-ascii?Q?QVfEp5VzCHkNiiM2WLZJ/Ifaicx8E2V2eBoyb5BoRydrAcPfwXvNS3EnsDeD?=
 =?us-ascii?Q?dAuwoUXBGG/2vlAJAqdKN88zfgtCs1l2PXXC9w/qkQXeiiJu8DFq5CsX6cp5?=
 =?us-ascii?Q?6KR5Y85izLxcFuHrqBMF1NLaUpTHZ+pSemkyX1TlYD/etJgbGqB1rQzE1iqu?=
 =?us-ascii?Q?8a7HTOwV2i6d9XRZXYSCcwbqnBaqxcoB8JJzxTQoSQTrDBJEpc8xRm87Ogha?=
 =?us-ascii?Q?QO9LwxwmDPXuU/9FwSFbBNVhUJBMqgOW+gSV/3qIBaUrLhgGEVbYjpyLYFiD?=
 =?us-ascii?Q?G2sldGX+i/vZn3IYtV5B6p6t5z/5lreVi/IrJuzdUXaPubC6Wutm+aRDef5l?=
 =?us-ascii?Q?gOJ23AivsYM+SXQ6A9kY+NXBPhlGuzznasaWvvcds+uR/GqfZNUb9npMJ8BD?=
 =?us-ascii?Q?DXtIR2Gh40Bnz5pFrqK8zat9chvl8h1H5hlpXFxvgKeM/JSRy8WWwWZT59VX?=
 =?us-ascii?Q?vco+Loyo7olOC/R1uISSR1IGKCCpjh6+ytYzQNSg0iS4TmDRAkOSlNWBKAxP?=
 =?us-ascii?Q?ULJ4EWJSGj38De2y4laaX5Y+6BZ63EDyTVLooaugxVpyKe5oNM5MuQiSlreW?=
 =?us-ascii?Q?wIGebwLdYtk4dtkE2uwwyNZXXvUJSpV2P0sNAGqqaVTAnVfSDyhmJkHWkGLa?=
 =?us-ascii?Q?dpuQyozd33uREeQ1yyau43WXLWkB+mKnxlbDflqaY6V6AHGYzbzAXTAay2sA?=
 =?us-ascii?Q?DXgDA4rqO0xh0PaAlzmp1xpCP1eXtv02086d01WK7BPzXhWM6LaVrHNDWZpP?=
 =?us-ascii?Q?w19yuDUraxxSRqBJBFCnZ/wUL8JgGhZPOp9QAsB1xO+ohxYcixGx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6e8ad8-a189-4079-2e69-08df2633d2e0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:33:33.4812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC4WUqkF0XZKvVmUKcOQNCb9it5qHVDGPbtAI8cBf/Uh1dQgdYb/N2uwob/G8MRq87v8lzPoAL0tIQNGosuO8bSnb5u8yLadqqba0AF4Bd+EST8dYREwRj0CKzKZAvn+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8534

On Sat, Oct 10, 2026 at 02:05:23AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_irq_type() can be called concurrently for different pins on
> the same port.  The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so on SMP systems two
> concurrent gpio_set_irq_type() calls for pins on the same port run
> without mutual exclusion.
>
> The read-modify-write of port->both_edges is performed outside the
> port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
> concurrent updates for different pins can overwrite each other,
> causing missed interrupts or stuck IRQ lines on dual-edge triggered
> pins.
>
> The original uniprocessor MXC SoCs were not affected; the race
> became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
> driver.
>
> Convert both_edges from u32 to unsigned long and use set_bit(),
> clear_bit(), and test_bit() to make the modifications atomic.
>
> Fixes: 910862ec092c ("mxc: emulate GPIO interrupt on both-edges")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index e05f276a50e8..2f83a0f076bf 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -68,7 +68,7 @@ struct mxc_gpio_port {
>  	struct irq_domain *domain;
>  	struct gpio_generic_chip gen_gc;
>  	struct device *dev;
> -	u32 both_edges;
> +	unsigned long both_edges;
>  	struct mxc_gpio_reg_saved gpio_saved_reg;
>  	bool power_off;
>  	u32 wakeup_pads;
> @@ -168,7 +168,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  	int edge;
>  	void __iomem *reg = port->base;
>
> -	port->both_edges &= ~(1 << gpio_idx);
> +	clear_bit(gpio_idx, &port->both_edges);
>  	switch (type) {
>  	case IRQ_TYPE_EDGE_RISING:
>  		edge = GPIO_INT_RISE_EDGE;
> @@ -188,7 +188,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  				edge = GPIO_INT_HIGH_LEV;
>  				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
>  			}
> -			port->both_edges |= 1 << gpio_idx;
> +			set_bit(gpio_idx, &port->both_edges);
>  		}
>  		break;
>  	case IRQ_TYPE_LEVEL_LOW:
> @@ -259,7 +259,7 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
>  	while (irq_stat != 0) {
>  		int irqoffset = fls(irq_stat) - 1;
>
> -		if (port->both_edges & (1 << irqoffset))
> +		if (test_bit(irqoffset, &port->both_edges))
>  			mxc_flip_edge(port, irqoffset);
>
>  		generic_handle_domain_irq(port->domain, irqoffset);
>
> --
> 2.51.0
>
>
