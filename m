Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD94F4040;
	Fri,  9 Oct 2026 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572117; cv=fail; b=LYJES6ldalE9FYRuIaEVpsRXOeq0FVICWwnnjHYPA1vP94zZaN0ODgNUGLxSjC94cmZ//o7SD9swWZU3zyqeuDJRh3EcGHSnqR1az50nCrDzbfQy3WaFhdDeeLpdDQpStJBla4Fz+Kd7YtlzfoWnKkHbiWoyVh6XAPF4ZQg6x7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572117; c=relaxed/simple;
	bh=iUvWx0JfCnDFi60NCOl1qRVRxgrH9yJW9gUYj2SXrLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yh5o4Mqy9NNCdZ7E4c8CC6QIl8tA/Xnyu6p/Cax4ZKQj49b/6MwUh15suQDYxKJAlxuOhrsyZQqFVxYIrQN1r0N0EPEHGCMRS3XqL1ql38xf31Rx5ahiOCqUAE9X7soFwGGvAkLrLznqu/1OPhOBTV3c+yzj5T90Ox0xkPk4T0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UCRWFc2q; arc=fail smtp.client-ip=40.107.159.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UCRWFc2q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjWGkOnDsl2gkq/w+mKfsuDCrrAypMAUxoJYjIQjwBLuYz0xs7HWPPeVLyfJ3AJVbkulT0TVtO0H0ThjXUIkRG6jiJeWUhsE5BB8RTY4EWIVIBVQLxGDIsVlzU1ACEF9p5gto71RARWNRPo9smbbmGOChyaEO+4fF7mTBiYCZ+iZYCkk8/m5uhXkqPOnD7ls1Ws3NeHiLue7eVbrloXPs7H5SOkEllM16Da4RqqsE4Hh/Iw701vvWW1e5R1h+7DgaP/soM/oTbUtnA6KGmgqrQCwSqorpxlNDR2x3j0K/xiw8Tj0nbu//zVhmKRAI0yQuPAUO6CQKZs+VcxBuuKIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z29X8V/lz7bURwOJBOwAmKfO0zRHOvqGlX2qziI+Z4g=;
 b=EjaFLnEfpEyPEqG8J6y4rnhrMGwK/LDynbsonblrAD4pxdy4s7EicxgHOfwE9zSXyKvu3Z24w4CshdnGxVsk3RPkmGbuZCCxWtlja5oZCxUB0RidmWhxz9wfy1Q2J7qWdwF9jl0qRSdJaO2MKTPg2KNKgqXQz6fuaf6uSNvtrsFaQ5SkXCjAncGhn8vP0AHm4g4/dqzuTe4yCtF7UWa8Ur093qVe1IpmkWLOhsyXCxrfDMGCU9IfmhxL2kFHXe6B5YGuJXq6GDrVP9AQsdQMguhmbLFR/MNHNcazLhk2hyQ6EtkuvaiYH0s5OSrre181sw+NOMZvocHaVhNphyCsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z29X8V/lz7bURwOJBOwAmKfO0zRHOvqGlX2qziI+Z4g=;
 b=UCRWFc2qub2UR8hrbrDOam6WcVV37Pf4LrV+6Y+q+cti31CcKeAcZLrqnXPjMKCVa9+PPFkhAI7GK9jYFWgJ1HFwoCHe9rtyfagf5QybQ+kB1G93+mtaehkUflzxUE8JTN1eydl8c8lnrjLNwuFq5oeTVLSRANmMEj0zXxAsjLcTerHV+nSfAQjsCByUo4GfHX1b6LBGWh6i0dQV6l7i9ETI0BBnUcLTVQjU1HAswHZCtMHWGdTkWDXmH3TKkbQiV7NTpS5vQUOLthC5LB0G2olhXN3VTjl/Fd/E8uhjqL3kqtX+O92EXtKltWQxJsKo71KNWlJOtWJE/aNclYDHng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:55:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:55:12 +0000
Date: Fri, 9 Oct 2026 13:55:08 -0500
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
Subject: Re: [PATCH v5 11/13] gpio: mxc: switch probe error paths to
 dev_err_probe()
Message-ID: <ask4jIQSq0z5g7UL@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-11-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-11-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be81224-8d4b-4188-aeef-08df2636d917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|7416014|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	1tXyAKDgUFkoM7kugeymr94v3AX0iVXdP/8tOEB5RO7claVtGkw7JfGpwF1vDywlbqKvxf3mSpyIzaxPBZNrIB7nMJoI7MXWITDQyn6s08QNKCwErXIZWDNgrbJ4//wk3CQmc1BcjXxD8T2a7oJipf1M/jJJiwgY5m+P4TrE1T0gSnOV9ooMwkl1cZ32hFDmS9wLKP4TmX+5vMszDOYZik/YDKXy3gU89XulJHqK/e5QYHOwme+LYDys/j9/AgXHE8c513ZCJN16MA7bOyumvFitEZs7Rc0uAHuvwXoD42INQ49bCvUvECJJvG+wGfD2FTedmUBj17xqwYlg2rA6ySlqzybxuiDw9FJMOJborY2056tcwvgynbALhzXu+TDXSTGHPC6GjBkv3tlAZvEW3Q8FS9F/fPX/NDTIdEbPJaWBIFBzT2pR7/c90AhZ9Yh7G4zEEQ45YoKtbuOZ8oL8cb8fAgqIMW3pnZ8VnjGycMd4aS0Ccmi/GMkUMjyG/z8g2/cEpuaGoyGdxuO9kszniLEEcsMsUYCV/zEP1Ii6wT6BOXJ1fLqiiMcKaZ/egI//Gz+Kg4Jihfl+jSElydogKQBiO1G93ZzdANA3jcNI1kIGZGVU500CZTkPayxdmsRbT9YPnrwFkQEwSU7OzLz/3BOz0+8h7XzL2iBVwxIbzPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(7416014)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iya2oNrfm+Ju5H1cPzJlOAOzR+SWUwznAPXXRC4/yc80yJQoliPw9ER3g3pv?=
 =?us-ascii?Q?VS7cYFqYlLmorKIdbA/v73tVyRRrV/mZkpPqCvCTih0kMLO+T+o+e1rmtFPZ?=
 =?us-ascii?Q?w88cAyZ4Pof/Xbndl6Wb4trtpuc04E/lESQkYSU2rLdRc0gxUBYyuYpLU6B5?=
 =?us-ascii?Q?1JEnJslQBA1wLpcyRFHTrBUiOck79T6j1JJ5iB/byUorAmiKO+2a5xC8ENSS?=
 =?us-ascii?Q?TsRhjREoweixPUCEsV27k3t1wmO2vtMdEibTM+Xef68snzOjF/Idp99QRU/U?=
 =?us-ascii?Q?VhnBMmHIVlR5F4bawFZdahqIqmnf3R23HJ8giAxgO8olVAcpkXfphiGmscK4?=
 =?us-ascii?Q?2xMtfBXTlLVKpf1B8H8SYBHZFfdDQbA7vlKJmyPZyh5qAESDgGen3cTworjF?=
 =?us-ascii?Q?s9fpG+4QCT+Xx5PDHPA/nko8Rt6Vm5Ry2UQtxKvPvKYBuv5sP21DqnC+FAVa?=
 =?us-ascii?Q?1CxKy87cthkLHMzvhX7v1yDnigPNaFvI4cLen7foUib4ap236bOAU1Uf4nj3?=
 =?us-ascii?Q?JrqNfXwn+2vjkURS9SltUPFBwkIaIGybag+0bNAxeMd5QGC+btF0kMmufNT+?=
 =?us-ascii?Q?OmrkD79p5YOkX8RN2LqWFN4uFkuyZgmw5NqF+iQ2YcyowQhoJfqhWpK62kKc?=
 =?us-ascii?Q?mx7Iq8j/r4ezOfYN47KNcBD6Y3ch8papTEjw2Dxhae35C9M6tkxdM+yLQbr8?=
 =?us-ascii?Q?R+/g+l4UsTlHUTYglsvduQXPW1gwu7D3jeCd4dn5f3lIKp82CCI75aL4Nw+U?=
 =?us-ascii?Q?5qTa24YurXVuJrnzUFuV5OfTlenpYSLkMu3sS7ltVLXTqW5L+cqG1nNPNiZ5?=
 =?us-ascii?Q?w4kyl4kRe3VkA79pmauboOCjmWm0z1W7b5aOyU37bKwW//Zmtu/bFypAwIhW?=
 =?us-ascii?Q?ZSuhFWS5QdL02lOMbE9RROzcRIxrnFtfG+mTQaHHo6HyzHGvywRuSqrKpCb0?=
 =?us-ascii?Q?JK4kzf8OV3quCeGCkrTzx82FSq5DND+Tmey3M8Hr5Y3K8RFiPxghhnFKzJvy?=
 =?us-ascii?Q?honbLjhKM2Uj8s9IfA67mXxvCf6z3uq/YHkTtNXU+Rx9Y5wjDIFAgFRK3wxH?=
 =?us-ascii?Q?VMBU8fCvTPpsUdBEFxUxXwQlwDG24ejEiIYMl7gfK7fvDJAS0oG9YN1/zetF?=
 =?us-ascii?Q?6zfvLV2+J6jX/bQoWbAgYHfmjIQIcuYiK7hKg6dcll4OtPICT1xcmVuzonOb?=
 =?us-ascii?Q?AsppGxEnZCch5WavD7S0vyYjezOJuT4TT9yzJTwLQ0cIvdzhR6aIjiNvF1vv?=
 =?us-ascii?Q?bO2brzOeHZUwzYPPc3N3DrsJjxpZ4yFcvuNaShMuplJUJ/v7DSdK8AzJUEDp?=
 =?us-ascii?Q?Lyt+Sut8XOR21X5XxgGLcORqgFB2/G8sjxygYI714U51QmEjr5xBYaz2w8Bp?=
 =?us-ascii?Q?QxoVXTqPZoAik58MwB/2A1dT0CVMtUgf3swAt1Cwq2NVEzo+HOT4hiM2/Mfv?=
 =?us-ascii?Q?/7hQlgFad63cU41NUGCcZMp7IVkezi/7vHYYW14rmnvuVexVugvPKIUCyhsy?=
 =?us-ascii?Q?uylzwbhYRHGcfD/pKC9v4HrI/iJrIGeK8yfJzI446yBG+6gwATSk1lq+P2Hl?=
 =?us-ascii?Q?AiyFIB73pQPeR7iGUdctIe3hNJBUI7HhUEZop2J1Pyth4Edb2N9p3gqISqze?=
 =?us-ascii?Q?0U867Udpih73bp66yH57f4nVasfgAn297k2pkcjx2MCVo8lg1VVxzIQOoh/r?=
 =?us-ascii?Q?nlEnIlwcn+SQNcFfIZw0t5ZrDuoXH6uRdZSLcAS0wt+UyxIVbqYqzNYEVGV5?=
 =?us-ascii?Q?lq+CngIDu7kPGq7DLF2dpWrwRhc/XFsbiXniX0EQ+Bp3QWGTwOjl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be81224-8d4b-4188-aeef-08df2636d917
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:55:12.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8DEuFue6Xm7bfZ8LJTl3zf9I1w2NVVGSFsygJefBrg0BFyDmSOUhz3ZI/H7Xsow00FMfw9VwwcY3ML7RjTXm3GnfidSXVldKaxIDLERapKhktKRBflp+bA8V7dbfb+L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

On Sat, Oct 10, 2026 at 02:05:32AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>

subject need update

gpio: mxc: add dev_err_probe() for error paths to help diagnostics

Frank

>
> Replace bare return statements with dev_err_probe() across all probe
> error paths for consistent diagnostics and deferred-probe support.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 6074b1e3d683..1eb5cd148c28 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -520,7 +520,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		return err;
> +		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
>
>  	port->gen_gc.gc.request = mxc_gpio_request;
>  	port->gen_gc.gc.free = mxc_gpio_free;
> @@ -536,11 +536,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>  	if (err)
> -		return err;
> +		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
>
>  	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
>  	if (irq_base < 0)
> -		return irq_base;
> +		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
>
>  	d_info = (struct irq_domain_info) {
>  		.fwnode		= dev_fwnode(dev),
> @@ -553,14 +553,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	port->domain = devm_irq_domain_instantiate(dev, &d_info);
>  	if (IS_ERR(port->domain))
> -		return PTR_ERR(port->domain);
> +		return dev_err_probe(dev, PTR_ERR(port->domain),
> +				     "Failed to create irq domain\n");
>
>  	irq_domain_set_pm_device(port->domain, dev);
>
>  	/* gpio-mxc can be a generic irq chip */
>  	err = mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		return err;
> +		return dev_err_probe(dev, err, "Failed to init generic irq chip\n");
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
>
> --
> 2.51.0
>
>
