Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B33D34BC;
	Thu,  8 Oct 2026 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490371; cv=fail; b=RMwifkfp+VtQHGQdyVl43gYnLyOcxXpsT1gTBaCCeOpPjsOXZ6rNxBdWYROQc9mPQ6Td2Uc3jPI6ZvSW0cjzy6c6QptgkHen4jKK47jqe/joKk9w/Y60ViwMA+EAOtNmivUB262OG3UwU+5DUQbN2KEYqs+czejK+7YzaQe6GSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490371; c=relaxed/simple;
	bh=vb3yGR866P/MkYTJd4o6PJulldG6HU1QiDv4+t5SXYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qkHlZ65suviByzLrM7Mebhh712QPUyWEtTAFjtiqtOIRD5Y5Jo2f2ETcqxW3bPojXO0Iq3SqHlqLjSZRQWY957+pzdNl1P3/GtS7xyA4yM2J4N130gLd1RmXUM/6KDfDRMWhJWg428mdeDMuwelPp4n0QAOD61u6hN/S9DSetEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A78miHo4; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A78miHo4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbTZhENc0z7v8pvLLVfBU9N7Qav6dxvwW5pG+v/ds/gp2uSt3TmhL2UdejJR18n0PCVvSBC4TVZ0TNHGRpdrsV23B0OdSGf9VFYGUtn0OMQOSLwMjZH25bzCiprE7GqqwsbGjlzVikrxam6AOLPeGpJ/an2eT75SzReQWvP+/H5IST+QsYTwvjgEjnLXtHQFl/AmCK2N4tTTWeMxb9qICfoQvBZVPCu95XuwxgDHDldObyQcX+643sujkab8x82MEl+ZWdPdkibXpHVHFaHRYJWVwvPAnBShJuNwTLwKCMkPvfZOcoNtMfKEcposc9rYGgdgG8rBRmSI7/s30Oz87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbrjoK40U3LyAbGwK/cCOmJ7VOHk3se8Z6AgTB4O3uA=;
 b=MVRA8YPXTw8K1JE6wJiYslNPIn2K1aABlcxORvCCHIjaCp+G0b6DVEHJ2baKuGa4+51gLEG5I0U+Cq9EM6dYg8VAysHycv4dKwLj9QKZkWVEmmW5Ww83XsgBDxosJYlBQxG99VEmmhfSp8XrE3ymI6RBB44Rr+aRruO+aBlyOVWIN4LhdRS059wgHUseIyG3MJC9+3jrDFg2emB0BgmFGPcKrtsPxV3hYcua32ZXXdtr97G7NiPeSurHHMIcydMjK0U18Iwcu/2u9q1KvjB6IBsuP6rnxaNLUfjWZM/kfi+FQql6/whUYVD3Nsh3OKPKRLV87qVL98z0P8pLOg4NPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbrjoK40U3LyAbGwK/cCOmJ7VOHk3se8Z6AgTB4O3uA=;
 b=A78miHo4eWRyOthZ4k1UmQqZc2Y9LGr4HavpnAN+utJqTsDoV6fT4nVsSlunDvkeNqK5vJK3+sLtACr/X937VDiwJDNvo1XbFtw80paNXV4g+gCWHEy15c+o74/0SZ13a7LEeYUc0PMHvXyyUL/ERVtiJiY4+CX5ecXGhaNw1+V2IKzt2RNEkCkxxclCOzTFPguiSsXnvALSLmYTJfqQECkoskKrc/xUjLZXemhzUA/lNLni69C5iKuL7XoHan+wyOd7E96Z+VyYZo0mIXMthlp64wF1YNfpF7d0Zs/vqp2I4AhB7p061gb4AmLEn0a5pSLuA1WTnh+h/WqEzaiTlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR2PR04MB737718.eurprd04.prod.outlook.com (2603:10a6:2c8:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 20:12:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:12:47 +0000
Date: Thu, 8 Oct 2026 15:12:43 -0500
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
Subject: Re: [PATCH v4 06/10] gpio: mxc: convert probe error handling to
 devres
Message-ID: <asf5O1FoHF_nI3iC@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-6-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-6-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR2PR04MB737718:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bac9442-0ae1-4f42-22a1-08df2578855d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|23010399003|7416014|4143699003|56012099006|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6uJYAS2HiJTi/IAkIz9jTz5aBhvmnbLyF07ISXNMF/IhfS+DkJSSPENOgnS9uaTLhrDJNRsMZ3R7Nd1KDhPvTsmmmfnCoaC4kunuYJSxc9YqdyG6wCcpziEdSGSARmiVv5qyHPIoH7+24Rp7qj9rGDrICkdW8bio9PI8PfiOvlFYB0HU1hCvM/6MPhGXzKwQnZI6YOgEzrLZ91y0Z1rx+NG+hBYy1N4tSsU4pCt2MAr4meZyThVgJmv4AuPmkP3EK8N82PS+SCNWRbFYYRWI3NDyxeGnaytKSialoYEwP0TugYqkixYMTdfPbKx8QU1dXwH2YOJWb+KXw7vxmGbnRFkVIZqw/BM1JOYArRXGHNrfZ8dZntYt7nipI8yQ880uEZvenhvh1rTUjYpPhXviyMUNB3konhgsT+4h02Kte6GNrPLGkh+L8p4id21cNTT6kSYqtucoGqu333WFASVuks8ctr7PRl9BoazgtCvmU3IUzgdA2gzqbdimygRjqB2JvXXQDY6G2ks0TGJfAjFknR3i74jThgIPM38E+qGpkgoADKi4Te5WCGVW9pRVgiqzAz/pbkgT3PXfW61hZkbMTDACPc0M99QjbCkYYaquxoxXV7CeEe0hle3RFLHusxABGVUV+eSG5Yk0a8mruCq54/2j5MQ4AxOZT7a0OEvb+tU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(23010399003)(7416014)(4143699003)(56012099006)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YbITYd5dXSWCn8MDR5xKIj5XUR7ZW612hnDS4SnntN8Dty3ey3kVygQypRGc?=
 =?us-ascii?Q?56vtpXvXMSv8oQ9o5GLXSaYZzOVc5qKp5dOG3T2/0jME1aU6aj5MDR9rSnVJ?=
 =?us-ascii?Q?kB6Nyuh1Udj22uq5brHZ98TVBkfHnJxcHFrxthG0NOi1XMLFLtFM53kjUu3k?=
 =?us-ascii?Q?spkh70ScVjbMNjf+sS+1KguJWw+eE+1EbC4c9Zb1s8EcBzgdfXiSo2/p24qa?=
 =?us-ascii?Q?sWDaLPuPmWL1eN5uvj3yG2jtY2hRT4nm5xkdg/8AqZtdxvfGdKecZdynhZK5?=
 =?us-ascii?Q?a1jIWu0VmsFZnPp6NIN3VduSYsUUOoW7CDJAQAfUSl6dgPGlGPKwsT5Q3LpM?=
 =?us-ascii?Q?ZbtnVJw54iNrioN++betRY+EXhxk111GURbzKMURxwYzM0LnvLlyW9VFOR20?=
 =?us-ascii?Q?ZYGtnC7yTCz0JAS9FcRU+eIib6xXcMoF+PnKtS/SZ+yVS8y9R90Nndpk5V5R?=
 =?us-ascii?Q?1Xm+qQvkK3W5XtGuIWiCSG/zbsG/RDYTLOZIut7cZPNpZs4G3umY8mxIx3j0?=
 =?us-ascii?Q?xFbKoYoHrl8efacMMRuKyazhKHEZ6DFLoqK65UDQ8V4lOolm9ThHOW5smwtd?=
 =?us-ascii?Q?iLYDNNyLduCeTsOu2cgVglvMh85do1u8UWVVyaESlf2m2yftO3JaujupiEz/?=
 =?us-ascii?Q?xwwQhNCQiHbHc1VDBw/xzbPUFfmdm2oMlToONoRASsnJ2Q829bekL09rl0zx?=
 =?us-ascii?Q?+H3TQB8eL2C5odvIberurN8viEc7ZW8sxbnkYThUP0Jjw0zhTGxkBg81inQN?=
 =?us-ascii?Q?lH2Kjwd9re0SlgiWhHUv7mXZaECDPhONl2RfOs7tFzSTC4Rb+D3S7v2HmE97?=
 =?us-ascii?Q?GRbJIo4awg+7+nAk2ZNawe7VyapoYiZ/+FkLiT76Lhrof0Ai0awuoteutpDU?=
 =?us-ascii?Q?L4P0b7Af7AQzXcMnsfHN7FSeAiVEUT+BnhbaZ6I2p4xqgVwU/zYfchE0N1Di?=
 =?us-ascii?Q?Ir4goEQB46kWw+5yzQT+bEwtzU4LSOa3JI0VGAvrekD+tVKbDM34lVhxBlb9?=
 =?us-ascii?Q?OQdaQRVeUGMiXH28q0TZwqdxexwM5D9xu0nxuiUvelhqt3EJfPO567k7qcng?=
 =?us-ascii?Q?y5PYaVqoDjLl2x8ekp6xw2Kx9vqsAoQpC71BwZjKoCIjHdtmySNtTyo+TydW?=
 =?us-ascii?Q?QcLy1qc8Csj/Ei4Efc3qw73/BpMMvRuuTEDcjkjMVIaJpgkWmy+ID/3fSWch?=
 =?us-ascii?Q?Oy/Sj2V0eqCGd1qtsknUYkShY8v7y138hVet9nry7kgK/9S1AiVEUxKhDHob?=
 =?us-ascii?Q?PJNebCtIbW4XGKlX6C1QtmmYVBS+ndtYt51oAf+pwjvoRK+b0DAfK/vyKgbb?=
 =?us-ascii?Q?2Tdn44SXl8heZV/1mQ+OBHNLIsrsXrDEnp7cVNmCcJvTK5vQsLga2uqXTyjB?=
 =?us-ascii?Q?+vCZH7AVV6qxvwo2RqRpCOsJFKgKbdH1oK2BdmZZJ5larJyS5AKGWEsB5tfk?=
 =?us-ascii?Q?cMEgqe/YQaURyxLSEWm1RjQ8I2FLw0DOzkrJCGUE5xGfpQFfxvlwjdhEnUtI?=
 =?us-ascii?Q?CxNrQ5mY9jaO4GSB4d3TGcGsRVgyfEtQdwHH3AiebDD7YvvidNsvTYwyQ0Ql?=
 =?us-ascii?Q?J9EXsJ/aWGUIRdKee3pnpEzIbxteQHHiP6seBetnvFGLQ8/9lbSFIylMZZZi?=
 =?us-ascii?Q?3bIRSdaApT1ipcvOfaZVR6g/9LlveBekkEnjQInMHepW6w8SEYvpoT7JcbAE?=
 =?us-ascii?Q?tMoxh0r8q47zfkgoUnmTvO+vSRe2G9FAmzNvy00oD0DzOFxqUWCMGJ9e6uzn?=
 =?us-ascii?Q?j++QpycuyaW8w4dSGO44XhuqE1T6oiSduw8MuaCOaZt8skA7OoaC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bac9442-0ae1-4f42-22a1-08df2578855d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:12:47.5289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jbsnK+0JV/sAxHaHCZbERJ0+Mbb5pY6im7sUYqVpvz82GNeib0l9YOq5+ea1QTIp2Mu4/lla6z9UKBswqbyB0NH36MHkcE5+uaS31JhDdwuBjNdJR8oLaP2NK7kriNy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB737718

On Wed, Oct 07, 2026 at 06:44:21PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace irq_domain_create_legacy() with devm_irq_domain_instantiate()
> and the open-coded pm_runtime_set_active() + pm_runtime_enable() pair
> with devm_pm_runtime_set_active_enabled(), converting the remaining
> manually-unwound resources in probe to devres management.
>
> With every allocation after the PM block now devm-managed, the
> out_irqdomain_remove and out_bgio error-path labels are eliminated
> entirely - probe errors simply return directly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 49 +++++++++++++++++++++++++------------------------
>  1 file changed, 25 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 5da603569d88..54b09f1a4b50 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -449,6 +449,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  {
>  	struct gpio_generic_chip_config config = { };
>  	struct device_node *np = pdev->dev.of_node;
> +	struct irq_domain_info d_info;
>  	struct mxc_gpio_port *port;
>  	int irq_count;
>  	int irq_base;
> @@ -484,9 +485,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	if (IS_ERR(port->clk))
>  		return PTR_ERR(port->clk);
>
> -	pm_runtime_get_noresume(&pdev->dev);
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	err = devm_pm_runtime_get_noresume(&pdev->dev);
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");

look like needn't call devm_pm_runtime_Get_noresume() to pump ref count.

Frank

> +
> +	err = devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
>
>  	/* disable the interrupt and clear the status */
>  	writel(0, port->base + GPIO_IMR);
> @@ -512,7 +517,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		goto out_bgio;
> +		return err;
>
>  	port->gen_gc.gc.request = mxc_gpio_request;
>  	port->gen_gc.gc.free = mxc_gpio_free;
> @@ -528,27 +533,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
>  	if (err)
> -		goto out_bgio;
> +		return err;
>
>  	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
> -	if (irq_base < 0) {
> -		err = irq_base;
> -		goto out_bgio;
> -	}
> +	if (irq_base < 0)
> +		return irq_base;
> +
> +	d_info = (struct irq_domain_info) {
> +		.fwnode		= dev_fwnode(&pdev->dev),
> +		.size		= 32,
> +		.hwirq_max	= 32,
> +		.virq_base	= irq_base,
> +		.ops		= &irq_domain_simple_ops,
> +		.dev		= &pdev->dev,
> +	};
>
> -	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
> -						&irq_domain_simple_ops, NULL);
> -	if (!port->domain) {
> -		err = -ENODEV;
> -		goto out_bgio;
> -	}
> +	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
> +	if (IS_ERR(port->domain))
> +		return PTR_ERR(port->domain);
>
>  	irq_domain_set_pm_device(port->domain, &pdev->dev);
>
>  	/* gpio-mxc can be a generic irq chip */
>  	err = mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		goto out_irqdomain_remove;
> +		return err;
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
> @@ -558,14 +567,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	pm_runtime_put_autosuspend(&pdev->dev);
>
>  	return 0;
> -
> -out_irqdomain_remove:
> -	irq_domain_remove(port->domain);
> -out_bgio:
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_put_noidle(&pdev->dev);
> -	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
> -	return err;
>  }
>
>  static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
>
> --
> 2.51.0
>
>
