Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91193B6341
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889510; cv=fail; b=CO4aiwc5ZYbesaWIGx2mLHaXJ0wKVJjZit/4EmZXpGVnzeWO2dD01LSDuHzk+26XFs9aHdaCvpnMhqI/Ov72r3TXf9fpLNkw6tNUwAO4u5DBA8r1L+nce5NCwkw3BLsGGiBBl2YHWcGCpS81PRwprLb5+BYX5nIarLBJ7vCHzlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889510; c=relaxed/simple;
	bh=5iYnMgnzIioDCAMrGzBQM2hL3PaZih18/TZckdKzG8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GZrgcF3VeFTT5YpAsfLYgoPE/KaKvEULKoRDmbDIsrCeFlx4+AOLLWV/Q5FRVvK3ePW6q4sa1A18+jaVvOvxlXpafLjUG1woVYgFqA67s4EJzo8myLzpC61hdFc3ddLznVlKIPxDaKsH8FOdJpkXRWQbj/tQYAXs+Kzk+mL1h4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rh4Lubjw reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rh4Lubjw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+U2/aEWItOhp5cNZ2Igh0Yeg3qOWOzJL+3AbcRrbY5+lAbEJuVwk7Res8NNo5S6i/vD64+33OdjH4WiFo7gX8S+G/oZEhSdGBiUe4xjGVCxOpAUCnBxSmWLjbYyDSe4BlRyNQTXUzhV1sx6USOmXmBe5+FbBGXu/hFj7+IGbrx+Ie0IPLLu2eNzmP72b+FSx3IbHRhsy0u60SXaOpQ9S0z8vkr/dIztZejMx8G1O+/sBPCWaaNTwKt+6AXNBBdBdS1OnsoGjwPs5kARNbrZWiMF3ZY9eTEwD/IjkNjLM0PRiE/9dsv4xQyEHXGkmWIdfUEiAI19SRlwAu6YhIuMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJ6kk9VVrckqtWhbaKMrKbILO3azMjgLh2JGa9GmY0Y=;
 b=WbvdAN/7aVGTq2ZaX+3o5Jjf7WgBPrFupvHGLJfTzYQwe1t7uANbSacBXd+k46N3MF5maJAmzNHKs5xj9zavnxbLsprYPEJeRk3fE5Qy+SppVt26ObsXzr3b4k38LuGw0OZRDji7ZVgX4Ij5PuJ1Deu8vdVvxl+lxUreW0gqaplU/nvLTVHY8d+AmneH+LprbizHsyjt+u4IsmzATT6nDnhLHsyuqwOrdrVuFGwo71orSuOMgtiPH+//4HkjL6a+cpKpLPvM7o0NuiSbZWi5tZnPBsxfhlaFU5bR4NBYiYd4Y/MXhVE3ioEKhJv/L2TwoQBwOFqbULFrSnSfitmNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJ6kk9VVrckqtWhbaKMrKbILO3azMjgLh2JGa9GmY0Y=;
 b=Rh4LubjwrB4oocsn7epAAT3qd8lbOjYuxSEU9QnLltIAis4mxiFE/6+nBBH6eB1iVBnxDvWogAgb/nKlOWc8v11vEbY82u1bAO3wLVezE6jHGKCNUgHYTpG6zIj+BlrcjZasyPO/7DrX0kCG8bdcwvARbA0iEz5BlN+SOiaYUajkRJiXHeegxC3Ee91U1z+g7CrXGCLz9HkwhWIL26IjcyBeebICnxEmN7ePaG7XPddVgJlvQfwZxJJHIbh7it7Hfde0KS8fIStVIfVYhqCEQTrU/A09ghcOLeXDLQh8Gy1rx8YtR1Io6fXlrRyDFvm5aQjiVv1KAXh18P4DnjINLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MMZPR04MB327879.eurprd04.prod.outlook.com (2603:10a6:190:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 11:05:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 11:05:06 +0000
Date: Tue, 13 Oct 2026 19:09:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v7 2/4] gpio: mxc: fix both_edges bit operations
Message-ID: <as4Rdckv0hdCFBqd@shlinux89>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
 <20261013-gpio-mxc-cleanup-v7-2-c4d769587d3e@nxp.com>
 <sashiko-outbox-169085@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-169085@kernel.org>
X-ClientProxiedBy: SI2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:194::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MMZPR04MB327879:EE_
X-MS-Office365-Filtering-Correlation-Id: e7880a6e-df3c-48a3-c5b6-08df2919d69a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2HLsYsLkW7wFOfkyrVjUR1tonyAmUZsIijwSNnmyBArIIiUisQsKBCBt1o6ew+IfuznJzbFNRMEzkgyZ64gzWVzVs3BhnEKpavPJAVZLZ2kJ+UeuLjAVZEdgxoPzFYHUe7xo3W/N2047YWDWo+5X/pX/jWtL1368rDoOm+TzsQge+K5ddEo9LPh5nkt4HPAOf+6pdTWXEzIjd1TPX1bYaKMUUy0GjVoGmbkXR/Ub+498XJGKfYwEbAxTDTtzC17e+Z5rYP2KNKDv3hMo4dCXzcV5IaVIi5+KMCcchUC9Qd98OSAjtINHbpfpgCw1WUAubljrJScDlzdRdK++BnYgqMouOTIIGaL41ZyKrLW/H1N+8GkauY3ibnoluOZi7xrdaclIkcYXEPv36mrkrjE29fsMystNgDor68Vvu7PXJKRQuf/276KYsNr5xsybRN+Y9eTFl6+epMgrahz9bUboI8SEnwSB/PQjdHrbYLU0KInXqZmJzLcN++ZbE3MwBdXn4FpaF8ZjkWU3FYgRefMQx4PdS4K9SydnI9K0qAbdW5THxOeAEj28zO0GyQHACcZKEnv7oUMgXtKIxAnYq2oPKY9wiITIn9kEb5Ykw/3aHug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?orUGBvaLHFHdGy8Gx7ttcENu4OS97lDSGFlKQsFRJe0HQWvBDENOCy8Lxv?=
 =?iso-8859-1?Q?IpRKDQfRQOaO/tE7npmG61k00fUR1NTbZEScD9kWvOoZLI7sXrNiVDCQvO?=
 =?iso-8859-1?Q?gYs8tkudVexMebCZ3lnfqKyVgAxRl6r6+alOSIwHZ/dH6ZVyI9Kd1lxCro?=
 =?iso-8859-1?Q?wBDe8etJfEJ3l2V3hTZPg3n3ey64C+Oj8as7ojzeX1gFg2qQGaeonmvBun?=
 =?iso-8859-1?Q?F6vpF/8K+9J6CWtFpa2QTjabCBwA07WEyDA3a9zWMP65UA7+Sq8r43Wn5a?=
 =?iso-8859-1?Q?/PzwGSKD1J+0ptOIMzARe1dNrnLfTszGaz2Jc4Eer7lRENrWafShVD+os9?=
 =?iso-8859-1?Q?runTddEbshGr8tvLyneyrtKcAqYU83f0riDNjbEfSe0ki1gR3GMCuo6b6n?=
 =?iso-8859-1?Q?5JuSW/eQZL+6KCHw/+6JIaFHWi60j65J0R8cwOCLyfu99XFypsvEJNA0qd?=
 =?iso-8859-1?Q?zZqFccGG/Itvl2Th1OVFGxRzwUpG/UXOVDGS/w2X0raRWFnsi8qUxLuAgl?=
 =?iso-8859-1?Q?zIPnsvOEW3Dp1W+Xhw6HeQep2qaL5iKQTotuS+mScnCNiOs6RQ0eLDcluP?=
 =?iso-8859-1?Q?x3bq7QmAr9wWvW9pvYuaIzFnsqvIHdPsiGvMYA8i8ondrQDHKUsPe0pUHh?=
 =?iso-8859-1?Q?lt5603Pryb/mz8Qo3HuviwlRlcysqcYFECQ4BkGmJMQZf/GwpVK+YLfLXt?=
 =?iso-8859-1?Q?9OgNJKdPBdzVyR1RItTAet86uxTBoSXOJ8qp15cvvcRlXZJRcL0CU9OB/1?=
 =?iso-8859-1?Q?m9ElOnFEm77TtJizqwvSh1GJDX72cqbrockdjm1QllgrPeX4uSNZ7zMYD3?=
 =?iso-8859-1?Q?1Egb8QOJOFxHXmle2Yisvkr1TPra7OAHD+KW0ZU2H4JeVEEMu0IwSoFlmy?=
 =?iso-8859-1?Q?ZF6j/HNwuUSKFFifirZEv+dGjkaG5WnSS9dMFU1xkxXOF/vmeteizQvXQO?=
 =?iso-8859-1?Q?hhlAJN5497iMnEmIohymxAmcCzycqN/pa4PtuPWWa0t+qu4Hd0/CKzAjqd?=
 =?iso-8859-1?Q?UkwEfygpFErwApi9qE0h4wLBL/TMrIMs6w5aq/vUVJtb8gLNSnJGES7iRK?=
 =?iso-8859-1?Q?XMWSESS2L8dk6b/p0pVmvDe7BZRlSRYyCkBuFY13olacdcERJWCj8t5npn?=
 =?iso-8859-1?Q?GAIHn3UodcvrLrUDPtBztzxvFT5rxpQXpebDBEoYgX5tFRhPOihDl1sHoJ?=
 =?iso-8859-1?Q?843Q0nWYObNXJfhMApnPVMVNj2Ys3DpTeyogxbS2xgCMzkhdbe7UzdM8Gi?=
 =?iso-8859-1?Q?u/1rBDg2sY91V+O15b7IaTCZ7q7TnaGLI7JeGuPUL7prPUOSEwB6rjcnRT?=
 =?iso-8859-1?Q?C4oZBxjN7oJzePETtv71UcZqSS5nP88+XvwaIv33azR+nHw618iH+U5t1w?=
 =?iso-8859-1?Q?nyIgTMACfsBG6rycSWSoccEyZt0XoadyX4D2jZ1uBGyZtpzfDXZwo+3Cwz?=
 =?iso-8859-1?Q?9+KOI5lynPdDA2gLcIyTv5pF1//bQaXAEKeIaNOm/weE4Z6GuhwrjVYEPV?=
 =?iso-8859-1?Q?UHR2H5CIjFC097cpi9mPEXB86znr9IoftbocrKaL6y4EBszQ0jFzIftOuW?=
 =?iso-8859-1?Q?lTeQ2ZLk4qzjQAQiy31k9XGoen8I0ECI+uzQA/iMQpq01ieFsaBpAhlpBL?=
 =?iso-8859-1?Q?X7fLXcgKKiOhQWdQXI/aQDm4WPSZLHrAosrRKXuzBQ568Bqp72wl/n778q?=
 =?iso-8859-1?Q?c26IXJGEsQTkOFBS9UFBP43xmfr752E7mft0jJniAaahU06XwbTVfL4xq2?=
 =?iso-8859-1?Q?lW8mf3zQ8Ys+o1GrIaImFqJA4YmGp9GceWpSd3Phg8NoFO3T1D8NyC7owI?=
 =?iso-8859-1?Q?Tj6ZEuWMy0TPOiEizw3HhriayietbLeeabVevfk9UuwSYeIcWCl+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7880a6e-df3c-48a3-c5b6-08df2919d69a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:05:06.2592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7+zAar1z9dV0E5OXKdZwlu5OD2BwzqePqtmgW5uZ7BSANa/9BMYTKkyMCYGSpt7RsEZU7BGdDJ5K68uZDV5TlUJjDrmniD4Xux9U4LBT4JvG9BhKPtk03XwGCtelAyw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB327879

On Tue, Oct 13, 2026 at 06:26:06AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] gpio: state corruption on error path in gpio_set_irq_type()
>--
>
>commit 3d5872f9d45fab5b313d49ded5e6a9aacb019069
>Author: Peng Fan <peng.fan@nxp.com>
>
>gpio: mxc: fix both_edges bit operations
>
>This commit converts both_edges from u32 to unsigned long and uses atomic
>bitops to prevent concurrent updates from overwriting each other.
>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index e05f276a50e8d..7e17d7668980d 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>
>[ ... ]
>
>> @@ -168,7 +169,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>  	int edge;
>>  	void __iomem *reg = port->base;
>>  
>> -	port->both_edges &= ~(1 << gpio_idx);
>> +	clear_bit(gpio_idx, &port->both_edges);
>
>[Severity: Medium]
>If a caller requests an unsupported IRQ type, the switch statement later in
>this function falls through to the default case and returns -EINVAL:

This is false alarm. __irq_set_trigger() already guard, there is no chance
to 'return -EINVAL' here. The 'return -EINVAL' is just defensive code.

Regards
Peng

>
>	switch (type) {
>	...
>	default:
>		return -EINVAL;
>	}
>
>Could clearing both_edges early here leave the software state desynchronized
>from the hardware on this error path?
>
>If the hardware was previously configured for dual-edge interrupts, test_bit()
>in the IRQ handler will now return false, failing to flip the edge and
>potentially leading to a stuck IRQ line or interrupt storm.
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com?part=2
>
