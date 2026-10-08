Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C403CFF5A;
	Thu,  8 Oct 2026 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791491131; cv=fail; b=oc05E7Df8XtXXC9yH2Z1NfcApBmGHl0Fzh3ExUsFdA5l2Vszi2Rh3ofSyJcOITgP1k6ohYw4KKetHX9ve/HNopQCQIaA8jBD3hxO+SD45qVdKs5WtL/fQkJXKYgBNO8X3Tebx1XeogekbxtA9ET0oBOerph6/ruFOH5Af+Vkas4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791491131; c=relaxed/simple;
	bh=IEGSYC3mNrwAsyx8vfLCOgY+fFZfoynT4XK8I5OOZyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F0DYab55Gw/uh7VUX0FaR6oOmykTLs2Uax9GRXlgy0gyeUDyhkTjGpjeakH7EcWOe1txfq3e/4LJnnQS5LqqBWboOaWi0b1HATpU13yllMu0+7//LqrSJsO7lXrOS1OwrLa3ztXd3+hxDTcu8bV3PU6dnxAMEdv23NxLfhQmUnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RBjuRi0A; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RBjuRi0A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjoPx4L4QCFuYp64CvEO2GnUgw+lgM+POXFCd9MLaixFA5RbSNZmGi/vRkKsUgri/Sxmexdbm5r89oSdMdeLA6ikyLMyq1I3lgw3XlL5eSPA2sD3u+8bRGRMGGFkCkr547zr/Iup/8t9yPkWoSvliFXiXxPgvFAlxBwuhNi/q+KbtHN8w0fWqAT/2mwzFVhZhNwhf/KMDqhV3oMhN9KYvtmHLEqDoZbE477esWooHyGMoWpc3q3Z8GejtKoJeQ+dvkXxyaFlFA6s25DU3bEks24tC4uHVQARez5B2118rcEMZnnyX+vUpzlKYiwT3Av1ZCmNervW35jCR4YkSA6mTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LTGJ/bpMLwQDITqgTfGPBMxFlqrty2pqQ8XC9F84Xk=;
 b=ESoQuEpXSnix169HgjPbtsGDbwwR2PLTJ2egBC6tQ2TDymJBCudY/yMUAk/fprletcj+y1MlQXZmjQKaQoi0rG2DmxofloAE6hvVrg0j6AkR4hK/pVctwqjq+4075yZzvuOv8yvayHo+wwkrNEECv7haEPGnjBfLU23ria5F8qyxl+62Ii5n+NcPAgEmwA1C/WgEYBdASAtnMWShd9mSDNZeeEeS8mAQvQxpZS2OT4V9Y/hjVs4GFqSZeJD7BLHPxYhMdvhqGkIGMAwEOYxtzvDbRNGMnRGHSlN3RIzOcyKI6x4nI7X0OMSGxeD4RzpOIeYIkIySztkycQp6Mks0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LTGJ/bpMLwQDITqgTfGPBMxFlqrty2pqQ8XC9F84Xk=;
 b=RBjuRi0AYpb0pA2OWW7h0WSvubRuhhiO3UskNQ0MeW6FHoWcnP4+e2a5q6cuk96y+GikvfI3ovXySINu/OBQmPOFl0cTQ8HCvRRxesFjZehURyKqXUBfsac3qpZnv2lwyiX3OB8xfDV7EmH2LLGhBCgmYwXVXKuVVvzmQGY32dpOGmekLGdEdB5A9H7ec6jamU6RZZHE2WfXv6pfloKMbCdH3boFyvdG3tYMgGZlsmyTvVo2SIynG/ZQ34OySZovXcZWkh5F2moxK6nR+2OxrTTzbjtJaqvlSIsZxe3AFoepppQFrDdpzlc+e/f/TjWvpg84kdVyNpYRdMwrwvQaKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS4PR04MB9508.eurprd04.prod.outlook.com (2603:10a6:20b:4cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 8 Oct
 2026 20:25:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:25:27 +0000
Date: Thu, 8 Oct 2026 15:25:23 -0500
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
Subject: Re: [PATCH v4 09/10] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Message-ID: <asf8Mz9yGK7iqOS5@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-9-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-9-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: AS4PR09CA0027.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS4PR04MB9508:EE_
X-MS-Office365-Filtering-Correlation-Id: 85033b7d-2542-486f-4e96-08df257a49cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|19092799006|56012099006|10067099003|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PaDr9E+j5dTZwyy3U0QPRHn2dZvSU/FxneZQ+oPHC7rWtbhhV8Btwm2FbSnjuhhk0m5ZdkVZ4EHOTEYVokuvUH4K8NeoCYbIMN85MyLUDdrMPF6klbybReqbiIDDgksmt7dR2+ETv4oPIKhQo0YMbWNrEGKWVixz752AtcudRLvUUn0jnMh0xn2ZTiIFgnLIZJAnbFHDG8xZowtMyGi58iaz78oalhGGK3vWU8V1hJGhfrD9yEyQrUMI3Ck89Fhgfc73p+bxLP6ePHBQ2z38A4b32beYIEVPvtr9zxgl83hl0COtLf99Vc/tSMLOPrX6VfVafAFJ/ha+FJQv5lwVw2o5CDjA2LMORo17DUaLezgaohpbqs7htaROxIYql6CtQ4QuYH+PJi5OhwtbtX2RtR4yumbsxF9z0weZD2UIlnorFCjK0UI7TlM5iRB4iR+0S5NWZBJ5WL7Rh8HvRz1gG9IuBVJS34OwvHD7IKW7TC6mLp21fIR7eNaYpX4X2erUagR/QEfQtCYBckd6gWzNBqLEKNeLLBh/RwefyiW92wO54QCd7u+0XdQyv0MpSXhYrN2fI+SDNrKVk8VUMGAMVvgnru5WgoSxN5sZ0MZJu1uRlXk/r6EFcBF2uKnecPH5Iu2zN9FvjcKXWdx+S7QR8Rz8F4uqxZORx4Ni2akGGMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(19092799006)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CQ27gmh/HC270DP5RzZ36/0TxGuZ4yghl0ZcT0rkhR2wgAZIgnyHQKjij+Af?=
 =?us-ascii?Q?C+x4ztVm/Ovm8v9SKe07RdOI+a/pCFGjYDoKfkUyB6x96k8OU86RcXMKDljv?=
 =?us-ascii?Q?0hrEwNHgPOcPTSgmFPXZ/Sdg/OAZ68Ih0DH5Gj42hslS6Ncotii1zknfVGzi?=
 =?us-ascii?Q?rXuAJlqjcbXvJ4mMAgzA1en9eOE1wrCADoayAxR4aQWR86X1JVtbMCnVKVXY?=
 =?us-ascii?Q?bIDzEv9psy8S4GL0DqENXRaDEHIenHTAaEvmU4vxxsiiWFokI0FwzNV6wFLQ?=
 =?us-ascii?Q?G6Pwsx0wvoPWNvEbvktTzi/qPBmU2CdOkoLrEtWZAJFp6C78ipZiZwa8Rn7q?=
 =?us-ascii?Q?vK4oBGNBn5b21SQdCD0a6i53muyEbeNDGy/z97KeHkhiS5KgdH1wVW39XmMf?=
 =?us-ascii?Q?Qf4bu6eOejWYlMrEPbQNeW+oM28hdi+6fkBdbBAN24SfjkbCrxhKd6H1zF/q?=
 =?us-ascii?Q?6qiGC06+D4stdR3nCHxtLto1rgSPUk9daMhPr39R/XfXBsWQOUIOI9io3Qe6?=
 =?us-ascii?Q?HBMsLyb4w+7XKYYPd5ZladqkXjbYh/i8s3LdH54rhf6CGjnwqyT+ZTe730Rk?=
 =?us-ascii?Q?7HvEVUp1GPqEM7YdRW6jp+A1w4JdLWMnuizfvN1LnybbREI1fh3AafO/yNko?=
 =?us-ascii?Q?eEhqIVD56c1Pm1bx80S55ySw/rwQ6Z0detWV5DrwFgJHHlX8igFvrscsNYX2?=
 =?us-ascii?Q?PeoTsdssPYon8HAr5g1FiJrLcSSwKQHCIkih50vRBrparJqZoG4sZK6ULvtq?=
 =?us-ascii?Q?7MS8HI/0rdlaCeTVpupzd6cKCB5JYxooHLw5z8RDmEeccfQC4baIFjhk82yV?=
 =?us-ascii?Q?r5aAzq1DhgtinO9K7JNOIz0A8Tj4AAcYN/TcZDpibo2byT0xeK4iFcf6Gtf+?=
 =?us-ascii?Q?AYi0/BRXwNp2sZ3BTnU/nzGqU145s60K3Ikulv5i/vmGr61wpAFnLx/O9gno?=
 =?us-ascii?Q?7cTD1H0yCB5Ogmyx951neJBNtsbLAsvzGI2z1wL7LR2S4A3cAI2ycsg2WCsU?=
 =?us-ascii?Q?6cJKlu4zh84SP3kVmuLKAWP1uCSNr0yzGjo4OhpZO5f6j97LyJ6V3/MXNhez?=
 =?us-ascii?Q?ZXx17JN/G7Fq5ym9OJPi19aQHnMFWtzsTuhCrD2XAUtTnfZ9AzWVQMMXiSE6?=
 =?us-ascii?Q?Vsb2o33FAcR673jBpfp8lcHPxEHNtDbMHmxRo3gKL49VwPTRwVKLZzBFVeo5?=
 =?us-ascii?Q?nTkX2b3x9o8UoKIWHNxdDPho79hj6/vPKAPv7v7CVBzo+7d4KbCuUWD4yfKE?=
 =?us-ascii?Q?T7tUo2N6x9QqhUb4N2GjhRqdJcVRl+jchcVp1Te/GCIhGD5QYvaxN0GyGePf?=
 =?us-ascii?Q?S/dQEON569YoV0OCwl6ieZ5og3C7815nirR0F45GLmkg74d/T+OVp2ZbDEC1?=
 =?us-ascii?Q?0miXwbM+ZugVzBos/urWjbrSw5JNp4587JIAp+dwKAD3m2AMJLlUrpiBPIIP?=
 =?us-ascii?Q?a8PBinDmCckO9KMeKinfWwY1HRY1fAnLyD60bN3Ku6Y7MfAnaEyUj1s5/B6z?=
 =?us-ascii?Q?16pqtkWzlufZ3XX3KTnU8nyelODxS0XvdEL9N/RH3LXMC9UZrRCl0JRbQluR?=
 =?us-ascii?Q?Qwd1BM1HR30n2D55JGDLVp4Fhr5rYyCNNHqJiXoIUkMKfxonTaIBGfj7iEMB?=
 =?us-ascii?Q?Cb1g6w5hwAVYQ9t7+u7VR4DMu/zXBvWPsBkWMjrWQVS+Meeg6oFBfN4nNVLV?=
 =?us-ascii?Q?jyqpOpL5Kk6SXVk+NmBOSaoi6WWxfr1r+I3d6VaasTbZSTNXqqVWCtwquQW6?=
 =?us-ascii?Q?XR5TAxpIMTjeSNzn1PD0KJssJBiYLmblDlqrsg6V6uwfblSDKYOc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85033b7d-2542-486f-4e96-08df257a49cd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:25:26.9878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyQgOzgsQJ8c/ZUOFwYh5VJ5z2QBsw1trwIO3txC9ADVA/1f+kKAv9WZg3Jxzabj4pS15a1sMyO7C2dL6puME/jBubkdvRjqUHd2dEh4sSwnWRcNnH9nmP1wqLrPPPWC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9508

On Wed, Oct 07, 2026 at 06:44:24PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Both gpio_set_irq_type() and mxc_flip_edge() open-code the same ICR
> register selection and 2-bit field shift/mask arithmetic with magic
> numbers (0x10, 0xf, 0x3).
>
> Introduce two macros:
>   - MXC_ICR_REG(gpio):  selects ICR1 (pins 0-15) or ICR2 (pins 16-31)
>   - MXC_ICR_MASK(gpio): 2-bit mask at the correct position
>
> Use 0x3U in MXC_ICR_MASK() to avoid implementation-defined behavior
> when shifting by 30 bits (pin 15 or 31).
>
> Use field_prep() and field_get() from linux/bitfield.h for the
> shift/extract operations instead of open-coded shifts. The lowercase
> variants accept runtime-computed masks.
>
> This eliminates the intermediate 'bit' variable from both functions and
> makes the register access pattern self-documenting.
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 9d69524e06db..39de616cd434 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -7,6 +7,7 @@
>  // Authors: Daniel Mack, Juergen Beisert.
>  // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
>
> +#include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
> @@ -174,6 +175,9 @@ static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
>  #define GPIO_INT_FALL_EDGE	(port->hwdata->fall_edge)
>  #define GPIO_INT_BOTH_EDGES	0x4
>
> +#define MXC_ICR_REG(gpio)	(GPIO_ICR1 + (((gpio) & 0x10) >> 2))
> +#define MXC_ICR_MASK(gpio)	(0x3U << (((gpio) & 0xf) << 1))
> +
>  static const struct of_device_id mxc_gpio_dt_ids[] = {
>  	{ .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
>  	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
> @@ -200,7 +204,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  {
>  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>  	struct mxc_gpio_port *port = gc->private;
> -	u32 bit, val;
> +	u32 val;
>  	u32 gpio_idx = d->hwirq;
>  	int edge;
>  	void __iomem *reg = port->base;
> @@ -250,10 +254,9 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  		}
>
>  		if (edge != GPIO_INT_BOTH_EDGES) {
> -			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
> -			bit = gpio_idx & 0xf;
> -			val = readl(reg) & ~(0x3 << (bit << 1));
> -			writel(val | (edge << (bit << 1)), reg);
> +			reg += MXC_ICR_REG(gpio_idx);
> +			val = readl(reg) & ~MXC_ICR_MASK(gpio_idx);
> +			writel(val | field_prep(MXC_ICR_MASK(gpio_idx), edge), reg);

look like have not simpify much. can you add help function, such as

update_edge(val, gpio_idex, edge).

move & ~MXC_ICR_MASK(gpio_idx) and val | field_prep() into it.

Frank

>  		}
>
>  		writel(1 << gpio_idx, port->base + GPIO_ISR);
> @@ -266,16 +269,15 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>  {
>  	void __iomem *reg = port->base;
> -	u32 bit, val;
> +	u32 val;
>  	int edge;
>
>  	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
>
> -	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
> -	bit = gpio & 0xf;
> +	reg += MXC_ICR_REG(gpio);
>  	val = readl(reg);
> -	edge = (val >> (bit << 1)) & 3;
> -	val &= ~(0x3 << (bit << 1));
> +	edge = field_get(MXC_ICR_MASK(gpio), val);
> +	val &= ~MXC_ICR_MASK(gpio);
>  	if (edge == GPIO_INT_HIGH_LEV) {
>  		edge = GPIO_INT_LOW_LEV;
>  		pr_debug("mxc: switch GPIO %d to low trigger\n", gpio);
> @@ -287,7 +289,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>  		       gpio, edge);
>  		return;
>  	}
> -	writel(val | (edge << (bit << 1)), reg);
> +	writel(val | field_prep(MXC_ICR_MASK(gpio), edge), reg);
>  }
>
>  /* handle 32 interrupts in one status register */
>
> --
> 2.51.0
>
>
