Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5A64FC8D1;
	Fri,  9 Oct 2026 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570965; cv=fail; b=nM9L20nwuNhbNT/1pfbtHGJ/p4in9EmL5viKJrywU07RWVcwcbq82O8Nnp/bnJJhkABOqxl0+G9y4P288m2a6kmMy2dFTqPxl2GzJ8zGrVg4IhxZuspXVfmm1xaRdUwpuPxNEKpVzBrlPIc1OPjnb7uq3mbaifGCxRxpWka/7Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570965; c=relaxed/simple;
	bh=U10YLeJQo85pWQ3dTcB48NUAkCybe5naDhHiEzsB+Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MWxxLFw/B1mb/GWPc4mTtxeJwpPF5eQE08VmuqT3B3KzhSth76R+3ylilaupnthGW60BzKJ/y18dKsQviydG09kuWHkPBWT1TJgb6RjFruBh/hV7KAPAFLc3UNuP+fTanhmfUzpMvl6UgDZ8qKQzJeeJRv5l3pd3cVHWBEw5Gtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z1FiP5D6; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z1FiP5D6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au4OBtoFttlR9hXpeHqcvcq80b1MJfqZFy1o33bqc5uD8ZFtKQAfYYKRagFGmZPsafMgDFc/UighIVKgVBVXJMpfaCUNTRJVjQdL3dK0BLTSFzyU59NGdlKkZ9Yz94Vst+S2E9/fshjAqqk16A+Y0v2BnkHFKWrDcN8eVkIClyYVbN9DZs2GR5FpLGn3GshabV0jmKqHvVVF37mhJFHObtwz2fONVq6ZkyGR4Hirif5D0HzHwOik252jnL6iCIAaBrt7p0BrlRerVeu1zn2htGeuIvX1h2zVCab/ohzaOytZIHpEdMExqmjDzpOaeWFM7H/v29FLho5iBDZPvpF5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdAzAVJjnoAkEQ9cNose7dn5bvb6yfiJzFHoBgI5GEA=;
 b=mljaB7yyKfrPYFMyFz3Smy8jKCqtZaTBSitWpheb3BrFu1ia2RK0ZGhQ2x955SwsnLtRSlALJlAsfaTE2Y8M0+aIY6a7lFrh3IjtRQrpR5yLACUXHHZJT9dE3mzz5OOky+o3YpA6Y9f2UiX3Tw+8I7+dU/JQQB53OoDHIDR3LDLs2v2rXdkWHsXQrd0yrJVO07ruMAqwlA9Nl4kLZf583TRBX9cWmCcrsActnDoHCJhD4OABr2qeGjU3EoMbC2SBd9+plMZhQF9GJbWD1di7zL9b7F8tsPHMQtrRBHWEy63MMkRjB53DlailQh+L3ZhvF+A1fcDBDlJoUh49PB3GaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdAzAVJjnoAkEQ9cNose7dn5bvb6yfiJzFHoBgI5GEA=;
 b=Z1FiP5D6G0vzaJ61zJj16nNICXjh5+0aeAWeg3qx7cbCMNWw7eZT4upGOtsPUko6VMb5hvCNaJXKX/2yDbq1UFW+/TzyFmpMam0kioXZ9XeK8M62tk5jFY2+K3c6Y/geMWrEJXywJ3jja7ZgHI//IxS7EU6//aaePB0he3GpJ8cstv5wmiOn5Hxidpkm5lFbwdlh7tFoyTkOyuNax19blLgis5Nxr4YlCyy75pxtYkarXkVo4Wg9LMaMtK+z/xo/622r3dHhHR31zx+qcPNwlAdKp0f6iHetR3qTRZFVMGgY6rrAwldhwuQt6ktVkrS6tZx4Gb5kqL2HWUAvnmlfTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8534.eurprd04.prod.outlook.com (2603:10a6:10:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:36:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:36:00 +0000
Date: Fri, 9 Oct 2026 13:35:55 -0500
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
Subject: Re: [PATCH v5 03/13] gpio: mxc: fix wakeup_pads bit operations
Message-ID: <ask0Czj69yifyc6i@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-3-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-3-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: AS4P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: da54c9af-378d-4b66-84e9-08df26342a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|19092799006|1800799024|366016|56012099006|4143699003|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fnrPztzZtol2Bq8K7gchYEt9IV6DtBUZqxJE+LHPzh+EepQzccyr8uoJpKelVn7jl4jtlOrmdcDJfkhbYoWuO5t1sB1EnNQPS7ZtIq5WeMmg5rUBIHLNLXoHu2l39+fCmvRyGLLKXI852yrzqsjb5C2SocShVodO1RKvsTF22SRuVCcblJcUb/4UHmM4roS1A5BzfRb8ZnHJ0IXQ+JsM8CklNTa23QESBvPPCTfolsG3DFisaGo1EB1JVcVZcIvCrR6w5WK3qcS3NoU4XM8SB1QIigqx+fSFEw8ceFI56OUOF5XdQUX1mAaBx1P77AXMm5kciVMD/9PsKda7A3z2/jX1FgCkhPWHsBbx0sV+nyi7TujFRBIN37FmKFLxlbA0GidojgzvL6NjLS2supx/qrK9Cwv90Vnd3xjL8AKmURhtypNQ+6Ohp7OW+3ID3R7Gs3KgPhGiWi8eujoia6sDGmicZ8m1vxz8l+iaKsxLOJKUx0QQgKajHzinO11XW4VQWUHIpPuwp0amwaqgj6tBH3tnPR+0D3Z54HC4KD31AKVj9y4Ee9Rz9RTXqKWxmXKtwcflSU0vjP8G8Why6HP//5h7yrWRavZ8wbbVFRk2dYKwPONL647eBf5UkNgcxUTy5eVm/6wjEZAmhecgtCwqINPp8BW0TPejg9x/zgNCtaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(19092799006)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yZVegkqZDmMOnKwsiK/uiyjY/17Wr4Ph1IK54HD+RmI9CVltUk2Kt/alMW8B?=
 =?us-ascii?Q?Jb0h5jQWGdFqDmu6beWu+zLuXOA+3/L8qHuC/Mv1ijiGB5hUOawMoXtt3dBK?=
 =?us-ascii?Q?k3ao7hL3b4BgLobUx4f5CEI33b/YAk+cPcjvKu/9+Fq2iq3urkwW1/QD0Ruu?=
 =?us-ascii?Q?GQAvd3lR/lMyH+blAzMi+3IxSdxO8f5P5mxu5HnvW/HXZrGlqByDzCmlHa9r?=
 =?us-ascii?Q?1bhgXmZnacq4GZN/NhKVdF2GojRc4aQTD24E5SqSWDmFcymNL/8n6/XLX3UL?=
 =?us-ascii?Q?ni++5V6VhGchT7RkrwXCwA1naSnHdbSaDh8Cqi/cce+ONDDfUnOWocbvuWIA?=
 =?us-ascii?Q?gkJXT+CdE/O9HcWq7rBrJEPDPTkphjUAM0biHamqMK0xy81RMEcgVzbS6din?=
 =?us-ascii?Q?2+PbbixkwNtESv0Xq91uQOkvTox2855gdSFKOLIMfC/nNwRwPJboUDqRjUjF?=
 =?us-ascii?Q?M84tHgiXadAODCiz+iW7eDYTzJqWq0DIwW23RKSvVT3j0GuRGVgnIBHvcHtn?=
 =?us-ascii?Q?dThuqZIQ/3+2HbIZ9pIVeVL54OB/q6P1sIQIIK34w1JDR5SoLL7knU2l9RpC?=
 =?us-ascii?Q?c0LLaQ+Wjrf9FRSY0JPMOIadoTiFc972lKStZKJa5GSQCnomUpslzUd6JQwr?=
 =?us-ascii?Q?7EnGcQzKGZgY2Y8ioyoVsXeb6Zva3TpuY2aHFoYmCipKI4Tj+FKxA/eRVZvC?=
 =?us-ascii?Q?XiYNrLGzwrEr3uTfStNrrAyJKV/ISN+TufJTA1wLTr7G3z+2KVlaRgGOv7JQ?=
 =?us-ascii?Q?YMoRBu0n+pLQJ6sVDBiBIQ7rUYArfJf2NyErLBkH2HVkRdTVXuWuGyGyc0vt?=
 =?us-ascii?Q?Nouy+obh7FnLotu9LnDkCxIXzHmczPGpsaw2WiUqmYJ39zEJghGlljnbBBB0?=
 =?us-ascii?Q?ysVDjC5/j3ZLynpSGBpfzY01Osw15JecsnocOTdiojacGrEzZAQKdf1y0vuI?=
 =?us-ascii?Q?1fZ+kYM9vmFfL134+gnp4rT7XyWNCn1vEbXH9lN8RyyTy9kAIjfI9dnNRBzv?=
 =?us-ascii?Q?3xcmlpQY4hwOFO8NhVfEXYBK0iv1lPXH89UNTTiQ3IlqjEdVEhATT4oiSYkY?=
 =?us-ascii?Q?KWcyv30tvOwzsBMXnfn7Qh4rWHpCLsZZT+daNp1VqEjWFYnSGgCB02IObDst?=
 =?us-ascii?Q?Pjr8AMjLD8/rOdfV3X4+qBwwQlN6a0qz1skJYX5yY+1o0RQ6DzHLSmJQOm7z?=
 =?us-ascii?Q?goH7YzHhLUVs/MODNZZteiwW4XEl3RVsKbi38JOmYIojX2JVkD/baqjaYtOR?=
 =?us-ascii?Q?KJsrrH9Ffwk+IK+Gn0YJP9R+BSYI2HBIi1tcywk82l4oCCwBHjEqPbL70S/q?=
 =?us-ascii?Q?I7d412jhoSupFHozvR7IB2PgRr7laR+y+px1IarBi+sBwk9ypURSwalQJ7XB?=
 =?us-ascii?Q?eZhYqAgdm2oDAdKh6mh+1hqe4cH5th1CzhH0L/ODPp0mw6vgM5kTXQCtI+HD?=
 =?us-ascii?Q?+tTpOHVTDhf8cdZZk9ytplKZ5+O7dTDSs4vnpA1n90iAHtZ/EAhSg2eX9BCu?=
 =?us-ascii?Q?qHimc4BmUs8j6f7S5JzjSNVqsosXAObekXp4ihqFzH7KNmTFfgNUs5xb1utu?=
 =?us-ascii?Q?8TcMiHubWamqrqH1SEgTENKuxpylO64HTZ4yZrs197NZwiR+zLCSsoU6KRFE?=
 =?us-ascii?Q?SSgMCa4gcymB2AW/FjTbEbJAlagQT0BoUexiAmnfgtAfXGqxUm3hqlwUwzwR?=
 =?us-ascii?Q?8emb8fMHCv1P1E++J+5ypnTukThqSkNVDK2oQCSAzAgyHJQM42FaUAu9BWMb?=
 =?us-ascii?Q?HOYffbTa/9MU6Uk2mguVcp3HOMnh7JoecXAiG1MhJWULrwY9ondP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da54c9af-378d-4b66-84e9-08df26342a36
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:35:59.9922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vt0vADktcMs/xxfJHZLM/dEqeBwFLqBm1eeFirSdQjA1QrcErheme151R1VA7UvYT7+EkwnIxEvrm7V5FmmYmiQSb0fLd5u5MvgL1/bEL1SKGyjgM48jt2HIek/IQ6Er
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8534

On Sat, Oct 10, 2026 at 02:05:24AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so use atomic bitops when modifying wakeup_pads.
>
> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> wakeup_pads to unsigned long and reorder to avoid wasting words.
>
> And the enable/disable path unconditionally sets/clears the wakeup_pads

Nit:  And fix the enable/disable ....

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
> the bit on success.
>
> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 2f83a0f076bf..29396135717a 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -71,8 +71,8 @@ struct mxc_gpio_port {
>  	unsigned long both_edges;
>  	struct mxc_gpio_reg_saved gpio_saved_reg;
>  	bool power_off;
> -	u32 wakeup_pads;
>  	bool is_pad_wakeup;
> +	unsigned long wakeup_pads;
>  	u32 pad_type[32];
>  	const struct mxc_gpio_hwdata *hwdata;
>  };
> @@ -330,16 +330,18 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
>  			ret = enable_irq_wake(port->irq_high);
>  		else
>  			ret = enable_irq_wake(port->irq);
> -		port->wakeup_pads |= BIT(gpio_idx);
>  	} else {
>  		if (port->irq_high && (gpio_idx >= 16))
>  			ret = disable_irq_wake(port->irq_high);
>  		else
>  			ret = disable_irq_wake(port->irq);
> -		port->wakeup_pads &= ~BIT(gpio_idx);
>  	}
> +	if (ret)
> +		return ret;
>
> -	return ret;
> +	assign_bit(gpio_idx, &port->wakeup_pads, enable);
> +
> +	return 0;
>  }
>
>  static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
>
> --
> 2.51.0
>
>
