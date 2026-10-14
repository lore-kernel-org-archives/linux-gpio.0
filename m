Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9624A0934;
	Wed, 14 Oct 2026 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966630; cv=fail; b=cB6I68V94RUi40TyVDCyG4Bw2S+jjghoiHBXOo1QW1LdiTKWLWI7PBL8ypmK3BrjC7MflxhglXOMxnhBkfUMn3BLfsCGUc7nn9AfkL90LAl1YEMlwO7I0cjbAflEkBxe/jXA/m4FjXWqwcFkNezWh58FGF0LMc3nEMaQvNKhP8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966630; c=relaxed/simple;
	bh=hDtm2yo67I+G+9kY0GJukcD3cTYKY52vHVx0Uixc5Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KUo4txkFcREPzgKS8W2o0a/kosnro9MZE/Wn7Vz/MOXy714BFa3i5Bj3ER4U4NQcj8j2Bcd7iB8zr4EaED/TPe7IhiSaVxkuP9Ss0aXaQGNo+irl0+J5AU3dh0JNKN4oWK70FYz5C/3EbJmBZtJeCxVodT79S2v0buIRHhRjt/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mn++iTri; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mn++iTri"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uifN0WLOB+c+0tD0KVPPGvt1xc8Hy7ltlCoV7mguAmfu5FokMzxYzNSpSnYCqb7wjbS0oY50OzRqHGEtl2GNhl6dHOcL6RhjOXv2ml+rlbKOpnxTuhAdj44gVVKmcOjR0zf8azTrXIZLMcOuip+9omwfCnVs4OYOLIupEs2UPJEx3ihWszQwiWeQ1vK7kMVxUtrU2G8bAyc+Rddpy9Aqkj4IQ+XPBf6TMdbViRgIomqO0U8aIKRANTSGZo/QdXVUe830t23wWMB2JZKjctW3JiMmFB5cmn6AlFay5ajeCZj78CbpnGOHFeUVrodY7CyNzyCfSD10qGly50aHPoR2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw4KmkdFwK/CDZvAcWLH27fTwNsZ5t5VqFuZ9WIw3lY=;
 b=R+KTcCvJ+LQd76TxPwS7VJNZxnbKjIVWKKFpAtbdZlFNKH/4SrZ3AR/wW1qZJzZ7FJW8J5BclBkGyzQ4eo0MKuG0UZN3+fQ4WJzOf6seVV5D7BqJaI7UDKSCCA0ReLJ2fc4gC0H+4lalnCyoctHnD2zNijh7cKcozIC7j89HDVDjH3c3HUN7rZfSuiA3xe76HoJJUbhgiEcAVjY+Xng0nrBrkZP9Ij6vOSeUg8sl2Y/suNEN1iz6l94dLEw5Htv8kv/0zjTKXm22Rk6wm50YQpT02m6ZdhWdUYjwsy0GZOguzp0qPNUgftwcEh0OvO0Zr1P0s/rtN5dk2IUgnAIkwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw4KmkdFwK/CDZvAcWLH27fTwNsZ5t5VqFuZ9WIw3lY=;
 b=mn++iTriD2xhL5RekALuw/S3LRj8AZeVfuSfEnEsR3x+0TaOl4DzUQEBjmorV1F7CIxCaBmRkdHJ9kO5+G6IWBcRWUpzEhMzmzTAltdFPszDtfVyGYVBnHddmNBiRveJKatiBcCvDhnc8T6PT0NNtzFE51f6i3CrFQ4nNxObdW7fnt+Jio/k2jHC6ynZYqvwL7Oxowz91YJ480edZDfHHGjMjUGtld+WOBov2hdj9/RCuje3m8ue2/K9BU2almF6FS6mnCl6gWa60NESVfg4snds7iGV7Z3SXb9wYcYmLynWIKLTJlPnlx0BjRzuDHZdP9IdRQPVRWdGhIt+o2phgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 08:30:25 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 08:30:22 +0000
Date: Wed, 14 Oct 2026 16:34:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Message-ID: <as8+sqlBEuhfdtZ8@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
 <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d6a05c-7b27-4e19-426d-08df29cd637e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|7416014|376014|366016|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/6Za28xJAZe4ZAt26s6nTnh3Ousy/hz2+mGa7lnRKQtQj08f7ROJcC9feYjiP0ap6fOS2E1/iQFsFMyGfOr1Gfr0xnOEncaIyiGFh9d8Ehza21Dr/o0q6hwK1KuDRenKoT0zCX8pT61IT0n3CfLUxgKY9fWE+9c+JWFT5+Ao9yFMCYFqlHv77DNxmioA7WjQ5k1X15SyETZxWEDkl3RqRkstepFLQHgbaiQvgdyQgS6sk1SLd0dLSXhvLsXsfpSqfDtC6FsycU5L2x6F3pesjQ1ft+B2SFcK7gCxJWO6eJ23i4Hp1NJ8uHVQtbXXq+cWfkYMoehwd1Nlb+jsqxhz3v5yObnRFtoCnjoUPYTPeDe7rW8dNocXe8ECauP02bClfJtoDhgqPvhCo6PPDMMBYisRRZ7GhwgLU/F+Q9q4qbtU3f3v8CBFOy7pTPCg6/UsYmVoKQCU4+Q75BqHvxpVKLe+t3SjUeebosFONEMaNCRNH/0t+heVGAyoMcZIIRfIACyfN56xQCSvMFnso06w811UOWEctz5VOZ+wiGZBdcq2CoWWADwZj6KsX4OVYpc34Xo0WG/S1S/rQPH1EaJZZzGaPHrlfHqFJKGPJQY9tYp3V+dQDrQh9DK32ZhmUM3UBzz6NfVCI/RaTKejVMukqZ/aAXy/3sq6/Vr7PUdldzU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1RoNzBJYW5MYThwWGJweTJNakdBUDVjREV3N2x2aUhyeDc4bk0xeUdaNitk?=
 =?utf-8?B?L0tWTHVaWFJaRjlxVE9yVWZJbklWZU12emVsU25kaFA0MStRS3N6Tjd4MDFX?=
 =?utf-8?B?L2JZc0tKL2lxMGRBYzUrdkNMeDNTd2RrYmMyTUlqYlFFeGltV0pIbXMvS3d3?=
 =?utf-8?B?eUNxbmRlUjZYajhPTFdNWEJHL0drOGU0MzdIQUZsbER4aTdxRktjYjhkbXZt?=
 =?utf-8?B?cVVnQ21CMHc3NldvaFFNR1hNL2ZsV0FSWTlHM3M5WmtrdW5tZDloU01WTnFK?=
 =?utf-8?B?NjBFeEQzbFZRY1p3Q0Q2V1BmVUE2ZXVjOCt5TWdDNDVDMGhrUUd0djIxVFpo?=
 =?utf-8?B?dVQ4Ujc4VDRiYzVZelpRSWNKZUxMZkVpS2RKVnd3ZU9LS2VkV3p6c3RGRmdS?=
 =?utf-8?B?MmxPWlJNUDZjL3VQZ3c3Z1ZWcVA4VU9FcEJQK2Z0M2JtUklPV0d0TmY2SlhO?=
 =?utf-8?B?K1l0aEk4VUNHWkJQa1FkUlFNd3IrQjQrK2FmQis5TEFBaHhmS3V6Q1BoOTVO?=
 =?utf-8?B?OThUdnlSY0FURGx5NWVWaURLVTZmQ1BFYzNBZG9UNWpSbUszTUtqdlVNSStq?=
 =?utf-8?B?QmdwVHk5TllSbUhXdEFDb1I5Z2RYNUtGR0x1ZExNUDVxMXlVRXA5LzQrVHJl?=
 =?utf-8?B?bFczSG5aQWlIcjBrY2hJTjlXUG9jMlplWGY0dllKQkZwbWpld0t4RGRxWHU4?=
 =?utf-8?B?dDlCZk5zaUNOOUkwbVdLd2plN3o1R284UVBFRGViUnBzdTZ3bDh4RHBSZUZR?=
 =?utf-8?B?L2VPK2Z5K2dLUloxQ0lqMy9IK1lGU2hrbWVaUWxianRhRmoyRWtOaStFYTRs?=
 =?utf-8?B?VEJ3K1ZqbUxPT1lydDBxdGVKSW51OGw4Y1YwVFI5SitkOVBhWG4yejdUS1Q0?=
 =?utf-8?B?cWcvWnJmWGY3MVU4Qmd3UmpWNWdLOUhQbFpDSWJneGMwa2Ivcy81UkZ2RWli?=
 =?utf-8?B?L0NYcWc5UGpTTTYyc01jb2dvS3lNaFYzOGJaemhVc2tSNWFESnBGSHduaWZi?=
 =?utf-8?B?VlVETVZCb2w3a1ZMcElNQ0FXNDgwN2xGQlA3V0lHSnVCS2RRamoxTGtKeldF?=
 =?utf-8?B?U01TVlpjdmkzVmJYci8xY0MyNU0wcXJISkJnajYxcHFKZmsvK3g5anlHNGFN?=
 =?utf-8?B?UERoZjlZL1g2enJRMlRVaW1jTmxSOVkzQ3pDbElvbXZ6aFpNRy9GaEFVZTM2?=
 =?utf-8?B?dmd5ajJrd05qT0RSUzRtL0VGZStVOUdDQXpzWGN6YmJmdVMxZS90YXY1M2p3?=
 =?utf-8?B?MUVPTDFobUQrMnhwY3JnY3phbm1YUEFOZzU4cW8wdUcrY0h6TGRkVTF2dUdN?=
 =?utf-8?B?Y3JlVTg0N29sSS9aeGRCL3pZZmdaTHBPRWlmaFNiQVh0VjNldkpSMmw5K2NG?=
 =?utf-8?B?UGNXaXQ4azBKWU5BU1ZDV3VlUCtvbjZwTlNTNUpkaEhBS1hmeFZ6eW1kQ0k5?=
 =?utf-8?B?Z2laNFlUMUZCaHBia21UVGxXaW9lbDU3ZGFjTmdqQW5PVFhuOHVkWmQzeTQw?=
 =?utf-8?B?bnhrdjI1dzZlMVJQTkZjSkdqdUgzZnZjUVpxWW1IY2VxRkJsMktLYkI3WVlo?=
 =?utf-8?B?c25vamJUUTdTdDViQzhrQnpTSkFBQlEybEpwRXo0RnphaWNLd3FuNHdaUmpu?=
 =?utf-8?B?YjZwczRsaEFNWjJLYWxtdmFuWG1RM2xvRGQ0TlkzcENSaWtYUmN3Yzl2SldN?=
 =?utf-8?B?clcyUDA1ek9KcjYwNlFuaTBwRUc3dkhIbkppWUxxNG9mT2pGZ2hGWFI3NHor?=
 =?utf-8?B?Qko5WWNGSmt2WFJtcGVFNSsvSnkwTlI1OWY4YzU5czNHNEw3MWovdGR4bElU?=
 =?utf-8?B?b29UeVFJektDM0lUZVg0VHNJRXdhU3Y0dUx4c3FtUVNXQ3h6T1IwNzNJSFRT?=
 =?utf-8?B?WVB4YTg1aFFhUkdmc2x5c3QzbDJaTml3NkxLM0hseVZ3NlE5ZDdUdWJTVy95?=
 =?utf-8?B?dnVaK2J2RVJYell0emNzRkNCZjlKeElSK2RybG1mQnhYd0M1L0dWTytObmZZ?=
 =?utf-8?B?bmFhdXNseGptMnlsVURyaFFZY0xrRVF0dCtxbnp4ak50aUNDOUVpNVErZTNa?=
 =?utf-8?B?K0EzMmRwWTRYczFZVk5nZjR5UEgwd1hrSDV4SlhVeUIvTG5qbEhwem0rNDRT?=
 =?utf-8?B?NlZOV2RBMkplVzNSem9QaEdJTUVPc21jZFZraVhkcWM4ai84VzcwNHRYaEMr?=
 =?utf-8?B?MUNveVNOaExTUkt6T1hJSzhlV1BZa0JZWk8zZGsvbTV0dHdqMlRQdzZiSW5E?=
 =?utf-8?B?eEpPRFlTTFVRMGlWTnlCckdvd1VwZmpWUXRGTCtzcktoSTRrR3BCQXRUK2Nx?=
 =?utf-8?B?cko0TWovakV1YVNoUjQzY2lGbExNQTNGVVdQblVxb0xZWVpSalFhSjlsUVlw?=
 =?utf-8?Q?0uIf6vceeD71lzAxjsRAdGtBAOcOHtm//XHK0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d6a05c-7b27-4e19-426d-08df29cd637e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:30:22.9286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iwp1MvpEpQLWf/c1xJ0LVDi3yYHAO6Ggu0iUFu0anj2uLzpuzJchrTQCW32ocBKKal9qCGd/ONbQ1zfv6BKyTnkZdWOoFFOHiXFP84L75F/lSjJQu9bG3SstNmDV3fSJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969

Hi Linus,
On Wed, Oct 14, 2026 at 01:10:48AM +0200, Linus Walleij wrote:
>Hi Peng,
>
>On Sun, Oct 11, 2026 at 1:51 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
>>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
>>                 unsigned int offset, unsigned long conf)
>>  {
>> -       struct device_node *np = port->dev->of_node;
>> +       int ret;
>> +
>> +       if (!mxc_gpio_has_pad_wakeup(port))
>> +               return false;
>
>Why is the entire call to mxc_gpio_generic_config()
>bailing out here if the port does not have pad wakeup?
>
>> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
>> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
>> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
>> -               return (gpiochip_generic_config(&port->gen_gc.gc,
>> -                                               offset, conf) == 0);
>> +       ret = gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
>> +       if (ret)
>> +               return false;
>
>Then no generic config can happen.
>
>This looks weird, isn't it just some of the configs that
>don't work?

The early return is correct and matches the original behavior - only
i.MX8 SoCs with SCU have pad wakeup hardware.

gpiochip_generic_config() here calls into the pinctrl backend's
pin_config_set(), which on i.MX8 programs the SCU firmware with the
PAD wakeup source type.  Non-i.MX8 SoCs don't have an SCU pinctrl backend.

The function name is misleading - its only caller is mxc_gpio_set_pad_wakeup().

Thanks
Peng

>
>Yours,
>Linus Walleij
>
>
