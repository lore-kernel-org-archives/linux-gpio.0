Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7C79460;
	Sun,  4 Oct 2026 03:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791084747; cv=fail; b=qNXSI8OjdIdqTK/FyMHUTbmt9ADeHAUCLSJY3eEdVsA83AT87OZ6wc3lBHTIfVZ+XDB3Y/WAnKuz753T+JampPejWfaYQCcu1CGP9cNArwfffX09vMSUQBkL4wmVceuvYcUv0S/NWygp24m/Snmn5qhKzVwTk3mNuN0y1OBliL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791084747; c=relaxed/simple;
	bh=3tgNgisvvK17yZ9+rq0sbD+St/4tBcBToLXJaAoSgW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b1YB/hRp9sdiCZ+/kEn9GwKgqLgq0oRL2k4jlVsKewHPqFxbKx7wcRHx++fzx1XBW2UEAOhFcIMNYXK5cx9SN6e6A3eIR2lAkd4VpK9bGZzmWb3jDM/fxQy7m6qmTIgfeasGxNUtqwQXlMshtu5NKMUu0Zn6Vw3P2bJ3FHP9zPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J2p2UNl0; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J2p2UNl0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uikHv4uySpw85vQjNhk3Qvu7rbA2g3W2wbOxYK0XHApwHvtFbWy5eIYcPwjVUcuQnBb6ufMW2T5VxZEUiLHy1usiHiB+PQdTm2263SnXkmgbYha2pU+FxkqY5C2CUshMiuK6YVxvPELXGzCYjx8ZZECZDaoeWGfnQ0pPn0Vt+5GMrImDDVv1hnqADzMyqSVI4YXt0xysBBNUZfIJR0DmYcJDgEwttp3nB69Kl62ZrUggZAbIqfSrf71wbTaztgOFG63QdVNGVLAb+Z0kQvAPYllrDK5KxMhSZGZD9XoNbCXyCnpPT1KZ35b8YFWKwbYeJH5hoOgQfMbgfdt1WxkOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYefuSGGOBnP8xlOTHW4fWt+FJ3sSjzYVuUrlORqppc=;
 b=oyYV0ewiTm1ivQMjyfq293KQFNA94AoiMl2z6LeI6Cz4yx222ngrvDTNItuGBeyhDLlAe8aDa9yVdGdBADWGg7C+wE1hjIqgsovy6JiQO/KmXr1lkyUFfJHGYOV7Zm5m06bRal87V61XwfygMCZmrQHNwgmPkf/giGOTqxp53YcyM7D/teOovLzL4pomAWXpyC1B8cWYdpFiOUFKbWjX5Z9D+OlUEXpL2+qoh/x4kjymw9Mzj0eAxOg10kJaXdr68cqfYT2Fwb3uQhFYUMmqwMJDrCK+imYzswcN4H1x0Pm58XKCDTmBWd7GRqbODCbYUiTUr0t9BMnRhFNKkjI+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYefuSGGOBnP8xlOTHW4fWt+FJ3sSjzYVuUrlORqppc=;
 b=J2p2UNl0+t3gljsmV+iBPKVxvPN8f2DM/CW/6fG9JZOPsjdeF7jI3ehKx4QGznfJJeW2yNVis777tpk/Hr8Gxz3lNQzanHlnu9AKipx4AgrUze0CxM1yN83MCxpKD4nAxv2Ke198yY/N8KuwFSYYtMLhSDn0NVfgt8PNDyxZaPac30ofTuSqSmrELtb+YrhaQzIjHBPz1d3FDxIZAuvhV6LfWolh9rQ5G5qwZBtdKeXhX629pUdq25O0AVAh4LSNNsZaHZ0PTgMWNUJrafVzPa+jesESNsGFhkBi+jmQ54rpp641oGS9uLG4b/bO7l28t9nxhiGCIeuKUXxohxBSjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB494131.eurprd04.prod.outlook.com (2603:10a6:2c8:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 03:32:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 03:32:22 +0000
Date: Sat, 3 Oct 2026 22:32:13 -0500
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
Subject: Re: [PATCH 4/9] gpio: mxc: use devm action for irq_domain cleanup
Message-ID: <asHIvTgjU-UkR-0D@SMW015318>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
 <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
X-ClientProxiedBy: PH7P220CA0175.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB494131:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ecc341-516f-4bbf-123e-08df21c819c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|7416014|18002099003|22082099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	XKncUy5wWCiSn9qlXZlREnygBOUlvNhF8ewSQhZ44JMY6c8XHOaluSWNimKywCy+aZmZ7jD8Mn/NwcYd3di1FGsJc1cG652x6jNuVNua6zL0801Bt/vyi7zYy7iPogkr1UpelEXD/CyQ7tjKLkl4/pVs/bns97UX3C2Ak0ZLxOraV2S/VFzZhNfHGw0yp8p/Nr+bnjrKEAez0fUWpL14v+hbYMktrd63qZBmg5f9dvR6D+b0n0aYIk0UsSV7e1FlbuRHWnHGi7g1u+XSqfDReQrZIGILO41mxCcmLsz8vRcxC02CKonjE07U6ofxiLaJQl7sFwKplXSytddYFXN5Oc06S9upIPSuVI0Pfep4eaQRtH1WjoPX3Oeb/zghwizGem+DGq4Yn/cmgu48NZ0UUZbitkXYZLiQGQdRNYMeL0BZWNoQYht+md6hKvu0a4GDoN0mc+ucTgZojn9q0BWPFgIW9d7jKVe8gBTnwUqSzDsgEBbAGOJPKWfdg1bxLgPNiks0YFEp0/JUbyIwJAxLCpVTiV6haL/PEFENOldgyBzr5OsDf2mEET8QAPdnNi2mD3MW/gNjpgK6bwiBL8EV2RRgnoEvmhybVXomN3psGbeZGbHmJGghT8+fGN07eoMdXZ5UuLLNxYFqjaCgFso3erZZeOXXNaFOJEZbMn4rrSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(7416014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3qFB2luCIs7wOodArt5PlPxD5aoJ2jxNa6dO3oS9nCf8mHYLYkPJ2kMiFvaW?=
 =?us-ascii?Q?Wf73GpJJnmbIMz3kiaKhom0dJzW4uGojqJeoNrgPeHyNLPjveRvRIRqe1O6u?=
 =?us-ascii?Q?V5aT4dlpCmRTT4IAse949+Nrez27AJERIOuttfDtqjaCBMPlABFoqzEpIU4f?=
 =?us-ascii?Q?8Lq+8+50zjb86pR5vh63Sflaw83kLSuI39hEy8NUS99EkxWNrR47KPnNB8Q2?=
 =?us-ascii?Q?MprKsDHwCBQKeSxmJMukGzUOtfwhCcDGIkSdCxovAUQHJ+jaOw5//8vIXJoA?=
 =?us-ascii?Q?r/uxwAOvveDF3B9/cbic2LBPPSnGdv6/H9u4sPDRLqXobazvxHoa0a1PMke6?=
 =?us-ascii?Q?0FTIDCz2v8JuGYgcChNUgDSzS2E8VXt800vQYKdJKstuSuCooXHg3Ds0Nag3?=
 =?us-ascii?Q?7tREHdhtEzvwpSARRBr/ZgAYF15YJnKADqBdJ+eL/WeCM+aZGMOvBl35CFND?=
 =?us-ascii?Q?lmbYNSB0SzGMPYgXwWgTGvkF8DH5bjBxeL0v0qhV4lUGxHv4sD9PsmrNtO/n?=
 =?us-ascii?Q?/p2HTWnwthumCPhgbbym3ZwArkLzjyNh486953cHiJPIfl51TOq2Ut/OId9j?=
 =?us-ascii?Q?tEI76uCCqEgV/8+4y9rGeSSvfgFUttUsgHuuPsp9Mp4Ohun+2Mf9qx2jGXlU?=
 =?us-ascii?Q?yJTcEs1KHklv187eDsm2ioJLb3tU7V458yYnW+FpEmkqHExeOnAxyImVQoXO?=
 =?us-ascii?Q?L8YmMe5glkgwo6P864Vv2Yv55AXUTTCIjmIKB+a55Lo8JfZnjuHKxXq0Z+kH?=
 =?us-ascii?Q?CdkmI4n8LUv/nns+ZY5E1Qgytcua9J8HzTdzz8ygpJEg70ctmlLneELTryGK?=
 =?us-ascii?Q?Xo0oe3H73P1S/DnR+bvMgatjiV0Z+f7H08RTSqSTcpJ6nZbCRQJ/JAcTvApC?=
 =?us-ascii?Q?OC+Hy/5CKr/F1Cjcf/lHm56x1fjX3WF4T4z4XmfkKXpQDHJHHxfpQvJF65dO?=
 =?us-ascii?Q?RMHQRhtuHX7ZtB51LPtnxfsnn9vCxzg7k850mgPsZNsVtLUo9bXkMbArahCY?=
 =?us-ascii?Q?d+g9e4QWVn7hV1hQYrVrLawwYV52sFM4NZcf/dq4mN8iXDIOzStwYNqQfraq?=
 =?us-ascii?Q?pPxT0QueEuAY6jAJI5Ur11LaCb50GghPv+3IHMol774D/KxQ6NLoVXjLCnsq?=
 =?us-ascii?Q?PAS9Dxurk7B54xsKdHK06k7mz3+uVG30eES5ioEOckJmCSGPrvn3FOlNRyAl?=
 =?us-ascii?Q?j5xvT652Tla1Db+dLeO1mMfJIkxy7paCSZg4umut4A2O2ZtU9HSLOzGqdNN8?=
 =?us-ascii?Q?fGx5xpE2ZQS0QiDJd8FVBbiI5hk4pKkOD7fC7rh+MYyjooQNy8+tsIZBLIR+?=
 =?us-ascii?Q?YnCUpvPZS52O5UVvC8GxTK6KSPTsvoZbhgoNh+0PJLmMuSUXIvZCllkiMd9N?=
 =?us-ascii?Q?VGiXNRS9hFDUwy2LjcBaYniaeNbpVG9AW1/XTX8E6OhJy8KRN5RYWabKmYKr?=
 =?us-ascii?Q?hvFGPJDUKF3QaT9ECD8QvYqWZ76wfjhYc1khOqoDOZxnk3Id/PQtVEGhCkj7?=
 =?us-ascii?Q?Xo2YbyLog6t809adOamGMzmOQSEDuBPr9IXNq0mRj8SZirSFM/wTSY65612Z?=
 =?us-ascii?Q?lHtO9wAutlfw+P3wO92wMW68wwf84PrujEJ9oUmNZpEP0S4AwM3Z+YTfWFU4?=
 =?us-ascii?Q?qEsGyAnAqtP9CJXj+Ju0WqmjAtbu6pALABOksD30tznB9TCmzXgOeBMt8+b6?=
 =?us-ascii?Q?zAu5Plm00pfF7rEGTbDk64yHRc6zSo+5eZM1Oi99bRMCEq2J9bhdGEpnSp9C?=
 =?us-ascii?Q?PNeQ7UOFPQAPTmjy+hXZIoNuCA7LXXvnQ1rBcz0N4BZ5Wd/ZRsTG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ecc341-516f-4bbf-123e-08df21c819c9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 03:32:22.4088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nraBWuS2dEENqb6wvnNYhXy6gz9RK9uoTGYGQQYMy3gRNONVVDy8CoxeVCOc2tkwPwAWGKh28GOi+a9EHpv3peKhoit5GlOMnOCv0Hd6dE9mn3vJnmXdG7FMQccsOSnb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB494131

On Sat, Oct 03, 2026 at 08:06:46PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual irq_domain_remove() error path with
> devm_add_action_or_reset(), so the IRQ domain is cleaned up
> automatically on both probe failure to eliminate the
> out_irqdomain_remove goto label.
>
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 1c27232f6a80..3c395c82d7d4 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -417,6 +417,13 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
>  	}
>  }
>
> +static void mxc_gpio_irq_domain_remove(void *data)
> +{
> +	struct irq_domain *domain = data;
> +
> +	irq_domain_remove(domain);
> +}
> +
>  static int mxc_gpio_probe(struct platform_device *pdev)
>  {
>  	struct gpio_generic_chip_config config = { };
> @@ -526,12 +533,16 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  		goto out_bgio;
>  	}
>

No sure why not irq_domain_create_linear(),
https://lore.kernel.org/imx/aoW8V84mQ7UZhpaC@SMW015318/

Thomas Gleixner accept add devm_irq_domain_create_linear().

Frank

> +	err = devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_remove, port->domain);
> +	if (err)
> +		goto out_bgio;
> +
>  	irq_domain_set_pm_device(port->domain, &pdev->dev);
>
>  	/* gpio-mxc can be a generic irq chip */
>  	err = mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		goto out_irqdomain_remove;
> +		goto out_bgio;
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
> @@ -542,8 +553,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	return 0;
>
> -out_irqdomain_remove:
> -	irq_domain_remove(port->domain);
>  out_bgio:
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
>
> --
> 2.51.0
>
>
