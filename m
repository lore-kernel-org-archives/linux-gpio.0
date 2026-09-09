Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C53242D89;
	Wed,  9 Sep 2026 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936010; cv=fail; b=lwDHS9zdfWGiEvUW/tSCFwCJ5drm8X7yfQEMd+i57F7H/XxIWNNcHL9klFTojyiqdMWSrfkeT7OsTUjYkdo2mIQJTIwYpBaea80WcjF5BCQWpE9Dkqjwl3ehyFBxEm/M+KomHGbX0U+Kg3rl4fOYf/vLTS/UnPsE3+a47M/a9b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936010; c=relaxed/simple;
	bh=acUwX/1AwX+95c2MN/SHIutK5pyVlchH1ip9Z35cylY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bExqLB5BOfBQXxzy+TffAKE2z4kFLDFK0aIsIwHh7T2SR0+h/m8/d4IaB2EzQ4t/X+8AkyPMNXt1wam4fXM88lmTwfAEBYXCycPKq4MFyDNP7fRCKGHwx5oRVq8ox/qL0Q1AJp54u++IhePcZ/rjWQGhoOvK1542PPZ4BtEwGzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vSrp2oXH; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vSrp2oXH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bdbz5gCG+1x1KoF7nQT3cinuJsBezRfAZ4YZO2/z6mUctaXNbngX/zVQrpBwJF66QGfCAX03GgwCL0g1GqoMVTYoq7IYGifIUZIJ2NemxMK+eu3DSUt9c3kGLKL/cL7AH0lP3veiSLk8fqPGrhyTip9Y1MEoHR7sGqVULhUdPwZqMQjG1Oj3wngh83J0q1yuwnMStvWZcZy76WbWBC5Nj79yzkC+4ZEiQ191oWIOiV8we2SjkIvuEI3ZR6xf0vRhfla7pstYPZYi9iD3i6q5Ph47V+C/0Fi0OBemBUmfTIqk32zqteYcOtQtiPyJ/zRnxNKhIgxvHR9tkmfEU97ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpGnf2THzpjkqf3nYuIap+ZpOXwwTlp/Hym6b5DuIYo=;
 b=wQsTRsq4H2z9BXfHKs1I+9gFWi7hxW0+YU+UB4oZX10rIxyYTkuFVYehQlFyEmnrBMNtnalEcFeSznAvY8B2py9+Ug5CA4y2OwPHrmpU2XEmf1s/VUZ9WZ2XSKUsGEbmnSx8cImxgjtjYHkMozyN1D0dqD/cnTlwSmDYU8QeBLqf8jlxX+SdkcXLKHHi/pNuQ+7aVJUGgwSNvgcPNfSOSYZI/89EwP+N3JketL1klxDqwyt3jA+IAEnbzkwTN0XGujtSYSdjmc7mbbIxXo0DUWN/cYfLbDPXPz/f4ODn5ZnA1mT1/4bzrZs3/8vsr0L1m6egYVim1U+6kKe1VUnfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpGnf2THzpjkqf3nYuIap+ZpOXwwTlp/Hym6b5DuIYo=;
 b=vSrp2oXHqwzHO8rB+2cww0JsMnQxQFR2rtrxNScq7vcCzxsSch/XtkZPAccKYi/WTMBaeQQKOa1KsTZzGMG5BEvBKhQwrW4H+cyxstGmBY6iQgZf+PvUvjTUirG0DSVuYpMKuCa+6aVF6oy7thWg545FmMWX6MZds+6qrW4xlF3eHBIADvsMshIQNLjgkrQ0aP7i79HuVSl5U09uY+3GHHymu73YEAXx8P9IXaaxxxJqbQz4kl4ssHZjdWWoUux8wHTGEN6rS3DQHhvSgPPTn509nZVtfeqO8O3VZkJi64oc2+vsBVWkQ90FzLhtZCXPoAukSbHB5H3iPJ9q29uZjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by VI1PR04MB6831.eurprd04.prod.outlook.com
 (2603:10a6:803:135::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 9 Sep
 2026 06:40:03 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 06:40:02 +0000
Date: Wed, 9 Sep 2026 14:44:15 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 3/3] gpio: mmio: track the direction of chips without
 direction registers
Message-ID: <20260909064415.pel5dilh7nrkxz6u@shlinux89>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
 <20260903075940.2089367-4-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903075940.2089367-4-mehmet.fide@gmail.com>
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|VI1PR04MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fe79b5-78e8-4c40-27b1-08df0e3d2d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|19092799006|366016|3023799007|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yAFXmj1QQoogqfLKKldTXgr5zZLMZLt1KQ0f4SP5P305KuMYhHSsQvPzT+aALVcQ1eZZJCKUBu3kuv2xRGv2Z7ry1ceqVcAiWRMHjpKJf2VtVdZzyvkV3FoDCcJ87WLffK2oQjJeFQyXVhLhiZ2ptyTb45dDIJfLqbO1mpMkBtqBnyryF0ilpo8dbnGVkD/iQntmM5eh0/i412YY7e4C75/jsOCMmYOvM5scf4o9IuHwF5Z2+7NU9Jb/o/nwHo+tNanLtzxtuD6sKarNw1KUiz3/cXneDzZaBq1WYIam29fINNabxxuR/EzRu7xb9X3W5U70lE/6czlFoA0YXuXQSp6WPCy0jjGBJ9am8pd1pr+LbV1qytGZjae7aoDzydZ+gw6+CVo3SN2cglhSrrgMndq8jra9RNOydCdXMkHfJVTwK/oNkXG4VHJMrjoAV385DINNMe4MrcLCgE5RMXvRm5T7xXS9jazHBwU/Q8MGA+BBeHNLwzHikn/ITm+Zg28Ey3UKoqW3dEEX/O0NFlPc2RApooqpilw03+ohtD6EFxYfrzEWkxuzq31mpRZlTLAM0VKIAfQBLId4zlQY1Y9kVLsJrjNEGd5Vu7M4/bwjWlHH23f4rT//3Ba+esg/2Jj9JAKDcuKfxd315IAJlK0xacrr284QG+jAbrsn/Eod63U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(19092799006)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JaMbAWJajvtTWi6vZHMSjmSID9sxAB5Dv2IjVQkg85BAta6x/kP99x38Ftbg?=
 =?us-ascii?Q?o3JifF1xBSgUnKBwREGDkejUSum8XSfmHCMWj48AGzrkwN2JaNY+w/P81qKz?=
 =?us-ascii?Q?FJWZSUNL6f3Pbmw6QFWQQ0o9os5DmTqVRdpHiWhsTULWxWUmcjTAzCunc0jI?=
 =?us-ascii?Q?Mxp4yELSSmuiP7CjWFkS9yjafkgCivSQ5E3g3HcpptxbFh14G4F2WYOvn5VG?=
 =?us-ascii?Q?m0ptuTV5rpE9QlQGBrFKIfWtwehd6ppx0MC9k94j24PP2gcBsDK8Kz5bvxSV?=
 =?us-ascii?Q?liRCmqT5+13W+Ssh6gH3xJa7T09BNG01nVqfkCvDuMg0jHbbHbABIqMl0Dqv?=
 =?us-ascii?Q?A4cckGIY8r3QTN3l4SLo8pQ7FiEXOM4GiL61lmTkFNpII7rNoznOjimNE55q?=
 =?us-ascii?Q?lsNf48xM+vQ8nQhRXrP41H6BLl+e5zAwc+2RXJVpYvmm7xUwpLpPCZ3waKDR?=
 =?us-ascii?Q?LG83x/msKtHPyCCODCyf9RT5JXnO/oCXAjdkIqqSVtZLZU9+FE0WkBYiOB79?=
 =?us-ascii?Q?A0AVbAA7Jvz0LU2RV+WiIFCy2lQN4fWsemfwit31eEJiMyKP3vlfruMePSSh?=
 =?us-ascii?Q?2YTe+vf9pK/SEyVgKMvuC4NoqTsjDGv3c72ZUFO5cLulI2hYVFnGujSsNRlm?=
 =?us-ascii?Q?K5on8hplf5uoFXg17u7rh8j0dtc/k1V1O23CAsRaeiAvXa6HFIal2K2iSz4p?=
 =?us-ascii?Q?evS7l/8n3zlFAHy/iHcjzAPWQ3K2yRn1nvCdg9Emj7bdcVc1AaysnTtMJB9d?=
 =?us-ascii?Q?0MGZR80IRZ754w98xlHaqsGJU3BIVRmX6yfIfKReFn4Ndp/QPNcctaD+DMvK?=
 =?us-ascii?Q?kpj8KMXres4noc9P1k8ZMZbLr934ibTRFYy0goSp2gQLH1oeNXqlQ+ZUrFoU?=
 =?us-ascii?Q?lZeOpT0WSzn03hkurFkGRqMCc7Xp5kF0Mm9OBvF1KHAESp6+oa0hCcrBQIup?=
 =?us-ascii?Q?IpUJDe3L9dBzT8AIj44KIh8PWZQfULdHj7YDt2ifx4abnWVzriX1jM5jCv3v?=
 =?us-ascii?Q?ELeIP76lPeYCe4bkZ73eHj6a8ADp6ySVSj9f/s5DDgNn2f980O7F1OsQgJoI?=
 =?us-ascii?Q?G5w/3CP375Bt3ZlhHOduOvfiopMl7D3v/r458NI/8UHeFcs3jZKHxf/fietq?=
 =?us-ascii?Q?tSHM8CHxZjfD29OmjBSbMOeVo6QQKk1CEv4mYjemRYwTrSkO0t2zqZpb+w3m?=
 =?us-ascii?Q?tC96mkbhHhouj1TbqfynSRnnL0q66aaj2oqsyo2Sq02sHKIFhMOwMEzWWHLA?=
 =?us-ascii?Q?2ei6HBrjJVLFvvJIlZkwflMcR+3BhPZ0ZZlwa9am9gJtKX8bVZEtG5OlIl0q?=
 =?us-ascii?Q?nwafq+nR8/1VqwtFdEwSTdIm+QPQGzRJ1/IL+deyrHSADdV+00FClVDhCmAU?=
 =?us-ascii?Q?ZCg6GfP+PMh+sR/CaoBhYr4llFYkPywPzd7gwBueecb1OOYGzZ1fRB2yB+GQ?=
 =?us-ascii?Q?cBYVJDelDBl2op67zg6/1vztKfRsDlTARyzNpsCZi5w/bIDp6cnRscAeFRBn?=
 =?us-ascii?Q?XxipSbGRfRPEG6wd6lZIWpoMw7MK6Iyc3ha1UABPpIVu8h6AKrwB41MVamDW?=
 =?us-ascii?Q?APzC/+qCrvN6eedfn++GzyotsukYxFw/BMjKlOtQId+iAXbCSPCVG9xpFw7f?=
 =?us-ascii?Q?YJj0bGr1pqtHKQHmnIEvcl62EzTLgGFg1EZmtT5yhhCTWx5rvPGZw8+Ewbhl?=
 =?us-ascii?Q?GNZBYhbG0T8Xqqu6lxidBvmuwBJtaTDCG/V6R51o0SlbDxRyW1IbOS5wpvzu?=
 =?us-ascii?Q?KQnr515KQMkbOv3sszXMfcJUNzYpXPKEOV+WbzeE6Ipd7XhyyREJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fe79b5-78e8-4c40-27b1-08df0e3d2d56
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:40:02.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbH6rl4jEnLD2pQnJPGt1MwQ42/Qpi+HoOT7v7UI1HrULje/0P79hpEFw45fTOxjrIu1U8pcy/KmbD6Dqn2grnNCIiFP3fBMWyuu/DelsIN1KsJVHcvzUPcu5e8KvUte
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6831

On Thu, Sep 03, 2026 at 09:59:40AM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
> registers sets the direction through pinctrl but has no get_direction
> callback, so every gpiod_get_direction() call trips the WARN in gpiolib
> and the direction gpiolib reports is whatever it assumed. On a Vybrid
> Colibri module that is 21 backtraces per boot.
> 
> Keep the direction of such a chip in the existing shadow: the direction
> setters update sdir under the chip lock, and get_direction() is the
> shadow-reading path already used for unreadable direction registers.
> That keeps the callback usable in atomic context, which it has to be:
> gpiochip_lock_as_irq() calls it for !can_sleep chips from
> gpiochip_irq_domain_activate(), under the irq descriptor lock.
> 
> The pad's actual state is read once, in process context, when a line is
> requested: gpiolib calls request() right before get_direction() for a
> new line, so the shadow is seeded there from PIN_CONFIG_OUTPUT_ENABLE
> through the chip's get_config(), which is gpiochip_generic_get_config()
> for the pinctrl backend, and the line reports what the pin controller
> says. Lines pinctrl cannot answer for keep the input default, which is
> what gpiolib assumed before.

dir_unreadable is now set from a second source (PINCTRL_BACKEND with no
direction register, in addition to GPIO_GENERIC_UNREADABLE_REG_DIR);
worth a line in the commit message.

Reviewed-by: Haibo Chen <haibo.chen@nxp.com>

Regards
Haibo Chen

> 
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  drivers/gpio/gpio-mmio.c | 60 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 7e4b3e8d609f..0709ffaab4de 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
>  #include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/spinlock.h>
> @@ -372,7 +373,17 @@ static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
>  
>  static int gpio_mmio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
>  {
> -	return gpio_mmio_dir_return(gc, gpio, false);
> +	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
> +	int ret;
> +
> +	ret = gpio_mmio_dir_return(gc, gpio, false);
> +	if (ret)
> +		return ret;
> +
> +	guard(raw_spinlock_irqsave)(&chip->lock);
> +	chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
> +
> +	return 0;
>  }
>  
>  static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
> @@ -384,9 +395,19 @@ static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
>  static int gpio_mmio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
>  				    int val)
>  {
> +	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
> +	int ret;
> +
>  	gc->set(gc, gpio, val);
>  
> -	return gpio_mmio_dir_return(gc, gpio, true);
> +	ret = gpio_mmio_dir_return(gc, gpio, true);
> +	if (ret)
> +		return ret;
> +
> +	guard(raw_spinlock_irqsave)(&chip->lock);
> +	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
> +
> +	return 0;
>  }
>  
>  static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
> @@ -601,20 +622,51 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
>  			gc->direction_input = gpio_mmio_dir_in_err;
>  		else
>  			gc->direction_input = gpio_mmio_simple_dir_in;
> +
> +		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
> +			chip->dir_unreadable = true;
> +			gc->get_direction = gpio_mmio_get_dir;
> +			gc->get_config = gpiochip_generic_get_config;
> +		}
>  	}
>  
>  	return 0;
>  }
>  
> +static void gpio_mmio_seed_dir_from_pinctrl(struct gpio_chip *gc,
> +					    unsigned int gpio)
> +{
> +	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
> +	unsigned long config;
> +
> +	if (!gc->get_config || chip->reg_dir_out || chip->reg_dir_in)
> +		return;
> +
> +	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
> +	if (gc->get_config(gc, gpio, &config))
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&chip->lock);
> +	if (config)
> +		chip->sdir |= gpio_mmio_line2mask(gc, gpio);
> +	else
> +		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
> +}
> +
>  static int gpio_mmio_request(struct gpio_chip *gc, unsigned int gpio_pin)
>  {
>  	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
> +	int ret;
>  
>  	if (gpio_pin >= gc->ngpio)
>  		return -EINVAL;
>  
> -	if (chip->pinctrl)
> -		return gpiochip_generic_request(gc, gpio_pin);
> +	if (chip->pinctrl) {
> +		ret = gpiochip_generic_request(gc, gpio_pin);
> +		if (ret)
> +			return ret;
> +		gpio_mmio_seed_dir_from_pinctrl(gc, gpio_pin);
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.54.0
> 
