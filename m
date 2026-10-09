Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0E45013AF;
	Fri,  9 Oct 2026 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571196; cv=fail; b=GCdcQiLiDhWm/lgxKOD29gkkjpiETVWxrei6fg2kgQCTZ9cX8teSjfL3C0puRYmTZXfrPaxq0UQMQXHpFd5wpEhG0HBXvFAC/kePdsd5kmJ38WqJ04x+dlWsK8HjIHOOpt/XD1Lzm2iglaW3XdfcDohwSEcxqP9pDn9QWZYSxyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571196; c=relaxed/simple;
	bh=IcOVKssQf8HOiYFBzl/kd26ii5JqlwgqiljVmt2z9LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fR2azBoVe7KEd9BOzSHjW42v8dVRtxYhR2fBvTQRjpcD7eYeTjrqglikzRZ07BvKDL2laTODvfQ4WvR1ekD7jn88s7+HarmT2VtJoeQJ3Tsjt7rz7XOWqXZ1XQGprIAuPn5s86r+OxoZFqc6D4Ds9nvcRqRjoy5obkKEy6SFaXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h3dalnVz; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h3dalnVz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOMI87LqhV3hgtxdNXPt0ylzMRCv7WPbqPS4pFs8XiQRQ7EcZyURwYDRJAxLiNT0mdZ0NNg4M9Ox4Juy2sXUw9To6C+sFX9HP6lOxIzF1oB9CU/cQd+WoRy8qhILKByBop8OVrEnITvqySUh5+hgdQrY8wwC88jQLdq9Z5gw54i9pbGDpUib5FuziYXtGRE+r5icCnR/oLxt02Gjzt/xU/KIFEuy/jGjhEzv6h7C7dJIseGan9VVwOD8aPiqsH0xtIEahWbhRjONH38K8cBwyO0raA5AS41Ermk7w885Q27171NNTtuHnwsX7T8iXVZQ6uXtz9iI7kRVYcbU//OIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwFnfL61ZnK5LyZ2k0BUFvUdBXo9sSFdgWn+4mMk+ew=;
 b=urU3MAgMXaNH2kU0k+4PqNoyxNwKGzAZx4txfBP9L7F9xKJh9wXkfus7c82nhD1p8iTxEZfRh3KWCVIun4XcyJeT8FtyZTir4GilQkf7OKE1m8iISzrOFSPfennidAWrHeAhx9WoK0/ye7+PBw401KXZ+hfONt+ypA4yugJicAzdVUrm1o9Z6ICxqa7UTgTGULCVjEOLyq+OaFYkRTnpvSVfJ5RtUbcX1YN5e1Xw8+LRk4DFTqGXgJ5E+hq0q05ye2UEe5k1LyE3ilBRiTilBEwjfztcSxAlf22tia+a7UHKmre1n+22DyrDWfIPzFfU4/sSNc9GT6IJ5ZLv5HSW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwFnfL61ZnK5LyZ2k0BUFvUdBXo9sSFdgWn+4mMk+ew=;
 b=h3dalnVz66gYDmjiRnCiKX0ddIGFz9mSnVOwWzAoEcKhz3vTvcwVUvdotksKMKW3qlPvfyNRXafH2TuYBNzsf5AHu9wnENpMsABcQAfJjTuSGha1v/J9GdZdWtxdAEZSfeKkE+XyNT6n6G21LchCzN8VAam8ux35UmhwrPvWHksTiGL5Hp0YVD8Kz8KwezKaseV+WPtBzlBWLp8ur9EZWppJ9CHCBCtxNsE6JLJ6Pkz6t+VmrsYxj6PHOZlAeKDBIQBDpvCEl55FBR995do5lU+0Y72buukkkNDQHvsB28TV7dTbcvUK7+YErvjIqhsXnvan2siK4RuHxeSGltHzfw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8327.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 9 Oct
 2026 18:39:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:39:50 +0000
Date: Fri, 9 Oct 2026 13:39:45 -0500
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
Subject: Re: [PATCH v5 04/13] gpio: mxc: simplify gpio_set_wake_irq
Message-ID: <ask08f-uTty42B3L@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-4-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-4-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 456c53f4-ce8c-4d8e-6a4f-08df2634b389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|19092799006|1800799024|376014|56012099006|22082099003|11063799006|4143699003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+pdKPAOGsll+y52PoV2C7ftoqtxXPvQ1ZvXF5WEgIBK13npbg59P+cexKuHBu5MzSfR23lixPTExe73Bgp3Vz3EkSWW9C7SSBsxzIGHmACB7GkYs+H7s6i9EmeoSw3AwnLILkR2wPRumgeXhvOLze+2J2Ukhl/XcN11Xk4O/C0h8KFqPNXxepaukYl2UQ+dtE95/A07l5hQ8aV/ZBZmrWqByJndY6oDp9YoEQsVeHO0RGFhd2d7UX0MJH6ot29fcvPfSIlMv4WAYYyBMljgQ0SKDzXpQ2l3mMQxtAIbSGjw9j1Y2TuqRRHAJFo2gy8w8zl/jQC2i5zGcouR49JkQtARhxi96biue51z05eJSN21zZkR/IzmnpiLajAoUFH46PyXrFWJubzzMn8QiyE66kFyjQnKGqJqpxkHGfwd43ZqK5W3qMwcqqVPwaKzfpNAweXAGqJDZssfxkSoX73eS0Gun0v3QEi34jxn5NzgWFcPUZ4zDf2zUzW/rswXE47IEwQqGf6O3SawbHZHwvkW0VFlpecRGzxb30rCow05DgAdvh7Zrk2dPk8m6ZzpybM/hyEHs3cFHdVLW4OOkI9duwcOKlde5yA3asIYL/g/oAQ/fzOcQIQg1dWiJd/0M7k0ZlbIH77hKhby1CKAgSzdaVdJ7PlDOwjx6zqb8XlRPPi0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(19092799006)(1800799024)(376014)(56012099006)(22082099003)(11063799006)(4143699003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FELeZf5Z6oq6GzVzcPR+XKjbGNYwxJ3j7CMf6E1gKeNaknn6f8cVrsglC2kf?=
 =?us-ascii?Q?1J2QuPtMwb+P+X+0LpC5ZGLcVTik10lNLowAWdzEWf0LsllArBA9z8+h3GVT?=
 =?us-ascii?Q?+zr2iWGmynD6VRYMj4d6KhkG2xYkVzRDGBIwCFUuYrmnX65CT1mm3zKJhoO1?=
 =?us-ascii?Q?k+L8ud05mrYA2khOKn+UUYDXhZ7QD/M2UfzRgcyISki28COCzkXdTia2KCdY?=
 =?us-ascii?Q?uxx5f4Q4YVv1cRYO6JQ1dUItnV+ZDQAw9D/YwaaKjUXdyeL6wy5uH/0C4Ld2?=
 =?us-ascii?Q?nHhcyv+C03tFi3bIKghNPHt8Ky6mar14Wy/V3OsSYYzizCiV0v/2hS0TfTEk?=
 =?us-ascii?Q?nBh2fg52hA3zIWI2ho5iBYo8vxhsRfqRv3FZ1GM+aOG9t8QxGGQtCPKQEAMw?=
 =?us-ascii?Q?FqWk0P8dP/gZUTWe1N+H6l4Pakh4BQAqKJifSF0sGh3TorQwtNpbzQH2q9dt?=
 =?us-ascii?Q?9iwuPh189QAofvoTQw8TL7mgoxbjkK9tXOWFvePyNOyCZsAHBxYXZwmevfx7?=
 =?us-ascii?Q?nnTg0JayjUJOHQWhjO+xggRoYH4M1Cw4V1B/MoWyR28D9BoMX+nw54bECBDZ?=
 =?us-ascii?Q?eYL1Esx5oQ0+6gPzvf72yjZtz1esrod1Mmz9TJFehldYdM8xcp8+bKKEFhUx?=
 =?us-ascii?Q?1mFaZU8ET/Rh/cCMXND68FZlrbutLMSPNV2D7MV8QmriUDWLBsHPRHvQ1KBP?=
 =?us-ascii?Q?/J2GIXJoXhkQbIyGtFmM/O/f6NcrEMDP4BA3r/u+1vIJzOBrn1ztfGY2Z0Vt?=
 =?us-ascii?Q?9AuBJ7bEFqiLyk0tOOXM5yg01gDzbeFRs2U1OJWVA9U1CXVPKugmc/GbXWej?=
 =?us-ascii?Q?+UNdwhzLt73Gnev9KOi5ZHjwL5l7UHDswsUKO+SPHm1fA4xdW492zHgtBhMr?=
 =?us-ascii?Q?VUpS7u+LjaWZ5715eOoi5PJqmKBV3x1wMbDyETfoyB/C81ds1plEn60HXRKf?=
 =?us-ascii?Q?RPFkovC3/u+Vlin9HpJfG+/jncPR6fnJLExtiHrTu6cYkRlm0xgjIXS0Scwu?=
 =?us-ascii?Q?gSxNw9iaLXYDTPiIEPu9AdoBE68BN8pj9DfGBrzBw4vOALpEd0Qokq19oOWj?=
 =?us-ascii?Q?c8VJ/AZxL1n1rbuE/bhzb6x5pNMemapBwCmXKbECz9reeY5Ilow1aDsi64hR?=
 =?us-ascii?Q?fCviqUmjxWrCKdVdNYNeCNhUYh0veFBArI8av2WGNstK98pT5MEK+II1NF9f?=
 =?us-ascii?Q?Y/Xs1OfO8c7xdnJUHeydmjNEiRb6hAQSQYwdHhWYB8PUVv2WYz2gp68QoJMy?=
 =?us-ascii?Q?rN3wj8TPpkaNUtIBxRqUtCMZQaxmB+Gwk2VRIUgakYaQG6VOgJGZPIqfcaEr?=
 =?us-ascii?Q?vZY7eIkaOmaMY+H8Cq9kaXkxJbpTriIquyRtp+AVjl02NN5KQm+LZyNLDKgZ?=
 =?us-ascii?Q?pgAh23/Km1ETxFPYwzB7YHgT9Ou1ItG8i4dJHnkZHr/4WvP0Y9nli8NfvLYs?=
 =?us-ascii?Q?yde+W7OVdmySRcjtkDC9Lh0crSpYyhqEu8NkryFIGoU3jYuA+C8vKW02YoaE?=
 =?us-ascii?Q?QalJ/IqBJBZgjeaPxxDLoO0tSRauKEk5E/HFV2MCb5iqQ9oV4JXZojMyvVTL?=
 =?us-ascii?Q?T0WB7gO+rJxctgc3uJOR+LVSmxCr9XN9Tw6sW6P6PP3nEpmcY1b8WfzYbnlr?=
 =?us-ascii?Q?4nTDmwPAhI1fmLrVDGRlpdGCsnWhFpnf4AeRBgL9r37spULXWoYxNUjCfC5a?=
 =?us-ascii?Q?RZWdM2KWnRrg9TM2kt3rS5akn24Rq0dgarO3dPK7/5VxewoMPqeuY+xsWs9V?=
 =?us-ascii?Q?bynO8AIHQx57+AY4Pye+PEoAuO53NlP9y54wtTS84TfieeUZuE4r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 456c53f4-ce8c-4d8e-6a4f-08df2634b389
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:39:50.4069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0G8ODWUVMV7IpinEtH5nF+26wEBijiOH0cN8D0g40yyQCKC89HV6But5FkInG5YfPfu5QKk7M6NzOWfPXX6anIBjwQRjYR/ehnSC0sGFKg1fyTre1/Ih8PLgHyj+etz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8327

On Sat, Oct 10, 2026 at 02:05:25AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>

subject: need () after  gpio_set_wake_irq

gpio: mxc: Use irq_set_irq_wake() to simplify code

>
> Simplify the logic by consolidating into a single irq_set_irq_wake()
> call based on the enable parameter.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 29396135717a..c921534aafc2 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -325,17 +325,10 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
>  	u32 gpio_idx = d->hwirq;
>  	int ret;
>
> -	if (enable) {
> -		if (port->irq_high && (gpio_idx >= 16))
> -			ret = enable_irq_wake(port->irq_high);
> -		else
> -			ret = enable_irq_wake(port->irq);
> -	} else {
> -		if (port->irq_high && (gpio_idx >= 16))
> -			ret = disable_irq_wake(port->irq_high);
> -		else
> -			ret = disable_irq_wake(port->irq);
> -	}
> +	if (port->irq_high && (gpio_idx >= 16))
> +		ret = irq_set_irq_wake(port->irq_high, enable);
> +	else
> +		ret = irq_set_irq_wake(port->irq, enable);
>  	if (ret)
>  		return ret;
>
>
> --
> 2.51.0
>
>
