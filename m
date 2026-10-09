Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCC516171;
	Fri,  9 Oct 2026 18:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570601; cv=fail; b=ODk0iSSqBal5WQT+A9xzHK17s77+S1u1WTQ6eeh8hv0NER2ilAqpzYr5UFSXPbtVFvUzARs1iY5lcsbIpSV/3wzVAMV1c1EWifgsmHd1U3j9pMKNBFBNCKzrTnz6N+FXHqIwFhu9nVw8xQKHw67aVM1iZo0djnBv+fw2n/B2nik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570601; c=relaxed/simple;
	bh=ZR98hAiYjj+yCEnN/9b4pOsbQzThb7U+rBUVhnU4klY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C7H0XTeTZzGo9OI+SAooiloMzGb+EII8Hx6mHZIhMzmZAt9A/dlBz/+RcoTdte3SaIqv5+Ksi8hSFRcnhL/XfGWDpmhfSOeP5SmaPMve143qB59m11abXqgIwl/zoGycQZ8kSuPDojSmehiYCwZkXxQIiCyQCOEMIKxjNAsNTfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BHUsA7G8; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BHUsA7G8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcbL8QCJB4c3WuFm0zFgXzXgkR6lmnL1Hu5bMTWSmsPRJUVVh2J7ArDftMkzmt5W5wYmAKb7unrmlfrZYEC6isTXZfyKpOfrJ6gCM9omeRCgvIJcwxL7jQwIRATt//GyXCR9GeVwG5mIglpBtJ++rmhNs4wV2+0jhmyxrWnSqHm2cKLvBzJBbwnqEZsqFXiCCmFJVlS86vHzps0tgi7AUfSj2hNwyrqO92DPZJQ3Dic5gn36BVPA6AMXhkNeUxL860ViEmlWJszwgNAGA0JqyLcAzP3+Cu0JVFo/TD5FQ2+3egM0s1HeGpgmf0xqmfpH4/wKo5XkFEdoDSjP0a7/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwkIiQsonz78SGFb5pHK3ZmOoIYLe266nqGVCOKoj1M=;
 b=mfXoWELQ5iYLZTtTPrQaWUV7vPjSgCbxxes9uGiTg3BaZX6pCdTRGl+4fS6+jcxoHqCe91j6vO1bH90+KodUwsgRSDun8TnW6bPNGKcOVwuvr8O1hBEwQjiQDQhzA7TFy+adB+p7gmwK8F8+DvPYW1E3BMCPdPjSmn3HG74/+9qCPna6+IGKZhpnZ5Qp9lQcL6mqP+0I/ki8X7/Yy9D611No3zXIOytZAOPLczUDis7mubcuU4F7zSNwpbQ+sra1upiENLVula/QT/dlzF5EDbDJvspc/bpyjlPx210AXr85A6ad9Q2yCNrZpTRgbipcNGb8upv4tPOnbi5O307oTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwkIiQsonz78SGFb5pHK3ZmOoIYLe266nqGVCOKoj1M=;
 b=BHUsA7G8iQJ9goKpmckw+GpuIObOTiyPhsTBMfta4TrLv4sXJA5MfPo+Igjc4XhSqyHTFvlIZTgLw2pyZEFLs+fPuBHaejbOM1/c+AvPqO5VX6B2RqUucuYiv4EhJ1kKu/hltOYUgQ8vjfVN9VS4MOurzIBFDe7qClu8lnmLnNWdyNBH+x0WTQHNlnkSkreQoZsYEsclxx2IXXG85WxokpNAHya+dLziX1a4AlZiiNQbscmONpC40SLXCGVfdUSw6uyQ7z+5QgV0+2ifhqyWVG9J/Pjy5E/3VrL+T95zmOhng6DJPOIsmXK0ztRK4FOOhCTTHXfJgX5dq8CD8wXxhA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7675.eurprd04.prod.outlook.com (2603:10a6:10:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 18:29:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:29:49 +0000
Date: Fri, 9 Oct 2026 13:29:45 -0500
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
Subject: Re: [PATCH v5 01/13] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Message-ID: <askymZYMHqVRh-HA@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-1-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-1-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: afcb8981-f6a7-4570-10a3-08df26334d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|7416014|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	GFkrzSBXMqQefen4SKq0ZTguWzJG1xzTAt0GmzRgzYxL4kHIH9Afxtw73BBKU80ThWvMDNZyMCorLCFRZoVuQM8YzBUqNE2ck1aaMJIx791wpWpMahonMOrkLGd8q+4mll9LF5Z36yRF7LusE4uILFXqvnYj8NTxaNZfabcD6QQ1MW7K7LqWNzDEJzAqSeEcY00gPvESlGG6W7P0suVLQo8DpO43k1mjPtbQ6+HCRopCUWTCGHN3ZEOAmq1+Y0MJdiz3bRFMW2WvWzIp5LbtFdXhjiPzrOYVLssKeiIr2VLbi/g8jWiEGtsglcsA29zC1BVZyz7oFFeFgw+WYC0Vv31WCTSV5SmI+dOpRi+AAhlqq1MsYX6BLqIq9lKKB3NUHBWp3gpUCD6QMnxpWFEgEenfd0TRgmyRdphXPm3tJfH3tXNg2QjJv52zuj+0QKMzh21dwRKOtXqHB6Qd8Pf+nbLOVc1T1xpIhpESxyvQQR9paYkFFBTuhKeiXVrxRZCb1BndNP/sUGwtbjmtt8x2CD9Vq3w5L1mHIzwygo1mf5fYBLRqI+H18pSv1AjR0wpxvAqv+fkhIvmKUR/Lj6k3na9uqS3Yek7zxnPwk5Ji5+OusT9G7KQQLsbgVHUZlJhveMRPRGDyfr1tBfr6IHng6j2oefqV3CThPFryxLW74DU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gpnt7hw/jikzrQNwv3lwjbfbFtIGHNysgIF7dCSRk9uWHYs7+CrJGiv2nAaW?=
 =?us-ascii?Q?MwAYSBlAyyNRJ5mB9BLU4ojpbFCr5M+zVJFLe8t1D0wn0X5eQGU7WtC9kU38?=
 =?us-ascii?Q?Se51A3q2alKy0NagzAN+sKfLDdq6LVtdSpjqGHfaMtUuHOZG8vkCH33VILG9?=
 =?us-ascii?Q?6VAeOpUwAnKOAVhvj5ezS1YlhjzI0bZA/BuX9xI0qNM+GXmsjw7c8w3nJJTw?=
 =?us-ascii?Q?069EpHntsHJMd2mrSWE/3+ZaBt62UenIUb4DXyTE+Ntei50rlB4ddMnZ7hzi?=
 =?us-ascii?Q?t4AUpVGy7c1Ot2mDH3CVGNKa/69ssryzqnr8qfzT8bDRTWrERya4KdpVv46T?=
 =?us-ascii?Q?5w+Ws6jvxSq2AfpSePTa1tlF6WDPUy5iCG/MWU+p5HgVUllgySwwJ7sMQOZ3?=
 =?us-ascii?Q?QBLy3EgHNEeA3UAbX6v/4PsSSiusukE7KfHDvMx3SY6nHfVL6SY05bo1rPiF?=
 =?us-ascii?Q?6cYJpjkAiy6l7XfQlfNrb4+6D+cT2RSrYRDhPwk7ie0a+XXWCXWK+JR5fl+i?=
 =?us-ascii?Q?x7UnnvOVv8Yk5rFpDgkoWAFpI6HIxbpDg5+4894CDgfsiSA+7RtatSeiiUA0?=
 =?us-ascii?Q?++lv0sFeWWMTh8Kp7z6yLp+EMmybcPB805FD/2jbBqk+Dpq6ITiCVjHZwP9d?=
 =?us-ascii?Q?Bg6hy94Luh47f9KRVr52bhk7XlCWvs8Ty92nF9708jYnAXVS1xA81RCceIhs?=
 =?us-ascii?Q?VJaSkhRYmKE4kj+4rCjv2doPSM/Hp0F/rJlZc+gxs7pYySrsYZnOgjCz2NFZ?=
 =?us-ascii?Q?5iM5Tr+cJZKWb4x9ZcQmPbNc7keP+GMex4SA/hlZMpdjDNEVshoLCya4bYdZ?=
 =?us-ascii?Q?alhUcoSExnisz6w9BzSm5+Ngi3i3vzESKEwl0+9b1rby2M9EuArYdF4KDxU9?=
 =?us-ascii?Q?J+JkC73sy0C3nhGelJbouqVuLgKPqWVpfebaG7HD9E0ExCMnoOsig4T+Etr1?=
 =?us-ascii?Q?vFe05K5KZB3H4Uf90TKyMowAgkS4MHotLCy5ZbSaYEhhjKcMNag5yZmKQEbm?=
 =?us-ascii?Q?DIuG+cXSFVsScJJKjbqBqo4RI5jxpy+ayCPrFe3WsdkYneSq548fCDX/p2gW?=
 =?us-ascii?Q?0xVZBVv1C0m3yEQLg4i69kj7yHrqcbwyHxmVt1hSyBb5QjKvtVBLZD49vhPW?=
 =?us-ascii?Q?pG8p6RIgNVZ8Q/WrAURPRYKdlCkeNZXv1eATlkuyeaJIsu2dMl0xDizv7KSi?=
 =?us-ascii?Q?lJD6gkK8JlokLFigXF1WM5wgfelW6lnVB3uBkwcQQU1Xnp5egtiGuW2rVTSM?=
 =?us-ascii?Q?LaAWdueGzbzdCGRXErdN3q26aP+M3ztQks4eFyLyO41rPXIcWVa9t3ijCR7P?=
 =?us-ascii?Q?Pu26+3OHe5UUM/s/Ox8HiztZsA8tsmJmRGwXZqI5RkfARTFdtWwmbe6/+qQE?=
 =?us-ascii?Q?BVgfoWY2urNQiuYmpE5jVpUbYlZjnvAclXpM1AUh3th9ruFk5BqmFae/VtbR?=
 =?us-ascii?Q?BtZcwQ0VisBMJZwjx0DldH+RvqTvao8I5dmG7y4A2eW9hO4W/sL27h/zM4BM?=
 =?us-ascii?Q?cIlxN5s3J8udcIgLDDuAO4WWqFdL39URw1p5EiQdwvOS/Xdpo+9C9thcKauZ?=
 =?us-ascii?Q?e8CyhkgscAowEUDQb3buZGGrgPbGqUCSclisLe5Voj8f7GIuNuCI+1Kjb/2s?=
 =?us-ascii?Q?SlwhrXhlaSK0jviBy8WqfyZ869nJoy5jPIO1jYILaqw3mKcxUQ4MFx13mACr?=
 =?us-ascii?Q?Pw0QfA9+8zb7ssHI0d6+QUZaJmvUSPE/84pVbzHO5NTTOTIl27v1CyLfCAiC?=
 =?us-ascii?Q?CIBD3pUsHUgKBtZOmo4hf9dA6ZkFGTojd/uYCLWuUnuEiAvV7J4X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afcb8981-f6a7-4570-10a3-08df26334d8a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:29:49.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usNnBWeh7/MaLy48lC1zUR8iweqJA4XbTyGhfvIEf9yz6cCsqbaPy3zCEFWfhkHxQy6E0PMejemby9F2kgZpio6pqK0Dh78BvR6/B/G3wz8Wq4SBM1JNzn5kmaDBP3pz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7675

On Sat, Oct 10, 2026 at 02:05:22AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> mxc_update_irq_chained_handler() is called before the IRQ domain, the
> generic IRQ chip, and the port list entry are set up. If an interrupt
> arrives in that window:
>
>  - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
>    port->domain still NULL.
>  - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
>    been added to the list yet.
>
> Additionally, if any of the subsequent probe steps
> (gpio_generic_chip_init(), devm_gpiochip_add_data(),
> irq_domain_create_legacy(), or mxc_gpio_init_gc()) fail, the error
> paths never unregister the chained handler, leaving a dangling handler
> that points at freed memory.
>
> Move the handler installation after all its dependencies are ready and
> after list_add_tail(), so the handler is never live while the data
> structures it touches are incomplete, and is never installed if probe
> fails.
>
> Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/gpio/gpio-mxc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 7e2690d92df6..e05f276a50e8 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -474,8 +474,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	} else
>  		port->mx_irq_handler = mx3_gpio_irq_handler;
>
> -	mxc_update_irq_chained_handler(port, true);
> -
>  	config.dev = &pdev->dev;
>  	config.sz = 4;
>  	config.dat = port->base + GPIO_PSR;
> @@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
> +	mxc_update_irq_chained_handler(port, true);
> +
>  	platform_set_drvdata(pdev, port);
>  	pm_runtime_put_autosuspend(&pdev->dev);
>
>
> --
> 2.51.0
>
>
