Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F97175A95;
	Fri, 24 Jul 2026 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907162; cv=fail; b=Ldg/t0z/TIrZuPbqYudUVSZJ+sdjZCXx8AjVooHhXfOMDGteStSOF6QE+HQT4z0sKltROcFVad7xrEwRtkmCjxBtZ/gO20DucjQ0CUkGheZWd9qlAyDesriIUAC8PsYFDRrZzgddDyjyoqVvgI3Ab7jGgUElWE+dkfMdWfwEdB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907162; c=relaxed/simple;
	bh=/SQksir6mhn8ZchzyFiaZCxf8EKehLni84LcDr1VFms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bJSQLfXRIgJKp+9JoOAUIG8CG+FDoLPPzRcKm3WySk7ooeez7JEoL0FEjpcZWwY1zXfiRWeS8Uyzz5S9ghBCmh+/IrpE+wRGlPQV5SxzgXaYW12M3szcok/gVUdHKf2qTf9J+OtH56vXD6XthGVeXsloMNFpNzFzx27OpiGGrIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sfJneQAT reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sfJneQAT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEvxbz+mY/MsLLed2b0obYc8A2F6zvaNYQJtw90xQQWA69FOVsOaXTHKKLdIsGf6U40Ftmvn1XAYTsDibFtkFbkHXQdPdXDmM5z5RUcSVi+pfzfpwN5DpbEtfQz0hNS/h1hBrNUydQvtKbwtBxlp6enYLQQxT5y9+OQzctWEc0nBKopTbYtbdWjBK7epXs7uV2zYuDfUBTym9CDVDRSBBtBZenRrkIAfoqoBQUrj9iapDBP6DfjwOXIfcDa0iT5+sq/3rYz2dw+6Zq5x/Y8vrbZym65B99gQzhrgeYbvES1/XzIK1e8yBHoKZ0W+hVq7OLLHYY7WzPH/MVUKymlgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VipkrXyhurW107jEETkKz5rj+IdrsyqAoP8b5fo7JA=;
 b=nHVmhILeZ/nzy4fRB3rFibx6fMhsd1LM3v7Wp8UJSf8snsJDuyhIZ0OS+UrWugDQIW3FXhGPUAq/N/vP6giBIisze3MwH0uSvl/lloRwiCQETzcanYUb8t3cUW66J8JFDxuXog9wc2xzj6YKHjo2iLRU5m3BSou+l0HyM/SfWszEgosZOks+Gb3B/khj5MgtvrRXRSG98haTwRDD83P/itMc5Nsqzrfvx12J3KCpbv/bcbWglFGfvuM3WSuKjl5x315MBCStHZqAj9XIGtIbOFfJSZr9sTeT/WnZDn0kDvmi9GSsHPbnnxh19AYM+zfTLZNDeX148Z4Mm9GErs6Mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VipkrXyhurW107jEETkKz5rj+IdrsyqAoP8b5fo7JA=;
 b=sfJneQATjrrW1vqqkOiOQmmKKEZmXHbqusrTGs45q7sG+3hnksdoVJF/Jn9ig2otWHLsLoQMLvZTzhVK9afCvZR471WL6Q21kUKEBzHPd1sRYN5nG3LaDlJvrpH14EvsQ8uuFUNKUNld1ojEJK7bQptBhRoq6ubGBUHhFX1Gx0QjXc0xyblQ54Db68lN3TwBFnmfxw3nlpFT77S+2w301mJSMfUUTzFZPPMZq+FO2orSi+mhXSyafMaMz0IqpP7gpv/MuiJbJNqgmsVPIBT2jaJkHixGeJn7JiCA3XBfSjEA03694OeQ4O84rLDF//gIfEOOTbbyFSpdgyVApAXkiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12093.eurprd04.prod.outlook.com (2603:10a6:501:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 15:32:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 15:32:36 +0000
Date: Fri, 24 Jul 2026 10:32:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
Message-ID: <amOFh7KeLtO7ksCE@SMW015318>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: PH7P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12093:EE_
X-MS-Office365-Filtering-Correlation-Id: 3696f846-ed6a-49c6-cc39-08dee998c9e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|19092799006|1800799024|11063799006|10067099003|4143699003|5023799004|56012099006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	5kQOAZAg0I1kwD3JePmocgwu0sHSEoMxMwXX5i66QKU6er4dv2MMlyZ9bbpZEzY7L1QD7cPIdUE405eXdb0wr3Qoow7MVsHZR6WDEEKIU9rphNpCEqBYkhLdEjnzM73LyrRBFnEHCOD4yRpea2TpF4uZHEVAVmNk8dVtjD67PbDcnzKTtGkM2l9r+AHeWhClQ0icZa651v270FsAzw/BEe13YJV5K4Jtc/dfphrMemLkcpN5wUz6iKK7bLJhBEBKXT8R4FMW3/AeBjvTb6QdxOU806jA4dYxvccsJe8sWzkKuRUM0lhxsfr+B+KPUKA9r5AVAFlRXORyaNWTf1Uook0WIiBLvz6lW9JVFNRByLhSvls0rAMjqA0nJqu6N7PUCDFzLJfSI1EoM2t0OdXJfhoAGtvxg0GUl0uTl8Wv9KrYf+Q1f093l40tr/PQaEHRhfJHBxQBpC8Tuos5tlb+5dylzYs+4J/O+P0QLyVoaZdrXb6ryZieZO1H8s9FjhwVmROdhk/1ykJsZABms9uNBaNfNZuntVpwE9c97gPaHsWOobS8bIZReUHAHn+RzxkamZ+khi9leAEaTpkp7cp5L5Gy+iQLvzv7TVv4MYnSiXhqEmKBRUvUghraoG+ZkVBDXcMru5BklZcGnNUF+tpyQB8TWhF/SLbNTPQm9PEasrUG580HJxCxquAWPBEX0Ly9bIcyxNFoFaAxMf6ZloG5HEvQwYJ/ksDBTvTF4lFU914=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(19092799006)(1800799024)(11063799006)(10067099003)(4143699003)(5023799004)(56012099006)(18002099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?IgXAlMWRgHcnv/TpyGNBOIlZNfpTo2q+7OkVQrCxSAQg3yPaavqI3Sqvvy?=
 =?iso-8859-1?Q?GHEf0YrFwgh+UGO8z6mQkIB27mksuGCjrbcdyAmj8KhKgbuFVFxbgTvbu5?=
 =?iso-8859-1?Q?LbH9YA2UtOx78zihaPeZAwH7YDPTM1R4zWuSNkQicv5FQXXDjzkxwzxI8L?=
 =?iso-8859-1?Q?Az0Yk51P9B1oFioTvVxyTRWJdfRF7iOYjMwZHF5ESIsFysCowFccJPF+dh?=
 =?iso-8859-1?Q?Th83/b56tt7Ba0cicnISxbEvZvr7aMoYn+J4PR8XXdRb9yfxCntC13kED1?=
 =?iso-8859-1?Q?JOCLXSfmdOlcXo/yK3QaL0RLL6+N1DLsVMqPioWodHpGniAVcahCVgyKaZ?=
 =?iso-8859-1?Q?GiK/M/YgnucDzuKMubfJ4h4HGCsVnjoJ6QNMQrUqP8ai6STPxoMKvrTnVm?=
 =?iso-8859-1?Q?KV4JmlzK8Pd/QQCd7+lOGFkOdyhgwWb0osp6YKMYIKkFHFWWLjzE7QtC9t?=
 =?iso-8859-1?Q?It1HzfmtTUgIX4vlwvTNiB+plSVsI8qpNLHeXtSvubKU81EPP9hsnCtVPQ?=
 =?iso-8859-1?Q?XSryxJKddV04E4Sr6QMsg8/OVLeJVZsgpoWPYRaDwjFVsNuu5Lac8gbngn?=
 =?iso-8859-1?Q?BdPHLMipBEt09yUiLcha0YeBj6IUfwJJRY5LcSAo6sRlNornKPkHYn2lZ9?=
 =?iso-8859-1?Q?HgtuTNXJqC+bFyKTN3s2q+yC75qZGKvuYpI8ABVfQkcdsbryeC1l2JpJSt?=
 =?iso-8859-1?Q?QC252flk6DfOS9Zz/2vQL5nruVH1rJHh93Y2s3LyroM4XZC9LmCC80q4zw?=
 =?iso-8859-1?Q?6M64JJeEIuH3kRj2QORxZf6MscOm0phyU7Aud2tV03ZbshYHS1YcsLzHbD?=
 =?iso-8859-1?Q?fl1kgsL60KzKgN0TgrAri6yJ1vqrpdkOsiq9cf+qkhoOX7OiMBZGpz05OG?=
 =?iso-8859-1?Q?BFXxf5erR89NRifGhdJ5iT2pgT4dIV7jFtSjW1+xYoZg/IRuYJE6mPgl+z?=
 =?iso-8859-1?Q?KvXhjFa2zRec6BW592bWC/jc8wvJlgBU0AlHNZGS/8iHK3WTzmEHjMOXFi?=
 =?iso-8859-1?Q?yYHoqRfckzaBZrOBCl7OKHM83KNVOFiu+0ILRObW3ubVNm01/WaiLZkoaD?=
 =?iso-8859-1?Q?wZ+/fhwPoE8m1rN60DOxkzZNAlC2mV3eqq8VNYVpM/TZn6qdEczPnxv+vw?=
 =?iso-8859-1?Q?mHDVcx75Fh7IbhSFNxc7Rs5ldxHuPluFsrdtQEPO6OAelkZuwe5kV0fbTK?=
 =?iso-8859-1?Q?ut7/vkoNYZkqVhBVUEY8LuIU85Uo6JKrWRqc8Budlq4+bvQ84vdw6qmKb1?=
 =?iso-8859-1?Q?k+OZxphpVeHZoxsj9kgj8clblDf8cffiMfakL/cPCGtSrC7E9SsS6MsJmT?=
 =?iso-8859-1?Q?/GmWuPblJiv/3Q6eaqHHHkfbg3mcFXogbdEZkXxUkhqhcPT3ONTFWfXDuP?=
 =?iso-8859-1?Q?NU5y9MUEZdzWvRzRA/h+bPtQyRZb0xaozmEpoDdwphnptwtOBufDtMQqa+?=
 =?iso-8859-1?Q?3QqW363MQH1TAHcNXhXPaB1OggowbuOKlM7Aax2gcrN6EsIK4wmBQ9OjDC?=
 =?iso-8859-1?Q?KE0DKq5oU2OTp4xX90zwr/7lVCtZ2LizA13+sTezXvT3hxUmvViWuO4W/d?=
 =?iso-8859-1?Q?AglhW6R9xWWx/htlMTTbgFYXyIlFWent8fCc0enBEadfG+d8Kb96Z/Qksw?=
 =?iso-8859-1?Q?Y//YraemUp4u0vkwFWaLFt9p+U2pOpRRLaOJoD2eB3n1JvwH+8/BtF6QIH?=
 =?iso-8859-1?Q?eOVHNSNhwwKCiIgS6Zk9Qby9sM39VdFyaa8TN133k1YzGlZvj7V48Wtimt?=
 =?iso-8859-1?Q?Wxw0bP/xxx0wc8thUP5H8EjOQfOZCNeS77KJEE3oZeuc8cSWtJ8v/PsOkv?=
 =?iso-8859-1?Q?6vc/uBcQbSXdexRahLrzaOfvE/MuB04I+Mv4cczSHqHVyJe0qTeE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3696f846-ed6a-49c6-cc39-08dee998c9e2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:32:36.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HD2GnBkiKmqVO6HuCozo5TUC8lZ3qsYKh5qGLprcmZDORexj4BLG7nd3AFP4DPoqJUjbWEjxtx7HtyGSH+BedDbaXKEBoPrZr5RJOoiFFJ5//VAocXOU/cmFJ1/tO8pC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12093

On Tue, Jul 14, 2026 at 09:24:08AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-bcm-kona.c    | 1 +
>  drivers/gpio/gpio-creg-snps.c   | 1 +
>  drivers/gpio/gpio-ep93xx.c      | 1 +
>  drivers/gpio/gpio-ftgpio010.c   | 1 +
>  drivers/gpio/gpio-imx-scu.c     | 1 +
>  drivers/gpio/gpio-ixp4xx.c      | 2 +-
>  drivers/gpio/gpio-mpc5200.c     | 1 +
>  drivers/gpio/gpio-mpc8xxx.c     | 1 +
>  drivers/gpio/gpio-mpfs.c        | 1 +
>  drivers/gpio/gpio-msc313.c      | 1 +
>  drivers/gpio/gpio-mvebu.c       | 1 +
>  drivers/gpio/gpio-nomadik.c     | 1 +
>  drivers/gpio/gpio-pxa.c         | 1 +
>  drivers/gpio/gpio-spear-spics.c | 1 +
>  drivers/gpio/gpio-xgene.c       | 1 +
>  drivers/gpio/gpio-zevio.c       | 1 +
>  16 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index b0beffe48b7d..9bcbee25f685 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -522,6 +522,7 @@ static struct of_device_id const bcm_kona_gpio_of_match[] = {
>  	{ .compatible = "brcm,kona-gpio" },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, bcm_kona_gpio_of_match);
>
>  /*
>   * This lock class tells lockdep that GPIO irqs are in a different
> diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
> index 157ab90f5ba8..2e159ea41791 100644
> --- a/drivers/gpio/gpio-creg-snps.c
> +++ b/drivers/gpio/gpio-creg-snps.c
> @@ -131,6 +131,7 @@ static const struct of_device_id creg_gpio_ids[] = {
>  		.data = &hsdk_cs_ctl
>  	}, { /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, creg_gpio_ids);
>
>  static int creg_gpio_probe(struct platform_device *pdev)
>  {
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 8784e433e1ff..278b1093dd22 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -377,6 +377,7 @@ static const struct of_device_id ep93xx_gpio_match[] = {
>  	{ .compatible = "cirrus,ep9301-gpio" },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, ep93xx_gpio_match);
>
>  static struct platform_driver ep93xx_gpio_driver = {
>  	.driver		= {
> diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
> index 11e6907c3b54..e29df8d5e571 100644
> --- a/drivers/gpio/gpio-ftgpio010.c
> +++ b/drivers/gpio/gpio-ftgpio010.c
> @@ -323,6 +323,7 @@ static const struct of_device_id ftgpio_gpio_of_match[] = {
>  	},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, ftgpio_gpio_of_match);
>
>  static struct platform_driver ftgpio_gpio_driver = {
>  	.driver = {
> diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
> index 0a75afecf9f8..3ebd3d73ed58 100644
> --- a/drivers/gpio/gpio-imx-scu.c
> +++ b/drivers/gpio/gpio-imx-scu.c
> @@ -114,6 +114,7 @@ static const struct of_device_id imx_scu_gpio_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-sc-gpio" },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, imx_scu_gpio_dt_ids);
>
>  static struct platform_driver imx_scu_gpio_driver = {
>  	.driver	= {
> diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
> index 669b139cd499..88d48cfc9017 100644
> --- a/drivers/gpio/gpio-ixp4xx.c
> +++ b/drivers/gpio/gpio-ixp4xx.c
> @@ -341,7 +341,7 @@ static const struct of_device_id ixp4xx_gpio_of_match[] = {
>  	},
>  	{},
>  };
> -
> +MODULE_DEVICE_TABLE(of, ixp4xx_gpio_of_match);
>
>  static struct platform_driver ixp4xx_gpio_driver = {
>  	.driver = {
> diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
> index 00f209157fd0..2c828bc922ae 100644
> --- a/drivers/gpio/gpio-mpc5200.c
> +++ b/drivers/gpio/gpio-mpc5200.c
> @@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpiochip_match[] = {
>  	{ .compatible = "fsl,mpc5200-gpio-wkup", },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
>
>  static struct platform_driver mpc52xx_wkup_gpiochip_driver = {
>  	.driver = {
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index a6868f673831..ee35da06cbc7 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -318,6 +318,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
>  	{ .compatible = "fsl,qoriq-gpio",   },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, mpc8xxx_gpio_ids);
>
>  static int mpc8xxx_probe(struct platform_device *pdev)
>  {
> diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> index 7f0751d7b1c4..1078b3018970 100644
> --- a/drivers/gpio/gpio-mpfs.c
> +++ b/drivers/gpio/gpio-mpfs.c
> @@ -295,6 +295,7 @@ static const struct of_device_id mpfs_gpio_of_ids[] = {
>  	},
>  	{ /* end of list */ }
>  };
> +MODULE_DEVICE_TABLE(of, mpfs_gpio_of_ids);
>
>  static struct platform_driver mpfs_gpio_driver = {
>  	.probe = mpfs_gpio_probe,
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index 7345afdc78de..38932986dc36 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -688,6 +688,7 @@ static const struct of_device_id msc313_gpio_of_match[] = {
>  #endif
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, msc313_gpio_of_match);
>
>  /*
>   * The GPIO controller loses the state of the registers when the
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 8d3acadb0d68..4d1625be11ec 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -978,6 +978,7 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
>  		/* sentinel */
>  	},
>  };
> +MODULE_DEVICE_TABLE(of, mvebu_gpio_of_match);
>
>  static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
>  {
> diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> index 208fed631975..90293329b40b 100644
> --- a/drivers/gpio/gpio-nomadik.c
> +++ b/drivers/gpio/gpio-nomadik.c
> @@ -719,6 +719,7 @@ static const struct of_device_id nmk_gpio_match[] = {
>  	{ .compatible = "mobileye,eyeq5-gpio", },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, nmk_gpio_match);
>
>  static struct platform_driver nmk_gpio_driver = {
>  	.driver = {
> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> index 5d61053e0596..317e3bc925eb 100644
> --- a/drivers/gpio/gpio-pxa.c
> +++ b/drivers/gpio/gpio-pxa.c
> @@ -583,6 +583,7 @@ static const struct of_device_id pxa_gpio_dt_ids[] = {
>  	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id, },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, pxa_gpio_dt_ids);
>
>  static int pxa_gpio_probe_dt(struct platform_device *pdev,
>  			     struct pxa_gpio_chip *pchip)
> diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
> index 96a0e1211500..3099deb2b290 100644
> --- a/drivers/gpio/gpio-spear-spics.c
> +++ b/drivers/gpio/gpio-spear-spics.c
> @@ -157,6 +157,7 @@ static const struct of_device_id spics_gpio_of_match[] = {
>  	{ .compatible = "st,spear-spics-gpio" },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, spics_gpio_of_match);
>
>  static struct platform_driver spics_gpio_driver = {
>  	.probe = spics_gpio_probe,
> diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
> index ad0f1551c271..b34b0c58b67c 100644
> --- a/drivers/gpio/gpio-xgene.c
> +++ b/drivers/gpio/gpio-xgene.c
> @@ -191,6 +191,7 @@ static const struct of_device_id xgene_gpio_of_match[] = {
>  	{ .compatible = "apm,xgene-gpio", },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
>
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id xgene_gpio_acpi_match[] = {
> diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
> index 288a86c8294a..f1c5c6a20673 100644
> --- a/drivers/gpio/gpio-zevio.c
> +++ b/drivers/gpio/gpio-zevio.c
> @@ -213,6 +213,7 @@ static const struct of_device_id zevio_gpio_of_match[] = {
>  	{ .compatible = "lsi,zevio-gpio", },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, zevio_gpio_of_match);
>
>  static struct platform_driver zevio_gpio_driver = {
>  	.driver		= {
> --
> 2.55.0.11.g153666a7d9bb
>
>
