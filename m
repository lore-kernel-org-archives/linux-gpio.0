Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793110419;
	b=gkDfUJ6kKVjJWxttCnjumf3FhTPcgQ+5f6AynDoUM0qbNCyta9WmJM7vhESfZYBO/msw
	 Sdcr4r0tBEDv8e8xP64c51A4SseK9/Gb1mcl0/5UchX1QsHvWiYDP61Fet4V1foJ+B4Fm
	 DLVylMVZ7bQnE5WYDRctc4xKJxIk+rIok4AADBt2QG+l9Yt39feaAg47EAMH504zyP75L
	 8zA0/19TmaklOrkqlpjc8/qkIun9Jcl1MliSrccnZgAhMhSfXNVmRTJF82PoCQwbiiBYn
	 gxoKjGxSLopf0mjJd2RCRX5e9kEgexVxgd18Xz3/NDMUjU0Id3evm3n267lK43+l28g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110419;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6CkiKUm56EHL76juuvv0qJINAHBzD0rS5c09spWFsao=;
	b=ARcxKqCkaDdlDJ601ibTOprJqNtTHjtY1LwLB0cojLg99m07aZayHhUrhTrShwXpPuDz
	 tu1J5zaXP+S4AT2zJvWRMP1S0cunzOopP1ukDYZub+VLj7f9maTNeW9ESBHeY/TgYwDKh
	 zfYbeDwgD0uKxBIf2OZPOpFr8A+Hvdx0Gs8JgCw0Aig7CGHJINMQH79YJboyhL89ekdIb
	 0MfiB8vZdKj91fDMTXDC9FJlSBKpzrRx5vx/u3JYQxgAjWUZU4bX4yCBOrrDRJd7bK8mN
	 2rtgAz3Zn8psLm081bgyP5cLIl0TR5IsLmrkY34behsQOnPpUPwqe882MlR5mlU5Ppg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="eBpd967/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.1
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC6606A31B;
	Tue, 27 Oct 2026 14:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03CC6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eBpd967/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc7YmN8d+2eAdTfQq7W4Ca1OsJP+0DmNFCZtC6vd/2F2I0OkrnKDnqLV/8aq2sxV21WBo9XfJn1cSCQswoHjrZlJFberKnaJ5y0P2b7VmomdCWJxsYj7AHNYl70fhGoNy+fQwQv0sWdNLFZbwHF3myTGV9vJCcNgtSrc+m6PmglIkJ6vA1OoRkgdY92oOAslrKiP8DNspMgK7H7RaC+miIrRyWm/PeK8OHRNEeQ06namB4FJ6ERBoMN9J/WdHxc7W4yQqhVC4q8xSSDigwhcBCBy9wyaasHyuxAi3myBF5HE/MqaM+zHNgdq6jGQ5sd1TXhjlLWMSP09i8SDK2LGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CkiKUm56EHL76juuvv0qJINAHBzD0rS5c09spWFsao=;
 b=WlhusXN7x1OFYn8x47XIBLrRHzfRWDNAp7uMprQemJjKlSfAVGFlB603nBfJm+MG0GF3NGA0eYrnZSS3UxLpEEOG5vFfyxwnA56NjOX6g8I8BDi9WwX+Nk+DA4rFlJb5ZmuXljgmEaGPX5rt7JEzLDaAyid8biT6b/vBafYddtES6VlWz27Sipr81v7yJeRQcL3rHxIjK231WmwD+PsSspZq/bq9lcFME10MTsQEQiO1TIx/kAY+zhOW7O6E3hsDx3diAPykoVMIqOHLODSKi8VnN/cv5M7bPwBftUq798Cof8UvYg7rqG6LHitrSZ3/ZdvVihoqtpIWpjShOUr4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CkiKUm56EHL76juuvv0qJINAHBzD0rS5c09spWFsao=;
 b=eBpd967/dTbrcnH/AGMAgmespFaQmcDwOhDmVbkzDuWnGDJGk9/zTaQvpILcevdgjHmxBmLxlK3McvqAIBnJCnFMmCsusRkw7lOwB+fkr4RGcu73J68ijEQ9+0N2Rd50Q8593hotIvLokWkuN9nlDZCJLiJwYfiuSYJ5kopbGQ3VGK50vtvbWJhuIQyYoknb/rkphh+5n3NOb4P9eQJZetksvmibvy2ivTfk7lbGonCj/IvgI38kASQGbH3MRBX+LDj+mhgF/y6q1ObhEiiLvWddSao3b4re6T6sMvOS2/8iMxgITp4VKIzPDWaxGhz2c0xEckijBF6YRA/Q4EAZMw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:13:35 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:13:35 +0000
Date: Tue, 27 Oct 2026 09:13:27 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 09/12] gpio: mxc: add dev_err_probe() for error paths
 to help diagnostics
Message-ID: <auCxh1jBCI7JLEPf@SMW015318>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-9-7b602d70c149@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-9-7b602d70c149@nxp.com>
X-ClientProxiedBy: PH8PR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: aaff93b0-ab0a-4565-10e3-08df34347d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|261026140227099003|22082099003|18002099003|261026121527099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Qn4re7xuKMfNoh46hhGel5Qb91iNKyp5jYhA7X+WsB6UfMs4WLKI7xcrOxkcdMuFx5509Dz9q2dwjjgHQkx0PtEwhnbfPHizeM1f+ojrvT015xreBSN0pHxOICMozG7VzIfHx5KJaNGCbOGcSVt7KP1AcWp7qmdIOGa51cPwP7j5PHIGVVGu6PxLZHD4kfADyY67x5GEI8w0D5/XshTRc8J9bxrZUtniaCg8pwYM3ubQvnk4iHTYaF/0AHHfWDXcpRxDUPtg25iRsgXhFKyjMDlZw7WqXRx66AaAhR7+nWNFntTrySCdtTZCbuOUbm4PYziE5zSJY+BifncgXXBxEInUmew1BmUY+R3hZNVLhB56Y+2SP4dtTHnKoJECS+AN1n4LQ5mgWF1mULMUKQwBVeTQuVXi1ICrLtcOVxCzqOcbzf1mAWjMebLRC7RXBuj/GOfxNJcmresUiClp4Vwf1av37e35FpjIT7M+a8gRGEGF6X3piPfaIBZB2Rob5EAywKKQGateRa1D/N3ZNLkub6A7AG9ZHtRlAgTcZngtYL77lPOpvILf0Hc24Gkk9eHXbAWcn7/ZpxXfQh+BVYIDWjFylybBFUjb+6Gt2NCoK8b/xZQ5aeFAiWMOiW4Suey3JFUZbKCfNjYuBwZB4+Y82lj8dES4TLCiNWyE9EAsung=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(22082099003)(18002099003)(261026121527099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n9AP4R6SNQ1I7xWKZWvTOA4ojsL8yjgwYbZkXsXtcXfbZxEwVlhCIwIS2Oru?=
 =?us-ascii?Q?qLzwq19X+/nqpf8fI3oVvEJZL6fi75YOEjSCAChu64tc6eMKsCAMiITVsCoy?=
 =?us-ascii?Q?iABceAhigS7OvmhbxWBskIkhIDdpNxSAZsoLmevAUA+EMc/2Qf92iosbzZrV?=
 =?us-ascii?Q?z4GSRmaqU1AvXsah9QoEusDEXc83yh20+NzJTdi5rz0wmmptbLcojC88+O+1?=
 =?us-ascii?Q?pURYxn+0cvGJDk+DcyeyMjC2dOLzZytRYCTTWDI7I8clDPxcauugtWmd9Wtf?=
 =?us-ascii?Q?rv6WO4jabVs1Fj8Q7eDJt/YrcvWGpSklCBQSvPEY4CiHvlZhm+mvhKQ9mX7f?=
 =?us-ascii?Q?LGirxh4xJqNRdxlGXByl/5RCjqviV6Uk6WnA0vnKT9HGaWcCCgt6nZHgqAkB?=
 =?us-ascii?Q?R106U8tvj61oEcbU467gbO0dvP9yLf3NnV5hY2nWX2ODOdpChT+2E15wtVM5?=
 =?us-ascii?Q?JdxDU68PuBTM2ORvK4SKVNAO04f2RkGVW4czm62uzsVQERrU67OgkbypBpZH?=
 =?us-ascii?Q?Qr7XoJ4x0tQUUo3BmLC/j7m6U0Eiv1YMPtoIT5wNVPU7znaI8g2RwgU3yILr?=
 =?us-ascii?Q?47yWbq0m0jWstHQBb77dECLvdEeEttFtU5JLeJSMzSkxdIPs9sCWYuHbO1Ek?=
 =?us-ascii?Q?FLvwq+Fj2gsJrLYYAWCZTtFBius1mupCDyKHKopSnkDeN/pwdkCPpLsVk6bm?=
 =?us-ascii?Q?gs3zXyqJDWM6nfHzCKIvbSgxyR821gOizVEe1Gse3fqYeAO3Ydfbo106Uuog?=
 =?us-ascii?Q?ozBR42krkPu8pdv99shbavObyqoc6ivs5YR5XAG6VBLoQFQfCgnPp9DQPX08?=
 =?us-ascii?Q?BFOu7EwQ/H0XV/bLbI4i6WAeko/jYSilpn5wiTkL/+B6UaYokUVSBUBsLPux?=
 =?us-ascii?Q?azQrfJSd9aY8jwjvcp5SsbAPAsqDLRUblL0cyhxRz4H0CaGz8TopPOMg8SVy?=
 =?us-ascii?Q?HtSncR0z/3rVlpmyUAkrAcLMacF96rEBK1ZVW08FcH1Dkr1HAaVToBb87SxO?=
 =?us-ascii?Q?rCcAb1P8QiMqrUh8yQFzfD0QG6PEiu+ph6zhO2bWbIYsSPz2EyHW7cURjhyb?=
 =?us-ascii?Q?o9RwkkoxOSI+EsPiPD/6HQKwOE1CTbdEAD5hEAvjS3JSsHYJzL/a/gdM7EbK?=
 =?us-ascii?Q?IwczFye2cOGBrL0Ow+5JSsun3ZguNyuflTqC8cI4T2GptCFz2tulh1JWX65o?=
 =?us-ascii?Q?tUz07RfWZC24rAZibxOxQYYMyqiLy4b7+ANRI9+T8MRs9uAJqr0ogh8gVcsw?=
 =?us-ascii?Q?Mm9weZpoqX7iBZVm6naSOh6fdM8TmaoJjtxw0xeOQduDMowxBU8feWFjFvk6?=
 =?us-ascii?Q?g/gnuk0Y3bYtXvcW8dOUqTGlHNtbEYK6BaVCu+ih+DWcnBAPtpnkFdWYjDpk?=
 =?us-ascii?Q?GW9lHeBsOLGtf0Si9rjGVHEK+zHziox8kYlqO8pDEVDftoxX4b0LUKvCYcZo?=
 =?us-ascii?Q?gA/RLKldFmv2klFXSjNjp2ampIf80TJJxNJbMdTHXPSNwezYyMEiwqGfRKpP?=
 =?us-ascii?Q?Z8n8CSdHF2ZDtglTxzpbI/mxcpJWtvmTVHZXv5ote5zvJ32bohepryFrt2id?=
 =?us-ascii?Q?OiET367ndb1XMukR5fd2jUJwgOSiffPmgbV4sW4/fKbD93+c7Lqk24rQsUvt?=
 =?us-ascii?Q?4CSqx/PGj/9EeD/3G1EcTvenUj0wPq0G5MOkaRx2lADcP6wmWLQGKWK1ARwM?=
 =?us-ascii?Q?U9KauirSYPcpX5Yf0rvwaehvxWMVIsF6+q0TrXjbmLs5wG2IS7iu5f8u0kjD?=
 =?us-ascii?Q?zl65FzELQHnveMHo7AFm4Kp2gbS5873jAmljKlO294tVdNLNhrW0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaff93b0-ab0a-4565-10e3-08df34347d50
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:13:35.7192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRQkEYXeicUBW1Rz2hN/RGY0KRKDr6NPM43paRqGUVsY7XLp8wGnXeBDJSv+zIQUVunk7n+C8nWrxpgDjpMseqVejnt48vWSfn9qLkXZNGZdkJiUkeMt7pnft7pn4f7V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

On Tue, Oct 27, 2026 at 08:09:36PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use dev_err_probe() on probe error paths that do not already report the
> failure, so that deferred probe reasons are recorded consistently.  Leave
> the devm_platform_ioremap_resource() and platform_get_irq() paths alone;
> those already log their errors.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index eeb7d36e6b44..f816822e36ad 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -484,7 +484,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	irq_count = platform_irq_count(pdev);
>  	if (irq_count < 0)
> -		return irq_count;
> +		return dev_err_probe(dev, irq_count, "Failed to count irq\n");
>
>  	if (irq_count > 1) {
>  		port->irq_high = platform_get_irq(pdev, 1);
> @@ -499,7 +499,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	/* the controller clock is optional */
>  	port->clk = devm_clk_get_optional_enabled(dev, NULL);
>  	if (IS_ERR(port->clk))
> -		return PTR_ERR(port->clk);
> +		return dev_err_probe(dev, PTR_ERR(port->clk), "Failed to get clk\n");
>
>  	pm_runtime_get_noresume(dev);
>
> @@ -532,7 +532,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		return err;
> +		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
>
>  	port->gen_gc.gc.request = mxc_gpio_request;
>  	port->gen_gc.gc.free = mxc_gpio_free;
> @@ -548,7 +548,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
>  	if (irq_base < 0)
> -		return irq_base;
> +		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
>
>  	d_info = (struct irq_domain_info) {
>  		.fwnode		= dev_fwnode(dev),
> @@ -561,14 +561,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
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
>  	/*
>  	 * Register the GPIO chip last: devm_gpiochip_add_data() makes the
> @@ -577,7 +578,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	 */
>  	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>  	if (err)
> -		return err;
> +		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
>
> --
> 2.51.0
>
>
