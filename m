Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345713C3F75;
	Thu,  8 Oct 2026 19:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489572; cv=fail; b=MkcQ8Lh5QQ1uEzlDFCeBhEjx/sGOm26+BTb82EEj4oYpVosA9/1XpWOwKilyIomKkJmTBVlEcvqs5pPgaTfUOkDmNYVfTQ7iCCTI0or5u/Y8kJGTkVkr5hyS1ZCtUcqrBFT4EWjJtMnrtwZMKewJR5ZMjFWvOaqM9a7FwMdR698=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489572; c=relaxed/simple;
	bh=oLMNwzJ7cABL9aqGvixCkIBlEz5nCYSS2zrzx9b/TIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GXbjhI3XTcPU8HyfDvVtW/iXiyvnSSnqurcHZosgIyyHPdooqxco9OjWdKbwTBYUpQ+JOCLNAGCJ8djCfY6mSEIFg2yIfQNK84a/Kft0zP7v5fP2BpNHOtEoqm8r3mWIGj8LEwCLn4/lvmlJTksrfJsLKxyTXe+9mazeg0BtPTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f3cpmVOH; arc=fail smtp.client-ip=52.101.70.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f3cpmVOH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjVUG/2c/HQXuqu7uFoAO8gylhAo97uokwMu51CRs6MZReSfJhMmtuR2rcNRCAYGdosZ8M/nI1d/PQEAxukneZ4X1FroxbrHbg4VsI30Vw9R/pcihUt7QtlfppV+BpJPhYXFz5o/kT5tcptBaRblDCk3dzXZCmQXwY84/tpWIkFAomwXh69jN89rpfMoKTnTGUmaKRG+lsehvf02mnsmadJki4J1BKNdULGe2jDB03S3sORrOC8eQz5Vk0bVKKPp1PkGViTBD5ed8TiGCJ8LRs9Al9SW94bwmndKqtjbCjs+7SXHksFU7gRGdbNJCx0frLhkEkyXJqdCDqUOkSR2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjiT9bhKQ/nUOKTKtgiudlN0IHF2YOeWUnlVngXvonM=;
 b=mpdYZUMyuYSyuEkIlO9RGKQhpvSpEnSc3TVnx1YhzLFoxAkuzI1sOZDkMnxsS1t041pj1aHOmOHVqMubzu0rRYhFo0reg1Ok1u0Va6oxrqfVJXx3oVkLcygZyVy6CZP15kgS//Im3dBi6o8Mor43z9DCWYwChU2Bow+VV5YxLFdHzmZGIA30h1fZBtLJoRsllW6Btz0TfrGFjKeBtlvKtSuA3sMk5cEzErqlvLA4IjLPHtl3xmBMLqKUYd/Mv9r6Tn9pue7hAbT8vFoKewRzlm0XKbrhQRhreqg6OUPTcdtn1V2cuIo/ej+Y9bg6pf6aIviGNEs+GBbR0OOzE1iTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjiT9bhKQ/nUOKTKtgiudlN0IHF2YOeWUnlVngXvonM=;
 b=f3cpmVOH01ZLvI6XkX7ggoAjvc+maC8bhsNNBIPwYPPhR6pFGppKyQtOyc66o4Rfq64RYMZahVhCxDAgFyqPGVwS87XKNrF842OGBxu9XtbwGcuOnMn6IuzVhO5+NkzryJMpTQIbeCvJbqUi7elQmKGKQfC/eOPX4CH7NTRyBKiI3WTdTm8Ezis87kr418C9LGrs++jsNMiBRVVXtUEq4UNfSBnWGOrKiDHxj5roWRRAi9JlHcLDGwLzEAmCX7EnSLi56c0W4xL6rP4n9AA9m1ZNmdcg63DHvAbRMD0/sr+qYGfXtwVCQgUzNlP7PymQw6VSKluV8YpFYU2O5UqVMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7103.eurprd04.prod.outlook.com (2603:10a6:800:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:59:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:59:26 +0000
Date: Thu, 8 Oct 2026 14:59:22 -0500
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
Subject: Re: [PATCH v4 02/10] gpio: mxc: fix wakeup_pads bit operations
Message-ID: <asf2GpEfE9aE7FQS@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-2-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-2-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 97356642-e789-43b1-e774-08df2576a81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|7416014|23010399003|366016|18002099003|10067099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	GbzlNGc1J5QeTb0MgWLP6OBtPQr6HBeCKo3qIWQmcJv3xwXL7b/8blhmnHuVJnxXDnCJPcFek/jt+Il/cFDnUH/ERAFj2AlKyOsBO3V9vBwf7N0j+tW3chLYYYP0x6pYbrn/Cz4ZqX7OUzkcGxrW07Obk019BkY6ws4e3YIIFvEZ1H/sNACCHhqjiEg97tzYFtSbb74r47Sd8au+BXbC71ZL3HWXu1eR8xymBQuu3s2jRJtiDGNJgc95Uyd7rO8xltjSJ/tC4zKGB1FWdsqdw93bJlStBad2wmFKlFQiVISgMNTOYQjGeLout6xr/wRwScoLab+JjMuecBrxJ5BddaJdUUW6SohN043RtKnTj4WhA4j3SX/NuD1GMdpkCygkIAX2q4qUfGdX8LHxH+8e5L9DtuaGfq1GnQZ5w1z17G2dZ5mePryKkJrHRyzCyoORmsuKLTh89tFasxtG1oBrqnMFPlxPRC698eqQND+HaU0/57B/y25naOTek6k4RiwkcQsaxH5d7QNY40FNqf0objEGj3BLHgzlmXoHbiRVMnLMvHJF0tVWKraRl57phBuxqYklqLJ1mWmkm25RtF6aSUDyTHsk3TNU2/spzXiaHBPhsUpbxJFV42MSRvIwQb5nLkpREWNubGczm58mTfJPmGN2dIHAz1+/muzYnMJlVc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(7416014)(23010399003)(366016)(18002099003)(10067099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gaYVv91cXNwHmZEuC1rMK8nIzdFhhqkgxug4KwDgXpg6ZupPW6UA6tk7VRay?=
 =?us-ascii?Q?FtlAGLhXp+fHe3o1pHtTotUKZpDvH062nj43ZrOE+avv58AkEW+1bJy0h41D?=
 =?us-ascii?Q?9hiuFv1LQC1GufGKg4l52908VZBSR9w34ZTXsWSKn9qcPTsdclcbjiRSCtHr?=
 =?us-ascii?Q?yXP351S0MvoBq1uzJWSloCnDYOJ+c9RS3IO6ZaBpWpGlFx1HckKPMOJPiHlf?=
 =?us-ascii?Q?BpTc/WKZz7dYAEbw7GQ9A0482Gz8uL2/ixfrNjzmKIZ/NZoG2ba52xvU5uD5?=
 =?us-ascii?Q?/i6KECc/xycTjhZ+F+OqMsASxEFVlOIyV25we9ISXGrcDW11gZfs8IviOuI1?=
 =?us-ascii?Q?R4RD03qLaoxKZelyMczmZ+AF1qdFHfGK0XiVvLPhy2/SHeLwHRbNeQ1Hjlnw?=
 =?us-ascii?Q?y0dPM208Y3Jl5776dfTlJsqYeFCFYc5xFdxqZ3ID3RXLsbiCxL9HUFjot1us?=
 =?us-ascii?Q?ePIqsKW5MHb2MkKC9DR3XpioMDpJQRN7GFoJw8xB7Pc8EIeBdK6tQTIEsoz4?=
 =?us-ascii?Q?l73kE5lxynHwRqZqVNKGqCAzBYoXF3/SVTNuRdZhhb7wFGYSo1S9kn102Mo+?=
 =?us-ascii?Q?XlZPQuiH1DxCrIpgxVmtDtzYRGo7lgX9Ugb7uG/w2TxF5+1oRPvRFQkSJSd+?=
 =?us-ascii?Q?fLAwAK61zScsON3pY0lzjC45s/VuQUbOBSD87Xm+PH7gPUsZ894V7NXrptF3?=
 =?us-ascii?Q?JN493YUIbYGKYH/0p9QmbdbcLYZfOTQn7oFkjTnuPOOQ9+RJr+r820rsXeEC?=
 =?us-ascii?Q?+MZg+78xXKm4Limx1QBrWlUjaA6iwgrcWJIRcyz/E71e5h+8KjDvJ0rquiKM?=
 =?us-ascii?Q?eUjk1Zk3N5KAfXz4k+A0pU8rAE6Ok9zsVrh437itIc99lhPU13zyFe+vXVx6?=
 =?us-ascii?Q?stFzexIh8gqFbt1NhzKqGAV44tg+DcvqjN4pT2bdN201lDg3kMDX2/A+wZzH?=
 =?us-ascii?Q?D7zwEppFYVOCK+N7pJyJz2kAs4hqTQFO4aqRn/tQroJ0EGqmKyokrlK5pRJG?=
 =?us-ascii?Q?Dhz5I4rEfjnFvpuseFy7t9gB7CyTUXwgZxttoC9ZajnQsXOHAtQFnO1p4YtD?=
 =?us-ascii?Q?llY9vDmuYgKzrixAfgQLwUBPF+1MQ1yRFrbStyiIXj0IbiwRS67kpQuhhKVW?=
 =?us-ascii?Q?sVUKiJf2yqlpWAJNdjvbc24rBIwKSklL8g1qqmzB9h36sdLLkJ0+UJJX+6Vk?=
 =?us-ascii?Q?/jIwCzyicxS19V4H85/YgvBSJ1td5CBNh789vAFYXL17TfazhGIeSmPfeXF8?=
 =?us-ascii?Q?Km7KaE4jdY0Na+BACrRDKVq9jQltJOn7JufxUdDmowzUOfBRppSavL0gVJyE?=
 =?us-ascii?Q?6jLW10L64iop9ELv+NOH24JndbVhyfVcYSvZiXfA3CyG/s4/kGqM+xFF620L?=
 =?us-ascii?Q?JKKMwhAIuJDpHy+0V2PCNPuNaEAEe70cR8pkMYgJqHpeT7OOmK2MNsoMqRmz?=
 =?us-ascii?Q?2nWgh0iQLru3bkH8qK7QxgRscwUG00D97Q3kx4two5SGJLsmaOCooTK2m3aj?=
 =?us-ascii?Q?xxBxiCUxCCXuOjcUvfjAuNR1+tcgIyQOm37b5eCDB9n1qPaYvk2y1QGasley?=
 =?us-ascii?Q?m4PEJjaaaOY8nY1GI83k0vz+xA6ck025gyC5yyvW9gdnDB2hgNB21DrRgVga?=
 =?us-ascii?Q?+hctLEGX3QwBfDxZyoe4kHIQHSrmseFIOt9vjMyoWi6keigy93dPrUWg104k?=
 =?us-ascii?Q?yiAiYIBcKZjdj3g963J2qreVoOUZsvFwdEOQKXwuWu1W+NkXXG/ynYcs63lf?=
 =?us-ascii?Q?4JfYGtQ/jGJ5wshrQTLtLMoq3061F8U=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97356642-e789-43b1-e774-08df2576a81a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:59:26.8429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkLaDYd66B+ESgdNvJQU7ph/ddlnMyj15TlPT4F5RLo/XmiUUuP/PHfJnvFepqt1ftG/26eHAZDOMytX6NXI7VotI5Vi6MBP+NT0L2SGfQlZu+q8gFae/QeNZg8XzNMP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7103

On Wed, Oct 07, 2026 at 06:44:17PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so we need to use atomic bitops when modifying
> wakeup_pads.

So Need to use atomic ..

>
> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup member.

is_pad_wakeup is not member, that's local variable. so should be

"corrupting the adjacent is_pad_wakeup local variable"

> Change wakeup_pads to unsigned long and reorder to avoid the overlap.

reorder can't "avoid the overlay"

Change "corrupting the adjacent is_pad_wakeup" already avoid the overlap.


>
> And the enable/disable path unconditionally sets/clears the wakeup_pads
> bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
> the bit on success.
>
> While at here, simplify the logic by consolidating into a single
> irq_set_irq_wake() call based on the enable parameter.

And use irq_set_irq_wake() simple code. this part need seperate patch.

Frank

>
> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index e05f276a50e8..627fff6f1886 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -71,8 +71,8 @@ struct mxc_gpio_port {
>  	u32 both_edges;
>  	struct mxc_gpio_reg_saved gpio_saved_reg;
>  	bool power_off;
> -	u32 wakeup_pads;
>  	bool is_pad_wakeup;
> +	unsigned long wakeup_pads;
>  	u32 pad_type[32];
>  	const struct mxc_gpio_hwdata *hwdata;
>  };
> @@ -325,21 +325,16 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
>  	u32 gpio_idx = d->hwirq;
>  	int ret;
>
> -	if (enable) {
> -		if (port->irq_high && (gpio_idx >= 16))
> -			ret = enable_irq_wake(port->irq_high);
> -		else
> -			ret = enable_irq_wake(port->irq);
> -		port->wakeup_pads |= BIT(gpio_idx);
> -	} else {
> -		if (port->irq_high && (gpio_idx >= 16))
> -			ret = disable_irq_wake(port->irq_high);
> -		else
> -			ret = disable_irq_wake(port->irq);
> -		port->wakeup_pads &= ~BIT(gpio_idx);
> -	}
> +	if (port->irq_high && (gpio_idx >= 16))
> +		ret = irq_set_irq_wake(port->irq_high, enable);
> +	else
> +		ret = irq_set_irq_wake(port->irq, enable);
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
