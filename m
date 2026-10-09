Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA952475CF
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 02:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512905; cv=fail; b=OBpuKnbflEJ2AtTCMXMdQ4TpQtieeN4sQ/XoCQv2cL34N1TH9TdYGycmHYPLRhwvgicmPUc6f3r41mgz29aaZAeH5gWWokDLM2JLYN/288C/Bzz+vZwn6flsnS3j//rRTBrFbBqGbDSSirxFpHx9cADMSnWaVm2EFKUsmSBSvEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512905; c=relaxed/simple;
	bh=nbfAo1hkgWaSC5QlvEKREMwjvn1gWK5pV+pWLTLJV/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ed1+HE9u/ApimofzrCV4ZAahqi3bvGejVLNHY9iMa1EE1lPrptSAS6uF9/eQ+o33/2NeUYvdKyEKs3SySEGrETagkjW3r8b/ewJjWzUxd+cDtfOodR3WbOmKbwkIHPxBbUEUkkWPdlflZ9RhjByv/kFVpQS0pS2St1xn0/SJTr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SMjyyQ2Z reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SMjyyQ2Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CM5h0ecSt2aJLzUhDtr7bfqo86cLkgNU7uI3S+eZ0kdiMbt4QwbN7hBO7ljSneCMXYAzO6z7cOlY/xT/zdxTRxFbY8zIN9R68uPooL+bFvYUX393VjCIwrczqmVsZnF2U+YyQlztOEd67kJtDh6Ig7MeDiuKWsTRAlDYgSv8uz0zf/GG5b+CSc1CK5iWfXG6fZuh3/LCqPZzwTNBb5YizQuMK2Fc8whQnOnUl7zh1C0bxvGCBW9ki6pDJcMFtsHFSrD8tyITf0kKxeweODrt3xGVfXvttFCv/xP0GRP7c8cYjhvtiJgsNmMvLGfL09p1k7TyTtWFD9QYkXMCs/51tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlPMwcivZjWfXi1/1ENQaO3XF06zP0KqUVenmKD7fm8=;
 b=S64Wa0v8E1JZLtW6AAGbEAmEsXjizk/FeHuAiJBR3BkN8IDTDeeZBS84ByctRKp0RFZluylde5WbTiYUf4rHQ+ctZmaxp7W8V8aC/APZe2nlGvOW6xhZD1iN4ApJMrczFYognIIhW2bF4IrnLJZ8Wh+uh40XkP46nHis1Y/yDXGt2sx+r3CCzYhcr9u8ff+a+Y+OW63QL426mqmsjUf5pQjDEp0XUKM3Si07Oj9FEw6jmf/1OVWPhvmF69hTfosn/YqAagbfgngqrrveEhL7gNwyZTL9KNRBoYVxupNKG81c0zsYGkhTMo12Ycc5f8fbhiCzvxschcvxL4T1P9Sj9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlPMwcivZjWfXi1/1ENQaO3XF06zP0KqUVenmKD7fm8=;
 b=SMjyyQ2ZxnB2BgX7ys8vzXiWCRhzTTDsmCUml/Ku43hyOBFQAWMWDrXYIX9ZQlpujCjHTyvandQTodjyc/wR1xwv29lKm7QlgJHwFUOxinigL5XfeVPrLZKD43gc3WgeT4BIfA3+rvaA97XDn6QZ+efsu70JtWOMoWi470uEScI/L6364RCRxgJMOQ+0yS0VjVt4NIEugitj8YjdVaoLIK/f6pgo9//OdI2MbtOObVY/X1UpOx5NNgjgg5RMH4KOneurHjUDQ8oC4HPkajClClTXNar1NI5rvJdrVARhJ8II6vIxjM5iRTWHesqzsYlXs7Nzom/mVUKX2jhlWleAtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7269.eurprd04.prod.outlook.com (2603:10a6:10:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 02:28:08 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 02:28:08 +0000
Date: Fri, 9 Oct 2026 10:32:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 10/10] gpio: mxc: use BIT() macro for single-bit
 operations
Message-ID: <ashSSVN6mxvzy0JO@shlinux89>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-10-c9f5a8b50df9@nxp.com>
 <sashiko-outbox-162890@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-162890@kernel.org>
X-ClientProxiedBy: MA5P287CA0230.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBAPR04MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4183e4-afe3-424f-9e0d-08df25acf4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+PC7lqgzxCDMYFONL4QlMX70tZ8T+cQxJGXjjpNGLO4iyRdHFhTJ73rpAslN9KxxRLqzc4dlq6UqT1ma8BaAsq7j3uRC6jZ7LJ4yRXr71CLyrpMDbcssE/cuOwRME+XPOjjrweGH4se4UG2KZG7tptznmeU58lUWsxSCvhAsRpVO+CZ0V9nLQ8SkoI9NXNSWQeoDGyDkHsfOHIoCbfgDo7WSWWM/rmiwnYaJ2Fdm5XyJyQhWKpdC6DbY0XgOLm9lpwDG4+GMMsWxqyyRPVF9J7skIWfz2q/lk6ZVs/30AwQTpUzbcUoGw86cBmAXg9GPba6fcjun7ZEMOX1xz2WS9QJ/FIbbo5W0icWZjrk3Mc7IV9RyJoiO60O1OMlo2dlEcx/BMnZxdzjPYc/JD3hOzrlvPX/CABfuLYaUMAsEvChA8deS1ppdTBAbz9uxVGE6/SxJuBZ6qm9vHM1hFTikvRvaQhG/gTcvVNtvmDSKyaNtnE7pv/NL9tD5AQZ6TtdhKHxiiFXCdXJeoCN8wdwZQ4mqgTTgfyuVE6cH6egxT2whktIwGWOGpQNUZiPAtaZyGUGZZn5L/bFVbT1a4m88NF+6s7a8WHAF3/HPqF2JQ/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?p20XKlWgJx6rTtF7CEQu0h8ScOX6rmURyqIPz6TULuO08h6Vvbv5+6VmWo?=
 =?iso-8859-1?Q?QwJdQmEselg3AJnSh+ysvaL5hjPAGQ0fsYhZtdRgeLSxbz1UJZwt4ux6WB?=
 =?iso-8859-1?Q?HvD7468AfCorbQq0/g918xgyLLrZ+/1V1vzySBnNIC1m80O4XgTiIzE3OV?=
 =?iso-8859-1?Q?mPrHMwmybHxJQCHQRH6pNE3eh4mpkAMUklG3WBNmFR/mfnG+ROZGspiSV/?=
 =?iso-8859-1?Q?9KqnxiJSjQw00v1fy6OoWH5tmgoNUOM7mzYnFaCHWuwk2Zkz7b9Ztmur8K?=
 =?iso-8859-1?Q?4Oicj7N4HqqnR2dOjAqXKs7ynpH77h6twh/i/YoB8+VXVs04puLX3t/JjV?=
 =?iso-8859-1?Q?JSxAGEKohQZ6ffGamnxanvAg0vSjJP4DniN0R+g9TGWo+ZxX38CSePAg5u?=
 =?iso-8859-1?Q?OKg/yF8sH4ZTsgLpwn2TZK9MdIVcqBUc1FR7O3Kyz5kFMwxo9swohIa+4B?=
 =?iso-8859-1?Q?D42+Q8xAb0bSRKBI/+jBrsqwW0H+okPFWNX8H3wmKq9HDTFq5uxgnyZs+k?=
 =?iso-8859-1?Q?2iDbZMSWNvMT5O46TTKWs8lFldp4y+zSheMdQYlSqqLgEQ9d5b8x+jLe7M?=
 =?iso-8859-1?Q?7o5i41c/kHh4VJU+eRUHXbvLs4eqdjwR3B7CUMyVpxY6Z09a+PztoD71Qv?=
 =?iso-8859-1?Q?gEtmt7HIOiW0l1l/g+uNKItGx7U/Y15WSxKJ0mWRjV1ucJ9xJvkGh3huHR?=
 =?iso-8859-1?Q?dgLAqrhR2a0BtBHEaJ8YdmNmIGtoTY7RIPX58rwR+Za1orAmxKLq8braey?=
 =?iso-8859-1?Q?RNSyLvU1vqwt6YRTmxt7JEhy6GSGRlkNx4wuFS3s6WF1473+WJxsmfN038?=
 =?iso-8859-1?Q?TZGjWHETkEZSGaDIWPwWO/jBQbH7pbemcgLhBhI5fbcCT15A5HeLTYo2Xm?=
 =?iso-8859-1?Q?4CHhk1iU2k98wEcAOUuA0eCw17hLYRZ2P8+60iU76NXDhugFZFfQzhicI4?=
 =?iso-8859-1?Q?6pDkQMdiiDZfXrGnyJhSYmfATTRx98uPOc7aCryCAyezhCU6LroPvnSP/k?=
 =?iso-8859-1?Q?NQ83AYc7k98igfGjJJOG4KpASSTwfiql1LOFY+ZwtXU2MOuLmuX04xW49K?=
 =?iso-8859-1?Q?vFHoDdqbSNZ+SYICqTfhExQaheNtrY7+M14Gt0dLBVBjkZNTxFpfizeTxs?=
 =?iso-8859-1?Q?TflgkZ+4oHDU2q1wt3oqqjRfxdJxAn5QnQLguCYpifRklo/CNVFwU6gbiE?=
 =?iso-8859-1?Q?N2bSoimWEM3kyGcSjnmufsY9hGJYzKF+x2NnCFEZdU/xGoejUGdlIQZT/n?=
 =?iso-8859-1?Q?UZwOyuKCIF9dr1wP4ROwHkhKjx3fO4qtGHNS70RouodSQjrLdm03A4F4Xk?=
 =?iso-8859-1?Q?MG4K90fEc7bNONKRIt7kFiIkMOOlMB3e6PZkeKdfW3BJR3QcJEuyq5owxN?=
 =?iso-8859-1?Q?6SFCCf+qYCmPDZdUpdyGqaBHmUABkyB06oN9yOabzRgMFwTBEAY6udWmd0?=
 =?iso-8859-1?Q?druKVDKzqAkEJ6hj8cAvblmY792Ar6vt+aSxxTyeXSEg9FbbUwh27Oc6M3?=
 =?iso-8859-1?Q?bw0bF4fmLP5EZZVSqGTpzIXmkYE7PyYGBwMpR6X1J4YGCvqpcx+NmXbOO6?=
 =?iso-8859-1?Q?MzDGE8AsYev7fY84R/mZNYbnJqToUGhH8NkinP7pP10lVUDrBR12hsZwJE?=
 =?iso-8859-1?Q?y2IY55PwpXxeFTqeATsdWw7WGM9j3s3oyOziTcnpqJ4T0A7jUNGd/3n4We?=
 =?iso-8859-1?Q?sHz3BKFKijn6vS4Ve4qFhKeqwd8VS/T7YEVP3mNgQ5BdofpHMY8mtWzMzp?=
 =?iso-8859-1?Q?Qd2FBXwtmqaaPiEuhxv97CQw4xKfgIIZymEs8cKaCgWFLnmj1Vc3e4iE4S?=
 =?iso-8859-1?Q?EpKWx6ca1tXb7yq/anVnpYdw6EetZxkuO0uBzaXmKWClHWobsOsb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4183e4-afe3-424f-9e0d-08df25acf4fc
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 02:28:08.7647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tZ49YWN0U74pLwRJyqCxvzdaGgHd+9tk6NovR/nkQo0ZgEocIRDemJpN9FgMeasY6Z75bJKpn/N0qX0repABSOdzRp9SEfaVQcK2pC3DEMg8iuGlvrMZKmd7wv+mP8S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7269

On Wed, Oct 07, 2026 at 10:56:01AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] gpio: mxc: race condition in gpio_set_irq_type updating port->both_edges
>--
>
>commit 71b368728fc9ada85f870f46f968a6583a740b0c
>Author: Peng Fan <peng.fan@nxp.com>
>
>gpio: mxc: use BIT() macro for single-bit operations
>
>This commit replaces open-coded shifts with the BIT() macro to avoid potential
>signed-shift issues and improve consistency. No functional changes are
>intended.
>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 39de616cd434f..ad50b602c4a16 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -209,7 +209,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>  	int edge;
>>  	void __iomem *reg = port->base;
>>  
>> -	port->both_edges &= ~(1 << gpio_idx);
>> +	port->both_edges &= ~BIT(gpio_idx);
>
>[Severity: Medium]
>Could this unprotected read-modify-write on the shared port bitmask lead to a
>race condition?

This is a pre-existing issue. I need to use a separate patch to address it.

Regards
Peng

>
>Concurrent updates to the shared port->both_edges bitmask could cause one CPU
>to overwrite and lose the IRQ edge configuration of another pin, potentially
>leading to missed interrupts or stuck IRQ lines.
>
>This can happen during parallel device probing or via userspace GPIO
>configuration (e.g., libgpiod/sysfs) when two CPU cores concurrently call
>gpio_set_irq_type() for different GPIO pins on the same port.
>
>The IRQ subsystem serializes irq_set_type() on a per-pin basis (via
>desc->lock), not per-port.
>
>While the driver correctly takes the port-wide lock later in this function via
>scoped_guard(gpio_generic_lock_irqsave, &port->gen_gc) for its MMIO register
>updates, it performs read-modify-write operations on the shared
>port->both_edges software mask completely outside of this critical section.
>
>[ ... ]
>
>> @@ -229,7 +229,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>  				edge = GPIO_INT_HIGH_LEV;
>>  				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
>>  			}
>> -			port->both_edges |= 1 << gpio_idx;
>> +			port->both_edges |= BIT(gpio_idx);
>
>[Severity: Medium]
>This appears to be a second unprotected modification in the IRQ_TYPE_EDGE_BOTH
>path.
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com?part=10
>
