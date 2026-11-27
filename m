Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795783472;
	b=ckIbOBOv/skMOf8TzVuJfVf3QdCapLNoMEc2Ed56zdvaY3nhsS1S133Xvd1EWedA47+w
	 hPDnNxhcd65KyiwAVi8jFaUXGPZ20j9nHS+qR2Ns50GPTDolZcFxZ5JwjgWptxpPESvwq
	 hYuIBM/Xi6DNxjOEreNAkJ7//Lw+enoU50F3yeERS38jEKvyLLhVL8XHB7lftibnMqLWE
	 yOd5sCTqTes5gFQLEnVVmsVaj+Ma37G6LxQiwYoxywz0vHj+o9AYR/8Ki880dRFGDuwQJ
	 nMGfAG2qq/xVKT9+yhGm1E+T1OKscCxy6Zd2Hb1KoXmnDcuHgR2zOGc3TrUt6FY77cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783472;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=K23MhkI7u2nmrGjo5fskZ+vv9xB3Mo5gfAuWT6Bh+XE=;
	b=npcof6Vd1lemwlTGe2wM7u9jad1ACyBS3A2xeoYV1qNugHetoAx0pVdF18F3s7W4r2K0
	 mkK8JRLckDWBMrj9ybAPZefF5coah5VmfJBK8tDu7m3Hn4vLasJ5fCkshTqvdpss0+nXz
	 t1EvRh5iN3PEKfWd1uQ+C28JSmIJ6LYSuqociggEadDCTLPnHDQ1fw/167vKGR9+BfNCk
	 edaBUsxjaFF6jMPThRrAWcmmcEDI2SaA5FDBwG8tR4oPRfb3qGaeie6Al07mC70QPLFr5
	 FizKKtpYiuPZaHkR6Pm/hYjBoTCasuM3idiwYuZKq53pv1rcIBRxGPC0qrCMJU4ZPyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=guDrymY5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.7
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013007.outbound.protection.outlook.com [40.93.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D9606A31F
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 12:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0D9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=guDrymY5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9EcxW0MGL9m+00+n5zPPPBfWMuwVSRVcBpCCXpoU+mBRKPI4XDNe51qzCqjD/0Jmk0t4QbXiqmHS3ENPlPJ8hxjMf3VU4AP3WXsU+1JY7mYCTkFIr6j8Mv8ZVstuR741nWjvGNcNzcQT5/HZMI9i6DjLRUDgpQZkf5C8kFCBY3IGAqCu8zZI3SNI7c8ZNkjCR30KhdjRDB4JTA4f9D1/aRqU6eftvw3R1ni0wS83bCyqJ2xLuXT9auyO1/nsxeyVqDglnyR7/h6hfZQzKD2sEF2vLQuhOdE8RMm4gzIqQh07q/VyjpRdE3d24SDxGMnYEeWGjCjbvv/5JPEcsxacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K23MhkI7u2nmrGjo5fskZ+vv9xB3Mo5gfAuWT6Bh+XE=;
 b=u3tLq8vAhGLGPxWNE+vvYyhNGVsWEF7PQjJDvOq2Fne11KbUHXmE2pwtp+4VM15iXjNqnXePkzW1P/NwJ8xRG7D8LRtysLqrSU/YG/eLVKLvOY8STri8l/MXlhG0GnPQhKw755NITf/pDfPNvdF9qnveL0OSEx+3u6Z28+mK/e07W+IOQMRR+/hLsAgx3g//JHc6/CGmO3VtScpHRy35EKe54FKlKpukoqZB1qVOiEUOc5NnkDGefoOFXZPVBUbCnmNYmKL32/nPQ2unbMcDmw3AEHJdW0zDsGnIeOs+Bow1U2W1LOd8I4PkHnITMjvBPErBYoTQL24Dh0rFU/n9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K23MhkI7u2nmrGjo5fskZ+vv9xB3Mo5gfAuWT6Bh+XE=;
 b=guDrymY5/4NPnISCzPTypad5YDfQYgAwOgCzJtgnUit+vDUoGpb1ywQMvGr2QrzePju0/HBrNvSL1VX1gQvvfsNMgHq+dkyPeSvb/ytgGFZgDpR/EkVwUgno+z+1ni7cNqPhdOp6SGcj3wItcqo7qDmxY6/9P71eHurCgMT7Xc7BxuLHcnIGk3JvwLKNoHPb+cu/QumS0+/xWQArsOaR7hsOaLCUz6c3n7K3PPpJQVXW2KGjyTK1yuXTSH7lbYi4c3G9vqKpDNxZ8vREHLXP7v+MjX7aA+/C3lzwaqvjoIqEQjx2FI9vD8QeWpdx3pYjFQjOcMpWgTNrNhDN+71ofA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by SA3PR12MB7975.namprd12.prod.outlook.com (2603:10b6:806:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 12:44:29 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 12:44:29 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: release user space's lines when adding the chip fails late
Date: Fri, 27 Nov 2026 14:44:26 +0200
Message-ID: <20261127124425.3423779-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-233252@kernel.org>
References: <20261125-gpiolib-setupdev-v1-1-aambrozewicz@nvidia.com> <sashiko-outbox-233252@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::19) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|SA3PR12MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 431611c8-66ee-4388-c2bb-08df4c842d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	7ZCSf9/xsF+z2VL6CtUvrUuKkNF5WRkUQfeE5UQXVNGIrn8XnILH+zk2kgXBz2MHBlGAn2YAHJTrFEx/r1lye1BJ0ERvush+EFvep9s/TJJPtngi3IKN+3bLr5APWnVW4cPgh3nwTS0Yv9dVw89SNBRKn5HNJ5PNKFcrIa9rBdiSF871Rd0Pk6vCiQKChheNMokntLtHZMltocGgPO+q5fg7163v4qmr1z7niJDIkhxJHRdhiyYWukCG1UhnyB9Co6Slk+sHB+EHq6Pc6XTfbVg0rffcn61V9z8k6uuw5oPY2/52B/W3AluXyh/tFj/WXZri5jsfpy2T5PukuGKl3sKcl2nI4OQc1eaX0EEJAOHy0Lc8cVhv05f9Ex/BWVAX7INMj2GUGwLfv6MsHkZWHvawTJrbb1pnjM/QeS4ZrJt4dcBnKbOpiHRxSRSvNLQUKL3ApXbtNGT7xO7sxU9d6zhsLu6GXyMwUCreMeullCFcHWlWl+pIxrckDwXwXhJD6Zy5HEmJ4UoM59jItUsXxMkCDEUnk+GS8MeN6y2nBh95czqKZG58FO6Jmj/X4N612ELojQJzoVMMPjSuNmd61a04J1nm5PkG0L2A//SiiCwOxm1bUWu77daohA9BwAapKCjOre5+YV6wjXWs+qMH09ECm6S2GTwn/TiDXg/471U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?010T2A+S+R3RLIYQs6bUKZ59/pUwdN5Y9J4sXC7/6LOz4Z6lyBj5a37uLiyh?=
 =?us-ascii?Q?mUENczNc5vEHbPUgCyN2htxg8tMZ+SH4W/WvzhfEzmEKSpUgVW4y+Vhx3BtT?=
 =?us-ascii?Q?Tc4ev3DOC6IDzHR1LaTjGL8vHwd97hCLNnjzB5XjAYy5+FYHbltm0NSWpu3d?=
 =?us-ascii?Q?1rQcDm/IGpHvuouq9SSOMkaaFM3LbjKJtjf+SyMZki4L/XET9HWVaMwyO78I?=
 =?us-ascii?Q?NvZj8jWSV1LpQ591PdyQ+kiRqKC98EG9G9mgofMjAltlAHVpgR/oQrIPZC5q?=
 =?us-ascii?Q?Mfux9Drw4SSGOtvq6YQzcmcskyhAGfVnEY32NtjBFFsqKlU04pleAaV6OxXS?=
 =?us-ascii?Q?Z/anw3tREAjSrvsiVA6IT0aj/RUqwRp7WYT1M8y4E0BM6XdYFba5p0KbktZn?=
 =?us-ascii?Q?GYtbAbDtdwGDeU+r6tnqjh9pfVQ8bm7VEkCC2Ur5lUCtWzMAq+MM0JcSmxX+?=
 =?us-ascii?Q?6zBogotULlVX+T57H+leR5iXhIdnkO5yqPalIKIldUQgbwtHIGd6QVGNxw16?=
 =?us-ascii?Q?SEkwB5PFuWD8HeYTF3m42dwuwR+Iyr2vwHtBy56Siv+MMJrRuqRWBK+iDK0H?=
 =?us-ascii?Q?CIpGcI7wmOJ15JljHYeGKrQ1nn5xOR5v6I9NYI3sOaAvrUE2VDHwGabXRqoh?=
 =?us-ascii?Q?RvaxiZzYvEjrSm3gQPKZBFVbsBPJgynRd0TDs1i9DOLGkO3HFEZPcEEVd4rz?=
 =?us-ascii?Q?Wkn50mkiXwZ1pK/cKEd2MGPtmAemVndzbiaNVeU5oCAVmjDOXhgae9tuwFaB?=
 =?us-ascii?Q?MUqNL1Lx/3voUvVxJJWYIhF1nmvRkp+hB6qS9r/lwYs35Dy+E6XuieJOh2Sn?=
 =?us-ascii?Q?4xRVs1uSxJP9eljzcOj2Z02SVzNJ6cVGoUFI8u8fWgq6auOCo40DO0a9F05Z?=
 =?us-ascii?Q?LAMB7pflaQJhOmSglBwep+UCXwXjG6h6wFIrj7MNa8oKkk40IgxiovTwqDLW?=
 =?us-ascii?Q?rXb4HaWQLgrJ1LcCMwaJ3lLEUTAXjOA7O17O3WST1AkhjgWUBhVqaQwrLs/s?=
 =?us-ascii?Q?N9nt0ocmr8w+6uFBj0S0pjT41kGimYPCY9PJSEhdZgRSU8948jGLFpWOs1HO?=
 =?us-ascii?Q?7pHPa4GrJfrWSX6rTlMcKvKn12bjLZOemrRsD9Q0ktMl8fIEX9VLmQW9tnd+?=
 =?us-ascii?Q?kQpksdaoYjmNhHqWS00mFe+A0ey5lYLCfZ+hJUVaSE2rylRDq7YkMjqHtcEv?=
 =?us-ascii?Q?ugSSBXxQwL83IObwqYJRjYzURJY7cIrZYWDRwG/R0hYW8UsaFc236W/FSY4a?=
 =?us-ascii?Q?c7UU74vIBNz3rq+XAgwo9v5h1O4frrHu+LwuPmvRBZQCo0RksMEhDKOCkHcz?=
 =?us-ascii?Q?t3rA0i7wRCVNsBPucKNLMph7XxMjnUU0c/wKq8rT6GMWIQPhGXWsKDbjjxmT?=
 =?us-ascii?Q?eq11ry50bBLzaZpzV7qqB0GfxoqPQTw6bhmzXcPoeUiGXlX5ApA/Y5sZxo5m?=
 =?us-ascii?Q?UqT3Mxs0FqBvWydhrwBhaZS1fwBNKnFx7m3u32g44duKZNRJ9yY1hHNKmEuB?=
 =?us-ascii?Q?sB3iNqZN8TIDT+55Q4yYXrmbUt20iAGfb1JtNCG2WOiyXmbt2JNfav4hoS7J?=
 =?us-ascii?Q?VSwet4LcOea8NVbCzynaoO6cQTQ0OL3OI1VPDZQiVw8kK5TIfovaT0V4wZoi?=
 =?us-ascii?Q?BVQBFtUFLhfFcm2oPhN0OPCwoW6AH92F2GVsMLV86iA6s+YbvwfOvaMKk8fW?=
 =?us-ascii?Q?9bC9i0HdY8pRcT6wEumd5or1rVidAcA6q7xaalyA8LrBj9/DF2PIkJ1wB/Hp?=
 =?us-ascii?Q?tsmGAjUZ2w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431611c8-66ee-4388-c2bb-08df4c842d50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 12:44:29.2128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hw6PpkSCdU0Z8Hokm4+autOOt6OiOLmAUsRoZW49RDSRxpBKRGPD2xnTMA1r142JLi+Ric/GdWFwXep74mmStA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7975

On Wed, Nov 25, 2026 at 11:31:01AM +0000, sashiko-bot@kernel.org wrote:
> Does moving gpio_device_teardown_shared() into gpiochip_numb_device() skip
> gc->free() for shared GPIO lines when gpiochip_setup_dev() fails?

Yes, and gpiochip_remove() already does the same.

> Can running gpiochip_numb_device() before gpiochip_irqchip_remove() and
> acpi_gpiochip_remove() warn on a double free_irq() and skip gc->free() for
> ACPI GPIOs?

Yes, also already in gpiochip_remove(). v2 releases the chip's own
lines before the numbing on both paths:
https://lore.kernel.org/r/20261127-gpiolib-ownlines-v2-0-aambrozewicz@nvidia.com

> If an asynchronously probing consumer requests a line meant to be hogged
> or shared, gpiochip_hog_lines() or gpiochip_setup_shared() fails with
> -EBUSY and tears down the controller registration.

Only through some lookups. The OF, ACPI and software node lookups find
the chip with gpio_device_find(), which skips a chip whose device is
not registered yet (drivers/gpio/gpiolib.c:1526 at 1f7d535465a5), and
gpiochip_setup_dev() registers it only after gpiochip_hog_lines() and
gpiochip_setup_shared() (gpiolib.c:1362, 1378, 1391). Lookups by global
GPIO number, gpio_to_desc() (gpiolib.c:176; the legacy number-based API
and ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER, gpiolib-acpi-core.c:735), and by
line name from a machine lookup table, gpio_name_to_desc()
(gpiolib.c:578, called at 4728), do not check that: through them the
race can happen, as it could before this patch.

Adrian
