Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745514078F4;
	Tue,  6 Oct 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290906; cv=fail; b=m7u3iGFvq1cDGpgrIbsWLpaC6BzjeW6fL/hlLbpAzdmQZkMXde/9cgzkslTaDcvn2HEl1Sbmu1oITOixnqWeQFtmOnvkZdIDGy+At9mo8TB5H06/+P+P4HGMPCBzNTsOYtBwrgPG/U23YVE4BnpZB1aXG9rr35EzJ9FgC2ufzPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290906; c=relaxed/simple;
	bh=3vRC99mP09O+5WuMbnYULwrfSyNqP+uQwocUDOQd70s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CLoAuXtHPJDHaMp/IGyKz3IjdiJwjjgCnP6TMS6J4mEPq6lyEOd8OZKLDzPIevkKslls4JA3E3rEfOQf8I8AhHOUAqDnrPb18svcJ4uEWUKVI7TTESGy93qoCFXdrJPvNAtgC5YoUjhaL4odbfOViVwh9EPXpS4fIDDlgvIrDD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QfNrfvrI; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QfNrfvrI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovSGcKmUJyI9XdoEDXy/M1G8oIQNPy3R+VvYZPFc8Wo3dWY5xShQhuOizcheI+vxQe/OJwLqPedamUhX1Ti/uPpYqKpNFqLnsD2XHcGNAm8g7umBCmujxefeHI83Ur5mDI9GnS70j74uE/aFBxpNwFz3I6IXEUpopnnWb9pt4aebrx0xcOWkbOYyePZM/3FaP+/50W0rskBSId8U/MYM4n7BBdR/xkZxxfJhVGopntdBnVgz+B6/xEXtIVf3ZZDvzO6onT+PuCYss2EVxPsX1+vhrQQ4pSX2+WowB3tikrm6bYN2SPXBVaiqLZgUxR9irEKc5JUaZvJNKrsINNUKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj8o6HC3AwzR1Ak/ZrTdXDzWyx3IS3PV8qhJ9+6bhdo=;
 b=siK0JIUdGaKxWp1oI1izzYQIpZbRi96n46NErENZ21bD2HKmlHjEQK1fO8OBhUcG1HhOvJbh2Ypa6yZxK59Cq1eSJeQ4KzK+sqykz9sR4p+s9YBQ891VszFEI+y4I8mUxsh/UYYpL+a+w0m6JSQMcdzUwYCBHG0o/bX6y92eDNZwfUgGDFG43ikn0u8KG+qk6yaa2BNItLJA3O4qr3aSyjZFFSlpgWajWk5SlIOCeAfUARAmn7Y5qC9dvgelQsro8/xkAggEWI7put+ULznk268fKJi2mSP6hohONDgzMEr1IbXZ+1PkWlRzcCX40pj2gYq3TwByztLSI5TbthufkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj8o6HC3AwzR1Ak/ZrTdXDzWyx3IS3PV8qhJ9+6bhdo=;
 b=QfNrfvrI1Ktrzf88AGz5GUJMBHQiBzqadQ5RxAJV5TXMrtdePwH2ljzzsMT94mK//yP4CIXNxIi6UU5tIJcZdGI4xtGZj79vPBhVU0xAHmstZkebSJCVRuQuj04SSaOtTnRLs9KygqPaRkbVE9HYDPGFs/miPaSFfjNfUHo8wv16o4pRj45lPWgJUZvWvNgDVNdrySZUrN/8Glx+Wr2F6D6NZHhfd6ze3s1H50mtgcRPZ2lRBskm+IlVUIEN95Y4PoZe4lIEwuz4i0ELMORcPzQVOv8+SLQUfTj15wNBZedHylmvbCIHDUQb3iPYt5VroU69nlF14Vc8YlDhGHMWOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9700.eurprd04.prod.outlook.com (2603:10a6:20b:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 12:48:08 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 12:48:08 +0000
Date: Tue, 6 Oct 2026 20:52:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/9] gpio: mxc: fix wakeup_pads bit operations
Message-ID: <asTvFjwJ3f1FbnJ0@shlinux89>
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
 <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
 <CAHp75Ve+p6TMr7MwQw0orGdjxLgNBN8gfTw2SY+EKBBgCyYXgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve+p6TMr7MwQw0orGdjxLgNBN8gfTw2SY+EKBBgCyYXgA@mail.gmail.com>
X-ClientProxiedBy: MA0PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7f2e1e-bc10-4ea2-9808-08df23a812a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|366016|23010399003|376014|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QKieAmyuHdMSXXPVKCciPFDIjpvARfRnpYQeFayqyi25B5Pe6mC0A+p5qvzB6fHNelBaURj1UE65ER/s0DkX4tXhtkyX4H45RmFOiiUK80vwcKlfIwkOcsnCcT9Z6Pk/on9xZRm7yNYCzWkXSn3q5tvcET1mUqhyOFsAKsovX2WLvWK9LCCzzYdMEzeu5fOmqE/qUD2/3lQyTGdgDGhW1bG0UiVCPoxpZiX0bm/2p1Ay0bfsAq4C0J73GX9AJHyWkcvkUctAE6dkQ/HycDRVZM9k16HiteQWtctVvmnvGgbrqeGzGS+48xgfDEQtp4du9XksD/t0QJpEEXbFxLNg+Jd+HE5zZd1degV+eNnQEms38zHB8V82dZ8bbly2uvSe3JvFKvfH8Z6vk8hipEfarN+M8BwOUSKp+lO9u2QkbRUC+ul+RZ/umXzkdUibQC2YwVF+NZI4gHqAlsmEXl4NYDrNK+eCiogkmYwyCY0rgPhj2IEPlAmOupzhvrq6xuP0M03P4QU847Z3pQ60ECoDJ2sDicw9Nh0NdlzyUKo9kC27nEXPePWTBCME1ZIAhASwooFf3LQTz0YAp5C8ULPV2Esg/NRlhBHnQpOlqvotF1MEQx0yjXUpogWPYB8N/ICpskq8PtF7vwcKWP0vNsJoyupdBaaHRUuH//1pnBRlIkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(366016)(23010399003)(376014)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2M2QU9kalBmem5ldmd1SUVsWWNDMlpGenhRSmRrTmV6N3BsZTkxVFh3K2J0?=
 =?utf-8?B?VFRkYzVTTmNLTHJpL3ArUm9PcUZFRmZJUWVhUy9SVTArMTNGL2hYelRHSUVV?=
 =?utf-8?B?M1AvcjNrQjJyUHdGbThqUFhDK0xwTko1a3lYR3JCRjVRSDA4TWEwLzk1QVAr?=
 =?utf-8?B?S2FSWnhpc3NsejVjQ0t3ZE9mbEp5R3p0R3kyY2FYQUVuTnJta25oT2o5ZXF3?=
 =?utf-8?B?SWttQ01iMG1Ibm1vQUZRSHB2V2lnU1IxUVRTQmxCRHhUU1JqME84VFJUZCs0?=
 =?utf-8?B?TWxaVzBsbGxwZEhsa2Zia0lkUGwrU1J4dmI5ZmNtYTJYdnAyMklUSUNxMEc4?=
 =?utf-8?B?RmhCcVJwVlc4TmwxNm9lclBPQXc3YWdnVk1JWFZNeGN0OWhlV1FmdUV0b0JL?=
 =?utf-8?B?TjJ0Nm0yVVVaclkxQzE2RHBlR3pkV2JjMXZ6QzRBRmZtM0J5dXZvVlBGTDZw?=
 =?utf-8?B?VmJrNmliVVhCNlowTW42NXFEK1EzamNmRGViUk9tOS9kWWh3RnJhRXV1VzZK?=
 =?utf-8?B?UDkweXJSUXJNT2l2MnZuamVTZkZ6Ym8xVWNJaFdYV3ZCZEF5Z2xpUHZsbHow?=
 =?utf-8?B?MDVJeTJtU0RNdm1PZXQyTnk4aGlJb2h3QU9oN1ZTZDJSeS9EaG5hdjJBa1hQ?=
 =?utf-8?B?OU1KS2tkY2d1V01QOFRJYjhmc0lUd0x6RHZzZW9GUCtSbnBldFZMWHo2bGlH?=
 =?utf-8?B?L25Wa2RKRGl6NWxFVmIwU25vcnR3eFlkQnFPVGp6Titid1hOVkpMNnFWQW00?=
 =?utf-8?B?dWlSNkN3Yk9tdE83d211OVdqdlk2cDJpRGtXSFZJekNNYStwNzJhUThaTUZq?=
 =?utf-8?B?NStrRzdZdG0vbWZvT0RJSThaVjIxQ1JzcWxPZXhhak1IRkhFOXEycGZYc3NB?=
 =?utf-8?B?VnFOQ1dQYzZsbjdXUmhBMWlVdWRNeEoycjk1blRpamFGOFhDWlMxQmtka2Z6?=
 =?utf-8?B?NHo2ZUJRRGVBSzFhdGNoUWdwRFdpcjA5cVQwUFc3bnRqS045RnlFM2pxSmY4?=
 =?utf-8?B?R3BKM3pkbmFvOVBRTS9NV3o5c2ZJNWpwdUxDV1IvZWNFdUZXR0NPY3hyQmNq?=
 =?utf-8?B?RW1IY1FmZ1pxT1VzV21OTmxnR25kUDRKQ3lWVVp2RFhKdU51YVpuUEhMZGZX?=
 =?utf-8?B?cEN2ZVlFekVacm5ud1hHaHA3SVd5VEpDS0piT2JnQWx5ZGFUSk1QMGd2MExH?=
 =?utf-8?B?N0tOL0F1MGVFdTFVMStXUTFQTDljV3NYRXpDTDdSL0FVTTl4WjRPMXR2aXFw?=
 =?utf-8?B?dk1oc2NyOVQzdWJtbXFKQkZLbW9tSkN5YzNCNGRpT3ZrUkRHUWUrRGt0NXd3?=
 =?utf-8?B?NFpiRG41S0RJZ0xkaFg2VkFyaTZRcTN0UmczSE1kSklNeWl4aDFyVmtrWkVV?=
 =?utf-8?B?UUtBT3NhTWlzNFhTMTdpNGR5RGhXall1OCtKY2QzV1NtZ3JpNTRUNEhxUXpJ?=
 =?utf-8?B?QXByQWtzYzRDazRKZk03VmpEK1ZIaEhOOGZiVCsyYVFwbm84cnA1a29uTlhp?=
 =?utf-8?B?TjkxWFFiZHJtOXduUXRHa0psUDZPK3llVnAzWi9MU21HbVpNK29zNHZhSjZB?=
 =?utf-8?B?NzhJTGNHNTFZZU9WNHlrRnN3eXZmeG0zVURBSmNDVHoxRndTUndOVEpHSjQy?=
 =?utf-8?B?TmRjdy93SkRKQVdGaThqZExGZys5QUJmbTY1dVdhL2FaWWorelRvZksyYjRy?=
 =?utf-8?B?YStjNW1mU00rK3l1YkVmU0h2RjJSRkNSemxwZDAzMHIzYlMzd21NK2IwMmJI?=
 =?utf-8?B?Z3MyeFJMa3FQczMramVoVHZVTnRidkYzWExvZncrNW1JU0duYmVOUXM1ODJp?=
 =?utf-8?B?SnpFU1hVTFVwYTRZa1V5U09rdWhlcFhXZlFmWndpMEhNcGZhWk1sTTEyajU1?=
 =?utf-8?B?N1hDL3FPTGtoUUdoeThPMVlTcjlmWFNjNWlKU3JCZVpWK1NNQndoUU81SjYx?=
 =?utf-8?B?a1dvZGZyV09nNlZmdEk1NjQwd3ZRRHpUUlNXTkU3bkJqdjBoZFRjSko2ay9a?=
 =?utf-8?B?Y2JZbHJJMjUwRHBiYUVlbG5ZbFlwa1E5ZDQ5MXdOUmRHSVZrRVhKUENwV2g1?=
 =?utf-8?B?YjFzMjByT1hpc1JhM1hqWm5QWVJ2aVJkRE9sZTN1TUhDR2VVTytkSzNHWHZF?=
 =?utf-8?B?M2pZU21oOHUzQVZjMVcyclo5L2VUSjRmTXdRSFY3T0JudkFidkxiT2xXQ2JV?=
 =?utf-8?B?TXAzczJORTJ5RUV5UktNclozWlFNbGZWRVZVdk1YaDJBcEZKRXh4QlBlODJo?=
 =?utf-8?B?cHJCcnNNaDJZZDNZbktjbS8yS1Y2NExHY0dzTkZ5UEZXdDArVmRyaHpiaHhG?=
 =?utf-8?B?N2JFdldsSEtrTzYrcHJuM2I0WkE4WXhtc0l4cGdLT1piT3ZMSnlKOGlpbXp6?=
 =?utf-8?Q?o7h6QiBoXa9zYBxqIVuabDXRc7N/4Va3oTr53?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7f2e1e-bc10-4ea2-9808-08df23a812a3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:48:08.6271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VZudObtC8vpcRSr7Fbsm4JuJv1RAkorAt1vQYmkDFlR2YkJxkVMj78nO7EYXXIBFuj0rBboUSTT69HeTMUgVLLr5RtfnOihGxkK2gTHq8b1KCdap3cutlJ33dflBGUo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9700

Hi Andy,
On Tue, Oct 06, 2026 at 11:36:15AM +0300, Andy Shevchenko wrote:
>On Mon, Oct 5, 2026 at 5:24 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> gpio_set_wake_irq() can be called concurrently for different pins on
>> the same port, so need to use atomic bitops when modifying wakeup_pads.
>
>so we need
>
>> Since wakeup_pads is u32 but assign_bit() operate on unsigned long
>
>operates
>
>> pointers.
>
>This sentence doesn't sound like it's finished.
>
>> On 64-bit platforms this causes an 8-byte read-modify-write
>> on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
>> Change wakeup_pads to unsigned long and reorder to avoid the overlap.

wakeup_pads is a u32, while assign_bit() operates on unsigned long
pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
So change wakeup_pads to unsigned long and reorder to avoid the overlap.

>>
>> And the enable/disable path unconditionally sets/clears the wakeup_pads
>> bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
>> the bit on success.
>>
>> While at here, simplify the logic by consolidating into a single
>> irq_set_irq_wake() call based on the enable parameter.
>
>...
>
>> +       if (port->irq_high && (gpio_idx >= 16))
>> +               ret = irq_set_irq_wake(port->irq_high, enable);
>> +       else
>> +               ret = irq_set_irq_wake(port->irq, enable);
>>
>
>This blank line may be removed.

sure.

>
>> -       return ret;
>> +       if (ret)
>> +               return ret;
>
>...
>
>> -       for (i = 0; i < 32; i++) {
>> -               if ((port->wakeup_pads & (1 << i))) {
>> -                       type = port->pad_type[i];
>> -                       if (enable)
>> -                               config = pad_type_map[type];
>> -                       else
>> -                               config = IMX_SCU_WAKEUP_OFF;
>> -
>> -                       if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
>> -                               dev_warn_once(port->dev,
>> -                                             "No falling-edge support for wakeup on i.MX8QM\n");
>> -                               config = IMX_SCU_WAKEUP_OFF;
>> -                       }
>> +       for_each_set_bit(i, &port->wakeup_pads, 32) {
>
>This change can be done later, can it?
>(I mean in a separate patch)

ok to use a separate patch for switching to use for_each_set_bit.

Thanks
Peng

>
>> +               type = port->pad_type[i];
>> +               if (enable)
>> +                       config = pad_type_map[type];
>> +               else
>> +                       config = IMX_SCU_WAKEUP_OFF;
>>
>> -                       ret |= mxc_gpio_generic_config(port, i, config);
>> +               if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
>> +                       dev_warn_once(port->dev,
>> +                                     "No falling-edge support for wakeup on i.MX8QM\n");
>> +                       config = IMX_SCU_WAKEUP_OFF;
>>                 }
>> +
>> +               ret |= mxc_gpio_generic_config(port, i, config);
>>         }
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
