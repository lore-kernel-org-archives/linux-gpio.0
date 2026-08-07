Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021099.outbound.protection.outlook.com [40.107.130.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE414272E6D;
	Fri,  7 Aug 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120740; cv=fail; b=XoSwx1ZmJcEyZeyIK593NEy87k9k3Kk9psQdTz2DPNUv82XFKAMFjSFtutDzlI1uJUmYW9t2XCeC+ZmSvCk9FVFpbMsOR4id4+UdntHCikvm3CKcN6J8hkWYIJr/MFTxq5x9KHOQQOkpn+s321BM0/QTu3GBsX7LMKX9ExtRZfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120740; c=relaxed/simple;
	bh=whq5f7Foux3R+lo2kYb8x8E7GRmqpIrGndOMObN7hyU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WGeqsXD3P8OaWvF+3+sP1X61bSVPR27ljhQ6Ifs+6FV42LIx4VJabnyniFASwZNz3gVjv0XCvtUaEna2EnAYZl46lAELiQIq084FG3Kxnf0crD5hb3HNotCvglQ0oCSIaMTMIodcb97Mde3/Gy3sQy3AV293Ua2Yneo/ohYS5Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=DQQp5HX4; arc=fail smtp.client-ip=40.107.130.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="DQQp5HX4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bbu33SuToWl+YOQ9a5CYrSO5olhSPWfvyh1yJDURM8gtRDOSVcebadoql00IU3Eog8x7Aj8YuwL8WzW4/6/msRYhm4V/wif0MPuo9S9MUgagJSq+2S8mkKuCnEog8qEk/KZDHz5XiT8MDKfUjvbYhADDUUcTSxdAp+dLX2rx7D6EUdIx0x0x3e+6v1mk1+/9Xp44bAUmAWqWOLUKcmELuLb2rlzMkRJyidRVHm+woUN7mmShIcT+4b/WuhUPEAjbw/8GRyRzmHoIhqivaDeurUM5XWrXpZN1d6xHmTB8mD9hlQ39tXxgkjcZ9yUec4+I2UaZwRAlw4K2u4eq2Mmflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zex60VbHrfG7OkjV7ydF5ctBknwdk9FQOgg5YarncGI=;
 b=fJSOkcAcRaF+/a8SOIzWgl+6jv0xseRuxqt8zlL+z1hWjIkd63Nxaxn6+MkHE/1F+DBxdUiHJWRuU1Tg0pJgqUMi25Spd3wnl8RdjofMAHubxXs+Ih4Y+G2jZTSc0X6sSV3ddk9cAR36dOOjbJrpLPP2Pdn38Qll8AmcUCMmScoaz2k5d3K4nl6hRQgcUa3psN9j24EX9rh4nu5HAEBIRQF+Pkvzqg7s2WKg7KNqWLCeYedwoDFqp/igb2+unPhRevloAVOGml3LcAfBVxN3NmSR3xYOd08Fc3gNgFmy1aOg+AmtnSB03W/VQTzmJZRxezkgFkq5Bj8QUpx+r1H/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zex60VbHrfG7OkjV7ydF5ctBknwdk9FQOgg5YarncGI=;
 b=DQQp5HX44mfEF37zRwzmQ9aE/1r163I5WvZx97uETLqYBHyZzJLx4y4cW9tznOYhcwcjjolTCBeqg2nXmbC1Hp9dxb2NInBbURZ8u9gqlkcERtYKgteWY8M/jBshqb1d47a0tWvRodXDQ8EIcr5PF0MzrIDT2dIx5JLnOEY6Cpk+JbiozsoM63lCB+WMsBI0GGrZH/akiJ4GXg4zh13JxEGNzB7TFpSqsFfCqNA62VCiG7BmTa1ORPvJqtHqRagb/zcUt7GgG+3rxQBZCEd7y9pKiSHO3z0qMLIUm5SQVYrVYs5j/Lvrml1li2TGbL67hJuj1lPrWKVQ9qGDd3w/9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7853.eurprd08.prod.outlook.com (2603:10a6:20b:51c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 16:38:55 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 16:38:55 +0000
Message-ID: <4c0f22af-6124-4118-8ebf-0725e8fc89bb@iopsys.eu>
Date: Fri, 7 Aug 2026 19:38:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF0001DC19.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::279) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: c5dcb63f-ad29-4362-bee3-08def4a25ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZVm382pcmK+7Gs9Hqd3TbfkRqFQPCa3y0SfzI6AXp9UBk5qedt8PN3d5LOYOBeWLdosMGWyawHNaJU4g+5EtO5VqLyzPf3W+U9q+U6oUkGl/Cv3blawmXF1Eo8iELdZmsY6QIPvZaG8y1fWXt2dPzFEGlRpG5u12uVBmtMFuFbIV6zJr21p1YGeCCh9cyjC9gcwICAxolfFW1LVjUtTscUD3GHMuO+pikgw0unP8Oy83XeTBuKVzyhjocu4ZQejUJw12pOAfk4pv36HYKK3ViJCbPpEIhIp6mboGo5dktuO+4xVXS1DiC1xxBWMiLpLeOSW8qOigFBzYL3MnJsL8A6szr1FOoYNfsAJ9We21SVDVSAl6lQ2ccre96OdCHplOBx8ciEhe1qxMDj4IqOpK+jldEmGan3nguZBwFLZ+CIVdjDcvjLS/N9GzbgbmM1BnxxOJTtnlqLdsjLpdVL7dBfW8s0h5Uzcdl2B1IOedxJisk+HqIw7EyGW7l4NJMyUqvgKr4DfSiryv0cno+yZ5a6kVIcURXNq0E0voASpHbGzt/gLCsFluzxCZKGHQhmPVpP6IVbxAvHsOubyuNnuXVCM73JMrt1hBcxKYdvSUJ1Y9NNKTVYgVw8Vbkv/yw+7qLjZc7YGBz3ctSp05RbuqYpupQsrcLdurRyih4Sb/+zY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlFjZ3MwbVMvZ0J0SXRrbnpTL2ZacGZDbklMbGhuM0VyV1BFNFRNVUFMUnRj?=
 =?utf-8?B?RHJMRUFPcGhjT3IwYzR3U2Y1Rm1xclR4NHVRTW5SbTJabGkzQU52QXVNcXVT?=
 =?utf-8?B?ekJBL2ZETDloS0lNTzI5V2hpbUZxV3hBNTZONzZGT1BVQ0J4TGtNa2RnQndv?=
 =?utf-8?B?a1R4Z05jZTNhWFN0azhyenNrcUh5SFpVVXRHL2NuVGtaK2VTUFhNNDJ1bG1t?=
 =?utf-8?B?UlNkOTFGb2wwWHpSS1ZwcnlGKzNUUjh4Tm9UYWVLVmRnRzZublJZZFVaRFdK?=
 =?utf-8?B?RG9vMlh2V2FKeEdCbWprNDBWbVFxQ3JJb3RiTDNYaUZzNkJkRm1NRXc3WmI2?=
 =?utf-8?B?Q1V3a1ltRDlraTJIbURnMEJzcytnVFhiSjlJbjRoOE13c1YreXV5L21HM3px?=
 =?utf-8?B?cjQrY2VnT2lrczRZdW5LaFVPVzkwd2FQRlUyK2hXT1lBT05MRDBJVE0zL0gv?=
 =?utf-8?B?N0tGWnJKUy9lRnFWSnRsanJFV1RVc1p2NGRydFhpdG1UZ29RVEtRK0EyeVd5?=
 =?utf-8?B?cWh3U2EweHYzbVEyK1FaK3h2YTdkR0svM3lyMXRVQUZZYWJmTk1SWFVER1V1?=
 =?utf-8?B?S1I5OXkrdE15RXNQQXRkY1FTVzlGZVZzMllJclMwZjYrTUZ4TktIejJPdzFl?=
 =?utf-8?B?KzBWZ0RUUmtZRzZsdWprNmZEcEN5ZTYwTDAvSC9oVFFNQmljUk9TYTF2UGVv?=
 =?utf-8?B?VytEamhWam5MNmFPYTlNNVNrQW9VeGxaRnpTMTdndkQrcnFvZDl5VXZtRVVK?=
 =?utf-8?B?RWNvQ1ppc0RLQ2dwWUhUMERyMHNGZ0VuR01vcERXc0crczhRTnlmNDFieHNN?=
 =?utf-8?B?RitlMmp2OEtIN0dJMksxalJ0NkVWT0p2dFIzMlA2UzQzVWpONDVPbWJwWlVm?=
 =?utf-8?B?dXg4UUYvTytBSWVlZUlKUG9QbU9pblg1WkROU05LRkdmT1ltR1drU29pajUx?=
 =?utf-8?B?MUJ5ZXM0RjBiaC9nNmJVQVd0elhYdno0cVgvNmdubjJjdG83MXpoWDBodGlx?=
 =?utf-8?B?am9PZWlRcExiZkpienRqbmlOUklDanZVNXNZQzhMRWI1VXRpMVkxa1g1ZzhY?=
 =?utf-8?B?NEFKNmVuUVdrbGhRZTl6ZEhIUVRBcnF5TXlrQzFMV1ZUSTF0RHp4WEFsSkFl?=
 =?utf-8?B?WjFpTGZpRTF6M2huajYxTVRtVS9wNzYxejJDUWRJRk9ac0Znd0lkbmQ0enhJ?=
 =?utf-8?B?QVYvd3NOdXlZbTR3S2huamV6QXBXYi9wazFTY1RpR3A0NUtSeHIxVVBpTkRE?=
 =?utf-8?B?TlNTS3dNejg1VHFJai9RL3hHenlDQmxydERQUU95MG1lQ2x4WXIwbjlNNmxx?=
 =?utf-8?B?MUFuRnpHSUZjQzl5UnNtV3hzbTlIRmc1ZFdTcWRVeCtya2hEK3Z4cGd1NlJx?=
 =?utf-8?B?bk5qQ21lbzlPSmlibzJVeUVSZlVjS0xtK2RKT0J5bGpWRDJUakZ4U2cwdDFa?=
 =?utf-8?B?TXQ5cTZvNFNQNktBc1kza2g3RmZ5TE5qSnNUNGt2bmR0UWp4MEVwMlBMVndL?=
 =?utf-8?B?Qmg2SEFteHNsVURWdXpQT05WcndKMC81Q3U2SW5FQlBHVitvMXVyQUhmcklt?=
 =?utf-8?B?WVdYeVh4Z25lVmVtRnQxZDRjZm9pcnZHT29uemI0cG9DL3Y3SVk0MW5Dc0lr?=
 =?utf-8?B?OFlhRTZYRXJpaGh2alg3UFhtdGJ5K1MxcGlBbXhUSUREby9LNk9JWkdpZUsw?=
 =?utf-8?B?N2o5d3JtdHhpVjZLclY0dUtwOXMrdGJFUnpMeFJoWUFQS2pxZVdxRStSUGN2?=
 =?utf-8?B?SDN6bzFXWEwzakdkZy9HVzRZZnJtTzdGSENIS0NnVGhQMU5zTnZHWDRZeTMw?=
 =?utf-8?B?TURRTkNPTzZ1YzRIVHpack91bjJTSHFTbVA4d0MvWHFOdVhOYmwwSUF1aUxn?=
 =?utf-8?B?VTkvTERWakFmRkdGbWJCVC9wM0hVQmVTTUNmWmNMbGpkZ2xnYXlTcWZLd2hs?=
 =?utf-8?B?UU8vZVRhT1RaU0JNV0xRUkR5YnJMN0F6WURORURib0Y3WTBEblNyWTcvdDJS?=
 =?utf-8?B?M2ZEZitNR1l5clBqa2NVQ1F5T01LVTFzRzJMQ3c5dGJlNEU4eGREeEhVa3o0?=
 =?utf-8?B?TVhDUnZZdEZobXEvRTF0RnNkdTNzUEZaWG9jWFQyejFCNlhQTUhLN1lHZ1ll?=
 =?utf-8?B?bzlUTzd2T3lTcGt5VEtRLzBNUUFrdWtkdEJULzQ0cjczaE9lUm5FeWttZVZr?=
 =?utf-8?B?UDlOc0tic2laK3IzaFhDY3h3cWJQV2c5SlJIWDUzVU40QmJhaTdPNmJLdWgy?=
 =?utf-8?B?blY0VDhIRzVjWDhvZXJlZFMvckF6c0J0aCt4eFpSalVrZVM0Sytid0V3dGow?=
 =?utf-8?B?ZHdNZTQzR1F0TDJVclBSc041VzErbE81VEtXdGlSa1dBdjZlaENvWlFsWjc1?=
 =?utf-8?Q?D6L95qgW/ouXxZVU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dcb63f-ad29-4362-bee3-08def4a25ef0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:38:54.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lb2H+EejlCx04aV0SKXOscFR+pc1av+FM+sBh4KwXe+nRBlIw3IMjMT5MkhGlUZZEm+/rFUcK/zmj6DTEbnpQ/h/Vo7BAv0WsXFH9+HwqF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7853


On 8/7/26 19:07, Linus Walleij wrote:
> Hi Mikhail,
>
> On Fri, Aug 7, 2026 at 12:06 AM Mikhail Kshevetskiy
> <mikhail.kshevetskiy@iopsys.eu> wrote:
>
>> This patchset
>>  * fixes more airoha pinctrl issues
>>  * split combined driver on common code and several SoC specific drivers
>>  * improves an7583 pinctrl support
>>  * adds support of en7523 SoC
>>  * adds support of an7563 SoC
>>
>> The driver split changes are based on Matheus Sampaio Queiroga work.
> This patch set began with 11 patches and is now 37 patches.
>
> Is this becayse Sashiko is touting you to just fix more and more issues?
>
> I think at some point we have to draw a line and say "let's fix the rest
> later".
>
> On the other hand I appreciate your efforts...

following reasons:
* move binding changes to separate patches (8 patches)
* openwrt upstream changes (4 patches)
* issues found by sashiko (5 patches)
* new features (3 patches)
* code cleanups (4 patches)

so growing from 11 to 37 patches looks reasonable

>
> Yours,
> Linus Walleij
