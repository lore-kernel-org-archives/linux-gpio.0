Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010013.outbound.protection.outlook.com [52.101.69.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D93348C7C;
	Mon, 12 Oct 2026 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798522; cv=fail; b=Q0ZufvbUfm0WfRNmfvixqTo7jwo/N80Fix5NopKScPNnGL5nq37oPXs2DXPdYiC/MdqrsvghKHig7GZitjmZ/uwMmVuJNZv/w6GPibdossqx6AJPnipAqhwhsZ9p0L6Wz6SIbypQKPGmzgwu8A6ogo1g4VNozRayMN8UULb/94k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798522; c=relaxed/simple;
	bh=4MnBJela9ggmTG/uoh/+ro8mh8UYqmTRSFU88iwy7MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eILSUmeu3CP3JCsVwmMYTdQ1jngETEdn3Ib13MawcGx/Um85fmOjKmu8Y1D3/DdXArP1XqIQ5fFaM+9SYTUmd1A+IibImfiOGt4FPRajHgzE5t5tt/TnHU9Oi2IwAJ8DopgniCl9kqJk2AymBbcuKf9xyDCf6gDdc7qWZxRP0bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G6LQaw4u; arc=fail smtp.client-ip=52.101.69.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G6LQaw4u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHnrqYFwzrVMXDUkIggze/idPRrVZ9em0sAXRmTzTram9w79Vlc1/dC+P8AhdYXdludUqK7Bppbl9yU68NPkYBVtYlk74/PXYc/UoW1cYJdxZvaZKCdhTLg+sCbkbUUhYsxakPgj/dcsz9+pt1gt9Nnq8ArH+WRHQoM4p969foNZGJHQm42cUaIyEuvp/rQFYdW44aKDE4Creumu4YS9baVH5JOPP+eZxfaErcJgfAz0VBSxZpPVykD3zmuEhCWyAvPG9srM9kOhQJkQg6oO7xvDWrcvuU/i9xlM6326c8GZxGSDvEMLL2mnIIj4xTe9GxC8uMbt7Uw7Yo6LngTGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQN32VP09U12Mc8KYSirL0cfnK0qyLc3zA6HebWBeQg=;
 b=j0MzxNlbXMbLL0DP0P3lQK9LypQYJn40vT1tKnq4C2S2dcJ6crEKPObF783NF8v1EwRduN6rZQfdOPlMy7LAA/g/Yq2v3eluqmGR+K5hH4XDE0QyKzyU6Al1LVPb/r19f0q0iUau6U3yJCpZ6xMTK+7O0pEIeWtBuxBDTtE7cMU8Nb1pnyqwaXtean5WyZRAmj68KJjQ2YW/vg869aA9HIU4p0MAqrODxPjUvnnX+bEnUr3HsnTACUTBTCOpc/IOgat1hjia4yWNMbFsaDmbyTPKh0bk9zx9UB/tgUujd2vHveZBaP/hm/MS26bA/9NEC9zcpx1PMJ0fO+t4zKMuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQN32VP09U12Mc8KYSirL0cfnK0qyLc3zA6HebWBeQg=;
 b=G6LQaw4ujFZXcxv4xtzgah0MKscGqIwe8iN3+awYM9mr7xUKekAwNEy64Kfp2lP7oR66BWzatujAiArykQQBQBz5nWpwolF+gJepfS73JIHcW07CrWfxhb0LvoMAQUJpPEbtx8IibYcO5DepQKpSUYMDNlbr1vvGP+eivQDgOazSj5Toa4pLZXABhiwhM0UXhP8FV+0xSshZ5g8cLE9ZbT+zurGcnJZHSWq7IPhDLfxvoZEV0QO8Z1o4JfxEwRJncJYk2OhL2PbuR1zZ9umTp4q3jX1u8ZZv0HWOZehXxE9ss/gRASKTB6HWCRjpvKGcFfQVYJWtjjKH5a7ANHTZOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by OSKPR04MB11414.eurprd04.prod.outlook.com (2603:10a6:e10:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:48:37 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:48:37 +0000
Date: Mon, 12 Oct 2026 17:53:13 +0800
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
Subject: Re: [PATCH v6 05/13] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
Message-ID: <asyuCRwvU8U2kjbX@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
 <CAHp75VdsxjdbrvjmFS0R0wzFV1pge1L-bfqmA5dwWD=o1Z81LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdsxjdbrvjmFS0R0wzFV1pge1L-bfqmA5dwWD=o1Z81LA@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|OSKPR04MB11414:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a27830-acd7-4e34-4bf8-08df2845fd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|19092799006|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GJhuqxU8w4yIg+ia5sOeINycvsAwxLf8pP15fzTsstxGtfGFM0hj55W4mgzIUY2vaJTLgY/XMbcu3T4WPvvyEBkqM0tG+RZGTuGoGluWurL/LTqmn0M+zg3/BI+BOStDJJiKL2O5gCZfx+AcNT3zAzrXzoPI3UGRyeTKil3EK3HuvzIw2FAEAGzebMRcbF/XV7vzFvWS34rrblca3wBt6tt2oTLgUwcTOYDqDfNd9dtKETaaHn62mYmJ90wp+GfJCxhzb5iJRkCWyEeyKZH9wbYK466jxUkr5VNcM+apBOIkifowsYg5mBSzlYx7L/wL1UgV3yBVehejZjuH60G9ykWadWGS7Qo8rSlQQ+sk+bNnDa9vnPEFhTAmaxIMuBe5PvdBNM84nhTb8cMKIkEG8rMiC0FgUn1mTRne4z4rGSq36nDUBfYzKmeeAdDgN24Pavoc/sJ2stJ9/ovHX7csomJzLq+IvuwODdMoV0Ew8SROBiHbz2YnUVVfEsC1c/DkBq24wosG6aC7gq2yf/eS+uxLYcRLqXL5613Rt+nOytg+4YrdrJLbN3/H0uTMqtH6sy9ewCZXR4yuFogTVmMyYP6HDkpv1jKh26LajV1bT5bg8P8Jcbfj/NLXj9EarDoPGFYApN/ZOYkYiIN4uOGj9pNZOELt1rmug6PNxXBNIHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(19092799006)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGFSNjBpaGcyZk00VDR3ZDd6bFBpZTBxNzhKQUFEcEtncHgzTkhzYTdmN2F0?=
 =?utf-8?B?L0toUVhwRUFDVEduTG15NE8vekVNbURhb0dPSE1LT0xGQ0lHVG1QdkdkWW5O?=
 =?utf-8?B?Y2NuVEpSZ3JnSDdQQWdFNkNZNW9ENjRZQWNwZTU0YUtRSGFTUEFkNlEveUxP?=
 =?utf-8?B?YVYyVlBZQUR3Q2tjTTJHZHp6U0tOUEhHTENFNzIwSTVhaXFZQ09nMDRoRWQ4?=
 =?utf-8?B?Y1kwNVJ1N2lrQzlIMVp1NkFpZEN6S00yU0tTOHdnajVSUGxtQWxwS2lLTlJr?=
 =?utf-8?B?a0wvMkE4SGpMTnlYUW8zbVZlanJsZHUwU1BFODRzRG9Fd0ltSHE5cVJOcTU1?=
 =?utf-8?B?bTNDaERhQ3FsRFdUUVlGeVhRUVl0Mi9UeDdseEs1MmhKbUlwVFdlVlZ4VFZH?=
 =?utf-8?B?dnExK1pzMXZnZmM0d3JibnRIUm1KRVkvLzFWOEo5RnRoTTU1aVdjbGhLc0Jo?=
 =?utf-8?B?ME9Xb21Rb00zNnZnTFh0ZFFrMk9PbXc2KzlhTTM3bmVzZ3FyZE13bXRGcHpz?=
 =?utf-8?B?NnNqUE5LSlZpbW5jRjRaNzd2ckdtSElXOFpIVDBYNEhRM2FUTFoyd3BLQStQ?=
 =?utf-8?B?Y2wxendJaWRyRE83OXloTEN2OGZaVDZQcXBtK3ZpQTdnRGMwSUVBVVZEczdI?=
 =?utf-8?B?NnpXcVFVMCtTdkVvNlBDaXJ6VFFmU3dpckpSVEFZb3lvSVV0R2xPK29sWUhC?=
 =?utf-8?B?YkNIcWtrVHNadXozcHBQTCttLy9KdEdvK0MzK05tWnFUMjY4OE1ORnpnSmIz?=
 =?utf-8?B?Y1hUMWRqVkRzV0VHQnE5dE9xeUViZEp4aTkvdVlhVm9rR3FQRVRwNkhNemhP?=
 =?utf-8?B?RWRDN1NtcS9YbzZSY3Z1UklSZTEzOTMwRFczZzBERmMxZTU4VHJYSWQ2Ymkw?=
 =?utf-8?B?UE5RZ3pYR0JGc1VqRW82TnMxRGpNeXNOVk1vN01kRzBEOHJuVHYxUmRSdHZm?=
 =?utf-8?B?ZTViekxFMkRJMXlJUzBqSWdwaktIcjcxazdrNXYwRjNmcXFoZDlLV0lVSzNp?=
 =?utf-8?B?WWd0a1h5KzFjeUNIUEoyU1dJb3RrTEtGN0MzRllyMkhDYlBVZFNBVU91NHNi?=
 =?utf-8?B?RXk5VmN1YVh6b1BsRXdpUVdyU05UNkRIRXNwOENURzVOMGE5bVQ0UDhudkNY?=
 =?utf-8?B?WWt4d1VGam1xS3JCUW95THQ3ZmVZTHlRWTJRZm9RL0F5VnQzb0JpcHJ5TGRi?=
 =?utf-8?B?eVJjSnpycU9JTGFCREZ5NmdmNDMvWkZzYU1hMVlmbVBqbUxVc24xRTViZjVL?=
 =?utf-8?B?RWRNTG1TbzZmbnlmMXg5WVJuSUQxOFpFdWVjVWI1U0kzQTNiMVBnNmRLajBv?=
 =?utf-8?B?dTVhQTZPcm9SekxCVGdmRnFKVERVdHBNN1NJaFM3K3g4Rk1ocWUxR0NlNE15?=
 =?utf-8?B?SGxNQ28vNXVzVDZVd3MwZStBMjM3TXNCdFVqMkd4bGoxVnhQQ1Z2MkhQOGxj?=
 =?utf-8?B?Z2pxTGdVNWVBZnlHLzZlNldEeThLZWR5Y0ZjNm40T0xZRStNVGNjSVNSZEFz?=
 =?utf-8?B?YzdpZzlLQndUSEF1ZWxURTVicDhLUnl5cXZrZmduSWRHTm93NXdhMjRScVdo?=
 =?utf-8?B?S3VRZ3IzZnlIdWhBS3I2K3VMeUl4TVBzdWw3dGpLeUNaQUtTaUNLV2xDa2Vn?=
 =?utf-8?B?VTRVK0w2QXNLTzIvem12bkdFUkFFU2NqaVRPRExuck8randPYkpvdjV2V0l4?=
 =?utf-8?B?UWdwVmFXbUYrek1WVnE5ekE4cnRJdmtsdVZSUXBzdEpwZXFSSUdCV3c4YjZx?=
 =?utf-8?B?a3RPOStHWEQxNDE5S1VYZTFqbnhZWHJXK2NNbG8zcEYxdlpCSTJtaEZYK2tr?=
 =?utf-8?B?MndQU25DbEhDNXpjT2xBSzBDTUo5VHFxNk1JaWNlYzU2ck93QXI2VDh2ekhp?=
 =?utf-8?B?TTN1Y0FMbmxhRlFMbEZ3UCtydGlSbmNCOWxWZkdXakJMY2dacEVMR2NldTRP?=
 =?utf-8?B?czloaTBnNlpmWnE4TEFTTkZKTFhnYjlydWpyZmpFbWJFVTFYWFZtMVFnaFZr?=
 =?utf-8?B?L2txNkFkbFozc05VeWpQWWxEc0REMXVvRmE3Ry85OHlXYnhhbk1KYW13OUNz?=
 =?utf-8?B?Q2Y5bmxHaEhvY29Hci92UkIvbHJwb284VVY2S1F6aDRKTkFIQnJ1dzVsRWUz?=
 =?utf-8?B?eVdGOUcxU0J5ZjhWdDJTQjBGTHFQLzViT2NOZ2hWcXJPdUh4V2dZYVltTlUr?=
 =?utf-8?B?UU1ZM0ZhSmptRVdzazhMbUM5K0JyTGwydDlWVVh3cjhRVU9aTUpaeDR4ajZP?=
 =?utf-8?B?Wkl1U29BeFdQTFZkbmxTcFNGd3BhUFRlK2tTaHNPRnBDdHdMajRvaTR2YjVG?=
 =?utf-8?B?MFl5Q2pXVlQ0RWhwY2pLY3B4T0FoaVE4b2xWNTBWSjY1V0Q5V0VubXRYVkRS?=
 =?utf-8?Q?VQ5LQc23+2b5C1zAzilAUK9vF8IpMAdWT4uZZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a27830-acd7-4e34-4bf8-08df2845fd22
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:48:37.5633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wECDsKv3XtQy0Qa5qwWJ1d2YuI48zUNNYLXbjb4p5SpFlDx4Oq63V+ktn5sPesnHbA2tq3Hs0pH36WPkbvJq8R82wueW2utEiN20/ludYrdmrVNB/PoMzrb9djzHy6uE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11414

On Mon, Oct 12, 2026 at 12:19:13PM +0300, Andy Shevchenko wrote:
>On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
>> of checking every bit individually.
>
>Suggested-by?

Sorry. your tag will be included in v7.

Thanks
Peng

>
>-- 
>With Best Regards,
>Andy Shevchenko
>
