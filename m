Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5873DDDD9;
	Thu,  8 Oct 2026 20:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791491205; cv=fail; b=ac8rpsaYqqmHDLtuTGMRTqJUhlhc8HC9w83WRrQN++NQo4jDUaYFzA3w8W/eQ0Ri5yfd2uTVzmKZVPzALVpcsJa/8zQiEgc2HxPlHComeEK/gxyffAinIcS4Uv1fGLM3vDJ5fSgjTFjvRgNn7EcfrwvPTcS2U/Ah2+cmaV68mCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791491205; c=relaxed/simple;
	bh=JjBs0TGitRanxD6fN/xLXccrCeRw8vLkOBqqNRfyD+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oeBuEPhWHR0WMUkYAC4kcH0lxAK9LewavZqUrHJw6/zJwM9BchVl+GUfP5zdnR6BDddZ4R4ddisggbixWAT306cLCHWNZrE6qSBWBRp0gRxtkuxln2iRIfRYdIaCu4nHxYc9UIH5slhvh7vHUk8XxVTS1B1mjRVUeLh4Dvyses0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ns6Dfbh2; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ns6Dfbh2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTYx2zYjEkVkh3v871xfQc2gFHyhZWoOgzna6nYIvvH9gHbUloI3ELCxL+SyKAJph4USki0ri5Mn0RPh+1zvmt5BdNqU8iYJGxubvIpRkip7BWysZKdH97Kow3tpQS/Xl1W25bOE0QBCb6DCPSDLwNGaRmqLCgbsOxT5+qOaLGlwwMaNlVlJa6JgrDEWez6LWTlJQR0qbMS8qUoROSxyPfW4T7c4whvQ3rpzuSISmLw7euC5BgAoUI0SJqhjMjH0Ra4PAqfzv0UsJkI41MvM52y8OnKFRiXuwUZaaOe7SLuHIhilbnRPw6mq9XBIiM1E7JlPwkU9EUnT4PAmTce8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7xlQn9VqPCa0QEammaErAeYXmO8mbMfLW7eKnz0Ak0=;
 b=xb0XkRAhi0+mDdUOkYtoNBdBiFzNf6PB+PkKiTV52uEcplyqBZWct9wcBgci+IqKNpjkYwGDJJHrLmGebiuEvIbgCZ+nx7rycUTaM2jn/T/YZ4IPjyUqVS8JiOAeGQA6d7J+dVfWCVLZ+UsImnog6FmhjyRHObOMAVbEQ3lwdIRtly47erIhnrjafgLZQSfx3S87APcD9ElU3Rp+/MxUg7LbSgR/5VEDyklqI5GP/CC3rxEx2eeoerb4CxRq/G3gicQ0TG6MRcojsUggEhdhTRM81vqYPLoYj2u4WasgVvkM3OdmBpZMl85egSReuRF8ArUR/BZwD5IzjoiVOFBl8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7xlQn9VqPCa0QEammaErAeYXmO8mbMfLW7eKnz0Ak0=;
 b=Ns6Dfbh288rX5ClbByzfKmThzSL8ho3oy9oBh9Cek+g5jE3pMXkvjM05v2OawS8tcLk9GoQxugLxEyZNXdBxgk5vcWA/4G09vwrBx3nHy2cH4CWQT8AU58MyRNBeaoRm35HJ20DW2kawP9iPfreLYSN3+xuuL9lxeUXYcBfno2SvCJZ6yNWEwNwl+JC/wnQp50XUskUdeDrhswSEzUV9g+mKyBqBXdnZhX51OQVUmLnDffYd03mP/YUitGOahXIttbkujAKpn/F8ED22FNKlIM+Vbr7KlxuOiuhVNZIgpIKIvMKQ/Vh5m+BOHLw6umz4TmB8VsoIUNZzaaikXFEm8g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 20:26:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:26:38 +0000
Date: Thu, 8 Oct 2026 15:26:34 -0500
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
Subject: Re: [PATCH v4 10/10] gpio: mxc: use BIT() macro for single-bit
 operations
Message-ID: <asf8en4oGzQ0_oPy@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-10-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-10-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: AM0P309CA0010.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: cad19d98-d3e7-4180-aa6b-08df257a746a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|19092799006|6133799003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ntvwbxw5R5aIg02DxYTMQEAS0Y8nOV/MOwVjMW3Sb455E+5IrYT9rWZnrefOcElGcHUs5m0kDbhYq5LUXWxMifRUq5vBbhwKX5NVLwDrwRnJ5aFmcwXitdbglYpylhMJipiNGFaCGiZG2IeRuRzKhjEK1yftf50jwcPWx2pxaPVwV7gPcXjPU0qL5ajeg7wE3Rvs9ouEykisdRbQzxqxWsekIs+2xykelfnSPPnkIabF+QZ8Chm/TLuOjgv8f/rbFR0SlGCqgBNznWiGXPzS7vr4vfOfK2JNGPqO3UTWKckLY0hjfy2Bc1clh7akI8BVHGrbDAWAh6f2n9/4p/fvTuyYqNWd2ZV+PWIvOBAZ++wgDSJmJGh4UVOsvLzFcjs7XAyC6vFjQ6+5/S1Gm5WXNZy/DrwQQvJ1XT1QM9XNCu4HGFGnAoKvpcsCj3jGikm5GA6OO2m0I7/gC5tWrcfNGhOP0kOODJp4BFMAfRrJIQ27mwLwPek4PqHpPbYF8ZAF/+NfBfPX9VbJidSQe2Ea3tmIYbkYT9IFoB4oDuDRnObZmFV2aJz8SilGuv4SGGXD4r7EDmovDABvgfwMv+56erNPS/JE60VN2NhZds3qfEMuSlb0Y6RzW5VCM4OFrFEo2sBfIfPMG0SPNxSY8HGYbppxgtFCxVWLk/P07E17jBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(19092799006)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6YtkOu8pheqOCEQga6WDxom1vX0ADJFK+as+dzFq9ehfqD7UI5P9cLfCdZ6i?=
 =?us-ascii?Q?JcsaMqA8rZ5y8wVIxGq1OyE9g3RXUA8lowdlRuEAqUSaenFVVLDThQWyTYVr?=
 =?us-ascii?Q?kitQpcLt17qPQsOEKteW56qs4nDoD3jEW6KCTA73nQKnpzgdiXKLKsR+MvwN?=
 =?us-ascii?Q?E1F+8Iyp5IM1N6qiD0qu71+0NPTVXsYnmwmAIQrBk1LQWppku2Sa+1VQU+bC?=
 =?us-ascii?Q?2/0gVx1539K50DF2y6vfZilvgF5cGzJ8+B1ZFO3E+iZxK7dDm0r7TI0iIjYg?=
 =?us-ascii?Q?E4iuwlw9pUpaPgFbOcd7JI5GMU8zfGiLU/yy672r/c6lI20KC3HUQi9w2lOn?=
 =?us-ascii?Q?cdZhMfZKaC+eRcyksWe++VU5G6hK0NeBf2M0EWy6jmG4WIDLgaD2TLYpEw2Z?=
 =?us-ascii?Q?NwuSynZ1/wIqR8vbCUdTDiam8JyyHszWV50l50gJfVq0psjaJJWE1orOgqmm?=
 =?us-ascii?Q?ExAV2lNh1y8+dZvzRJSb/gEQKl+P7GytCLlfk+WdZIwvl2BBaykxLH2cUiX5?=
 =?us-ascii?Q?x/e0T2BSsE1lwcjoGWYkjDI0d+3e4IGVx0iMReUynOWFk1qRfJMesR4y+Iab?=
 =?us-ascii?Q?A8meOdTqm4pEe3i+RUtl8/XoaaU5HB7wH5p79rNJQs+ZgSDSZS8u82zz1L6D?=
 =?us-ascii?Q?02x8iYqPd6fZXKrdw98utvJ2I3Brea8d9nTsS+7udk9vU8euWFoUMKVgjaCi?=
 =?us-ascii?Q?lik3z6QX8PhmLMqszMxfDESrrheqZaQTN244Dt3n4NBf5oU0cTm0M0E16BY5?=
 =?us-ascii?Q?XfwadcQ3MCdnyLcZmYH2Jhz21bO+izWoQL1G0qoqVgHhMEX08ToKc7+q3u1S?=
 =?us-ascii?Q?b74l216iZEjkSAROBcBIDaLst4qUHbsNP0Bsi58rVPaZlggrGZ0yspXDQyck?=
 =?us-ascii?Q?WPHF8XC14yHc4G61/ON3E5jgpR/bQUg3oH7yqH/V07dku4FhU/GzoReDhBo8?=
 =?us-ascii?Q?Yb5890L12XJWT850n68v1n91ViX4hwX0nBI6rgoU2DhSWK04c6FyEV9ZSkQf?=
 =?us-ascii?Q?L5kseN/HPHj9GqaY9407cMNk+r38aHdMHeaYfKmvmfdYJ/Zl+f/iW5Uh6zkb?=
 =?us-ascii?Q?elFW0AjQbt6ne61L3B6y5wxYd9/gkNubaVK/Kb1uFg8bus6oHdKurAtiC2ig?=
 =?us-ascii?Q?lEnmjW5tLs0K7nwBZ4j1KPqflw6Fa3tBk0LbHNE8mV+4xJalI8/C3+ZkfhQS?=
 =?us-ascii?Q?x3BnKXrx+1ZWhBa1n+PmkHBg/Jq98FMm5PA/DHOyodBeWJzrG1PLiAbZtKbF?=
 =?us-ascii?Q?k+wRABb/dOi74Rv+guJKp78LBf6Iih1oLA/Kjmf9qgGmI0d/73l2YviPCi9+?=
 =?us-ascii?Q?Gt5YBu8FrUrxvk1bfcwiW+F0h/NtzimyGXX1N/OSMxdaQO+yJOq9cb/d5ZL+?=
 =?us-ascii?Q?A90Wd3R/yh7wwbu7Ut3AuPa9gs0t0U9JpQRfSVVel0EuzWBGBxjpeKYr2Cgw?=
 =?us-ascii?Q?cCF0gnjlwTra7REJYdXR7EHc6qIT7VfV1txAz5xaD5EvQqqS9PvpeOMoF+hn?=
 =?us-ascii?Q?g+ufJ39zKjaaXQNAgG+onpxoDyIF5We1WkyGh7Lq06MEz0vh2SfrYiWLdDDa?=
 =?us-ascii?Q?UlmHfYEcuTS5szxVIOqukB6T5BQ389iuWLSa3ISac1s4Mm9JYjDg2RSfcl8g?=
 =?us-ascii?Q?tX1Q61X/tbrq5sqFqc8ZmgTWxy1WG19RCSrRc/oWIXLV6ZkXFQsJ1LIOHoG5?=
 =?us-ascii?Q?5y1zry0fGdCs9CKrBA8zAcEUbY9xexCDUHo/IF5QSkqrti1ebnCVaQxq8Fn6?=
 =?us-ascii?Q?/JdZ+wKQ4WkUQJ44JJmAHXUNFHCW4n7mj4mb7tiowXeAHp1zU6Q4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad19d98-d3e7-4180-aa6b-08df257a746a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:26:38.0943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAoGFdperjGEXgbWVTn6qQGdkeiFPw67+ShUmCH3LYg7PBOkZCwc4k8oaUGQkoh/NMvWEgu1nQUlvbXB7M6Df6PQT3WE+ISZC52wPYUHBQsBGoUgUknuRwHwHsXbLOAj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876

On Wed, Oct 07, 2026 at 06:44:25PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace open-coded '1 << n' shifts with the BIT() macro throughout
> the driver for consistency and to avoid potential signed-shift issues
> when the bit index is 31 (1 << 31 is implementation-defined for
> signed int).
>
> No functional change.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 39de616cd434..ad50b602c4a1 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -209,7 +209,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  	int edge;
>  	void __iomem *reg = port->base;
>
> -	port->both_edges &= ~(1 << gpio_idx);
> +	port->both_edges &= ~BIT(gpio_idx);
>  	switch (type) {
>  	case IRQ_TYPE_EDGE_RISING:
>  		edge = GPIO_INT_RISE_EDGE;
> @@ -229,7 +229,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  				edge = GPIO_INT_HIGH_LEV;
>  				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
>  			}
> -			port->both_edges |= 1 << gpio_idx;
> +			port->both_edges |= BIT(gpio_idx);
>  		}
>  		break;
>  	case IRQ_TYPE_LEVEL_LOW:
> @@ -246,10 +246,10 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  		if (GPIO_EDGE_SEL >= 0) {
>  			val = readl(port->base + GPIO_EDGE_SEL);
>  			if (edge == GPIO_INT_BOTH_EDGES)
> -				writel(val | (1 << gpio_idx),
> +				writel(val | BIT(gpio_idx),
>  				       port->base + GPIO_EDGE_SEL);
>  			else
> -				writel(val & ~(1 << gpio_idx),
> +				writel(val & ~BIT(gpio_idx),
>  				       port->base + GPIO_EDGE_SEL);
>  		}
>
> @@ -259,7 +259,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  			writel(val | field_prep(MXC_ICR_MASK(gpio_idx), edge), reg);
>  		}
>
> -		writel(1 << gpio_idx, port->base + GPIO_ISR);
> +		writel(BIT(gpio_idx), port->base + GPIO_ISR);
>  		port->pad_type[gpio_idx] = type;
>  	}
>
> @@ -298,12 +298,12 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
>  	while (irq_stat != 0) {
>  		int irqoffset = fls(irq_stat) - 1;
>
> -		if (port->both_edges & (1 << irqoffset))
> +		if (port->both_edges & BIT(irqoffset))
>  			mxc_flip_edge(port, irqoffset);
>
>  		generic_handle_domain_irq(port->domain, irqoffset);
>
> -		irq_stat &= ~(1 << irqoffset);
> +		irq_stat &= ~BIT(irqoffset);
>  	}
>  }
>
>
> --
> 2.51.0
>
>
