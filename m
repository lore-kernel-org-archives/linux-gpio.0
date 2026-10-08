Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718033DA7F9;
	Thu,  8 Oct 2026 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490211; cv=fail; b=k/WtPSutzCuzjkpnxgxyX0KB4NhNsy5zXL+xTbY3xjHVKD/MtQ3h+5sC0+oA2BNw2MApZl4f+G2lxAoSNpDmTvpS9wX6hPBynHtSnq41nmq6pL/GnOTSyBgtjDlv/5vsKeZYn6tqk32ESQEg0hsnz9epll7ipW68iB7MVVEXDQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490211; c=relaxed/simple;
	bh=b3aychW5mbmP5JzQI2MLE/TMUbiJLrzPuWYeMgTGNzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VQwHq6dLWcSiiLxrg+h+gAgjv1fPb+B/AvT30E2D4aiIDIwFcXsf8KxKzsMP1G8Nn7BACakRnXGQBOTpVTHMOq6LxEfGeiYT7cqazxWkzrNJCXIL2othEN9/DmpcoPKgEkTFdSF/LSjgmQDnPz3UVaughQMBY38MhGqhcEJY4wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TA3SLLNS; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TA3SLLNS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXuptWThescLKNdGQuCjOstouP9RMCcon2C28usR0MQLrJeOHyRuuifoxk8nt2zy8uCEGcdIiEvHtaTiRDEXL/410BYB32xoLZ5MxVEIppywkv6umTRho/miGBJe7eSMLejmWbAQ0auPVI7jUvx1Pp4jzBdx2hh0A+qVF1PIsH1vqP+PD7TIB81Fln4fc7YEsNMux+du1awaELs6B2FinUDjOH5gjfTLn3rwy29oUD61uJObmves81reUqZGK4m7wz5YVEE0PKnnMqMMdPMXskhHZUnMyu0gvdLwSkZbUSX2CZzIkBoDxP5atNZ8oBW1jnwkDRtlsZ7dYuAn5mReNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Kaj7Be+ZzKdoJzsLfU0RgPH3aYUOygMfnYwDvuq18o=;
 b=Lld0ZWZW5CIqoxsPtky+rXixDEPhGjKkSrsocN13ZZ2ORcBCacmE09jd8HnB+fgQUt6UIee1tllA+K6CMJzN/eg2QdXTc4YKR1aJqCIeGzCGRnb6vSZ0xEKuAz0PtLMLsy5nWIaPD0f9aBw2r+A85FZsTZJ/CUhW+pZfAcKiAPyZCjcZhtrAqOJYhJE644CsZ6swoBddRuFXZIiBAShRRAENmC9nT3iNcl/2fOG001Ts5ll9faHSrTqIZd54JGngljWlCFym8caOEZ819g7Z2T1mZkJGLckfeHtPQKrCwMTY3HZqWtkKyzyWPH/5f6n0EwmRGt1XkMD3RmfZWTXBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Kaj7Be+ZzKdoJzsLfU0RgPH3aYUOygMfnYwDvuq18o=;
 b=TA3SLLNSqBWh5Sx7KrQHlLU19U3iVxru9sJNwmWJY/aBqe1lXeCeZ6hAaARB8jsxhrDEVRUYDOLuQ7328Cu1017VcQWZilfmzA5RJdixp0wAmhhGhTBkquWSzyVevRNhjLrICUgFA0JpOMaKgfZ1ODbQWc8tV4X4BRVZVeTRMvHtiVLJ10xEXJ896AbTQcrXpJQfQ9S6kYSRpHGfKPVEypGeogJXZ/J37QGPGH4g/aACw05wiCgzPakn0k62AiwLyZGxHMLfpRFUrvyv7wdOjprrq0esqzOHBIZ5F4AGo8CS5aChlalv4PdUrAFXoEMfxvRyd4bCWnmETkvUl6vLeg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR2PR04MB737718.eurprd04.prod.outlook.com (2603:10a6:2c8:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 20:10:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:10:07 +0000
Date: Thu, 8 Oct 2026 15:10:03 -0500
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
Subject: Re: [PATCH v4 05/10] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Message-ID: <asf4m_H_XghR4G0t@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-5-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-5-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: AS4P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR2PR04MB737718:EE_
X-MS-Office365-Filtering-Correlation-Id: 353381cc-c7ec-42b6-edb1-08df2578261b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|23010399003|7416014|4143699003|56012099006|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ollj4Yim6y8fsoOzLLGP859UCCLkdN+JnoZLHEvb3ml4+Ag/B/U3ZxT71xGqxuGiygMHCCm9dkfZbZNOw8GcauoYTNNqa995k0O94ARcX1bt+kgQQ8EjrcCaGywBQXKmEaC3up094SYql9KlJBfDnLqsbozgfU7bxcLiwYNhcxfWMcuQlbk1N6b6Lg9Wz8aK5LbCaIgwlmrZvLVCAi2JQB6590AuMG2r+NWnWcDcI+P5BQuRxklSOXCOgN49p0CM4qmQrFf3ThXN53lFM+JXTBLVq+h2RTpbUZg9dq8Varb1Kttaw30G1MjPlqgMTIRZXrhndaGcpw4LohNxvC5+b2MB6HjGQGh/OagbxgAWyDm2OVJR42J+J2nFvAEZtmsmHIdG4NZ8mmGDZ7lioH8rX3B6lv5ASwv2gv3mr9GWWwyle3gJwgleGlt8xweIP90lZxQSaAdjLFB+RiSxcNYg35SMfmREZ4Q32yPNS5ARLBgq7iiHeaExc/f+nBjvGa5fDHOZNRjzmd1fBwBHwiKMoiRKHP1k81m51jeo/85yhJxopNkQnUp06KHrvJTFt8B6TiygyLNnVMKBByrOLL9r08995+GSXa/GhjCdc5g3teuIRzMAY804MxrwyrluWaEscR/Z/4Wqiu0O12LxipBQswXPMcbWlfOA8iV+dQ3GCa8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(23010399003)(7416014)(4143699003)(56012099006)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hYYCWtijz0FIOprpLQWdSwfiIbJxD15D4mhUW2+JXKWEBkR3DoUCWZQnkCM6?=
 =?us-ascii?Q?o9KL8ZERPsOQgM+nV43AqKQ9LE2N04OpbHkQoVDVF9QvKpsrCEhEK7ckawUl?=
 =?us-ascii?Q?THY/W//UUzDCV5u9QNk9mc6m24CpMKExfHypCsiTk0Sf9hy8y8NcpGIRfr4U?=
 =?us-ascii?Q?im+FKbWI1BIKiVN/BQT2PanJySaWjj7Yj8VqpUzeOITM1Rj4ClLFWAaoP0RD?=
 =?us-ascii?Q?sfBMMritooJlQGBSx4swDCFK6w7y6L7ulfl+dnEV7ydrHiPTx2V9vXzdmXxR?=
 =?us-ascii?Q?AWOFC53IrGEUb4+iR0rE/LBTDjfDV5zVJL3Vleub/QQzpGuuEFbI3ebKFyae?=
 =?us-ascii?Q?UCFRLs/8d6MeebHAFOJvGxrMAl/m7+wHz1hnIZ+PX504CuL0viQcgoKfYPv5?=
 =?us-ascii?Q?eaNyu915spOPXJ489vQ1FRJt998BnxKS0LN6GYTlzyjYDD7MjlfbhM0UXqlP?=
 =?us-ascii?Q?SBxcDs5KCDpePNVOSo5srzVJHqiEH8JSMv51+ff71i/7hWY3FdfqNAmKP/F6?=
 =?us-ascii?Q?BhhurgE0bCMQg0onhtdXhzkLIjzx17FeubdNRYLonE6IkIGSVIevEVxQSFw/?=
 =?us-ascii?Q?DCedSN4pz7WIYuZekSKNC0n3bTcYF8B+03z7druOIC7NcnSiJDW+MN1kBLmN?=
 =?us-ascii?Q?09XXQbJHqnzLraNqtDgRVSUappEuopxNQPGfT1KphbNG1JNKD1Q26DjfMRtj?=
 =?us-ascii?Q?cXmF0EQCF4B84rbM+hsyFy8+zYqfPwgyhkmGnrN5C5ZYxU/7mH2yYUBpxEzw?=
 =?us-ascii?Q?GE5aHEBrlGSBeQG0qwJudxo3oJiZ5TPnMugrE73yBjzDTB6nXW84OOisjvrQ?=
 =?us-ascii?Q?vAjoWnXHEddJCJ1fGCiFgJXWhJ603gF5fILNgS/EXqzsfULzobvlBH7yEFMF?=
 =?us-ascii?Q?Vim8fPaNh5RaE8FclA+zXUChi3f0vQ3NutAyNkaDbMQsInXoo6+Y+0E3SLkn?=
 =?us-ascii?Q?5acRjXrtrtP8pYF2widzTliawZn/8pKfJgMAmdOj6YLApsFtpYC5hHkT9um5?=
 =?us-ascii?Q?pqkIk3E+EeQ1ZOct2c+t8HoXqv4dDd79gGMEeOiS5kd8JcaCILxrNs44AYKW?=
 =?us-ascii?Q?xAZMszNAkSkP9bwChxZQa0Y+9uF/AUq8JkoMK4gtDFL947D2QZmmK65rILaj?=
 =?us-ascii?Q?8sumPVoVxvojNd46KXropXy9jju0ZNcpQwl4n81iHlkhRRbN1v+CoZ2812jZ?=
 =?us-ascii?Q?8sd2BCQ31BZ3fdVoh14pElP1Q3RlfEZl5SdtTGgvOZmwk1YcGdRpbGlJTu3f?=
 =?us-ascii?Q?VsoTUThYUAxDPBzo/nxuihLTX9dkBtQz8p5opLCWZxer6L9n08aj04sW0tIY?=
 =?us-ascii?Q?aljKUc6gURCwKwn/5NBp1iWqcgo7nZBmSyd6B/7LWf6L/+fCOFoX5xT+qNyx?=
 =?us-ascii?Q?WcI8eLgRZsrjqgGFquPp8Ys5ppzhrFiipvY0V5vVYlWXKXtvYxrCQveh2f9a?=
 =?us-ascii?Q?Yw/bXoDKu62U1G7MFnITz6zrIoYp9godK3CMka0Tt4xU3xAtgXwsUE88pYIN?=
 =?us-ascii?Q?7OR8++1njWbVAjiQ+9DU8eLu2VNfZtCIz+d9jIKdSkHtgChJxI0CzuJ7E8Lz?=
 =?us-ascii?Q?S+EPVRvxRNw/4YUGjvTswvIBgukZwRAOt5I4Dv8noBOXPs2xngonvf76Wz7H?=
 =?us-ascii?Q?di+la8exf+wXJEfaLApej00Nb1c0OWhHXC8n612C8sVR+jBGJb9W4UioewhD?=
 =?us-ascii?Q?kFwXDZbHIkPbe2+HXokyEnN2SG67Rfp0q/uiGcMQE/9PL7TrMICqIjMy2+tB?=
 =?us-ascii?Q?w9XUX+rkV/1a7yB5ygb138MofVSeL/K/05Dkjt2PfKQ12ub6+4db?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353381cc-c7ec-42b6-edb1-08df2578261b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:10:07.7293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlb1NcZ526S3ceypYfFCDNFDYC46/BW+ZkiR05uERtKbzeAP7R2oaEDHx/gYd5PFY+MfvGbMh6ydHDIGWb+ryHQOn8cNyXiNcet1TFIvOn/XDs4SXIU+qP9AA7D8fvH0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB737718

On Wed, Oct 07, 2026 at 06:44:20PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior.  These properties are
> invariant for the lifetime of the device.
>
> Extend the hwdata flags scheme introduced in the previous commit with
> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_IS_IMX8QM, adding dedicated
> hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
> This replaces the repeated device tree string comparisons in the
> suspend/resume path with simple flag tests on static per-compatible
> data.
>
> While at it, clean up mxc_gpio_generic_config() to use a local ret
> variable for clarity instead of the == 0 comparison.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 46 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index c08f0b59d284..5da603569d88 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -34,6 +34,8 @@
>  #define IMX_SCU_WAKEUP_HIGH_LVL		7
>
>  #define MXC_GPIO_HAS_POWER_OFF		BIT(0)
> +#define MXC_GPIO_HAS_PAD_WAKEUP		BIT(1)
> +#define MXC_GPIO_IS_IMX8QM		BIT(2)

Look like QM don't support fall edge

Can you use MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN?

So it will be easy to know what feature missed for QM by hwdata.

Frank

>
>  /* device type dependent stuff */
>  struct mxc_gpio_hwdata {
> @@ -132,6 +134,26 @@ static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
>  	.flags = MXC_GPIO_HAS_POWER_OFF,
>  };
>
> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
> +	MXC_GPIO_HW_DATA_COMMON,
> +	.flags = MXC_GPIO_IS_IMX8QM | MXC_GPIO_HAS_PAD_WAKEUP,
> +};
> +
> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
> +	MXC_GPIO_HW_DATA_COMMON,
> +	.flags = MXC_GPIO_HAS_PAD_WAKEUP,
> +};
> +
> +static inline bool mxc_gpio_is_imx8qm(struct mxc_gpio_port *port)
> +{
> +	return port->hwdata->flags & MXC_GPIO_IS_IMX8QM;
> +}
> +
> +static inline bool mxc_gpio_has_pad_wakeup(struct mxc_gpio_port *port)
> +{
> +	return port->hwdata->flags & MXC_GPIO_HAS_PAD_WAKEUP;
> +}
> +
>  static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
>  {
>  	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
> @@ -158,9 +180,9 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
>  	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
>  	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
>  	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
> -	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
> -	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
> -	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
> +	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx8qxp_gpio_hwdata },
> +	{ .compatible = "fsl,imx8qm-gpio", .data = &imx8qm_gpio_hwdata },
> +	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx8qxp_gpio_hwdata },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
> @@ -575,15 +597,16 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
>  		unsigned int offset, unsigned long conf)
>  {
> -	struct device_node *np = port->dev->of_node;
> +	int ret;
> +
> +	if (!mxc_gpio_has_pad_wakeup(port))
> +		return false;
>
> -	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -		return (gpiochip_generic_config(&port->gen_gc.gc,
> -						offset, conf) == 0);
> +	ret = gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
> +	if (ret)
> +		return false;
>
> -	return false;
> +	return true;
>  }
>
>  static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
> @@ -591,7 +614,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>  	unsigned long config;
>  	bool ret = false;
>  	int i, type;
> -	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
>
>  	static const u32 pad_type_map[] = {
>  		IMX_SCU_WAKEUP_OFF,		/* 0 */
> @@ -612,7 +634,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>  		else
>  			config = IMX_SCU_WAKEUP_OFF;
>
> -		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
> +		if (mxc_gpio_is_imx8qm(port) && config == IMX_SCU_WAKEUP_FALL_EDGE) {
>  			dev_warn_once(port->dev,
>  				      "No falling-edge support for wakeup on i.MX8QM\n");
>  			config = IMX_SCU_WAKEUP_OFF;
>
> --
> 2.51.0
>
>
