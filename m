Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83B2868AB;
	Fri,  9 Oct 2026 00:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507337; cv=fail; b=tuWPSXdIkSk/6SCznpm9YltnuXHVXIIcDxyMiAmRqkqPY+mFABXdn6JHKgzCxEjeV3Sqi02QAM6NekDiz42ZJ3++0ByyN6UMyv6Ttr6PMBpdrmvkySQX/zcw/ssLOJ5iInAu/c9mzOiupduy44MbqaonJljuIlKiU3n4vQUWG3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507337; c=relaxed/simple;
	bh=a3QeJufDoNu3thALhSbzBKU3VV14HomMVYsBHzHwOf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MbHxVVot7O4KEgLisCXN3HgK315wPZdG0bvsyU4n9LUb4B6LOuuJSCreVLH5hUWKjFgFMbsmGDuO91tbHGTbs24vrLOtSFL//Ipxyqj0PhOiHR/V1bDAcCzAOyL+4liYk4Dw84ZZQ+tmLyMpZNKt3Od1SWbSXVY6E5XKEGZIz0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CWs5IydM; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CWs5IydM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjvjkDmAx1yLzlznakwS7p6uRC7jKlRzIlKAs9qiv8JBVhrafksQSz1H/olgG0KkLLxGgbDMhrxq5ZLAjxQhJXemPQUlQp14QavpJ0KJmZ4Skn/YzCQg1/MtyRdNc0YWclgYF/fn7V6QroWKaUfMnyKk7t5WsKafd6i3VVs6rmt741dmfw5RmdPFdOefn0K415gxXdREI4+TMNKD17pPbVwC0pDN9TvgJk1kICciW4e15M/AUGLlffHRNmL7N+q+X5etALAcc6oc0S6MvCORGxcmMi00T3taKTJAivmSKBLKm+Ic35+S6OCu6PzDzLpRiEQpadEkR0FfSj7+lf+EjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqc4NLPpDKx3dDUEgO8Zoa0fJ92M0az9GLbMb9djg28=;
 b=dPQozOCCw4EiG+3XeacVFNF+5HOFeue15lqhbZQMlDB9VgJrZMVU3/K9XZ6W1m7s4W3Sce8VzKnnEz+Y2iPCzwI2y6G9O1CnyR+DI2xGu9fii4E9OvqCI7prglVJM5vGtuOUy81Nkqgd9pKxgpp/Sd2GEudA4TejPd4DD4I0pF2axWiwxakWySlgY0aGFqHd4D+vsA4LQEjFg+5KfJinLhGfWAJIkzIiaqUUsBUd+ce0oTA0aywYKSHfw4jp07JcHeci5mTKXbB8ZqS3+HJI+rfQgJapszfotAIwcX78kl1gWboM4Dfu9eVP3tgkeugs2cigfdx2rmLHT1WpEliVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aqc4NLPpDKx3dDUEgO8Zoa0fJ92M0az9GLbMb9djg28=;
 b=CWs5IydMos0mcLIrGcdenbE9F9II/ObmzNfK/L+T6GL9zLydMTRW4Qg03aQTuD+Rlt7DSOmcgzfdO4E9UdmbzBNb2pWlCFV6OLMozqg/dwSC6/XGR8ZUMkOFWHLmbRt3mAnlTM5E0uOgQvVhnaZUQGl1l+B2TixnXfEVM66QGdpwHmKuVJnC1O3HSklG3BdPQiFzQr/oUnOk83pKdGtd83o/O0P69vy2pLdjmXOyHh8ZaUpN4toHWPM+IzOPRjhnSQhPf8TOUxzdlmiil09F/pKRCZMbEBYVI1p1tqZDOX+GkVugV1vhq/a3SIAGpAQjVR3QWFmYrtyn+t0VcuQA2w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 00:55:30 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 00:55:30 +0000
Date: Fri, 9 Oct 2026 09:00:03 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
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
Message-ID: <asg8k55GMcdQf+Ss@shlinux89>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-5-c9f5a8b50df9@nxp.com>
 <asf4m_H_XghR4G0t@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asf4m_H_XghR4G0t@SMW015318>
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: f82ff7cd-f0a8-4faf-1f31-08df25a00424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|23010399003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/7Ufb6kgRYJ4AI9LMBDBWoCJh1r2IecsnSq/8pk1AFcQhrQLyGQx8IKoHpX7nPdu7h6Hz0RuA6HUUIsdM857VAM9GP8OA5L6YCtyaD5AVbm8VsE1cSn1DK8aCSj/lGRxMWc/5a5Lm6eAsaJ2kCQNadQKVX1XUCyCxUT99WTB49tT4QvwyXhxfX5MkDhbi2Lx2ruWd0YD/jE9rpFyuGZKcpISTA2oAH96TUsAzGxccFO4oBtNVDrdpRMOjphQHVYbhTfJhFpUfUZKrQr0w1hmjbbADrNqvfXFbrnJWPNmG+HFNl1xsCIuyXqLDHoz/s0S4N1IaDxQNq+/lHZK+t90eqpMFyKqboLGBauRaZnsGbZuw949jnNCI78ByvQJa2LN8ekNe8vOSxAQ8GQDnGfGCvxtXLLUE6cZCuiUQ2v/THs8HAk7fRh5A1DuGosEPjTFI7zHrCfCUsVMOYBxgLII0yCJl0xaspypt7PtCOMiTcKcOIdNS+vEK9M/gGZQgM0ztOEHD8Rp/CweBepRuL4rH1OteW9BNcbGtasiK2rwCulwKySvPIgdRn7pzB/lE9arqss1sijSGHlyYrbmnIYZ6o4L/SS0gOAJe3jBLGgOTSwrQ6COMeLPQevUiVDa7wDXi272R5tow1qr5T6ksW06gejJTGUu/kIMNacjG9Gh66k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fQ9+owgOopEfyr+1TFuYFgsujGrO4wLn6XfII4rAGod8vpouNi8G9YdOIJld?=
 =?us-ascii?Q?XKvRbGocrfD9DSyjcq67g5T/LAjsazqEoqXPkuzQT3rzfX0nRgSptOB9O4Mj?=
 =?us-ascii?Q?hMOtQ2nQol3qf9JGmgYubaEgTIUtql6sQL9sLoBbLIHAg6axutfoT+iYBTdt?=
 =?us-ascii?Q?vZ16AB7UBl3wuKa6O1YQWTaq2g4ALPfJdLJLi1xXYH8dL6ho11UC6HQ8YMX/?=
 =?us-ascii?Q?4Ea0MSjY3tEhVPiNb0knxxR9VC2WE/+SSOtFcXZSBhBLV5Ef0i+AD4lvsBZm?=
 =?us-ascii?Q?uxnRAKy+7ZD9jkAVc5vn3XedaNnOr0ohB+u9t24X1R0iHPXK45HdvQXI3jOu?=
 =?us-ascii?Q?0eGhreujVuqYtJ6tTV2CmUirXwdqYgL4Z1GCU/1OxzhJWIgYP2YJoldRWGNM?=
 =?us-ascii?Q?+sCYqK6CByjHOnjKP0huogW1GRPtUXhqA1UOJNoE+SUzWiMAAo3qXI8Dm0ms?=
 =?us-ascii?Q?I8D4E33X1NhKCQMWDMB3DRhugCdoDM9AOn5FYC3ir/oqLZqPuEJXNY0av6CR?=
 =?us-ascii?Q?MJZ3R1I52vwEV1G0f5/0VJR+1c9Jd6JM3DDMLbGzaVnpnTfXtCwYlTVzbTld?=
 =?us-ascii?Q?LgxTSt6thgRjVzmI9l46zmxESWxLjHwO0gW+Zu0jf8K9SN+ao1RpMB1rCYLx?=
 =?us-ascii?Q?0qVlFE8/xPE1yNKC/JYuY70oIS46TZx09JKcvirgCs5Jf2OWGw99PnlPXdLW?=
 =?us-ascii?Q?AlYvNyN23Y9pXKhoCJn9kpnh81srRP518/LiZijlWPgN0e42yS80G7MJ53MR?=
 =?us-ascii?Q?9rXJ7U5zoZqzSZxXD5iHyHQN1gGKRJxdQNEBQHKpfEKDZDX9qW4K21BWWVTY?=
 =?us-ascii?Q?WO/rCDG3tj2IJnferDTutl+zFwdVL4XmLb3PjX0qc9FQ+cdk0GtabGaU1Act?=
 =?us-ascii?Q?v4gGWTiv6+K2Sc0eGEmkTGpjCd0SC+O68LIK4i9XL5DqhyGyd6Cxz7FGCI94?=
 =?us-ascii?Q?WCKbK+6wFIhDPs5yk0zNnMTRAoCm1kW5sGIkKHVsZMFqyl2A1beLT8opkQXQ?=
 =?us-ascii?Q?lhzL5yKqLDB8kN52O17EazeqHX1M6yhsKY2jY6xyt32tyh5UXm559YA+c858?=
 =?us-ascii?Q?sHVsZTWDi6vsAEq7vt5bJBeW0b5qGnX0c4G0dWWsODzYB/ou7twuWSjLlymj?=
 =?us-ascii?Q?Djyt30bn6HA4pZfIbygEzDXYXzFRyGt9Yj1hkouJNgLNQbbRyq4iTp6mrli1?=
 =?us-ascii?Q?gIK1J0R+gTObwDOg53zJ+/5nlepSV52DavS28ED3iCyac4uzjkGtpyf61L2D?=
 =?us-ascii?Q?zpiqJTStfzBUehP33tqq1pMG/21FHozWzMKVK5aZNvtNF4ywR4k6hTWjBpAd?=
 =?us-ascii?Q?Uvc2Y7LvE3WnWjoREAdMJsq49Q7L7goTFMvmyl0HCPZffxLTS85+G6eJDTUI?=
 =?us-ascii?Q?QHToQ3/0qAKUnhieLYURIgdpAF8OnPRYZreLRuzpOUDtbeNuPn2c3vaVRdhi?=
 =?us-ascii?Q?37DFz/qjbk+Se+qsafdtPWRjyCXleU2ezynZFPwTRPw58Cb8M1ewczOMmdXD?=
 =?us-ascii?Q?Ze3W2XjcFGKv0k6Vp+1WY1SocOMzHM+7KXplP3wpn4CwxAc5MrHvQJOa22Ap?=
 =?us-ascii?Q?4q+lUurBa8UywA4Gsxbl8yaOmg2le84jpHOb+L6EAxc0xa5E0+O7XRyuT9RJ?=
 =?us-ascii?Q?ngDWLUApQVH0PuSxN6PtN13yQDDDJnDKVSPHuV8ASD/Saw+vLJ1ykdf5Ovfl?=
 =?us-ascii?Q?huGyQhRT0lRKQQtHHTMwwu+R2KEHu8pwsAdlYfaDf+5yMxITjaJipg14UJ9Q?=
 =?us-ascii?Q?Y/DF8MZUj+cST4xsQcYp+273i+Qv9dTH/IPxO7IqYXRtjMIDL/Ig?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82ff7cd-f0a8-4faf-1f31-08df25a00424
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 00:55:30.5620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vtC/sJIr4MsvfT4Mqb5zShp0cny2ncJNHeHalskmnBzxis7MJSBocly8w4jVEYplajIBT5Qo73JB78tixejAxkn7Jan8elBek3TxOnTuAoGUyKr7Uiqw3Jy5VSRznNt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

On Thu, Oct 08, 2026 at 03:10:03PM -0500, Frank Li wrote:
>On Wed, Oct 07, 2026 at 06:44:20PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
>> of_device_is_compatible() on every invocation to determine pad wakeup
>> capability and i.MX8QM-specific behavior.  These properties are
>> invariant for the lifetime of the device.
>>
>> Extend the hwdata flags scheme introduced in the previous commit with
>> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_IS_IMX8QM, adding dedicated
>> hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
>> This replaces the repeated device tree string comparisons in the
>> suspend/resume path with simple flag tests on static per-compatible
>> data.
>>
>> While at it, clean up mxc_gpio_generic_config() to use a local ret
>> variable for clarity instead of the == 0 comparison.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/gpio/gpio-mxc.c | 46 ++++++++++++++++++++++++++++++++++------------
>>  1 file changed, 34 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index c08f0b59d284..5da603569d88 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -34,6 +34,8 @@
>>  #define IMX_SCU_WAKEUP_HIGH_LVL		7
>>
>>  #define MXC_GPIO_HAS_POWER_OFF		BIT(0)
>> +#define MXC_GPIO_HAS_PAD_WAKEUP		BIT(1)
>> +#define MXC_GPIO_IS_IMX8QM		BIT(2)
>
>Look like QM don't support fall edge
>
>Can you use MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN?
>
>So it will be easy to know what feature missed for QM by hwdata.

ok. Fix in next version.

Thanks
Peng

>
>Frank
>
>>
>>  /* device type dependent stuff */
>>  struct mxc_gpio_hwdata {
>> @@ -132,6 +134,26 @@ static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
>>  	.flags = MXC_GPIO_HAS_POWER_OFF,
>>  };
>>
>> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
>> +	MXC_GPIO_HW_DATA_COMMON,
>> +	.flags = MXC_GPIO_IS_IMX8QM | MXC_GPIO_HAS_PAD_WAKEUP,
>> +};
>> +
>> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
>> +	MXC_GPIO_HW_DATA_COMMON,
>> +	.flags = MXC_GPIO_HAS_PAD_WAKEUP,
>> +};
>> +
>> +static inline bool mxc_gpio_is_imx8qm(struct mxc_gpio_port *port)
>> +{
>> +	return port->hwdata->flags & MXC_GPIO_IS_IMX8QM;
>> +}
>> +
>> +static inline bool mxc_gpio_has_pad_wakeup(struct mxc_gpio_port *port)
>> +{
>> +	return port->hwdata->flags & MXC_GPIO_HAS_PAD_WAKEUP;
>> +}
>> +
>>  static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
>>  {
>>  	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
>> @@ -158,9 +180,9 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
>>  	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
>>  	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
>>  	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
>> -	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
>> -	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
>> -	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
>> +	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx8qxp_gpio_hwdata },
>> +	{ .compatible = "fsl,imx8qm-gpio", .data = &imx8qm_gpio_hwdata },
>> +	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx8qxp_gpio_hwdata },
>>  	{ /* sentinel */ }
>>  };
>>  MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
>> @@ -575,15 +597,16 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
>>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
>>  		unsigned int offset, unsigned long conf)
>>  {
>> -	struct device_node *np = port->dev->of_node;
>> +	int ret;
>> +
>> +	if (!mxc_gpio_has_pad_wakeup(port))
>> +		return false;
>>
>> -	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
>> -	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
>> -	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
>> -		return (gpiochip_generic_config(&port->gen_gc.gc,
>> -						offset, conf) == 0);
>> +	ret = gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
>> +	if (ret)
>> +		return false;
>>
>> -	return false;
>> +	return true;
>>  }
>>
>>  static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>> @@ -591,7 +614,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>>  	unsigned long config;
>>  	bool ret = false;
>>  	int i, type;
>> -	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
>>
>>  	static const u32 pad_type_map[] = {
>>  		IMX_SCU_WAKEUP_OFF,		/* 0 */
>> @@ -612,7 +634,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>>  		else
>>  			config = IMX_SCU_WAKEUP_OFF;
>>
>> -		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
>> +		if (mxc_gpio_is_imx8qm(port) && config == IMX_SCU_WAKEUP_FALL_EDGE) {
>>  			dev_warn_once(port->dev,
>>  				      "No falling-edge support for wakeup on i.MX8QM\n");
>>  			config = IMX_SCU_WAKEUP_OFF;
>>
>> --
>> 2.51.0
>>
>>
>
