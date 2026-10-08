Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB1242C50B;
	Thu,  8 Oct 2026 20:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490567; cv=fail; b=ewhk9lUTmHCO8olcHVYBFi/nd2VflPOzMEHeeU/sKnE0HJDP+Qtr6JI0BsTpeydmlcpJ1xkHZOGJN7f0ujvkVt9NPacn+UDmup2M/iUSivjQT7wIo1gbBOsmMV91QdOoknkOZANgWycgHb/AW8y2lqjiNpyx1DEW1by4vzOLhoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490567; c=relaxed/simple;
	bh=jHe8NJA3j4RWNvwOVOby9cyEGqA7T73qbOZwgc6nubI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KI6MslKCSauyI42qIdsP/6R5zKaAbdT1hfp9ynDhSll1sbzO8dhZzo1heDc9Kwvk/wnR76T6wSeMVgVK4vlMpFQcl0bBs84EViIfOVTl5EF5Fo43KUflUrb/rLvOdFuhknL60/vvLjahRuH91aQYVgC94r1L+Sw9SvpWoqdC3Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ya7WJy2M; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ya7WJy2M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGWXH+I/zPYHd77V6ESLOHwcXp9x3AKAQmKpI4XoXk5tUlnDEdQIh5456eoxudH3G1XLT+PAvIf9Yf2yJfC1mtd35MPQlJXDsNrW/31wIb2Q+vNDqm4nT5/PxiE+n45g9X9U7I2gshZEbDm5CLRk8lLkS0BNgeklUP5++t8Y34urFc8e4txb3AccXezGIqjfznlWgJdzYykteN0TTYpDb5Ymq8jgoMmE3obJp9LE0iuOvNVOO7q6tw6IOU71GlnT1qQxNSypdNfkx7KHGD3diALxDdc+Jm8JaDZZ6w0Dj8Op0Nonuy56VU2qL7ePZOf+mLxPETIqa9ky/YlP6uxQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2Pk++Yj5wK1TAewENd7Bp6VzV8FCYVumGqTQdGV2/w=;
 b=a8S+6WNETln8TIpnFfvgO8orFzhAaLBOaJ4FqOTfwzB18GuEqtpkK9CI4pI7tdJlUcY9pXF2duzm1Mu1Nz8/O2I53ctvCMuNTH/P5D0ulxNZTZ8Ffg0Xm9RmiaBLsq8i64CTKsKV1CfOLLhpZbdKCNl7i62Qi2z4kA6cM8d//G7Iw3wbc7k5QfYtdVORnCAhKpE4NSpqYO0eHTkAhzGSYGthDCHdE109ThYzWzlzEWGsNcY2nHkAe/MoRbg408CRfvvpW/jkgVVwdhUl44Lv7F3W7BCCcIsw+LSNANb4ziiUIkBvzPzlmGo9nSxbPZ1s7+q2JbLqc3NUM6gPgXmWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2Pk++Yj5wK1TAewENd7Bp6VzV8FCYVumGqTQdGV2/w=;
 b=Ya7WJy2M4FpUIZ4dYDhQiXfhsnETp4hZoZgW80o5H66DFsYSlidcbuhDvO8PAACSHwZmrCIrkluKbRD8gx5zcuLOqDhSIvUNjNk5o9YpMpmzE/Zd/lTInGtil+t/LLxYzRuDAtlBasP4bbGsguWqnexYF/phEExtlAn74vUz+tLKPzXBwNXdtNUQC66vzJsbclGFVuL/VSu0Hw8Wqv0tQ2EidN89bOGlWGhaZYDxV6SBwwHFDc5vjOaTKjcNmFIDsq8cvSr0b840d8GxQbEluJASFWv86A/QSqYn07BpY6ISrClngYIzKNMQP+UbURD8tj1xsjU3Vu8T3uUe4hoIxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR2PR04MB737718.eurprd04.prod.outlook.com (2603:10a6:2c8:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 20:16:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:16:03 +0000
Date: Thu, 8 Oct 2026 15:15:59 -0500
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
Subject: Re: [PATCH v4 07/10] gpio: mxc: switch probe error paths to
 dev_err_probe()
Message-ID: <asf5_2pZXD-IXJ3H@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-7-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-7-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: AM9P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR2PR04MB737718:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a07f61-21d2-40aa-b3a9-08df2578f9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|23010399003|1800799024|7416014|4143699003|56012099006|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e6C4qJcXM5dXghVIzA0zSU6BFifqbNUiKEaWLRgNfkl/rySExDtxowbQneaHBtI6pnPOjqvEwF5MhGprpEXrKM/yzqIkvEIzRWPTT1bUHR64Y0UXx6a/Evro0plYXKxXEkwXvBzwhBMRliWk8B/t9ls3CIQxphRFRXsEK/nsOo7iWsibi8RhRRvjRDDXyvw+O7TRJJNN4duHsdCGMOQklsIFRbDnmy7PII2vf24QhTUfe2LJLVfDmSqp9jZeGmZo6Vrl4lYuBlqltGU5NMFXI0UcNEd05qoOi8cwGt93p/XHXm8V3ItNSHqbgNZtMgpW2i+8zx4dq1KQX0+aPmcjUDW1n06wRfzQBiDB5d3FBz2Jdtx+NWDbjXmZSlMKHzs1xA+3JqPC1EfUB7dAPpj9HPTCz5Jr93zwFEh9baOGM8gmTYRVXTU30UKbZK+KlnOFLFXfxW59Yj6x7mOzcTDfFqTFKRLEpvXg7jyOSORaben9FzDfzk/XX1T7cXxDW4oiq18exfPxpkekP8iuGYcjRF0Uuyju9pKCaAKgZUkOb07NjWnEZ7PZLTIDH+TTKxVQZmPdyXvcqHS9ABpYz3OXSyGQKGwX6tlAJMc/ZBSYcsI06U7sgkPAQrQhY0Yr18Jz3ngJZ61NfyrGzR+Cwo/1FLO2fq0PPmQiES3WYQFcZ+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(23010399003)(1800799024)(7416014)(4143699003)(56012099006)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RyEwGv0NQ2NFSpYltgFMGlhVRxMJp381TF5+gFjh8D+FR5YYKHpE/3A+HtaX?=
 =?us-ascii?Q?K8HzTJg+ypXFV+nvptaY23iZ7GBNQF2AOK4XaWMglc0dXPWJ03ipMVJGMsQR?=
 =?us-ascii?Q?Dc3YqT/tcLgacdZ5shZtuNDcC5KF/CrPmafgdK7ag8HDQ9wD56YNttZ+9HUg?=
 =?us-ascii?Q?X6KkEt25gG/9OCVM/Z9A3DmHrmqzawS5Lun8tflSwARglTsWGSRZDqjkNTMo?=
 =?us-ascii?Q?LUhaTfp9BsM/pRD2UHUsW977GOPuF+zu+DeFNVrHKkZH54LEVO0ZEnz/IPeB?=
 =?us-ascii?Q?w7z6stX+yyOmcls3LMJ2TGYI/Yubjw3Qdzx4hzmZLpbYs2aJVyiA/xGUzK/J?=
 =?us-ascii?Q?S5nSxH6JsMvG3aGD4qpXA//erlNg9DBitqqisdHH+F5dy7gX1y47WEkj4E0G?=
 =?us-ascii?Q?N7p+AhoTFjFLmmczvlRaKdgMuON6frznhMpyoarlTM/jPuLbNbbP8lUjFnir?=
 =?us-ascii?Q?+StzWppZrqrhVLoxGvOk1DGy5AM7lseeAp0/glE+OHF756/Kn2TRCPtOFQSp?=
 =?us-ascii?Q?S44I3IiZy2TDX069ds+ju6Jb7O1OxcxT3Z3qiZNVlSvEkRuefaO7OJn3721n?=
 =?us-ascii?Q?67uUoyrSFrlt9YQdKH821FKnzBgtKiTueo63yIsC3cXId29R1BIZjAGt9Xqj?=
 =?us-ascii?Q?qqRQr8lW7hO3ySotn2KjPY/NfVjrwCmmG5HyYlywjjDba56VMp3sST3lgE/f?=
 =?us-ascii?Q?xnVEuYGQgiAVRMRbC3TDUUhKypnRYH9iQeGYcky3WULPn9y20lpLcGd/fvoM?=
 =?us-ascii?Q?KuyhjqjPh55ogCOn987PW8/nUolIK+RHPIog/MUb4ztsS3dUWY1MbNblAsbV?=
 =?us-ascii?Q?+D0ufgSNRtqU5vnKF7h/kJEsIxOg1Cr24QEkeBEnlcRqzTRL0Pep3yufaWN5?=
 =?us-ascii?Q?32M0hfMYSWO56JxfT9piQFhCpPs5W/fVaXbgKbY3OCHOgKKhqc9GowPc1l/L?=
 =?us-ascii?Q?EcQIcfwe7aozby3F0TvF4FkLP2L9VKzIIgGgt8ojcSvWpHN/b4lECsfbfGSX?=
 =?us-ascii?Q?tgHS8aW5mR9AAepZNR6iaQnOvwSOMNkimgWjd/qtzSIm0SdGNrwD7Ibkzf27?=
 =?us-ascii?Q?OUlI8kFoZbJ3YwUI4IK+oB/GQEjYnNj0aSpCXDVWVTR/+FEdX5yCSrO6md1t?=
 =?us-ascii?Q?5vWIDjN7k2/AnXfAP/OernEHz0dY+700BcXU838tyVkcHq70crxR2Xwp3BXm?=
 =?us-ascii?Q?oH9YfHaXEBZfho7WkNA4iVvNLNfHX55Ql82UfGrg893oh9uNpPAFT4PLdEKz?=
 =?us-ascii?Q?odjmVKC3Whn4RiczB9+M0fAD54h5sK/vNCHZLr57xkGzYNc9eQNflLew4vEJ?=
 =?us-ascii?Q?68LHmGSw3yo+Y/OX2ubjgpJOgW7Q/ThtPfKH6c1NNBnlvqL3cSllo/5o8Qvm?=
 =?us-ascii?Q?pOd5KcsyAbV+QY4W1dfRJmXCFuBtbKTdbNOiVG2Q66Eyd4mfeeglzLO0EUA0?=
 =?us-ascii?Q?i1VN8Hh66DdTWdU0WywMeSce9UU0aXwLRZbf+NcBfuV/MBCXg1HcdSbRLf5Y?=
 =?us-ascii?Q?hvdFJvVlA3HDBZz8KlDSXLnyRskDfVuzH20zR2KTsy6rOdAUmJAC2OrAPSQx?=
 =?us-ascii?Q?yIkFFNmus/esA6hvm9R2yMjuDIXe+6cEiseu5M/XTMPhOcbHoaCXDmeSiklP?=
 =?us-ascii?Q?4vWmRFReVkF0HQHNU94+KEf5SvHOg3c8lKXRaqRzADqpQGG/+3PW38NgVqRI?=
 =?us-ascii?Q?90IeqpGoNi2jy6PnddXDe5C0H3Xw01VwfFlJftQEquC1CAS+nkHCwj11SbYg?=
 =?us-ascii?Q?LWAQm6C3GNOzNEK0Q5KfXielS631Lcw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a07f61-21d2-40aa-b3a9-08df2578f9c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:16:03.0897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1yK4Sfmo+xNPR3+nSWJTH0M/Elu0hblZAbZkXqA7gykYUeriqf3ybTdR6kJHS6jrPJo61J3JkYdGQ9bTvfHwNOfNDgseNK2V+S/jrzZkrLJWAuxybqUPixbkSBXEw+6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB737718

On Wed, Oct 07, 2026 at 06:44:22PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>

subject: add dev_err_probe() for error paths.

>
> Replace bare return statements with dev_err_probe() across all probe
> error paths for consistent diagnostics and deferred-probe support.

return err, suppose already support deferred-probe.

Add error just help diagnostics.

Frank

>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 54b09f1a4b50..f5f9ef1564cd 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -517,7 +517,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		return err;
> +		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
>
>  	port->gen_gc.gc.request = mxc_gpio_request;
>  	port->gen_gc.gc.free = mxc_gpio_free;
> @@ -533,11 +533,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
>  	if (err)
> -		return err;
> +		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
>
>  	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
>  	if (irq_base < 0)
> -		return irq_base;
> +		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
>
>  	d_info = (struct irq_domain_info) {
>  		.fwnode		= dev_fwnode(&pdev->dev),
> @@ -550,14 +550,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
>  	if (IS_ERR(port->domain))
> -		return PTR_ERR(port->domain);
> +		return dev_err_probe(&pdev->dev, PTR_ERR(port->domain),
> +				     "Failed to create irq domain\n");
>
>  	irq_domain_set_pm_device(port->domain, &pdev->dev);
>
>  	/* gpio-mxc can be a generic irq chip */
>  	err = mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		return err;
> +		return dev_err_probe(&pdev->dev, err, "Failed to init generic irq chip\n");
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
>
> --
> 2.51.0
>
>
