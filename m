Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013032.outbound.protection.outlook.com [52.101.83.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B042E06EF;
	Sun,  4 Oct 2026 03:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791083220; cv=fail; b=gPTzisxb+Y8o6RxvxcqHblxje4mmxtKgPw0wnuW6QVkcNNZ4tZiGMmYq1pFjAgrdoa4YQsr2D2SygkqHi32WMTzKaBSZNm4JcqNfbqPWXWLd/J0QcWEGuTI/UySl3OFMhqpY1ARnNU/mtOqvG+XWWA44jp3s9ix7/lyTRLB/KYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791083220; c=relaxed/simple;
	bh=FpDGGEtjmZU4ButOjEIQvRD2A1RMYfTMwblaEz+m7rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EAmqDoj/M8vcKFMGAcpVes05O1lv6fcBkLd9zAgUawlZp34b7vfGKYoXPlsP1W9Be77t6f51LZCqrgMyfan4f/IAXvroCeB/YZIwnnHS6NGuRy0lqPsOcqlviVQB97ve+HYUxcuShOJUTWkzTMk9LVqr7Qb49//rxSniPpWqTKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qKpom8Wq; arc=fail smtp.client-ip=52.101.83.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qKpom8Wq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCJ2v0OOChE/CqHJ/kgcc0m2fRkS1fzMOTMIts+E70aKSetKMaKjBG8rYtqcFD+t92OVEcNbuyIIkNY1Q6oekybagCzpjdP9sJRfCaYYGvgoZW2UtEkJv5qCirYr3E7s9MSQspksn+OYnEOG2UrEMCrIRkfEYaWTMT9JBimVThput48ZAr+WmMcKO0tlJ61q2DPeSb4vBM1dVfDqmYTlFWKMrUPYzPvgnlS5sAvzJZJcRkt5EHoTJzLg98wyBnsRHcA+1XmTnZx+KD7IoQCBYpQez3NYhK+9bwmzpDUeF7aKEnyUHwteNOH1HfVLfx5+T0loH0qj83Li4OGpCtK00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxWjNg+dBiEIbIvUNguoo5z15QG9Zp9/TAM3UmoWAmY=;
 b=Kw+oRaXjSsrGXdB33THpCFamR8AGgLJv55+QtH9kJWsiwVdK4NHzxPQ/wbqAsinZgReclvu9rDXCXHW5t3T8v0020o8LvfzcYwCT8it3uMrrtQIoua7+YJR3j9cg/aPyovsYjkBMZxBsOiN3gvSycnF/N6Z2Y/VWGYZVzxAwGuTwCa6MKzCGPSRt0u7fEw63+XY/6zNjSD/X1JzHFPSpRIqgWdL/WfUjp5615hG/OixGBXY6KCCTqHcee7MF2OL5fCQ99B5t7TzRU7WM9pqLayRpsUgfOz7y/UB/FsD9rtRFn2WSk1MdmfLJY753s0Mk7I9ddqLp9upy3NxtAgJqWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxWjNg+dBiEIbIvUNguoo5z15QG9Zp9/TAM3UmoWAmY=;
 b=qKpom8Wqew2OG2JYUbbXjspkl8I93JuAhdNQa+ZWfD8UEwe++SrubK2HHFsP6Ctq2JcBSqSR5aQLOho6yuHaonnJKCuANQg0/3u7pknsB8KCb6SUSjoRTwKmv4lGFRImMnthn03oa1MM+yv/zvBMhHg6snY0ncdaLphAtON4VzCSm1aBtdHmfU6Jo6RceWWupIm8cYKy3Eewd5jtNThH2jtMn0MDnsvgxOX0544eD4Nz3zfCPnHtC/wRR/kBM1wdNZhSSaJyY7qdxLFDq23WoULb1kWotvJDDNxTWDk3dVOt7v/zBtx70CJPrx/r4bP623CfFiP62PKGBf3CPxo62A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8800.eurprd04.prod.outlook.com (2603:10a6:102:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Sun, 4 Oct
 2026 03:06:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 03:06:54 +0000
Date: Sat, 3 Oct 2026 22:06:44 -0500
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
Subject: Re: [PATCH 3/9] gpio: mxc: cache compatible checks at probe time
Message-ID: <asHCxLsQF8_JgP9X@SMW015318>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
 <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
X-ClientProxiedBy: PH8PR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9ff72a-ee16-4080-5b4a-08df21c48b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|7416014|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nq/4qNLp/ZcnvdJRzLI6vsRoPOJSTXY0rWS8EOrXhC6yhZSdZub9aWaka9Spx1qbSSBRWreuH4qpAh4lhKGxnAV4dM6Y9iIf2RodBPHKJyIZGqUt2aNEwdTI4KUrJHeQoFEIuFI2ZnRk0g1HkDDQFjUJvQr1i/ATT8xmk3VIVA6DqfQ1ezC9n9MByYw8a2ivc29kCeVHRjk4o09Xmd4y+UeT1xWPM0+lB1lu2VISjdHTyVFa2dxw2Lr3wUN8+AuLP7NTe27Kgh/ShioHH8rd6qzPV595uM1wh4TDvYO2988hXCae6ewoaDD00Fh+I6GVw4MKRA3Ym60Y2JYciW7qXf+VXuwcQ/1oUxc5InUt7FadfuFH41GxxZJo8XEcBrje00qrVHb+xdbALkp+2oJwkpdYVB/ItCKHOOFhfu+LG82s14x+oAiwEuawt/T/hDJxuaMTX77Hk6cpU1YF/zXuBmVRyD6DK8yqlf/tqJJqbizCEZhidTeAjbNaNfklYPlPf6fChT0jQS/qYquAvNAZ4RIuAL7B6MlLEtieJJqMeram/wyEFEtgjTyPuvqLQ2wzAhLrE7iJkY43F2meQQCR8mCd5LK/+rQCiSGU7re5qan2LtqfN09xYQrtPY9l+VeyueBY0o5KTZKNW7e10foS68L412qxQWINgwAX6yKsn+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(7416014)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gMLB/mLaRbPmD0gj0DaHm4dcrGr+GN76lxMpvRqgE1DuzPW14KFqTzu9NAb5?=
 =?us-ascii?Q?kImaoayuDy++TNZocdAjuNVGaYW5k3ly60ChY2CyNNr1A3WZNFUdyWMd0i+s?=
 =?us-ascii?Q?wUcF3YNxmsT0+ZIeCbAeqYJDkezJniP9RLlQf+vjreGS9Am0ilcAyqK+fR3g?=
 =?us-ascii?Q?TfLl6HxM9PCL76KSutykaaoGPSXpPAmprDvsrcgl7b2ch/09RQI7mT0AJIUk?=
 =?us-ascii?Q?mukdNtt0HbwdLgf4EbSGl4X4HRTObf+kmgg1woRx3T5LPwRJdS8ZyRAKiL6v?=
 =?us-ascii?Q?TU6VWki1+kQFOdz151/8fH8fu8RvRp2lwpmnOGxwIYNINMtvFLIPNzTP7xxz?=
 =?us-ascii?Q?FZFa17+f584EzZ9Kj5XnbIYnidJONhQEETP6mDpO6lTsxIoHtQMyFT7Iwip4?=
 =?us-ascii?Q?2IAgtJsW2rMXz+Lway8yFxNEzDJNCeTaWSC5a08HRNmVYW6K6U5ocujQ94mX?=
 =?us-ascii?Q?6HCI8AJrX0s0PMwHLuHn+NeHgoTEL+a8QGtIyJTbflZRgiUtgx/JTo6kgXPK?=
 =?us-ascii?Q?e7EMpd4tFduPILOOevunWor772aoPRQICO17Hm1iNMh3NTfyj7ol+Nf2XVAB?=
 =?us-ascii?Q?7mD3HXVwq13eib6HPfuLgVCuZo3TRYKm1N9QgT3vxni5OpziltC8qNZdqMlA?=
 =?us-ascii?Q?j9l01ePOqa029ZqNYfOYKk+JncSxTSu6CR8nYPdu3c4PMOLGjKr1xoQ+rsPV?=
 =?us-ascii?Q?8GejF7LtRI5hp7BC3081tZsWg563SmUWnPjFcbqNgCIg+rDV6dKD2kYu7iB3?=
 =?us-ascii?Q?lQ04i2GGZJtJe2RW2PNUEoSrZXYfZrxCNXt85nwAIGFhBMSSpyczVKGn8ijb?=
 =?us-ascii?Q?hRKEIQVrOq/rVPYS3nZui8AgYBf9tejsg0SMZNJxi39sEB3rjdscBPgNwRqq?=
 =?us-ascii?Q?DQ/58Fo3UL/YOrbr8eGRU+II9UQJ5Be+H2HAVqa2CIBC9Q4wGF9tRa8MJcYk?=
 =?us-ascii?Q?UjyIFptlaD93+/2GkJETJzIa0FsSTMuhn0/zmTcO02iJ/itZ3jTYYPtVE2iK?=
 =?us-ascii?Q?BY4fS0FK5SlkgJFi+a45kguM9AJJU9B5+T8qxrm4x7DkR9wKWfR4XdnWrlCs?=
 =?us-ascii?Q?misHR7MXkuyt95iMxbEqluCB05n8jzh+pttzftnqdCZkdxy4KEHH4hfCMdBD?=
 =?us-ascii?Q?tEGWL32nDXZToTg60V8eDEeYgeBux5nHvyDDDMaYLD+dXnKmN0uuqSiwOno6?=
 =?us-ascii?Q?dQWZ4LHIdKt+1CJWmlJCtGRxEewDK7mOfveQGKAiN8ZlvXYiZ3+9PYv0YIJW?=
 =?us-ascii?Q?UTFEUapf08BS+lMAgPsvdHNDrpnrbxPCX4gEgNBAsRq90GwlUgsPSsppshhJ?=
 =?us-ascii?Q?7BGVd7ubEzniptqNjvPXUSMjNNqR0ZvGUQJYwlZYnLQn5Un884WAcTgG4rGK?=
 =?us-ascii?Q?1nS18OqxnCU4H6sk5rkMLJbZIf3XaoYguncu9t8SFi663G1r60BQBO8u5bB4?=
 =?us-ascii?Q?bqM0AUGIgy4XXUhLQAoBrwDyp8ZibGt2L/MobQnyHlImcWLboT9Tw8U0iPYQ?=
 =?us-ascii?Q?nlTWFZjO6MzoUoaSyI+uaKp8Hi9xM3ETEcjvwqogyr3f3qdADjwMvYsKTIJo?=
 =?us-ascii?Q?lLnpZPPf9G4m9iCqVj239XfZqiDISc2aMjAjqnmf+nYNil1Pqdpe2K7uPBYf?=
 =?us-ascii?Q?v2MFKV1wx5lnTu4f6LrqIS3uMGX/VpvlhgFUGg19F4FVo8qDw6P4t+xzL036?=
 =?us-ascii?Q?o02p+KKG+k8NAcoMLAbcyPFB7PQ7rT5Ggpf8Epg3zGVSQsTwNFF6EACKbSD6?=
 =?us-ascii?Q?p8iXhF0IlSSuWHYuYOAFTh+GDglsa+yWMYTN1GAEee5E1jU8we7G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9ff72a-ee16-4080-5b4a-08df21c48b37
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 03:06:54.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIgJBUwkWOy8Ny/cP6KelVkBYlXtri0c3KUuRWxytzl8DE0nmX4Rr3CpozYNvOuwt+ZozjsPvF5gmBJ4YnZaiaX4v9Nl9qHtDVe1HEubHkk1VQ//g1QU+3z0JlWLNI3z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8800

On Sat, Oct 03, 2026 at 08:06:45PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior. These properties are
> invariant for the lifetime of the device.
>
> Cache them as bool fields (has_pad_wakeup, is_imx8qm) in mxc_gpio_port
> during probe, eliminating repeated device tree string comparisons in
> the suspend/resume hot path.
>
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 8a755ac1af83..1c27232f6a80 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -73,6 +73,8 @@ struct mxc_gpio_port {
>  	bool power_off;
>  	unsigned long wakeup_pads;
>  	bool is_pad_wakeup;
> +	bool has_pad_wakeup;
> +	bool is_imx8qm;
>  	u32 pad_type[32];
>  	const struct mxc_gpio_hwdata *hwdata;
>  };
> @@ -457,6 +459,14 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
>  		port->power_off = true;
>
> +	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> +	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> +	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> +		port->has_pad_wakeup = true;

can you move has_pad_wakeup/is_imx8qm in mxc_gpio_hw_data?

Frank

> +
> +	if (of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> +		port->is_imx8qm = true;
> +
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> @@ -570,15 +580,10 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
>  		unsigned int offset, unsigned long conf)
>  {
> -	struct device_node *np = port->dev->of_node;
> -
> -	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -		return (gpiochip_generic_config(&port->gen_gc.gc,
> -						offset, conf) == 0);
> +	if (!port->has_pad_wakeup)
> +		return false;
>
> -	return false;
> +	return (gpiochip_generic_config(&port->gen_gc.gc, offset, conf) == 0);
>  }
>
>  static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
> @@ -586,7 +591,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>  	unsigned long config;
>  	bool ret = false;
>  	int i, type;
> -	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
>
>  	static const u32 pad_type_map[] = {
>  		IMX_SCU_WAKEUP_OFF,		/* 0 */
> @@ -608,7 +612,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>  			else
>  				config = IMX_SCU_WAKEUP_OFF;
>
> -			if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
> +			if (port->is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
>  				dev_warn_once(port->dev,
>  					      "No falling-edge support for wakeup on i.MX8QM\n");
>  				config = IMX_SCU_WAKEUP_OFF;
>
> --
> 2.51.0
>
>
