Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E1C4F30C8;
	Fri,  9 Oct 2026 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572022; cv=fail; b=jnjTD28oY5jIquZrmuorptG3uiap9eudsJns+1ZdHfeItemH70C3QBKeM44LyRwWTbpCUt0MFEVRh9HkoSjCdkmA8yan8sMFCjKoQfMw7YZjHrHTy9eG31onbkjouK8oWao1+gD15nt2hzwDUeBSMudLNuhpH8meBP6Zgkp+s80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572022; c=relaxed/simple;
	bh=TSXlfjSxwZcxY9AMelEwsDrGoxrEq13UqcC0iumti6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DI08HlprOKiMaDKtFtk3I9D9qfkqRmpoZNKlNOjer3E89cxUV2lSJBUNhx5lyPyD0GSGbFkii5CooxFDt8IRNSRxWpScwYn55EXwG6w94OQxJYH3c1RZp3tow5IJ0XPEXxc6EbDwg0aJ7zpvtBIS0QWBf5u0kCNXjT+bp6A8d38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fIPcykBl; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fIPcykBl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sq3YgyhRlpS5d7bS9n5w2sQUPpfQKau3HFZg64F8khuRSWeeEkeKOqLErWW8gtRsaYQg6CMxho/as6XYjiWaYpX9KBOhpEw6OLZZDNuxeQKZDYwyNNO92YgaABbD9KAXXkCaEOhST+EfDmCr54G8VaKY3BxB4KzlT/lvOmOhBH1k/GSTMb2Oszt0WkboxpIyzXaHK3qLTVxZzjGE9Kw/9dFrIDRU91Z/yE8tSWilagKlv13ETCoeNfv4lrorqg34LkloMBC+VsuJamBGCNgWMNrJBeL7Nx1N2LiOuJyVY7raKRDuaiTh/UNUCAXjGonWjndCLdsDswA9Er10Maiv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bquGIrYU9g8iQxrv0rgpfMlzpMEliMNfxjm1RmLaJCQ=;
 b=QkQMTN1LotpLgOYaLHq6co5kzA2XJNJoBffwB/1G1huOF2kqF9QtwwQ1wXb43BEnOjI1FWYcOqC00eIg7CH09CUa+suRFOtUTpgUUTIrpUDwaqjyNNSVbWj3AP1IjnA6A2wfxMLoK+y0Nk/hnydrycxLU7LXNmFe4s0bo6Cl6U9j5aXZaht8sYx8+qWLBT1idS3T1lcXX1q67nRJuiaZzsJ3KkuJ9KFF9V5ITPXOPNTt1bQ2y8Gz/HZUl5qa4oUZlHOCcrG7ar3HGkOs6ahHrBCfaAG57yTuVL5WeqjgTXxUr6Ahd0faiGCNIle3lz3K0byfj496Kk4A6rR2oDY+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bquGIrYU9g8iQxrv0rgpfMlzpMEliMNfxjm1RmLaJCQ=;
 b=fIPcykBlBDjDo5zbs67qQVVgumPWrgecDM5hk0+UV5tT2Klae3lal1MwGl4RyqvAgRQORWRZjAnDDJAN6ClnJk8Gy/u7loLLQ/J/xkfrWS1xhw5QoP7oroELSmLk1QzhegBhxjP6wXpf8pUCxZ7SQHqEnF94mN/5vEsIaEHU4fesCpCnums7byNu6Z5NBqFVt7SGneJZ3SQRbi4EpGB80xzDqDzvdFdF5l4Epjcr2IpucUFTTEjW1eCraptPuotLLqSmGhr1bsZMXXZAi3tBm598XqH5XACO4sf/C2Rl13ScaqAVIDyTQbCb0wIgqfFJpfuVLVuy9HW7nJcgRU6l7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB9014.eurprd04.prod.outlook.com (2603:10a6:20b:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:53:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:53:38 +0000
Date: Fri, 9 Oct 2026 13:53:34 -0500
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
Subject: Re: [PATCH v5 10/13] gpio: mxc: convert probe error handling to
 devres
Message-ID: <ask4LjeZgiyDFv7I@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-10-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-10-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: AS4P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB9014:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f5bca5-e925-42aa-1d80-08df2636a0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|10067099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	00oBPUqq3M7BdJYc7vte5ZjrOzTrie9TxXXyeFpSFw4s/AUCwu9KGc1xawlzw5JcvXrmOTEvEBWaLSbyzaJ3yiPeglBTmRTeIJ0eXth5mtMW0dHf2G82tPQHCMtBexxH+F961iKygoC+n4fOoQfiFwD/73U4rgt2zr69IpwcXfB3YDZPeCGiF8lbtwKs68RM3lLAkiwTNgLlxoVqhFm8PYS6V3y/Jiag0wGQupE61MoNLywpU4I803F7WxeBXZOTrXAIuHHNKx0cQJpVVlq1ueoJM/tBjbBUsoY9jwD2FabVhV1BQ1mBcPViLMhmUzzcst8CubahsifdqTbGqDVDD4ppbhKw82kJkWJzyNE0D6Fm2zT/xQhkrnG00/HI77oU5pOG2k8azxuGPl0j3udU0Eilx2pGxK2io2uwPgPBwzWk21dlZuSpI0zPWSKnQOWt9bOQQzl/js9e55yFOipj4+MXG8TSg+4xJvt0mxKvdXI+B/YOOtfbXHJhmg6mnjBp0pW7NJCXOLMVSpBG/Rz0as7icaeAgbLA2hl1yvn+XLFOmqaafDcB0ByqQo1wYwJ/j9MTwfj8wsxp4S82hzJdakwbPnPvZRyB7DP1PP9OQD9Tpp0vgAazwTPszf2SAq5sdMVbAOGtNQSLhJkuPayHcxD7n8DTInhtRZ6QhcaPhjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PDdXqyLUxivAaKS1NJLCT8cwm/Z4htPVTDOoTGDZvFa+rUSTf5i19rP8mZm5?=
 =?us-ascii?Q?dFqukdUGf6dLN3KR18MRW0YILaaAIVyMDptqhNUZ64tyS/bk2vs/SbUn/4C4?=
 =?us-ascii?Q?Q0zxFPUvtaYo2bW+XuiMYNJRLPVURPgHGgIasnA8YOXT/Ke5tM+hjUgIqKNp?=
 =?us-ascii?Q?dMDCD3L4hgKKT8+uNv7/UiYI23yKP/3UV/lDYXgc0sLe+vA+EdJlnAG0USIu?=
 =?us-ascii?Q?8uY7ns1w1inqNyL+0k7zZ1YtfYls+0SdglIJw9xR1i1rbkuzY5zQhrMwhnG3?=
 =?us-ascii?Q?RsxbOapqfiiESfgtZe1fAdxJL7YoNmFgHzHtZGiJ7vIkt8ogxi8y4TSryIrS?=
 =?us-ascii?Q?leh9TwFymgr6X1u9WQfiGeVM+27mLJNph8ChbVaLof5r5ZCT4WAphfDO2rIU?=
 =?us-ascii?Q?Itf+oteRM94kr7qcf2pPJ2NzvG8fxEII/NP6lk9PAvY86wSzpZTDfAlV8X2E?=
 =?us-ascii?Q?Hi4WeQ2oD4J0ScDjsF6qRhBrKuhViIKSekUJ1k8OYEZsLtJ/7vOe7v265WS5?=
 =?us-ascii?Q?b7Je8SL0KPY9fS8LvlNDejeA92fHDyQigzV5EtNMUZVJ55H0VFXKs91fqO3/?=
 =?us-ascii?Q?JMlG1shpfLNSY5vM+1Wvt+V5TXDcPNbLlZ2EIpBvwABCXhsPhJ7zGDe6ZJ1x?=
 =?us-ascii?Q?ibf8HF9XJsezzB2VSNVPePJjFHefWmSNk991Ea9S8+xAHTptPftS/oI8YI8Y?=
 =?us-ascii?Q?8s/gLDE+AjVr8ls1gusAor6E13e31XPL9GUKd9PQ6ZjWVUE3ECtRltgZ6pZU?=
 =?us-ascii?Q?FvqFAD/AiNmtIV1IjOf116k2YLgtKxDyCfbhKiiPk0Hb3po7VnJhmUYLbLCE?=
 =?us-ascii?Q?/18RIaBKTnGc9ycEEwRmaUwN/DJhZ/gpamh9STKmnk9XOu9PutuFOWf2XuGO?=
 =?us-ascii?Q?mH3NYWDckXJ9XZ3Q8GijXcvW+CQ/I5XTCHHNvR/UnzOEcFwXHrHg/TFNghdA?=
 =?us-ascii?Q?7m5A4dDP2YOrvaea9nWyWPxzgG8YNlIKisAIkam+zVkM6iyPA8wPyWG+dx9F?=
 =?us-ascii?Q?hcUQ5gtLj/38ds5v/bWTpK7CRdx1//PBwQN0BGJ47e8pkDbfuZm3FP+sclyb?=
 =?us-ascii?Q?V57bANZ78TOBX1TINSqZkTgx9r0cjZ2XYIlvErhd4qM1A/czPGmriGtha4sy?=
 =?us-ascii?Q?a1vfbPe2z1VJZvn6SD1RWNPvTlk/1b+i0X+a+oWRwLR3r3xEAQua+RNKczfK?=
 =?us-ascii?Q?qE2BMxzrkJ+TDdfgUtJju4jgMlR0O9yqyjhdSpJwu7xGaMjrAx+xCM9nUNKI?=
 =?us-ascii?Q?xnelDrwaBx+raMt0V2CPxcTDODo3vvO1uSzuEOCLxHwsabpzrdIn099syEJO?=
 =?us-ascii?Q?3dUaDFp4fKAsdVJUSudg+hRMCi3nDllK/q771opLhL+77RT9nsOmPVpIum/u?=
 =?us-ascii?Q?WjKL+iBLfotILNUTMoUIPRqLh8/KDpRMS9Fx22p7o6cMM6CI7oN/Tq8j+ykD?=
 =?us-ascii?Q?StxfqLkPH9RsOhIHQNp2oxHiRNhh9oCpYjp1mrTk7U9rEYAPGCGmrge4anVz?=
 =?us-ascii?Q?NeUgn+M8OY47Gr7YabLYKkEyFvMEehxt9DBoZho8kUU6m9uvtByq6itisF3P?=
 =?us-ascii?Q?HM3vApb8YE8n3inaLOh6ZVJ5ExqIJn3X4j5NGtA1mhy2X+6wnd9NIQxKzQuV?=
 =?us-ascii?Q?NW2PWhngD/BfoqCKR2vXe4pnODjAyjertY4fpu7v3VMuawPaXmhctMyjUdyH?=
 =?us-ascii?Q?lddSVsq114JJeYgCm4vp6sT5T/925bAyeMnLySFNNqHeeG6cdi88xvJmcVXc?=
 =?us-ascii?Q?yNbFn8CX5f6QTRJkjLGxAjt6GdufnKNECrAUlAX4weZ5MGf8XrbB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f5bca5-e925-42aa-1d80-08df2636a0f7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:53:38.2172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LINEHPYJ+VSeNHS8df19OLD7gNrkKDQUkklSUBhcPlM5ISepogVcpzWmAvQ88q9bIrl6q6M2MwYRwe7ZBVB+8aXyg5O+s2TlZrfU7auR/2b6sWEj6Rige1V4dbgyDtEL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9014

On Sat, Oct 10, 2026 at 02:05:31AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>

subject:

gpio: mxc: use devres functions simplify probe code

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
>  drivers/gpio/gpio-mxc.c | 43 +++++++++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 3d5a6566d3f4..6074b1e3d683 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -452,6 +452,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	struct gpio_generic_chip_config config = { };
>  	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
> +	struct irq_domain_info d_info;
>  	struct mxc_gpio_port *port;
>  	int irq_count;
>  	int irq_base;
> @@ -491,8 +492,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	struct device *pm_guard __free(pm_runtime_put_noidle) = dev;
>
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> +	err = devm_pm_runtime_set_active_enabled(dev);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to enable PM runtime\n");
>
>  	/* disable the interrupt and clear the status */
>  	writel(0, port->base + GPIO_IMR);
> @@ -518,7 +520,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		goto out_bgio;
> +		return err;
>
>  	port->gen_gc.gc.request = mxc_gpio_request;
>  	port->gen_gc.gc.free = mxc_gpio_free;
> @@ -534,27 +536,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>  	if (err)
> -		goto out_bgio;
> +		return err;
>
>  	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
> -	if (irq_base < 0) {
> -		err = irq_base;
> -		goto out_bgio;
> -	}
> +	if (irq_base < 0)
> +		return irq_base;
> +
> +	d_info = (struct irq_domain_info) {
> +		.fwnode		= dev_fwnode(dev),
> +		.size		= 32,
> +		.hwirq_max	= 32,
> +		.virq_base	= irq_base,
> +		.ops		= &irq_domain_simple_ops,
> +		.dev		= dev,
> +	};
>
> -	port->domain = irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base, 0,
> -						&irq_domain_simple_ops, NULL);
> -	if (!port->domain) {
> -		err = -ENODEV;
> -		goto out_bgio;
> -	}
> +	port->domain = devm_irq_domain_instantiate(dev, &d_info);
> +	if (IS_ERR(port->domain))
> +		return PTR_ERR(port->domain);
>
>  	irq_domain_set_pm_device(port->domain, dev);
>
>  	/* gpio-mxc can be a generic irq chip */
>  	err = mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		goto out_irqdomain_remove;
> +		return err;
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
> @@ -566,13 +572,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	pm_runtime_put_autosuspend(dev);
>
>  	return 0;
> -
> -out_irqdomain_remove:
> -	irq_domain_remove(port->domain);
> -out_bgio:
> -	pm_runtime_disable(dev);
> -	dev_info(dev, "%s failed with errno %d\n", __func__, err);
> -	return err;
>  }
>
>  static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
>
> --
> 2.51.0
>
>
