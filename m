Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2733F49891F;
	Thu, 17 Sep 2026 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678968; cv=fail; b=uViLvdQGJmb1r3NQL+aDWLO0ukxkGNJg3PIfOmGJhS7tWdAp0YgbvRfmSqVdP+PGIFdr62/gzSQzei5UXkiiKq3gvkqgRTSD5g9XTOpxshmAZIzqQtqkZxnY84lLsQGNyVvnAKdIRcy7jwxXEhU9iVKrdxl2m5QswoipzFaAau0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678968; c=relaxed/simple;
	bh=IzUJOsLqL/CawR8cPWz0xO//L/gHNpI34yuf/C3R7Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dmfhaEbZ3u6aKubYg5ImpGipIkWALKdwuABhPM/zoxq3iFGe0dK7vX8DJ7RKtmRrz/9D1x6s1aB0w+3AaMmJZTdsERkk2NWGEY3L5LDvKOhz+qVIKUwLOALIVXWivavKo6mk0hDqwSza1amOxoQCjYrquSOdoEzH3bmfK2SvGyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gnFp4nkS; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gnFp4nkS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3xm3/rhmWgBJW5IevKGBH+nxAz9efpjwLaaF9rLSlsXY6fozxhhFPROEhTWxWBMavM817JqR6rTHJaGHV+lLVrAJLe11G+0GtrLOsVZ9fSrN3rL0icQ2OholHvbCUtvhmM84xQM2wWUgkT/HmRr/aE+6/6I6pJxjUDy9aoaP+BjoJVtHB4CTWyjwjDPXpDvCGSsW++U6sjk0Q00URtADG7FPkbosGXbdzAwN5u4fOlol3W0p9OlJmqnI0hise+KLQO3lvp1Vi3XwJe3ZDo3yh+l0uWHNrAQOeZMEI5EEYAwVesHhD+VOU4vcBALwrHZUqnYSNcbnUmkmWewJR6vwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/AkXFtkXJODP6l/P8JMsdIWOZof4oWyLDcB4HZweLo=;
 b=GYpJUHS1W7m5AiRlWv5NMzHaw9zikH4yr5xYidneEtlHKcm/8+XBW2MN82Vibj2vJ7Lm0Gs6Y/kHfkp8DuoINXgmeQgnyHJjdCYZMUxUl42ww8kK4610t/CQD6D1FVbuSG8DhoBA1emR1I1QEYAFfc4CnuWRUETqjtfJpb2vGDHtWioa67G6ojW/XZaU00DfZfSr9P28ke+T4Lkd2lfggNah+vg60TMHD6s54gDmy5Kd+2j25mGizkKW7OaI0EZhrDGKDRmR0SMUt6nSiURi6USqwt4Jlnez0M+wWXDxqb/Fw8jQKnnA4ROzvYU21o1BIw7M20RiqWYWLhcbyI62pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/AkXFtkXJODP6l/P8JMsdIWOZof4oWyLDcB4HZweLo=;
 b=gnFp4nkSS0eo0UD2/BX/uOqi2LphvRAge2A7OH+bXC5xQ/pwumBBod13jyJEoBPvhvHWVxxhXo3mmFgSZeULtjWOtoPIjzSxXx4jI3Ih8Sn7vh+ZhLiQ4Qme1WK2i5RCZq7sv5mNN8U3ATuEYOHagOhc1YlmxRoqMI+RGEHleMvqqiW4bV4Y17q1TEZ77t4UT8N5ymGpnMbqfk6UjP+4746ZyFMJUfuiMxjJZRhOh9sv/xX0rUVcxSzjLaw9FMs/zpoWNWxDVv6STqQX+xhkQmjq+eo+Tqkzh55p6QukdT2kekBIA8/19Iso215nCwdNMPRF5s+FcReWplXQVIn8YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11057.eurprd04.prod.outlook.com (2603:10a6:102:48f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 21:02:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 21:02:41 +0000
Date: Thu, 17 Sep 2026 17:02:34 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: linusw@kernel.org, Frank.Li@nxp.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pinctrl-generic-mux: Fix provider resource leak
 on re-parse
Message-ID: <aqxVas_FftE9-pTQ@lizhi-Precision-Tower-5810>
References: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: PH7PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:510:339::16) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11057:EE_
X-MS-Office365-Filtering-Correlation-Id: adba7bed-4727-41ab-f880-08df14ff02cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|19092799006|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5QcZHFa7B+yh90s9dGTI1PMLPp2yDciivR6iZ7p0Gqq+qUe9vfw0sO9YdagB3/QcF82X66BgwgRcZdZqs4HcucK249V9cIstiqbPFvr3pHUaoaqC2XvwaoMQCWZTcE07Imac1vZUpgJVfMR7s6Nas0opfB8LmYLSxU+nbuui9ptZBycrgj0PwxsykYsN5CBaQgW47nNLMEA18un1Rysd7bPwsVCzGGJEX3+nlRPWkjpvPALX7wIPaXZt8LVuPbe1V6DSJ4Ai+RqtxGjOUFqmLlmLAGHhlGa45TWfYWUailMmcZT8WLN+2Oog7TuW6fX35IHU5KIJ3Pi4UlkCRpem0mWsO2cnj7g1Uynyksk55Yqp+jEs5FBitj5onn8YbuGVJ+4zxIrFUfun3elzEEt9C0cds2QhoK0KbaSmkT/IsTm7Z5/AfqsfAfSEqXTDUfL/U0cZzJoDuvEc1WsbMpefvqN+WmcBI6kJfpldqpYzxlj3cuPZjSP1NyzUOxKfJverzILyLnZyHRu2d+va65aDE7B9mXjIJtMTMQBlETLZnQXq0cN4i2AhMo6froP1CxgBjmUaFAFKiFm1HaxEU+QoRskc9aLmf1iigSPhFSkOZ+YC6fkn5gXs/HRiy54sob2a3TjJydk1gLeIIwi/JckOsN/vQV1DFNegf5MN9luVHpE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ZgxtZY0b16HC8GHmWXwSPBzDSwlLcnOfp62WCo2Pw02tEANE1iOM0HfWjwB?=
 =?us-ascii?Q?3EwUAe4XACXHtLeLh06fsx9My5j0d6NJt7yI1qaZTmlgXV0PC9jMzeuyYce+?=
 =?us-ascii?Q?LES45Tyb4UOlFJOcsulJ0gOcGDHXBAWKL2S6OTTmTSTtiBOmWXpwONq07lgo?=
 =?us-ascii?Q?1dlpoYUEwfzG/GnZW9KvsR63Q+7n5Pk7DF+avr8897e4DNimiamFKtpnk5VS?=
 =?us-ascii?Q?WfhNMceLa4CwYuTimHXrSlCAS9ECo6U1qGfesuasB5QdLfNIpoJLMoyC2eU9?=
 =?us-ascii?Q?44PU3Xr88gjDVq8wM9mcXXmLk8lN1Dt2avJZMkm3AdzQPUFO1Obhnb+rZInS?=
 =?us-ascii?Q?Dl0cYN1f65En0gsmie8QWI3pFwxGzH4VPHCaAFHcMXhFVpdf79vG5tD8zaYr?=
 =?us-ascii?Q?IJ8apIO0uf+X5Ipt9cKPQGsavsESIMmBzKmQCVpg/ZliRhmFBRn+FgS/K3pa?=
 =?us-ascii?Q?eQB5RAL5fkkHy4kJQ06B31dVvRJWz4j7ccF4Im1TeeIYrBlhBekNEoqupxPS?=
 =?us-ascii?Q?lyp75kOjWpF2kF9DAAT1mkt3GZISht0cNe7EgKluHwyr8i5kxJg/Bv6/c2sj?=
 =?us-ascii?Q?1DBY1hCZPd4yPLSkAGFlKT5VtNhdg0Y+Aw5DHSLuvJaKI8+bGSVKg+skzcxG?=
 =?us-ascii?Q?X63Vk9jgcCLoxufI140/LF1t5RgyTPJBnlzUrlmelZmVVBf+ALzLRY3DY3Qr?=
 =?us-ascii?Q?B3A5Hso/va7poPlkSpJ//bhfisw+bdh1gAdndUehzpW8nnJdwowXfkBKzPZq?=
 =?us-ascii?Q?i/Hq10SU44+kRKApi9QDlPuU+7gNI+oE3ZriYd0E3NCxkqZRUd1ifs8tvZ4E?=
 =?us-ascii?Q?NFNX9rTiY8vjk3qL1SgV8lbhHVlADNSl0gf2c4Pi9uwsTzNRRx/nHLEFJvmj?=
 =?us-ascii?Q?sVmM5K4QZFqewdIpUY3xTqLhbFduCidUkngdPTVtI6k8oEG0Ub7r2yWPP5b7?=
 =?us-ascii?Q?F8C15nKaeP1SsS9NrjpaNIOkxoqhLD+lbSxewgyd07wlYcXKxlYoURvZjQJr?=
 =?us-ascii?Q?ghgwtMwT9x0fPLvz9v2fCGX4Y0PhQpy3VENe++r5kinz99cjGR5s9gj15XQE?=
 =?us-ascii?Q?aaI0Ut/8ELvsJSJf9TA/+bso57CjuWnmkG8w7n/5H5pOM7Gm3ijnBZ2ftKBp?=
 =?us-ascii?Q?qAsuoC2ogCfVVBMqnne5vxI0KqnURD6UL6ozcJh0KPXQ009cGrmXCxzVghbw?=
 =?us-ascii?Q?jBN3wvRcSSm3wFmYduxHyGbAbPlbmyY+flQY5BAccNJX2EcSco09kLLuv5KJ?=
 =?us-ascii?Q?/m1h9545V6gN0xXpHX0h202DEiKOlOFQmFD1MD7JSU8RvaQo0RAVc6en4kXO?=
 =?us-ascii?Q?OcvJ5X1hsrPtnN05yvI1lxgsdzcGjA4WbLMBTvfJmcr39Wpl5TccDjmCgjoO?=
 =?us-ascii?Q?VTZqkgNBSskJLvR31wWRkM5roSkk99KsW257hXqcW/5kn2U/Vd7cUBeT+tZm?=
 =?us-ascii?Q?BDBJETcz+53jLPq/bBUE20xLDYNVUJyEKlak6hQwtj8Gpy/eUtwANOzFWLDB?=
 =?us-ascii?Q?53+MHhKpcewl5Ba661iUlZGfwYXcYBZXQZBdCOfO16XkpyeHxSaZlWizm4Tz?=
 =?us-ascii?Q?Zi9mYCyOMrWjcXfjHlmDvOUTu6JLF8/0e24XRrIbL32f8JMP+xp18K2PpZjz?=
 =?us-ascii?Q?oKGVqfh6rn0XfTmREVfxE8feHN+Y+qVTp1vq4yCGPqu9VNJZqRqkQBs3V7X1?=
 =?us-ascii?Q?rMxIcP1DMp2bhYoy5tbY8gdbuvAU8NlP9Xpzqxx/ptJkBmz0tEVbZPkt48HS?=
 =?us-ascii?Q?nbc04fFSp72PNGDhLRLNUif6VPHyLnxND73Act0duP10SgL1auiS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adba7bed-4727-41ab-f880-08df14ff02cd
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:02:41.4916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+5p8UuL5Oa1K+E4cz5VuztjHvz8Cxpl1Wbq6J1DbzqCHqFUxgzZZQvuf3tN+ScsGdseyJEm5JFxti5y/nbqSMk/PCqp8ah3Bzf5e5sKdULlfDjaTnHGPvtmWVqe4v1c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11057

On Wed, Sep 16, 2026 at 12:04:35PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
...
>
> +static int mux_pinctrl_probe_dt(struct pinctrl_dev *pctldev,
> +				struct device_node *np)
> +{
> +	struct device *dev = pctldev->dev;
> +
> +	for_each_available_child_of_node_scoped(np, grp) {
> +		struct mux_pin_function *function;
> +		const char **group_names;
> +		int ret;
> +
> +		function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
> +		if (!function)
> +			return -ENOMEM;
> +
> +		group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
> +		if (!group_names)
> +			return -ENOMEM;
> +
> +		group_names[0] = grp->name;
> +
> +		function->mux_state = devm_mux_state_get_from_np(dev, NULL, grp);
> +		if (IS_ERR(function->mux_state))
> +			return dev_err_probe(dev, PTR_ERR(function->mux_state),
> +					     "failed to get mux-state for %pOFn\n",
> +					     grp);
> +
> +		ret = pinctrl_generic_add_group(pctldev, grp->name, NULL, 0, NULL);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add group %pOFn\n", grp);
> +
> +		ret = pinmux_generic_add_function(pctldev, grp->name, group_names,
> +						  1, function);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add function %pOFn\n", grp);
> +	}
> +
> +	return 0;
> +}

This method also works, slice difference, if some pin have not used by
consumer,  old method may save some memory.

leave to linus to decide which is better way, this one or add free() at
.dt_free_map()

Frank

> +
>  static const struct pinctrl_ops mux_pinctrl_ops = {
>  	.get_groups_count = pinctrl_generic_get_group_count,
>  	.get_group_name = pinctrl_generic_get_group_name,
> @@ -157,6 +189,10 @@ static int mux_pinctrl_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to register pinctrl.\n");
>
> +	ret = mux_pinctrl_probe_dt(mpctl->pctl, dev->of_node);
> +	if (ret)
> +		return ret;
> +
>  	ret = pinctrl_enable(mpctl->pctl);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to enable pinctrl.\n");
> --
> 2.50.1
>
