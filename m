Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3BB345EDD;
	Wed,  9 Sep 2026 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933969; cv=fail; b=RWUnUXYbggGyOQ1so8m0Rr7xWz8hZxXEykZ4fgRW2s/bnMOYXtdqR/4gFHGJcu+RSE4gqD5mUmcXOwm93UwNzCqFYDvpn+hqkQnVVQY/yTqnW+bww9/Vdq6fXYRncSanZRXMA7HvYpsIvRseTaIpFu9QqFLgwEt/x30XpfM43B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933969; c=relaxed/simple;
	bh=fQGBQlFr+PieRA0jfjSYVlEVwrm86lHtd3QP+ZvvMWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ml0K45dCWpvtTaql5yweeBmKs1bsQOXAYv30AtCfmSHkHdnLL8KiFPREIT+1MMrkSWmxphiHitI3qhnjqyk20Wc+aC3nmSK2nPJJahkFfwGx9ecWuMIi4bPZpccH82SGGbRlMO8WIrFe84RTLm33UgKa+Cms2CQzapv1rQoFxQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pYOrqJK+; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pYOrqJK+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e97wcWD19HX5XbydlVb+PciX5PcQwVCIHUUYu/F3NFoYMsm298R3EImtgfneYQHbIlgmFcWfAFyKWXWCs8kJdjLDz8RC8hOWxIeYnvd/0xf4R066pPX1MnwxX4+j1x6uLLHlvukuZqmjV9hLB/m1STs2eWS11CWlz92ufQA1Wn8UKAsvoHfwTMXqM7muaagGiPqmXVMHxs2J9BtK/FJJhD6j2Fv0T+uO3bqAuz9b/UpQXaPEv1w49wfHnaHJwmsK3YS3YZFaPQAKAQEHyUOplpYV8RL8L5IPOrykTIkjd4o4L2OT4NbhzIBJ5lJBsJNO3SOgpiOMoYrXJ/7x2SsO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeqfW/Vd+k6IJYjOr5ZiTlO1rC3LRoQ/B671V6qo+ZI=;
 b=wLEsDSUT/3evg6DyRLlu0AWi7PIj5BPatTPaTTDp/Rnj0HgDYLznEy5lotZnfCT6/NJ2ZIFeB9Jap7TzhOvIAqGA406kuEs2H7Na4H4EeQaJbKZmLO9sVURYguoGxF4bWVBLSqZ+tIR79b9jIvWONdplY7BniP1eA79g54OA2wlm51gK/8mxHHyyFJ6jjVilk4PIIPk5j1TO8BoDImVWDvoy/SStE7zcVMbLWQWv4e6KbkVTjFlXVd09CTEkTjtJNAohYZJFsP/wUrbATzJ+8rzQd4nvpug9Dp/5uACejAqH6Z774gMXXbwYp8AGFys+uqFfD5iPt5nbtSMhAMKHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeqfW/Vd+k6IJYjOr5ZiTlO1rC3LRoQ/B671V6qo+ZI=;
 b=pYOrqJK+SjyWZh2l/5ynF6I749hTqKp9gvGnwLG1fhenaAx3JCuD5h1XZUvOAjF0od1aZElXPVJWYohByuiln+dlFq7d55893B5Mfom1DNYhQw31eCjBUCvHyiyeCbHWm8O5eRsXJtM8sTnl+VPhiiPrEGT+txj8UV0AKeuR2O6KwsNyiv+KE1y0DNEuwbuq7wm50DsHw7QGUVB1eFOQQLmIOdIW99Va0IaNaEFlrMzGoKUY6ZdL6DQNby1xB8zC/gAPN/UfW9955Sijt1iuGGbVB++5fd2RjNUP28u/5PpIany6rE1PcEoQW4jqCUPfC7lka9LItWAUG4AoKBpzEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by AM9PR04MB8651.eurprd04.prod.outlook.com
 (2603:10a6:20b:43e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 06:06:04 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 06:06:04 +0000
Date: Wed, 9 Sep 2026 14:10:16 +0800
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
Subject: Re: [PATCH v5 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE
 queries from the pad register
Message-ID: <20260909061016.f53mt4wxcivlvhoa@shlinux89>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
 <20260903075940.2089367-2-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903075940.2089367-2-mehmet.fide@gmail.com>
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|AM9PR04MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecd58af-59b5-4955-3078-08df0e386dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|7416014|376014|366016|10067099003|4143699003|6133799003|3023799007|18002099003|22082099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ronz9Ll1JUpTw0SdkQXGb0yr03FaFT3zxG0+wyLuyeQZrZGx53I/NS61kMhij9mSiKS4By1hx+HSucshws2DbuyscZ+HKfjQWL4LHtnc5R3eScHkhiXGolSe6ChJffM+1J4a1FEcpLZPpJLoBrod17IO+lskQr44hVBSe3zv3B5wbUeePGDZLvjvts3a5nUT02K7fomFPovsh7B98tBP8UVbFsZYPPfp0G3gapNFb2lw3ns2fEsH7m25dMMgdy8xS2GlpQTrgnFHlW7zWU3Pqe+hEg9GrhR+CYDSBdEEk5UtKKmWV/o4T1uDFt16zQOSmlq94QLcWCkJjAWX2wDU9uWDkAAM5m8zrKPzyfIrxtv3szB2wtY/ddxruKIlWFtKWgw9POEvPOQRocRJBCWW3DqvN1MJ3+os+f4iHkjAbrM8hyPUgxVUTRKC/xKSI9VGK8Vp/hEedsQ1kv7sicKnmnqjesW5ZFGnK9THIBWTvYPfdJsDdcADjjjjCjuWS+0OSTAqdWkpv1YmJPvQWjXtQPaPaXn4153LYK9276VepCTLSMXKi7q/jAFYLQxEIBkp6XktCcbZzup7d1XmFO0kDTVWwqGUS/PJFrS1/tmelsARYAJTaF++aYMKQoa3Zu+kZi373mGP+FWuMcMLG7mo+Pvj6YGhFckR0lCmZzKBUR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(7416014)(376014)(366016)(10067099003)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6rZqUoi4zzdqNAlvYelDeB7TWdhIK0/Se1I78YDkpSWHaHRea4GMHDPZe1c?=
 =?us-ascii?Q?WF9cNJwPNmJuwl4fj4hakPIH/5Ct9u5BserhSskAf1lZopciV0E3efUsbYHN?=
 =?us-ascii?Q?GThKlvv6Txv4UW5NzovmtMzcSgw7DkXZbUsEJI+q4O/MKT9YA5gpSVPo4Tvj?=
 =?us-ascii?Q?wBKHVEHSG8FPKwtgBwT74klgr5FUj6R6fkjNRWwuXB+/r7tu0/eFDMW5v7lM?=
 =?us-ascii?Q?aYLsAnmd7aESdKPgePeqpdYQwJs70WanLE+mpQTErgvzTCTcN/cVFumQvCX7?=
 =?us-ascii?Q?NvEAUkZ5GZ6kHOEbmRyxGEsizqcJMnbWHhEmBq32e1V1ONq59bfm0c8u/SS6?=
 =?us-ascii?Q?EyFyEZLiDhcDppOckwbp/MnMJoIlE0OlNehqc6jzM18EOgc4RPzS7Xq+lmUr?=
 =?us-ascii?Q?JZdkn6ARHIXyXE4HYMALD/GSrJVcaPPoQAPfetajlTKi+nFLLgm6BcpRena/?=
 =?us-ascii?Q?UYCrHEdAACUk+UBmwVztrNYYa0siJSmLmfr+tTa+nb/gbwvVe5h1eLY9xNRV?=
 =?us-ascii?Q?WYgaLV7uSep57HiiNkT4Hdx6oZSbxQucVPmxuDpMWtVjYREBMCgWRrpupTKC?=
 =?us-ascii?Q?yUJqoaF72nkOCE8oJdm5xCnkKJ5r5vcC3zHJfJV5iHqKL8JPwdHpAqayQ6wh?=
 =?us-ascii?Q?U17cLYagFXTMfmB6CrBHjQekA0pgAuv/VBZlPiKR/OXHTzWf6l0cuVOU74+d?=
 =?us-ascii?Q?jLJ/6hfRRdlJByegBgmGLmQHrIKwWDMdbJFLJC6wwvPRvw8fWRb5ddIoxxfq?=
 =?us-ascii?Q?LOAuLq385EYjMYqOcYOaCSUBHyxCb+9cxvZK0pTXbkbdVDZSvN64o3VPjxpL?=
 =?us-ascii?Q?+ZXc/h+xrzbO92Y2VwPwpBxFjkyNO+98TOQxMzg9kBdSPKbQwOKcS6xMsd8N?=
 =?us-ascii?Q?0Z+u2kX1IncyHkH4pnzeLSxyv4brHnoiYwp3zQfQtCbsWW+vssumfVX8PiLg?=
 =?us-ascii?Q?VOF/zUzNRi2Tqa/f2OB/mXGczhDfMn9J5oErp+OU8GTh2kSnK0kJ8y5JrmlI?=
 =?us-ascii?Q?G7EwJZ1y4z1pncPB10gl3cnrQU7HHFWAcHqGbChddGxZIYQvazxiSRiclQJK?=
 =?us-ascii?Q?CgZkBTHLhWCOpS2ZXUv3l8wkNzwc4aCx1TasTsCo07AD/ikvD4dRyXLhIdDS?=
 =?us-ascii?Q?QsWf2SjCcFEcgzGnd7mJzOlZigXJsFB1eRk93u/di9fo4L/IIM76+dqTxfjc?=
 =?us-ascii?Q?BbgWibOQHs1qWA1qIa5LZqH8GsTWX+x1wjMFFc6VBPOwBH3JzJ38uRzbipQS?=
 =?us-ascii?Q?xkJVkDpmwuEYjUfqQvvraA/MbI1KEtGRXW85fVsX3FqAs8KEstfaerTofKSX?=
 =?us-ascii?Q?ZQmeHi1dC64ZFfo8eRQvYv9BAmp2JXUy8ZMz111IXexR5GF/E160P3VZP+w5?=
 =?us-ascii?Q?eoauBUz049L2B7ah6bTS3vbDrI8PpSgtCqG4Q4iPJhNlLNeANoj0jTSsAn0X?=
 =?us-ascii?Q?LpEZTKk7JIGpXK6mXp0bv+GVzAqu9tRnqbpgJbp4CG3OHacG4fwk4//tKz3P?=
 =?us-ascii?Q?Gz+IbrvcjyfjOKG9HdrH9GXuVNNOpCuzD5tvqFJgV9IhZIj4T/+s3WrpfMI0?=
 =?us-ascii?Q?6ONp31+itkK+F9mZRyIdFYWG4Dgj1ZanoK+xyYMkoBjaTXVE9amNEAKmYqXW?=
 =?us-ascii?Q?CbbWxivjFkTF3x+kp8VjLcu+H9ACZtsGIjGbQmpF/orArVClYtY8AxFG+ntY?=
 =?us-ascii?Q?P2kjuVBGaPgHr/E7PLD/3k9E0Yyq0AKwu5IiN6UcTKROD8Jy6Onpp20PbRb/?=
 =?us-ascii?Q?yn7WvQarm2lXCDMO5czfXme15wUuFvEhn1KDUuBHaEK3vduiAOzs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecd58af-59b5-4955-3078-08df0e386dec
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:06:04.1348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaezgkNT6e7dn1zOgyVKlhBWMXRrSauJAHcO9JjrPL6t/K3V6X72Xrsgyi38teVi/zgyqgMxbOSQBegWyUcpZx4gunvY0jIPjA9F4f2Hc3S74voNBrqTFlzit1Cc1z3+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8651

On Thu, Sep 03, 2026 at 09:59:38AM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The mmio pinconf get callback ignores which parameter was requested and
> returns the raw conf register, so a generic query through
> pinctrl_gpio_get_config() gets register bits back instead of the packed
> parameter it asked for.
> 
> Decode the requested parameter and answer PIN_CONFIG_OUTPUT_ENABLE and
> PIN_CONFIG_INPUT_ENABLE on SoCs that declare where those bits live in
> the pad register; Vybrid has OBE at bit 1 and IBE at bit 0. The answer
> is 0 with the bit value as the argument, which is what the
> pinctrl_gpio_get_config() users (gpio-by-pinctrl, and gpio-mmio in the
> next patch) expect. Other parameters and the SCU based SoCs, whose
> firmware call returns the raw pad value as well, get -ENOTSUPP; a pin
> the device tree never configured gets -EINVAL, as the raw helper already
> does, so a caller can tell "no answer for this pin" from "this
> controller never answers".
> 
> The only in-tree user of the raw register was the debugfs group dump,
> which called the callback with an uninitialized config; it now reads
> the register through its own helper, like the single pin dump already
> did.
> 
> The set callback is not touched: the fsl,pins binding hands it the raw
> pad register value and that stays the only thing it accepts. Nothing
> in-tree sends generic parameters to it on these SoCs; making it
> understand them is a separate change.
> 
> This gives gpio-mmio a way to read back the line direction on chips
> whose direction lives in the pin controller.

Since vf610 and imx7ulp/imx8ulp share one gpio driver(gpio-vf610.c), 
I double check the gpio driver, imx7ulp/imx8ulp has PDDR, so it will go
another path in mmio, not impacted by this patch. So even the pin config
register of imx7ulp/imx8ulp also include IBE/OBE, no need to add obe_mask/
ibe_mask as vf610.

Reviewed-by: Haibo Chen <haibo.chen@nxp.com>

Regards
Haibo Chen
> 
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c   | 54 +++++++++++++++++++++--
>  drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
>  drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
>  3 files changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 9a45b376d36f..f08ef52bf4f8 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -21,6 +21,7 @@
>  
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
>  
> @@ -291,8 +292,8 @@ struct pinmux_ops imx_pmx_ops = {
>  	.set_mux = imx_pmx_set,
>  };
>  
> -static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
> -				unsigned long *config)
> +static int imx_pinconf_get_raw_mmio(struct pinctrl_dev *pctldev,
> +				    unsigned int pin_id, unsigned long *config)
>  {
>  	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
>  	const struct imx_pinctrl_soc_info *info = ipctl->info;
> @@ -312,16 +313,61 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
>  	return 0;
>  }
>  
> +static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev,
> +				unsigned int pin_id, unsigned long *config)
> +{
> +	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct imx_pinctrl_soc_info *info = ipctl->info;
> +	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
> +	enum pin_config_param param = pinconf_to_config_param(*config);
> +	unsigned int mask;
> +	u32 raw;
> +
> +	switch (param) {
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		mask = info->obe_mask;
> +		break;
> +	case PIN_CONFIG_INPUT_ENABLE:
> +		mask = info->ibe_mask;
> +		break;
> +	default:
> +		mask = 0;
> +		break;
> +	}
> +
> +	if (!mask)
> +		return -ENOTSUPP;
> +	if (pin_reg->conf_reg == -1)
> +		return -EINVAL;
> +
> +	raw = readl(ipctl->base + pin_reg->conf_reg);
> +	*config = pinconf_to_config_packed(param, !!(raw & mask));
> +
> +	return 0;
> +}
> +
>  static int imx_pinconf_get(struct pinctrl_dev *pctldev,
>  			   unsigned pin_id, unsigned long *config)
>  {
>  	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
>  	const struct imx_pinctrl_soc_info *info = ipctl->info;
>  
> +	if (info->flags & IMX_USE_SCU)
> +		return -ENOTSUPP;
> +
> +	return imx_pinconf_get_mmio(pctldev, pin_id, config);
> +}
> +
> +static int imx_pinconf_get_raw(struct pinctrl_dev *pctldev,
> +			       unsigned int pin_id, unsigned long *config)
> +{
> +	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct imx_pinctrl_soc_info *info = ipctl->info;
> +
>  	if (info->flags & IMX_USE_SCU)
>  		return info->imx_pinconf_get(pctldev, pin_id, config);
>  	else
> -		return imx_pinconf_get_mmio(pctldev, pin_id, config);
> +		return imx_pinconf_get_raw_mmio(pctldev, pin_id, config);
>  }
>  
>  static int imx_pinconf_set_mmio(struct pinctrl_dev *pctldev,
> @@ -426,7 +472,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
>  		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
>  
>  		name = pin_get_name(pctldev, pin->pin);
> -		ret = imx_pinconf_get(pctldev, pin->pin, &config);
> +		ret = imx_pinconf_get_raw(pctldev, pin->pin, &config);
>  		if (ret)
>  			return;
>  		seq_printf(s, "  %s: 0x%lx\n", name, config);
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
> index f65ff45b4003..8fa7e1e2521d 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> @@ -91,6 +91,10 @@ struct imx_pinctrl_soc_info {
>  	unsigned int mux_mask;
>  	u8 mux_shift;
>  
> +	/* OBE/IBE bits in the conf register, 0 if the pad does not have them */
> +	unsigned int obe_mask;
> +	unsigned int ibe_mask;
> +
>  	int (*gpio_set_direction)(struct pinctrl_dev *pctldev,
>  				  struct pinctrl_gpio_range *range,
>  				  unsigned offset,
> diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctrl/freescale/pinctrl-vf610.c
> index 76a4bc0181a0..77d077618782 100644
> --- a/drivers/pinctrl/freescale/pinctrl-vf610.c
> +++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
> @@ -319,6 +319,8 @@ static const struct imx_pinctrl_soc_info vf610_pinctrl_info = {
>  	.gpio_set_direction = vf610_pmx_gpio_set_direction,
>  	.mux_mask = 0x700000,
>  	.mux_shift = 20,
> +	.obe_mask = 0x2,
> +	.ibe_mask = 0x1,
>  };
>  
>  static const struct of_device_id vf610_pinctrl_of_match[] = {
> -- 
> 2.54.0
> 
