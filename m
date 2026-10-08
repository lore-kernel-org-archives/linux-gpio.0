Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F106436B932;
	Thu,  8 Oct 2026 20:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489922; cv=fail; b=ZbHPoPl4oGw5LK8PWtEoOVrtS7U3SHwo5Vg5vlmHmzJPAvc1EezWPHsl7msED2zr9vgbaG3CF7pvilK/zBupEI3D8k3q8eVXrSpPmZz0UGowuOP8lqArSmqzgbPzZR1+vDL/Vt0qfeCosZqQ1Rhv7DLtFzRS0BBEHnA8w4Al58w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489922; c=relaxed/simple;
	bh=wMn6tAjqjVS1wElLAY82hPF0BM05LI4GmikYNCuI8uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f/OM6+m2bObBZRPqybfhYvmexduO7dYjm3svlqv9xKG9gLOaASZO+1jbP2xG4QIft/HKxWErUZOdcfXDFV4NSCHMPW8QgMQ17Do5PqNRqd2h7LK0pgXRt1uW8hFtyxauvzjTW8ODv6aIotxi7JNFyQBH3Sa52zFHrVwTEJDNb1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QWnAUnij; arc=fail smtp.client-ip=40.107.130.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QWnAUnij"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/42s2rXdRit4PvI6Wcl4E4BVkiW/BikPCr8Vbf9zJspGS0Zco1Kk7qjzauhGZScJLgyiWNXksD+12O/WtFGoWMXq22s7R6ppVe8Dc/FG0jEYGY5Xkx+mJki0kd1uR8GVOFMKgapCwtm5OSyszNIcaumS2kIKOkCpCqBSBo/qCwycT4rxR/iE6f+eGMSXhfT3zDseHJGn9oD0FdKD0J/ZHvjQMjniv1A424i0OTZE9vyVdmK1sEz34iVlzFcdi8Kzu1rfXFkUceArh+JY/mttuJ96vZbi9066yHsQvnXWWqftd6pGtTdFbWPBAKzV5kbdRN8CV7dOnFVAbkvji/2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xpa6G09RVLDsGw3P4ctiwmLopSzgBXCU+WntK0hIQc=;
 b=H9fLQ21j6+HguT4mBOx4clwWM3ZBAs6o0AaHfzpRbcHXv9Llu0zrvbEGAJQ7olhW11QmErgbIQjM0CUMNk+7y0LcoNT8Gd/Jc7ct7VH7YB6XPWG/nPQY7DmnpsJLNh4LOUOXygFM/dYmWp8sTJnrGutYaVOr5KHpvJhKl8w9Arh4PCkQGnyvQ0mk4FFiMKWSOtAhYQ7p45FyKyoARruGIc8cPNFbp2VosZjATKjDizQ4a+7kN6712zfLHU8/DEXRwdgPrnP+izStbPl8TW3fXtAGGNpsflakXFDqqnwhp/Z0Li9YG5piQLNlEJoxHmA3mhr179Bsob2WZXgwGRfNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xpa6G09RVLDsGw3P4ctiwmLopSzgBXCU+WntK0hIQc=;
 b=QWnAUnijrW5lvATYNHNiSX2XIgVT0ruhLx0zwkHn4I9YrlL7ayHv4vbswMy8qOqG/zmcBmX0HU9tHi50pdHNDvfi35MrJIsHUpvsTxUW7xnMQYvwMlNCIoSuBBpdkIU2JPNucVzO47qcB6P4wFKWCiFGzyaV1V4L3jNo7kpBkUTXgYysKXEzzJaIXqD45bmcVaWTMNteiPzZCWXeGiLtv4vjT0g5AOubXfDA0CIR4r4Vhs12WXSupexJYGqdy9F62R72l5yGiN1S3/ooOsygo8DH2ASrxWRhdxPodt17KrZ9o/X6l3K/z653WA4kesm4UWUEIumMFHQx+5epF5E2Dw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 20:05:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:05:18 +0000
Date: Thu, 8 Oct 2026 15:05:14 -0500
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
Subject: Re: [PATCH v4 04/10] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
Message-ID: <asf3esVzUN2sNU2y@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-4-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-4-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8a205e-2448-4df4-434d-08df2577797d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gEeOOEt0neEkmfMHmaonDjYiNilj+KCj8+TXvfWzVjSCfy4FqcrRSA10uaVkuP0yATwOlV9HMd6nitDPuVmlxCndDz9r627oufzvakupTnAPYrw5SLe4VuoI0wUt7oN5lfNxreY7uiE/NpuHs/O7+k7YVkqEUkkGWeYqinYUP0VcIE+HBzyhSmtqsZUM3BIwH+Bs9zVJEfRxUcEKz2+rksUB9go+gbYYWSmdC5CBfDYCdigS5VqvKvrqfzheR3LL5xKMa1VM1pTGnkYRgl4z1usLpqTb+TYN6VrAHF3xseB8aIX6WyV728VoFnMzLoVlRJD48Gs7jcOKH+0hiFnqqaautWprcldlI6hn99IqtX/xKGMrJIiFd+0pSPNongb+ob11iCAaOp9I9kef+VxnWlfPTQdh5Z7HdVvo76bpndvwmYv35JZKQKHQgcMSjeS2fz31ZjzCwjVUyegUl8KeRtL52j4O9wJWqeKlaj3JWLPlKtQAkvU/3ti3NZ2Uasc5iTe38rlEs7+HddpXI4UE+dUipYMx0D8hxshnAsv9+B7ZzOuSBsDRhWSEBSz9kYaZuNTLLk6KJ5+0oi2L8DuzSqgimI/lVp9Jkv8Xcxk7vDNdT/vL5z5At5N8D5YCSYzflpeKo2u5bp8KCsnlrOO6TSavq0o7LhRz0WQR+jbtXxA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L4LHRzK38oLIX9C5F7j+FPdLRb6EyXQpxWBPNJQF/58LqL7/NdIigVGFqBay?=
 =?us-ascii?Q?10o8qmRPORm+Pbq25Y6VLhXXRniwYbWFCl1nbxsJu2wgV3ExdSsyX3UCU0p8?=
 =?us-ascii?Q?Ckw5RiVDRgzYliJ7lihN1S37rZbuu4Agx4HY19l1BQ8ILWcnxD8L5l2OHHyE?=
 =?us-ascii?Q?/XwqnFdVZeJ51+bm5zzY9TVHMDjcK0HK5PmDiZvk9x4uLX26GBAsCcV4BMid?=
 =?us-ascii?Q?IW6cT4MNiJn76/nYMPBG08dzeqQAMrvyXwube2L+8Do+rmWzaGM1f/hwsd6J?=
 =?us-ascii?Q?5IFL+H80d1nG/GcHehdSe/PHQ1GvR1tlA5Qwotj3HhoQfeut8PwIoAxdGcpF?=
 =?us-ascii?Q?hnpPdrwHQUPTzAZUqlUhPUZSTDifor2bIGws0OdDrpO9zVHtWZeNPIJq0vEw?=
 =?us-ascii?Q?/GpqqAVZ1peIE+bVlh1S97hAjgzIZmjYANDNO9MZZTeBqQ6kh20bbfqv0sGm?=
 =?us-ascii?Q?QlULiQgK6TJuvBMX3gKJll7Xo6ap4S1GXgSrOLvqdno546T0S4zLa1pXyl66?=
 =?us-ascii?Q?Y+7Jz0kWxKe8bfxPirHMDbv3HsxhNcNoY7kUhZsEOg6duy23ZYVE68bpFE6i?=
 =?us-ascii?Q?ox77oOG2lQ5Paqt+YBHrWOIPnUmH+pQ4Bk8xD04dqrO8qv/nD95cTDIMCgaQ?=
 =?us-ascii?Q?EPgbt7IIBfUem4ybW4N9BH8OCGLRN2I028aIjyul5+r1HaU6Y82CXg5hKAZH?=
 =?us-ascii?Q?DFSv9DwyuyeWm2J23yYWwoEt9Pa55dczjph02j44QbKdTX4CectYbySYBati?=
 =?us-ascii?Q?BrmPZrc6p7xjQAq56d4QATvEKl3pLCRfxi3T3HiZBQSEEVTbDbPvn15a/2Vj?=
 =?us-ascii?Q?kbn5HZWTjMelIIO+qULUocmDla9t72lONky0YmMlogvLKDruZfImKb3b4hLj?=
 =?us-ascii?Q?dPILv3hAhRR4CjqUKfTqIDxuJR9aPK3GiE2aZcDHL2fr7S8iT8J/QJ7YzSh2?=
 =?us-ascii?Q?84cIf5CXDKXiFmU5P177vPKwzh+YwkAdgyUdWvTRGB3Vvt4C1Mjbps0QEsd0?=
 =?us-ascii?Q?HBiYYYYI28dYLrK1jbT2XgQmBFPPoQ1eIlqqrqFtfLBJrsEDcfjFsID3mXe1?=
 =?us-ascii?Q?yAhmljxoPzTwQQMZCqePAc5Mx1Aa1NmlssCCB5JO+2tz2+/VS1tw1LJ0ByLi?=
 =?us-ascii?Q?IxmcPnZn0kIr5nueAc6Pc9gkeANVDZCtkwSn5paDkfVj6Kc3piS2LKHjb/ol?=
 =?us-ascii?Q?FPQc86/zbNX18JFabzUH5+ONFaDInJcwZt2wKX68YEFZJZIPQy6TdBoQ9B3O?=
 =?us-ascii?Q?OnIJuH2EEUcnANLhLQIvqZNuRJ2CQOJT26r2Y3fxa8Gva/cGwQgGr0Lk7+Pu?=
 =?us-ascii?Q?ki+N3ITTCiLDIVrWCLyVdbkuOeOg9PPzVvQYqoGWQj/7OlMHEdJN+aWogv7d?=
 =?us-ascii?Q?7DRtb7ZuABh7p748olyEY84Elij6JC1kqMkZAFSy1Aee6aKbmVWDRJ3qlkzk?=
 =?us-ascii?Q?boohM5bxV8lxCgPUTNizSFx0D1QlVSIl+f0i/f/8OihFe+BnqWZ1qt771Vte?=
 =?us-ascii?Q?pnIIenmnG76qMJaGRmxXL7riKwDAYITfUd2YJJwHnNW9c5fU0ToPeQ5J3PND?=
 =?us-ascii?Q?KFelfUHPdGnTEN8aK+7fMDPTxlYUWUf3xNwaYsuku3lv74+nD5HALHv6uAwq?=
 =?us-ascii?Q?cwQSGjtY6Y9sjl7GkuvG0NZaz3r7LfImrse3L0Ov+EwpSgvbQZKLfd3QGqU6?=
 =?us-ascii?Q?4Rc/bG6wJL5Ycx+iWDQmQfguxgE1UA/FfTRrCJG/RZ6OZpT/6n+gkxXXUNjj?=
 =?us-ascii?Q?M6fa2z4zFsWKsHuRB0quZGuiiSfElQGvC77CwBph7Dlx9e/Hq/j/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8a205e-2448-4df4-434d-08df2577797d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:05:18.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKl8R8TIObZicJBQDw3W+VPqO8oRSYH5Ibkw2Oahuk6RkRSkx8Cq9XY9LXMurr+9nLClp+ZEA+8EwfAXwKHx/UGlgGGrLS057k3EQgh1lzuBWHZ19Km6E3EaJBJL2V0V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

On Wed, Oct 07, 2026 at 06:44:19PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
> with a flags field in mxc_gpio_hwdata to move the power-off capability
> from a per-instance bool populated at probe time to static per-compatible
> data.
>
> Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
> instance that carries it, along with a mxc_gpio_has_power_off() helper
> that replaces every former port->power_off test.
>
> While at it, factor the register offsets shared by imx35 and imx7d into
> a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
> initializers.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++++++++++-------------------
>  1 file changed, 31 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 1ff5c2afb2e8..c08f0b59d284 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -33,6 +33,8 @@
>  #define IMX_SCU_WAKEUP_RISE_EDGE	6
>  #define IMX_SCU_WAKEUP_HIGH_LVL		7
>
> +#define MXC_GPIO_HAS_POWER_OFF		BIT(0)
> +
>  /* device type dependent stuff */
>  struct mxc_gpio_hwdata {
>  	unsigned dr_reg;
> @@ -47,6 +49,7 @@ struct mxc_gpio_hwdata {
>  	unsigned high_level;
>  	unsigned rise_edge;
>  	unsigned fall_edge;
> +	unsigned int flags;
>  };
>
>  struct mxc_gpio_reg_saved {
> @@ -70,13 +73,26 @@ struct mxc_gpio_port {
>  	struct device *dev;
>  	u32 both_edges;
>  	struct mxc_gpio_reg_saved gpio_saved_reg;
> -	bool power_off;
>  	bool is_pad_wakeup;
>  	unsigned long wakeup_pads;
>  	u32 pad_type[32];
>  	const struct mxc_gpio_hwdata *hwdata;
>  };
>
> +#define MXC_GPIO_HW_DATA_COMMON	\
> +	.dr_reg		= 0x00,	\
> +	.gdir_reg	= 0x04,	\
> +	.psr_reg	= 0x08,	\
> +	.icr1_reg	= 0x0c,	\
> +	.icr2_reg	= 0x10,	\
> +	.imr_reg	= 0x14,	\
> +	.isr_reg	= 0x18,	\
> +	.edge_sel_reg	= 0x1c,	\
> +	.low_level	= 0x00,	\
> +	.high_level	= 0x01,	\
> +	.rise_edge	= 0x02,	\
> +	.fall_edge	= 0x03
> +
>  static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
>  	.dr_reg		= 0x1c,
>  	.gdir_reg	= 0x00,
> @@ -108,20 +124,19 @@ static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
>  };
>
>  static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
> -	.dr_reg		= 0x00,
> -	.gdir_reg	= 0x04,
> -	.psr_reg	= 0x08,
> -	.icr1_reg	= 0x0c,
> -	.icr2_reg	= 0x10,
> -	.imr_reg	= 0x14,
> -	.isr_reg	= 0x18,
> -	.edge_sel_reg	= 0x1c,
> -	.low_level	= 0x00,
> -	.high_level	= 0x01,
> -	.rise_edge	= 0x02,
> -	.fall_edge	= 0x03,
> +	MXC_GPIO_HW_DATA_COMMON,
> +};
> +
> +static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
> +	MXC_GPIO_HW_DATA_COMMON,
> +	.flags = MXC_GPIO_HAS_POWER_OFF,
>  };
>
> +static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
> +{
> +	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
> +}
> +
>  #define GPIO_DR			(port->hwdata->dr_reg)
>  #define GPIO_GDIR		(port->hwdata->gdir_reg)
>  #define GPIO_PSR		(port->hwdata->psr_reg)
> @@ -142,7 +157,7 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
>  	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
>  	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
>  	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
> -	{ .compatible = "fsl,imx7d-gpio", .data = &imx35_gpio_hwdata },
> +	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
>  	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
>  	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
>  	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
> @@ -447,9 +462,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	if (IS_ERR(port->clk))
>  		return PTR_ERR(port->clk);
>
> -	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
> -		port->power_off = true;
> -
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> @@ -536,7 +548,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
>  {
> -	if (!port->power_off)
> +	if (!mxc_gpio_has_power_off(port))
>  		return;
>
>  	port->gpio_saved_reg.icr1 = readl(port->base + GPIO_ICR1);
> @@ -549,7 +561,7 @@ static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
>
>  static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
>  {
> -	if (!port->power_off)
> +	if (!mxc_gpio_has_power_off(port))
>  		return;
>
>  	writel(port->gpio_saved_reg.icr1, port->base + GPIO_ICR1);
>
> --
> 2.51.0
>
>
