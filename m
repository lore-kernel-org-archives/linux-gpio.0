Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AE026296;
	Sun,  4 Oct 2026 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082866; cv=fail; b=gp4BnXVdVAd7AjIpzm3qqRJIDrlyquv447fd2v2tbx3/CDZDcEgqlsGxn93d62gad8h1WlBGzZ6syGbnXcMpepw8KJjFgs3hrpOxg59iLgG42G69PIigriFS56N4iT55s4siKTUqAbpC2PpiFUkYTOPegphPABY1HhcNUfHnyNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082866; c=relaxed/simple;
	bh=iEBCceweVaXcclJnA8jAHoYXznzYSXCjEaQ48f/62UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j5Rg/lbwAV9d97aquflBpfLMVvEOl5M23tXM7tX8GFz4jbFIR262KhoSduzXpSXn9djh8VzYe6/ExoiQTSWpi5FjmXkgyxf+G9+MxfeXVgD5efRPvSDWHtQLXiSt+qLfYMoHoFaCLtx2VijEPIAVMIx71QXj9alpRRIhPzhxqrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jzTKtBCg; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jzTKtBCg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrEoBaLVMi0Bx8DDmhNupO/Eg+TpkNEjl8Eu1tN8GXhfsVl6pFI/f9fC3niKYoO2ZG+JrWTsj8aXaMoCVYFWanybwuCxEoGYtR87j3KlgCFaD3xLrCZI3CaSvO02j/FNVqmaaQ1UHt4yyebf9/H+z0Wdbgg8Wt9T8burDPBL+Lx6B0vpx5IbXPfCiFI/1jyyijmlvzhto8rtlZsxWOptHjRtGG9PCUO/jPy9VHUASTMzvUJ/yZz6vc23PhFx/qJi03nrjrpykbaD2coJ/QQ8sG+vBGO/t5sWm9Np8UBRXzuh5oBL8dJGakI5rDUQMI0cv6OZl3Ynh0ol0Jlar+A9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiHZixXVix/AkBfG+gcteEQd5tg6upEzXa3Bh+o7KSc=;
 b=RWvaqCqPVFsLaiSaiUUNMbhZBNYALpYjJhsUG9JpaJFNXt79AviPsSCOA13q3LdSZIDSYJ+a2xaQobBjW1kwABbEsDrwksuDC4ylYDniAy58uYNBuNyYyDFYXRe6Mbj0YBJAJSdOupG62DvnZx5/h4vyHCUkm49lF9pDBDmXM4CvrOKKjW4WlCq0NqjnrdMPHiRnt8lCReyeRtYVK35/u1qoLWAVbDbm8gJO3mW7x2IUKbjcGpT0x80u6oJ0YgU0Gcsa9G8Uc4I92Cz0EYRusG1ig85TjCaFLeQ9hbkLF4SkllfjCV44XKZsVmrdpHSPFximSyUPdGa/3Q1ebQHymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiHZixXVix/AkBfG+gcteEQd5tg6upEzXa3Bh+o7KSc=;
 b=jzTKtBCg+uvOeoFp92NnIDJ94fm8g13JbXHpdfVY7mW8DeTlJVrvY3RgRtKTM11jbTq3YyeVfU5IJT3H6z3lqIApbJBwcWH2KQNdWDgq4pSGbZBzlIGJhiAzC1Y6fds2rwjlH6ZOq10Wl3bRCzmmb7+H7tjjtcNd/pbuvZXDOzjDUPafpuC5bBAiQ0T4RW1cra/aDB+VwRBDtP84vg5jNr/JKQQEf/IZ4wxDf18dGnRgEh4mdSCq5o1ehSnrSQIorEoySvVVzuT/cYHxFi8bbCDkZBDaXRfkIVXT6UwrB5yunCcNU61aFX2pkMuB7E02FZEwuVgQxM6kqZlG8p3lzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8800.eurprd04.prod.outlook.com (2603:10a6:102:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Sun, 4 Oct
 2026 03:01:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 03:01:00 +0000
Date: Sat, 3 Oct 2026 22:00:49 -0500
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
Subject: Re: [PATCH 5/9] gpio: mxc: use devres-managed PM runtime and
 dev_err_probe
Message-ID: <asHBYaF_vpgdZXAq@SMW015318>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
 <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
X-ClientProxiedBy: PH7P220CA0130.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa93b9c-2dbb-45c0-1926-08df21c3b7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|7416014|4143699003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JKkaOj5pB2JhALqVCCwSJ6bze/lio4Zwt/dgGQZSjTNHO77w3BN93jXG0DhlOou31J2XPtxVnZi0sA+AEkLIGqrWYgUFjFgs3AXaWDozhEE0xwW1dBb92r+T0rxGHZ+MO516m0SRBvAI2nTKOr7h9qoo3J4l/czs+2J68ugEjyNqoqIPVzpVUOH/VGsIxuAr4Zn39AVZVn7J03d6OwYgZ6UkG7RzxxuFtD84YRphEKkWQELG6qOwiHP1KG0agvSUmVI/woN1Sr+DJmdcuAP3nX0w6y77nAPVUUrXmkd+5rZcVVhTd3m6LApj3IMPLhyvq2hqWp6y4VY4p6vJWYZPloqMYCqotVTMtHsp4OXQAmQEMugLTtuANIjwHGLBZe1pn8Q0d29qy32c+ad+aHwgbsoFmOpdDpoTv+GHtF6fyjwCHfCi9AgNFMj0FNjooar/Y5Ol4h5ed0DQ5mpSWz1PPAAE87ML/ghIVatC2oQFKATv2BU0mzGjdv/cUDeBnZg97XF+4qTHNPzgGIQJRjN/Xm+vnpRf+gRFwXvCNQtwjGr2uZwJdkXDtYhc9ZU0pHlM1ryxVxzRAqoch3Rkr7zDJrRvgfwjpowe7y8PFRqW+p8RQ+Of+NSzisi92BwpLYiOj4Wm/SBN/cXtuB4iIduUzP5Q6zZLS9tYOJkUw1GvMRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(7416014)(4143699003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+VTsucIg+qUs/+NB9GYbhu0mrNs/MkqvIdTj033RxGdd1LAlHgsWfpNnmksO?=
 =?us-ascii?Q?pRcs24qnUqGAMDbNDt1rQbpf8Yr463m2hbnG/jXyDWAAEWRPGDBodtda99Cl?=
 =?us-ascii?Q?3y9lTk6QY3zPlSJ+BmCI1IfMcVAn3OTk71ihohgjePLCrqIFnjggtyqdcqU9?=
 =?us-ascii?Q?k/bJw1We1Ue7d5lNwGq24oZ6Z9WJPeiMPkDG2KpKgxmzRFZOpF/guFgcqmOB?=
 =?us-ascii?Q?P/7qQCYbzYQ8EyGGZMmb8PSQsmJmDFeuaTrYP9jnVeWj4CciHbBV0RCGNWkC?=
 =?us-ascii?Q?TSyFVhMsLicddtCputFTXpmFkq5Ll8RylLtPdqLnKX0VSX47p8H/NF4+zL1l?=
 =?us-ascii?Q?ayyuguu1qOgg4oc2rT5FH/6Ma5/qRu2Z5CRLZqyhhYOvCCAO+42yTKfKE1Kr?=
 =?us-ascii?Q?fkNbFJu9OavzCHDG9lQISDwrDYWk8QsJGYV6e1lQO9weB3U7W3f/i99KtKMd?=
 =?us-ascii?Q?igGAQujoO6DRv7CKR2X1nwh7Pv6cw9F2C4UJSPv7U0qgYhdh+zbGrSMzO+QB?=
 =?us-ascii?Q?F6PkhbzPKxcRhzeXJ+BGCSCcKSazF5PqlryVjxP8SWEY5WSH6kGzTMIZ897D?=
 =?us-ascii?Q?e2S7mWxwlGr+OHHE1hFAf+hdjcHJsV9tESFB7TtG3S80jkqQPnDSrGaQy4Fl?=
 =?us-ascii?Q?dvgNbJW/imLt30ni5g40OGrkPV/GFwpzjOrV7N2jBOvbvh2zMdIG8I7H9Cnb?=
 =?us-ascii?Q?8XzvcNNv5urP/UcEAF/tVuszzfZ/svf9i7A3kkATZ+q95qtnkgk0YGpi0HX9?=
 =?us-ascii?Q?Go59ouUuDPtxT3d5FTo72XQa/kYfUqPdPuR/f4B029X3yMZ6Ytt6dt0B6f5b?=
 =?us-ascii?Q?DkcEAU4fDDSCqLpzRd/bJtpi9h2W36JolMRwDRQY+sv8rmpVFCY84+Scg2mp?=
 =?us-ascii?Q?xt38yUEDRVuetI6scFeIwGsxAiYTNvCmz1KeRZAqsRWn4uMufLiwniL87EwF?=
 =?us-ascii?Q?NS2uKHii4fHu81tn8JViSe7NhkukJRd7iSzC78FDphThsuxf8AqTTx4YVS4f?=
 =?us-ascii?Q?sdrLsSLf/NaoGr2vR9v+syUd6ZA/5RWLmSi72zghWX+vNyiH/g3OQRFz04pM?=
 =?us-ascii?Q?66tZ12Qjj+4H9gdqFQlP7O7jpmAtxIkIiq1PpdIjJnL/Mvj3Ps2N4/sTicr7?=
 =?us-ascii?Q?62V6aLHzPAL2g138CYpvttPa40L4X05QrwSE74v8OcqE4RNLYRHqverFojBN?=
 =?us-ascii?Q?JmBxjBs8peJQTE30+/8DNLLPW8ivo/TWw6O+CiDavtM9m13JYs16KaxXuwkm?=
 =?us-ascii?Q?TvOi6lbomkvHkCMEMHIZDDLPsesx+XGZQEibZ+sRSx8DtluXx8ybND5IbGVb?=
 =?us-ascii?Q?jBqCJzh5tazVFBhmviFdoApxD4JCfDSThDNNCHiBN8Bcz5MGSMQCora7HL4k?=
 =?us-ascii?Q?JT3MeccZf03qG8Sf8DfbmjuVIjfOOe8ZaEittfufTo8EZh34UaBEcu3h22Td?=
 =?us-ascii?Q?BkaLhJH1o9bZWfnln66zkwIFWPAvW3SGoD/+y9AGoJ/evlajciaDBSF4BQF0?=
 =?us-ascii?Q?sW+7l4bpi6UFRWOFBpSs8R1MBSMZ7sXwrKvxlnup/cGPOxsLd2jJEJbt3Kbm?=
 =?us-ascii?Q?eej0irKnbg4m67daakLclVBVMCiHSa7FM7TMCdZN3mxpSjZl7gqFoF+v+1vO?=
 =?us-ascii?Q?mAdOkf++rfZ+FrnhUrGNEyLJ0uzLUdPrC9MQDyOvc6jGV6gfcAFXAawf/LFo?=
 =?us-ascii?Q?5zhzsYaAew/BTCD5prcx+7dmNwQ2vIyIGtvcvaVXp5gXImbEsg+RLLGyYZ1v?=
 =?us-ascii?Q?cjp5Z5tepT8W/ErOoC3wEykYzpQFSUtAPEaDs6QrIhFO2p75Clbu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa93b9c-2dbb-45c0-1926-08df21c3b7d6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 03:00:59.9672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBexOuFluPn05A2M5OQ+EQ0WyNHFb0PoRnsDOZ282kEZvJ1pqFDTwkkMvIp0CAUmY0nYf6sNT8GEIEZ4V6dQ08DZ2/gbxvykG1IHdw4jpHAK2iV3vMC/XAPDdqcP//3F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8800

On Sat, Oct 03, 2026 at 08:06:47PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Switch pm_runtime_get_noresume() and pm_runtime_enable() to their
> devm-managed variants so that pm_runtime_put_noidle() and
> pm_runtime_disable() are handled automatically by devres on both
> probe failure and device unbind.
>
> Remove the out_bgio goto label and replacing all error paths with
> direct returns using dev_err_probe(), which provides better
> diagnostic output and handles -EPROBE_DEFER.
>
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 3c395c82d7d4..73e19d2bf235 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -474,9 +474,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	if (of_device_is_compatible(np, "fsl,imx8qm-gpio"))
>  		port->is_imx8qm = true;
>
> -	pm_runtime_get_noresume(&pdev->dev);
> +	devm_pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	devm_pm_runtime_enable(&pdev->dev);

devm_pm_runtime_set_active_enabled() can include pm_runtime_set_active()
and need check return value here.

And why call pm_runtime_get_noresume() before enable()?

Frank

>
>  	/* disable the interrupt and clear the status */
>  	writel(0, port->base + GPIO_IMR);
> @@ -502,7 +502,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		goto out_bgio;
> +		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
>
>  	port->gen_gc.gc.request = mxc_gpio_request;
>  	port->gen_gc.gc.free = mxc_gpio_free;
> @@ -518,31 +518,27 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
>  	if (err)
> -		goto out_bgio;
> +		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
>
>  	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
> -	if (irq_base < 0) {
> -		err = irq_base;
> -		goto out_bgio;
> -	}
> +	if (irq_base < 0)
> +		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
>
>  	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
>  						&irq_domain_simple_ops, NULL);
> -	if (!port->domain) {
> -		err = -ENODEV;
> -		goto out_bgio;
> -	}
> +	if (!port->domain)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to create irq domain\n");
>
>  	err = devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_remove, port->domain);
>  	if (err)
> -		goto out_bgio;
> +		return dev_err_probe(&pdev->dev, err, "Failed to add irq_domain_remove\n");
>
>  	irq_domain_set_pm_device(port->domain, &pdev->dev);
>
>  	/* gpio-mxc can be a generic irq chip */
>  	err = mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		goto out_bgio;
> +		return dev_err_probe(&pdev->dev, err, "Failed mxc_gpio_init_gc\n");
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
> @@ -552,12 +548,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	pm_runtime_put_autosuspend(&pdev->dev);
>
>  	return 0;
> -
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
