Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F68403E9B;
	Fri, 16 Oct 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138782; cv=fail; b=BpkVc3jN3lhjlp4ZAdQeiNp59eP60jHsEQat69CNY7Qp/S/sjTIfyUcDxNEdNiIPTAHdKWWcL7etfp3DGB7V5ox4mF89A8NAGAHWAAdoId7iI0rBrkR08LJ4fAqJqJZn1RGjP2LAQk5UfvdpFF0F6bK/8ch8ji7cBR1XUDWA+lY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138782; c=relaxed/simple;
	bh=kRqwh81LdtWZ5VZDgOrFPgMonKee22m7T1Mt0ktviRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LF7kC/LMVkS670mMk3H+Z3aOWfpmma//mks6qNusoUGxZqu0kwyAZ41bkb/f+QMiQtOCEnJ9dvG+DbgfAAE+CVAEdRHHqci1mKhYsMgwcCGVaAkOKEI0nyQPRFUIIzgg6/Flaa2jH/j3fSa0t44InMV0VfZfLxq0lhhbDxleYC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dSxhpysn; arc=fail smtp.client-ip=52.101.43.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dSxhpysn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnijo2hHkGxG6FoJg1qgVTWJAm2cJ/HJlPDSxTBjH0NxdoGYalafx7QA8Q+UNcOiPYkxtqa+8b50BTj+omuF6fzsN5yyhNla4SiSrRJMjgvHVRE7KlpPRuhm1cF8vqji4PfIg5f1HU8ZVhGg7PAjW3EcqvAtAex77hyLpUIfFE4Jcb93TYaGd+g80n8d1EXhvlQEiKodZQpbs4JtJFYEeVQZhnlMx5IaLIhkBGT8LzQLUGcfEkbOGU+Zzioi/KBVpQH+GPd11lrOUDeFZJFoPIYhhFHTlhXPWf+jBWGKjazRzqtZSnHSQGVbskPxL/SQolk/o/2J8hqDZ4unvHkyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EopJUlpVqSWWIZFZQe6IUHaluhe35Y242TFyqebHYco=;
 b=fCZa25OGmGr/pcrewk1ZtjDeztXar6ZdNhXx5w1QPgSDLlUfbwt8BQwNJ/3hIkDzEUIb+CE2YpMcSNTpOFH/EdzrfvpZM4xgBnN97OvKvEg2m18861YePXXLi631MF1jDk3elyfMWdp54E4/GbfNpLVqle+gT5D8MRcMVH6AkmnLykRkY6TGNWk/XCrYgojCbFdR0OoY4IAovNan3pd/hJWDAH/ccX4A53uMbuwgm4Thy5K2f3GI0RjTyzuXPUGgN26IWvwcK6ZIKR7kSneoHOdGQUddjQNg255kFxaZCbnDtdSZ8GlES/f5Xi99fRheTadxtFRcfj4U3ISsSUz1UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EopJUlpVqSWWIZFZQe6IUHaluhe35Y242TFyqebHYco=;
 b=dSxhpysnDDUUc6J1+5Bi3rQlZTi7Jj7L2R/7zJrr9HKLwe8yYDyo7Xo9YwMBQsmG5Qqx6DL0bRK09RX/hl19XXVI+TnY2P0vK4YC4Ghs1+HefuzK9fta505Im7fQ3Esna2aUmkWfyrfXKoqYJGaz9tFg6Q7NYIfQObj0744AlEAunYXjNIGl4UVda92F/mXSWsGDgeFkmVORRR1z60qB5u9GCmXmYambURJgq9LMDKV8n0t6lfwW99WygJY9f0Cb8yfJQ0u+mpxK5uYUEyuv1K2BG/pGhXZ5IhrATWKjNe4aLKmFGzJ2UrMEbxF7b/96TV7Vsu0eMql7PWPILPmqcA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 08:19:33 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 08:19:33 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Donald Shannon <donalds@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-usb@vger.kernel.org,
	llvm@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 06/11] gpio: Add NVIDIA LSTP GPIO driver
Date: Fri, 16 Oct 2026 11:19:16 +0300
Message-ID: <20261016081917.1958681-4-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLkru2AL2_7ieOdbYrePAhNSFaa3wwEzCagiPsALgG2GwQ@mail.gmail.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com> <CAD++jLkru2AL2_7ieOdbYrePAhNSFaa3wwEzCagiPsALgG2GwQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::16) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: f9037e53-fe2c-41ec-993c-08df2b5e358f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|22082099003|18002099003|10067099003|3023799007|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ExKOhod+rmxF2za8tFM42zxfQIjJlxGt5ch2cBel//dO6dfDha+e54UnOn/hnymJavzXWdszGXyJG4Fm0bjnbcnXkL537bhsOZZYY/BOmNnP3NOm/5hbT8uYB7S0TBETu15wka2Qjy/yo1wfxo3zgY3ly+FMxMNI/MfN5PGVg4YVcjd22mZmoTaBD43F9FUJtfKzVhruWm16lfW/0X6XYBTDg/qrrRGVxnNvC3IG88G8CNz3DFK90USsPb4MUmATrfQdW4hJxQ8aKcobgLqen7fVGdHqjsB/T5Y4k3aVT9k+XUDk8GQ+7ng9Kfs/dutQnJWSpIu5ZhK27TKRe5TwspkfEYbDR9S88JNR+reOFlZmhGm8SH6aloG3aNbXOgv+HkwOC/n4I4X1XwKkIkjpLRBuTO6Jj5pJsrC2xCQreQf3kstU6eENn8Vv+R98tIKkBwMXiOWp0LVdOhdUWZ9PTuZWaOsZEcphMTijQBHf7WZpfeG/2TDhOVX9c7iZ9C0cq0KyuDHitafRLElErFfsghFk0hsJbzuCPli7Wwa5BHK0pLhD1pVRVBcTSAOrKNO+Yx5x9ozES3txrR9UntlPQhVuqYyLSevzHdqwZsoFLTZn9Vyo6T7umvqK26XUamflGdqJS13ePIz6EKUIPZRVAzcqlkQu/kuonFNmO63LAww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fZBR7bAup1pvHsYwDVBIFFtj2SucZgYscylEs2Mr6RPzD6Gf1iDCYnbz4bB9?=
 =?us-ascii?Q?8lc/Q3B8d9uUyWwSNntXqg5u2Sc/30UhXQKY5iaJosN/4T3abMZqPACcF7Kt?=
 =?us-ascii?Q?TpRyMAxPaBulrPBUFZpo/r8xWFXOK676eulKLJEhNRFqIigzae6dsAeXxB1/?=
 =?us-ascii?Q?4Bu2QUB60PARR2gjSl5+5fErnIs6of2Ox4GMoS8KwsFdLPcNa52B92UpknZX?=
 =?us-ascii?Q?gRuy/LmEniL2lsiXcF4+kP9esmakozxyEygxKKqrKpq8V6i0F6HE6UtwvGBX?=
 =?us-ascii?Q?CyReQ3rS5LCmtDy36bXkPqZS+FgxBNNSQa7e30Cn+nT6iGdSNpocHxnmZ+vq?=
 =?us-ascii?Q?7/oJzQExDkOlEI7uHjEfdTL9MHBjHxvBCussSBbomPD12eXTssC2dJtHHRxV?=
 =?us-ascii?Q?eVWlms8+uOwaPS2rTgcwKrZM5dMFnw6IMsp7ImzPY/BLouBG+XcXq6tlLsaR?=
 =?us-ascii?Q?/nXedrodJsyr8RORolrTtxi2t1oKhS+BQDCBz5KZohCx+vAVwxTAhtOkaW4+?=
 =?us-ascii?Q?eV7OPXcl4p3OWWVBSH5SnV0/bJWTh7dozPfivAiN8sZNDPSoq3ndlodF6ysN?=
 =?us-ascii?Q?ANyA1SLrbzXEXOvE+wh+02lQfs5HeuZw1dX4k6RL/hcmz06hQhEQdGhoDrk4?=
 =?us-ascii?Q?94SHX79bDNes9F4ILdab86DZoGDsz8auW3931kpQrHf/VUCN+RBJZp9LNxZs?=
 =?us-ascii?Q?xVGCfYw+frMq//DREY7FnzqUPCzrHu+hfxX5IL+vm71LTnyUtimi6TSJeD/P?=
 =?us-ascii?Q?bVSu35CW/Ljn9Zd78RMq/hlOrKkol2ZVJSXbOaIalgeWcXIIFPS4+BDn6a4t?=
 =?us-ascii?Q?2FtenlGOVVLk2IiG4p/e07WYixcYN+l+kQOJECfbDMUTP0huneXPnyar/+N0?=
 =?us-ascii?Q?4qymH2NPNGz02k5kumbCbumhbPZMFittLKXHkgzhCpLNOHlJm8K4ZYDm6OSb?=
 =?us-ascii?Q?ccM+dmSSjdUuo7AWkKpRqh3SpiGR3llYQNcWj9DKNfpVBQyXh4+Fsxg/WyMB?=
 =?us-ascii?Q?RlytPVx9j+JvpJCKXViIjx4iwYWY5O4kPHu31cAYG/vuq4Sf8lDed0OR0Coq?=
 =?us-ascii?Q?iZAUarJdA7X4LLWVMYtVE0MaK4Rx5Cuoz8XxshfXSSqG97OiyBKjPRovImzW?=
 =?us-ascii?Q?/8qpEzLK4aEKG1KOVwDA9HZQ0KvFBFGB4XGoy4JdYUNr/B0aF9dg3EFdPY7p?=
 =?us-ascii?Q?HxBDrRLnAKvor5HVClKli0BtFXvn3M4Pt5HcvPmqz8zI97ivEbtItLA4YFo2?=
 =?us-ascii?Q?16T1QeE9QRe8rfpBSi0MZxuS+rsHS3/OYZDJDP/WsX31LzG1DNd4ff/Jjsqe?=
 =?us-ascii?Q?FSeZY8HC2JnBEPvzX2b83JNaV2hacy6ETdbLbqbpDSYxdasXOunNd20rvacu?=
 =?us-ascii?Q?U/ICnvUaMx1p5mPZV94fcFG7K354Ov3XfRMvlIojUWg0ipww4ZSkrBguyYDJ?=
 =?us-ascii?Q?gWRqojl1k0e9D+Rju5OArD6QAWt65c4STj0IwVVm4VRj7xFVE5pAxuSAZD5d?=
 =?us-ascii?Q?zxaVS8W243MjJUS1/9pbEkkINfdONHD62uDErCELxhFxAbT7J5fmHAu/T3gM?=
 =?us-ascii?Q?TkG1VXbf/Qkz5y2ChRYS7FvN+6Oh4qq5DMYIBIbJqCt+imRAWiK1sX5lWXs2?=
 =?us-ascii?Q?GTQeipEmSAc0H/POCFTddcG5xMUG6NjXYuGDw17XXLKZ+6FBStRA4dURXiIw?=
 =?us-ascii?Q?Io0DvnHm13J336+YBL9a4yUpuv4N1ozQhRZ/gNBw4KL1atVObGDCjM2xohPr?=
 =?us-ascii?Q?oltZuTyeIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9037e53-fe2c-41ec-993c-08df2b5e358f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 08:19:33.6466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkBbQR2wiI2VY9oqBYcs5+1GwamnQ1FAxTQD0vif+H+N5kh6vNs0lD5RmOgDbBMXCNzZTdXwhdojXqL8fues2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330

Hi Linus,

Thanks for the review.

On Wed, Oct 14, 2026 at 1:25 AM Linus Walleij <linusw@kernel.org> wrote:
>> +config GPIO_LSTP
>
> GPIO_USBIO ... GPIO_LSTP?
>
> These should be in alphabetical order.

Will fix, and check the other Kconfig hunks in the series.

>> +#include <uapi/linux/gpio.h>
>
> Do you really need all this?
> Certainly <uapi/linux/gpio.h> is a mistake, look over all of these.

It was there for GPIO_MAX_NAME_SIZE, for a name truncation warning the
driver does not need. Both go, and I'll trim the rest of the includes
here and in the other drivers.

>> +/* clang-format off */
>
> I beg your pardon? What is this?

Markers that stopped clang-format from reflowing hand-formatted blocks.
They don't belong in posted code; they are gone in the next version.

> This  looks very dense too..
>
> At least a newline between the enums?

Will do.

>> +struct lstp_gpio_priv {
>
> Just call it lstp_gpio

Will do.

>> +       struct lstp_channel *ch;
>> +       struct gpio_chip gc;
>
> Why? Normally drivers get the state container from the
> chip not the other way around.

The gpio_chip callbacks do get it from the chip, with
gpiochip_get_data(). The channel pointer is the handle every request
to the device goes through. The only lookup the other way round is the
interrupt event callback: the LSTP core calls it with the channel, so
it takes the state from the channel's private pointer.

> It seems some pins are only input and some are only output.
>
> Have you considered using serialized register access over
> regmap and use regmap-gpio with fixed direction bitmaps?

Yes, the device configuration fixes each pin's direction. I looked at
gpio-regmap: a regmap bus with one register per pin would cover get,
set and the fixed directions. Two parts don't fit well, though.
gpio-regmap has no get_multiple/set_multiple, while the device takes
several pins in one request, so an array access would become one USB
round trip per pin. And interrupts arrive as event packets the device
sends on its own, not as status registers to read, so regmap-irq does
not apply and the irq_chip would stay as it is.

What I would take from it is reading the directions once at probe into
bitmaps, instead of asking the device on every call. Would that be
acceptable, or would you still prefer gpio-regmap despite the lost
batching?

Thanks,
Adrian
