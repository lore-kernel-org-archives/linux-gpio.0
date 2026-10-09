Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B251396B70;
	Fri,  9 Oct 2026 18:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572307; cv=fail; b=EHvosm9NOl7cmtS3+oFIsV5PP9r65PQbZYN+AkmuAAHjdScjiQ4K2T1FouZ1HK11Csj9aUf4wk/W1ZW1Vqd/iVKSRnT558H1lvpiGpoZAcqMnYL+fH2Rkl8mLF2ChO4h8SLUeJaCvgnWMD0IK1imBMtbnqnXdlyvzFD/l3csRqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572307; c=relaxed/simple;
	bh=ywjIpMAtFzNXu7mbIwLEhrEkJVHVJ2/s6z+z0i6/9gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oIERBm4Qi8fEjFK/DnB02fLs8MyEqAsp9IbWtuLH0Gt50ItIMA79Lber0ujL1zgRsugNpuTN55AFDKGohO1XRc8GktUCknnYJP6JOJyDmz5SUixbxYN2kOyfZWZWHebpHp/X/clnRVe4HCt/9nzZiOG349nA9jmI5QCqet3/wyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=apmigrZV; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="apmigrZV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6y9SjnGTfOZ3Sn0C5P+SWXEyuig8YJxekwO2CAQUSyUC3Y/APHhrxPXwD3avH1aTqLk40DFeV/Hk9+ZSqYw/7dqYr/Ze9miyYtA9tTIP7rXIhSIdnmRl8ZJzvAr/2EA30kyS+Tw2Hnc2ZEQ6iezMJfuHJoYVUMkthltoB3L3sTFv1UuHtsOCrK1M29+RndE6eMA0i02Nnutt0U1u0nz0JLP2OFbOTw0ScBX5yk7PadnwP3SJEVUJF0H+8ZV77Tt08R+Kcs1HDY+FjIZowigW3X1AqJFXXNi7ut3vsoS+gGvaomVdi8bNFQK9lXkITwZ27f+3SP8OqHs8gUp7pqHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKSU3Um0rzXT6xTEyC3hHrpcrAGHXqyPehafR5EfjUE=;
 b=PiGOcxo1SN1JcKqeyNgRTWFdUTBcOE3gNFZKAXXSOiFKXJ7WnZmUs6BXxbomUIUyFZ/m8FRdZeXFkZNhAIvfu+02nrZIlB3DZ0tzkTSlTwSsbIQzBaCmDFGPHUpySLi1SvfmRQidOBbfov6/KJudgvlKyUZUhm8CSTHiHI16P1zkp/IE0ifdBsHnnMfSW124NXwSSkU1q29vBLCk4miFNaQ7E96Hg8zOQgdh+zb6SE6R8NzML696wI9FNvrgbCZli2IHz1lpKPsNkcnH637xFDgpqXLfTEoe4skiITmpS9Tz5JsJ1pOCnN4agL9TpCw08nWiedjtOugwxHSKGIUZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKSU3Um0rzXT6xTEyC3hHrpcrAGHXqyPehafR5EfjUE=;
 b=apmigrZVR5eQJQpiIHZcksJFTANCNJgXc2VQyhneC/vFVKCR3SgJWCY4bJAMp7CMRPdryiKt2s5UiSFBGF6jeue+XdBFfDA4U16DKlTQQr0z3CO3ZYdDj2SMWWm/UI72jKlsFZv8zZouW3RC6ts1DKpgy6uo36+kpXy/Ii3Rj89JEn5/Q+yPWXqajLriQFNtMkBwZNHliMrKtAe+fZDcg0rgVsvfSkPoxxs2ocLpQrsv8N8YJw4hUeKL1e37MTtIOXItU6cNR/ypqL7XREI5M5M3XhC2Hz2kE7z9s9Gdyl+CEhRf2D+yfLFypQZp6UsVqdl4bN4KslZaGVURig1KcQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9734.eurprd04.prod.outlook.com (2603:10a6:150:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 18:58:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:58:19 +0000
Date: Fri, 9 Oct 2026 13:58:14 -0500
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
Subject: Re: [PATCH v5 12/13] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Message-ID: <ask5RqP5FOv2thwb@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-12-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-12-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: AM0PR02CA0117.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: 77fe2ece-0c8a-49a8-6da5-08df26374877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|6133799003|18002099003|22082099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gnANScUtyTCXlou7/Ijut7h7EXx9da2u1zXe2k3Bp2+g/06NVgelDx65QXoTVGUKsTtB9RQYdTVW/66Eqrke980NkXxMO3mOQz2BXWa5LIMMqPlRnGKnsKfM99dPcMh+1XNjfY7WLs83Ob6wV0K7cXdEGF19dBbauku7m+9OvqBS90Sh3/jnkdqmrTmtfzb+JTQYI2mnzc6dKxse+q4duBA8E3IZJXW47/k//xGmGYxHM6vvCpsCOYuhEdYsSgIGw5iw7suKazCgCAWrqxglt8V3kd4ZL6ASog2LnO0JDCDM3Aq55FhETT2e1vgiDbezW9UiNHbw7wB/978LmdHPbANmAe2llqYo2flNkGyGuARF5eaPhKLZ1bkJ39t398ZGeCsYQCjJ+HHnE8bvyELL3RIDtJNDpAIjO4l2frT8VbZQmk3k9Gy1Sdd/uikjD7lMQjxNyU/HcLwMyI7CNw3M7JSbFQdXS3yzCuEyn2wfOEZzd6wZPik2UR44UdQJhSMKJpddq9QeGeh0IK1HBXpstLTvrFW/oi9DJsp/02Uwry1eWNM7WskyZ51Ck8TwUy6AYUnWTptohi7B38Vh3c7Qn4d8UuuE8hbC5NrPOSfszbc8cmgyBv6/rPMpDVfYJFSFz7rQ2I6aapk44O3WUO79kVesqy+KhIofgNhLgIDGXPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VX+YWQxsc9+h2vS6ntugK9dg43MkHeRlR3f8s6Y8MOvOGcA6u6CouAtSQ8SH?=
 =?us-ascii?Q?dkPv4iUVbI3X/fvWTKO9FqsreP+X2cZQA9ChJNJyJJO35BnRdaF926Z1VkMg?=
 =?us-ascii?Q?iv8EaGiahqaBc7rGbJslj4gT+BWyVb/JrshoBK8ydUGPrLkK/jydKb+/hwhm?=
 =?us-ascii?Q?/6E06DmDoB2ZRTptrN1qK+pc9TQTxlsHGvyRj+1EPz4fpvNgz9Gn7kbtr0su?=
 =?us-ascii?Q?wqBbyhDqfF+uIprA47jZa8hDiPBczPyG2ah36PC3kDpA5noOI41BAfBD0hsG?=
 =?us-ascii?Q?VTTO0j5sj08K3LXwhZzqiU2znSlvFst/HMei8l9f1ofTZ+6EaTlwYygsKrvl?=
 =?us-ascii?Q?rwWbXdH8RLgkcQpcPpMdfxdCQksWAMB3knPHsjZpikS9nDw58eUJUNSMDDyZ?=
 =?us-ascii?Q?Ptfn/1bcFOqVELImukHIZtUfS+d+bIltARjOsbfY22kVOnNqGf0ZXgK5v8nS?=
 =?us-ascii?Q?Es6pRscKHoh3372Qy0+R8+NSxaspn4UK2rqjkRjb4LDuF9Y122MYttlz2x/t?=
 =?us-ascii?Q?vy/Msw2K6TVmnuCbe9vz1QxAWQN0Up4GE2CmoZfPi8SxW1TkF15LF7srsskj?=
 =?us-ascii?Q?oiyyeIkdUorP7GTDgBbtxtQRrWL64brBjfUZzvGbhBqbMPoIyvN5pOmehC0l?=
 =?us-ascii?Q?gc2hLyzO7EBma4SCeI4+keHBWKV12kntRPRkFnKyHo4xo6SIba2+d0/M+5so?=
 =?us-ascii?Q?G25WgRm92JQxFmSWNDSuxD4Z4+ZURyKOey7ia+KTm0VTCE+pprwkCm6LaYmN?=
 =?us-ascii?Q?cAl/Dg0JjaAhsBOSwgioM1bN0coFPSWEBnE6QYiR2VXQ1qcFKXmdFOENA/m5?=
 =?us-ascii?Q?vA/790SCBEdF+cZjmOtuBTULAdIQECceSaPp5lzXlRPV39jmvi74SiQt+SnC?=
 =?us-ascii?Q?/Igeh4dq26V5mrswtFUDvVFX3u7/8Wqh47R82QkzuMXaO7a2pgDI+EhTcry/?=
 =?us-ascii?Q?D1HhIKQiTLGRAnjnMVAb2TOw4U57Swa2u6nGRXfYODVi/ao90wVHg5r/cj+N?=
 =?us-ascii?Q?myLuEw/A6Nd1UqnX7G4s7j5J+S0PbREnNJS04KMAKDj/3hYQdJpDrvsn3MsS?=
 =?us-ascii?Q?22EWV5gImwF9sVVsMMcl4X9Lz7eUwbLI3KOO+SHv9qboEeHoFFxecnUpu+6D?=
 =?us-ascii?Q?D1eetD6H/6DCMaLi1fLRjP2DO6cJasN0ZLwOAU3VPgnUr+d0r4TaerIDkNjM?=
 =?us-ascii?Q?tlkOxi7i1M60ifQcABjhEQAb0N5fnzxCht4YJDdGuA3GHKpUaxZFioVBa61E?=
 =?us-ascii?Q?lX/2a2POy4WUEaWPEylqIy24SY+t+KwtwE+A6I5McU5nUS4tv00+gIDTr2Bi?=
 =?us-ascii?Q?U05Xi+/gXyFImUooGcXfERZm0fuKCSdCPkrECWa4eorHLDpLMOM+v11bgb+0?=
 =?us-ascii?Q?9JLd6lE0uVm0Jk2PF+R9YGMrC4/Dq+L1Z5VnrjOll1c3Rz2z08sJQmrOtMp3?=
 =?us-ascii?Q?jT6vur6bN19GBbdOk7V1Lj1R1jNB3S6XUuQRl8ZTr681JFi8k5lR/Uh+VXOf?=
 =?us-ascii?Q?gQO2WsVV5BAhtD8qzvBBZkktHJhhKWXVMcfrTJuOadct7X8HJQ+9fZvRWAOt?=
 =?us-ascii?Q?zi+ZAbhWs4BCtQgIECo5G0t7RB24uz20x2Gz4CnnUxjF59PFlJLMeMlxUgV5?=
 =?us-ascii?Q?onfXZGbRGahCQvlEFAuoQFSPjUp4i7wJiyAvRwyY7tq3NqBh8c0Ck2mJ6GEv?=
 =?us-ascii?Q?6j0wgthP/PucPJY/7L+yNQIrG5M0zF4ahvlL5SWIYoN7/5qOokZEF740MOVe?=
 =?us-ascii?Q?YO2+/VLIXmurMkrlN6PD12MhDxAfgv/u6v6tb+2HErPs/mtJVSMm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fe2ece-0c8a-49a8-6da5-08df26374877
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:58:19.2618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwZZp+mvf9KFZcu30V6mCeTI9wZcPrlsmsUJLw/X8JMch8yMrrdBkaBZoqaGnXS85I7NFPJSHSvjBpf8Xu0D71Cqi8/5aakRdSvS0aWLIKodNM+MMPR+kWLcZDvmUx5N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9734

On Sat, Oct 10, 2026 at 02:05:33AM +0800, Peng Fan (OSS) wrote:
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
> Extract the read-modify-write pattern into icr_update_edge()
> and the edge readback into icr_get_edge(), using field_prep() and
> field_get() from linux/bitfield.h for the shift/extract operations.

Nit: remove "from linux/bitfield.h", which is reduntant information.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 42 +++++++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 1eb5cd148c28..97147a5d747b 100644
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
> @@ -196,14 +200,28 @@ static LIST_HEAD(mxc_gpio_ports);
>
>  /* Note: This driver assumes 32 GPIOs are handled in one register */
>
> +static void icr_update_edge(struct mxc_gpio_port *port, u32 gpio, u32 edge)
> +{
> +	void __iomem *reg = port->base;
> +	u32 val;
> +
> +	reg += MXC_ICR_REG(gpio);
> +	val = readl(reg) & ~MXC_ICR_MASK(gpio);
> +	writel(val | field_prep(MXC_ICR_MASK(gpio), edge), reg);
> +}
> +
> +static u32 icr_get_edge(struct mxc_gpio_port *port, u32 gpio)
> +{
> +	return field_get(MXC_ICR_MASK(gpio), readl(port->base + MXC_ICR_REG(gpio)));
> +}
> +
>  static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  {
>  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>  	struct mxc_gpio_port *port = gc->private;
> -	u32 bit, val;
> +	u32 val;
>  	u32 gpio_idx = d->hwirq;
>  	int edge;
> -	void __iomem *reg = port->base;
>
>  	clear_bit(gpio_idx, &port->both_edges);
>  	switch (type) {
> @@ -249,12 +267,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  				       port->base + GPIO_EDGE_SEL);
>  		}
>
> -		if (edge != GPIO_INT_BOTH_EDGES) {
> -			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
> -			bit = gpio_idx & 0xf;
> -			val = readl(reg) & ~(0x3 << (bit << 1));
> -			writel(val | (edge << (bit << 1)), reg);
> -		}
> +		if (edge != GPIO_INT_BOTH_EDGES)
> +			icr_update_edge(port, gpio_idx, edge);
>
>  		writel(1 << gpio_idx, port->base + GPIO_ISR);
>  		port->pad_type[gpio_idx] = type;
> @@ -265,17 +279,11 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>
>  static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>  {
> -	void __iomem *reg = port->base;
> -	u32 bit, val;
> -	int edge;
> +	u32 edge;
>
>  	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
>
> -	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
> -	bit = gpio & 0xf;
> -	val = readl(reg);
> -	edge = (val >> (bit << 1)) & 3;
> -	val &= ~(0x3 << (bit << 1));
> +	edge = icr_get_edge(port, gpio);
>  	if (edge == GPIO_INT_HIGH_LEV) {
>  		edge = GPIO_INT_LOW_LEV;
>  		pr_debug("mxc: switch GPIO %d to low trigger\n", gpio);
> @@ -287,7 +295,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>  		       gpio, edge);
>  		return;
>  	}
> -	writel(val | (edge << (bit << 1)), reg);
> +	icr_update_edge(port, gpio, edge);
>  }
>
>  /* handle 32 interrupts in one status register */
>
> --
> 2.51.0
>
>
