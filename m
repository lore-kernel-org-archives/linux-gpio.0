Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601149C4CF;
	Fri,  9 Oct 2026 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571880; cv=fail; b=FPsm9MAqkvBWljue1YYS7qGdLr0M1WoY/JcXGx1cM+jsyO67d8YiNIt/b68J7bmZJmd3V4XOw1Qv1C0eJh63vj74vYrAcRkgrmbM16REk8BIO5zYayRVeioL4HLQj/CGDRlnR+AIeXiOVje8HSpZllfoA5+2fxVag7Wsnidpkb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571880; c=relaxed/simple;
	bh=qszXzDrOxYsUsnriQc5CBPSzsZe1ZSM+hH1pymZnZ0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JMemVcr8CLRZPOzFWP/CuXPSWe1IB/5VGqTBSxxFE+g86ETQSbetCFb6StxFhuKha3NETuvXHbEndIfIMrwvaY7WS7myx5+86swBzYBkkhrWgx6W88eOanE19W4XaJzyD12hv7lCaFzHrau3MqHvkyprGyQ1k8CATs16RuZ/3Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b6Q4pio5; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b6Q4pio5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9rR2wBbiM1u34ojyNxi5XfOFhUraJwePG++mMh71GKjd9K6+POXcwq4W8x6XpDJKYz0Gv+00q21UqoI0c53ogBmJRDnq+tjGYgYdZ3Loy77USwt/KEyCKN+VIWRV06bx9fmjxCPAS1Cu6ahcx1x9nIab5YjZ0E2dByASq8e2wN4KlU+cHPmBIZhgzie6Ds06Las0SXRGTbX6tj1bT9/zj89514E1dmpBkk+QuiJModoN6fv7cC9hMcQToHb9ugLIkL/Pct9a7rVwz9ncorZnEWy43nfbyroK8QPVagfSvZpbSF+yiXYWp+7GPEZPstvWcOx/9ZkHulZoCt/Mq8G/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU35L6QaxHmb4dioxD1i2PKFsVl6iuc7VGbFn0m+3m0=;
 b=a7Ow5OgAaolGpE+wVIJ0nhXmriNfLyn2icS/Xzf9Ndqaj/bSvxcTmKK8TQtFAnQtRvk/NwMJyxWw8eOKTEBiPzsWQwFachGTtVFU3ba8xv94t5T/t8FWYlPdCx4n1VSMn+lPhegXWL5tfPvjwkhLvs1uemSo6YPPm5Z5YzBtMT9Q1cNuop0f4oUMx9VEFjNNZ3JP2LakG4HRlHYPl2EYdI1lZ6FBnhrgBUTdZV2VrNhPdEcXCBWGMkgIADeN665jarJcugo8EQuKYFjEtDwN3QWij6GUGbagh1Nnn+iFHFffIxyZWKZ/03Z0czK1YmLOi0IKhpdhgdqM4WH3ynG9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU35L6QaxHmb4dioxD1i2PKFsVl6iuc7VGbFn0m+3m0=;
 b=b6Q4pio5DmrwE0KpxoV3MuGhuUvAR9gcLEYzv3QeRLBwruns9jShiRK/ffhwFTqg8zco3K3xztLbhGdE0ZgAcTZgJViSpf3P6NXaUmDznDv5zBSTHV4IyM494VLcasHyfbZJY846Lo17P/8Iwlo/sy1EnVerYakQiKmONWo/LdopzK/Anp7Cn4kHEyijZGeF+lMcpV4soxF79YTSgVz5czTAA0zknMfyFCr+Ky9WMBRCbwOmVtHat163+z3DnQx/PrhATpxCOu8/dFQ3FOlZFW1sNcf/mEFe/YIfMKTsy7FzWKUvntFdm+prIroz07rIruPN2Zx4bWON2U4Og8JBMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB9014.eurprd04.prod.outlook.com (2603:10a6:20b:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:51:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:51:16 +0000
Date: Fri, 9 Oct 2026 13:51:11 -0500
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
Subject: Re: [PATCH v5 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
Message-ID: <ask3n3aMR9Un-e6p@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-9-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-9-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: FR5P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB9014:EE_
X-MS-Office365-Filtering-Correlation-Id: 204b82c7-a360-4da3-9079-08df26364c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vNFja0AklbXMktST5pEoAzt1hKEg19ZsSTGreqi7358/2TMFe9LqqNKexGiQHM3R2G1k9xgslE6y3dtTxlfhdfEcOLO3Cy/EVXD5bLdUMMekCDlQnAseNL10IdTDoHHiKR9wOFfj7KRF4DIQwDANm5laJVhnXD9A4AUZyht9ckqw4MkVnAqEtHopHZ7ojIuceN2Fe2sD2ToRlcFUPgVnW961tAav+cktRy43iNPZWAg3MvqyzUffQ+S+30PPWZvxUig/U2Gz756v2VQHWsCmG2+RgJhw30JR/yDRluPHHY2mxuSHu/Pzp6kIiqO9vq6i9VKqXPh7vwSSI2NUQ9k64SQR091kWbmkhFYFhCyIvYM2i5LYxBBIsV8xTJ5ha8T87CWatXj7UX80+dVRD3Up/Fs9DlBLSei/IdzfGrsIrju5S+pjOQ3Ou4k1NUls2+SazjkfB+RFznk16oSuzYu1DR/HvvRjwDVfTF4lZbG/MAyHrdERgO7nQvyJjImiMkUudxXYBikPxYDo5yjIS+UXNsYKba1bx2ZVyK6FAvQ/XgtvwqYuyLShqPdq+34BcKXlE6rCGcnuck5525xXXUxHhTHUhiIL9LNcxcLilwUcNREHHMVU2+ZgNVxoAHyTT4pgO9icworPgk1ubJzUBl07NWEDt2DV5BpG/CqcAChw2us=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dRb3X8pMLFqlVq04J5cYTNoSzUdcej15BnwgLNuVIJ6E+wBg+wajSF5gfhH1?=
 =?us-ascii?Q?tfYjr9l+XVq1eY2AXy5eqUYrnCkyBG0ou7q6o9P01Fx2Ntp+csk9xcKhvmmQ?=
 =?us-ascii?Q?j+x6WUh2zX/Id0fwf+knOWRNZPSYWgMpsJDHCDknbARncc74kmjIQDeKGuMh?=
 =?us-ascii?Q?pzdSERa2fUlpvLtQ2xIj6sTJubgXweF6iOqIFPPiDutIwfidAEKnyYDnSFQT?=
 =?us-ascii?Q?nuQ6nnzXPvpCAu+Uizlecvo+auwmkQJfFzjVIWAYlvzzg5EzBWkemFlVv+et?=
 =?us-ascii?Q?lSOYFrMVNiBve2vUdqJukrAvA1U0+lunwSiRJICWr4mvbMo84uI9bQML1ko2?=
 =?us-ascii?Q?58km6Tp0Q3RHPE6BT2X2LKEjNHThrIkNwD5sgY3c/KXVPxV6jqkjD0Hlt1f+?=
 =?us-ascii?Q?eNIFyqYIeHSRjdMu9UYewRylEYPafNs4kyBnKrAx83Z9HywPh/d1kfVU/HnH?=
 =?us-ascii?Q?4/dGs6Co30nsiHHKp2oic7RqF92BaYsgN+oOYHcFa3PeMrItQolZgfi1ysKj?=
 =?us-ascii?Q?gcBRkipm665yTIuU2gGKqfYdVL5nDLD62+QXQYxv7ZfbhwC2PWF9LYFKBFqB?=
 =?us-ascii?Q?0fRVe7Ze+bf2VeIHfH/5mmTMvBWHplsEOjZxx3MW1wSorW8szsUHZJ8lu/kf?=
 =?us-ascii?Q?Zl4fdZep/FGvI7pifepXrq9ETaO1t4hbM00PvngDE1GaZBi3gMgSHfYazObl?=
 =?us-ascii?Q?IKtCC35AHTtPFQsvXEmJHNueha+78jp1Ybf5UiWJQTozqbU+ZyIWdaT6/5P5?=
 =?us-ascii?Q?Qrqp5fJrWUz4fguIaQDPJx+3qDuOCTN6TZqdkn3TDIj7O704EaAa94Zc2hj9?=
 =?us-ascii?Q?v5pISwJ4onRC4nHYFWBtLp+741PAgJZ8qaQyJ31N0FcosmUNrlQNkW+/z0S2?=
 =?us-ascii?Q?gTgcElnbjoqfY3+tv/74dA4gGF0netOaYOp5U2FiZuVTs0qF7ChOW4y7/Jyu?=
 =?us-ascii?Q?fEbNgtzg3HSLdTV/RNbua+E1njgB7LDGQaPSJZmMMbQv/hvAQrCTpQenVI5z?=
 =?us-ascii?Q?+QCu9mfFP+7tC5jcJjmHT3lozQwO1Oop6KEPy35OYFs/C/2S7GbLIgStFZiz?=
 =?us-ascii?Q?tfA7QOHcR8Vwvhtb50hCPCyG3WcxJGKzOcTQxtP6BfL9BFW2P9pLUqKhfGza?=
 =?us-ascii?Q?pJ6JGbLv/akXhsn7qpg2SmsG9FK3CH/dUqux+1bnJFcBwneX8/XamQOdWzTH?=
 =?us-ascii?Q?aHaWsAtZ40sW6sZ1sd5/t11uJVd5wxHBDYewTzoaKnGG+COU0oJLpZ0qtWAY?=
 =?us-ascii?Q?oJPEB/gvNcf+2pAGwEYE3kYAswaFUD76WSooS37wSFvuGnQLi/xYmDRyU+cv?=
 =?us-ascii?Q?qGyDvB2AGrmkUOacd8fsAWQh7Z2GPw6+r4EeHm4FBoNSxyNIQsw9fxlGpEeM?=
 =?us-ascii?Q?AROs8KhJMYzDN5kZJ2ZihVh4Zg34w9ZhwwIA1AFdb26sxPPdMsInXAJvShy8?=
 =?us-ascii?Q?HA6vMMjzJ2WvKlO+ghE7KZolbDCNiOz8bHFnHu408z/6rt2WRnzDJvat84lR?=
 =?us-ascii?Q?yw5wfgSdwgNo03d3vJ0P3crWrIlwo6sTNFLH0hqF9EdvrKjSTjxugwx8aFl4?=
 =?us-ascii?Q?w7bYwxIOESSO+zylusIRplXMFGGpAT9aMGBHhVG+/VcVsNQdJorZ/EOOY2Mr?=
 =?us-ascii?Q?4UR0Zr08IhWyF2bmGF9dk4bZXHFApcfh+N0M68PhUwO64lBwFymojM6KGMqC?=
 =?us-ascii?Q?Nla2hh8Gs+6olsyRQWbIw0Lw7pRPQmqm/1SVlPgqlCKZWlnbxyi+m0KHw3Iy?=
 =?us-ascii?Q?lpYNgVrX2MFjQ6bLHf8XBRMTZ1RehzvK30HlRwCyrIFdiJLcLGQc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204b82c7-a360-4da3-9079-08df26364c1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:51:15.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orrpjK7kir5SgTLwMkeQtzZYY4g2TUxjSCfaVQ9ZA9ed/cxfBTuCBA8lM0oivHOnwTZRZhI6MKAs3xOuOLfvzUTd9UOmpIY3RQI+gmSwKM8JG9HbXO4vyNSKTWcVkUYl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9014

On Sat, Oct 10, 2026 at 02:05:30AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> pm_runtime_get_noresume() in probe must be balanced by
> pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
> on success. devm_pm_runtime_get_noresume() cannot be used here because
> its devres action (pm_runtime_put_noidle()) would fire on unbind in
> addition to the success-path pm_runtime_put_autosuspend(), causing a
> usage counter underflow.
>
> Use a __free guard to automatically call pm_runtime_put_noidle() on
> error paths, and disarm it with no_free_ptr() before the success-path
> pm_runtime_put_autosuspend().
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 5ae9cdee6424..3d5a6566d3f4 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -445,6 +445,8 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
>  	}
>  }
>
> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_put_noidle(_T))
> +

This change need put into common runtime_pm.h and like pm maintainer to
review it. Other system may use it, like DMA engine, CSI, ...

And if someone add to common file later, it will cause build error.

>  static int mxc_gpio_probe(struct platform_device *pdev)
>  {
>  	struct gpio_generic_chip_config config = { };
> @@ -486,6 +488,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  		return PTR_ERR(port->clk);
>
>  	pm_runtime_get_noresume(dev);
> +
> +	struct device *pm_guard __free(pm_runtime_put_noidle) = dev;
> +
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>
> @@ -556,6 +561,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	mxc_update_irq_chained_handler(port, true);
>
>  	platform_set_drvdata(pdev, port);
> +
> +	pm_guard = no_free_ptr(pm_guard);

use retain_and_null_ptr();

Frank

>  	pm_runtime_put_autosuspend(dev);
>
>  	return 0;
> @@ -564,7 +571,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	irq_domain_remove(port->domain);
>  out_bgio:
>  	pm_runtime_disable(dev);
> -	pm_runtime_put_noidle(dev);
>  	dev_info(dev, "%s failed with errno %d\n", __func__, err);
>  	return err;
>  }
>
> --
> 2.51.0
>
>
