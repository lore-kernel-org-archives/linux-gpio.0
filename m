Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768155;
	b=SJ77rhaL7sUeT9m3Myd2aXglFNx13QlwxIBnr212w/mSgEfkEbme0DPOLcK8zFE+F+14
	 Gp9kRThNv3Eya2ZSRabhVNhjf/2x1cNH6vfPPjZ6jvwmBNCy2dCf6FSLCg1Prp7rx24rC
	 B6PkHhwfpGtFVFaabZqh+82DoZO6r88Ii/mJCkFaxZJovT0nK574ZUCwr2mayPhjGHhpr
	 oXW4t90s861wtXSqhAIlbF18zYyGwoeDcnPPKASoPXv2tG90IM8Sqqluyjucp743GmnT6
	 q4Qrsf2EK0kiGdk9osrtJQI08lk6VYBFjwn/ABGPfMYmEt6SI17XQ7GbPdQKZir+D7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768155;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=otJDfu2czUDBZpoQ84WulQsGoZ/j+riuANkdJizbN0A=;
	b=xxxR+T0txTHrKtZfiedL79K6ncp32LH+FCPXOPpkDJk3l3jUzAquv2hnttuAj62XTB5a
	 nzluekTphzC49PRjAucEeOnAHIPWbpL64KbL5o3mqM4zK2ZP3KrwDViEuaC63lpG0z2h7
	 TQmISeslpDZ4JRjQRpNROtCJQLn4lQI3h44YKYO0wKO5OeKegW6bjJV6pET/EdNpYw1Z2
	 GywcMJNrJFCclgZTifWGnBs4cDEPPmxXYpV9pDH/aDH+K88/T8FdfBXC9SuBkV+xCQnfC
	 TlMgZd3724IWEgdWjcJ6xebFFInLTUCEegLkdyUdyeJFmKVy1Z/d/PIgpA1gg/84oRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=NHU9x0KC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.2
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35745606A31A;
	Fri, 23 Oct 2026 15:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35745606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=NHU9x0KC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhL/lHZHvJE+n/HDEU4JzALlgSSFO01bsXDFfncr6s9i35k+md1A2OcpJV3My+11BmGrNQDwOzN+/bSCpUO+jhe9mFsEjtqpn+QH337o6jbKIkKMAm0ms7MKVgtG/hLybuKC2vJXXgYD9n9VnNnUZ6e2IAvAI0UcbezD8QtaEMHkU1KL2/142i7kUTDnd7sid0/umOdXUBOi+fBdrXRsOq+sovyf45BWO0+DKd7WRrLFn5MLHZoFzKYfFxarvSipBLagJ41dCD1zewVZY4KEPP7YekFJZoj0W8aKLSr/+PVCldo/38zX9KxbyEuHrhvo/5v37honWgRj3ON5CAiYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otJDfu2czUDBZpoQ84WulQsGoZ/j+riuANkdJizbN0A=;
 b=YW0rTP2cwpzO6ftUM/hnrb9p6yg76qim8ZL0Npvv61n+9oOr/XQFzRSYVA4Usqe16cNIAX46+YFaL5oP5RXDO9reGx6jCbDpz+szj2A/0/r0Y5KySeukVKznjaUwxdEvNFBJRwD82baFvfCemI/I+1kfXhIFAvW3Nb6A2BeXkJ4fhWMBoCZTnSiem6oan8uvFTlwuaTijlIqf537hapDJCu1DUN87UqIDzbcxWbABj3G32YSt0sktzi3HtHgF77eTzHPOE8Iv4gafZZ1XNPj/Q4zg4S5jAHKKO5P/J1zuJCHk4YVxeU5DhcMAF83Sm7omB0O8v/JRg5fkIaUjAi2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otJDfu2czUDBZpoQ84WulQsGoZ/j+riuANkdJizbN0A=;
 b=NHU9x0KCrW4Soyyd+vKDwUlteZcsPWFZGdBBO+SdFfWv9yKvzDTM7Rei7OGax59t6Zn/37aR8L0BIeUo111qxf3pKMVUlaUUhpLB2ZOV/vMzNQhsTukQTmCkhflWzfhv6gWfYqqMBIXuhRSQ3W/diruoTujBh4pxQUtqWwTK4DM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11) by OS7PR01MB18397.jpnprd01.prod.outlook.com
 (2603:1096:604:4be::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Fri, 23 Oct
 2026 15:09:11 +0000
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4]) by TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 15:09:10 +0000
Message-ID: <1ab43b52-0ee0-4e9f-871c-708736023b4b@renesas.com>
Date: Fri, 23 Oct 2026 16:08:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
 <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
In-Reply-To: <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::9) To TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15118:EE_|OS7PR01MB18397:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d69726-1cdf-46ec-f0ee-08df31179779
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|261009221227099003|261021121427099003|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q0mMgTSFbII9/io2tEW5uGI8MvIDG3iCyrQyFiE8HLrU31J1YzKQacbOvhFUdgnkeW8CEYcx4sqtcJ9S2SI5k9AtaIpfldMx3wsWXdBnH5MemIRdwGo22D8YZR4aO5S1uJk+XfH74hHqrGKH2eEqIeB0aJTSiqNlT4w/g/Igf6NljVrfonBxpZgtkU5XcAMWcGf9bNzb4aNjSCNF2Gv9DmeNY847WDNWI5sMI57YGy5aLraIK7cRw+NLVBASHmbiOnw0xfZCCT9CqgMmb8EuwxJVg2y//CB/HiVA3jZvyXb0xkvasGzC2XQUqE5W0baMdHVCECW4cmh6f7mhvHA3F4BLzyw2C6Z+RNLUcHHcSOb3ruVSbNDhC82C10EfMA0eEunoB6mSnfbex4OkO8DqIy1SvAVCshwVIsRSO0TqfWnScSmgh1qcYu5jePO0kMbpTxGpViBTWZZOMCd5wNR2kqaWCc6CM3OT1KtV0vm6eNcoSqqQ9/jENvrgBRgLTNUF1c1WyX2JwW6648soq5cF67ZMRJ5bSmmkfw4txke+Q63kJAzmUoLeOz0zSd6pyIHj3LU6VHsYhM7p0WfYGGw2TMS4vxisbjwSCq523sbZVMcNUt0oz/4yTc2QIj1BH1o7dKA8hAWRt6MLaUhau2Jv48+dLXw8DarzeNbVeLHgYfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(261009221227099003)(261021121427099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzZILzYrOHlRMzI4MGJWQzdxeHJ5aUQzekthc2phNmdrbEVQWE1sYkJ5OGVH?=
 =?utf-8?B?MjUvdTJWTzJVa0VTUTk5VkpQNll4aEUvWXdMREt1aHRGbVFYQ0hua0dGemlj?=
 =?utf-8?B?Ly9DZ2NqU2lBUUdQeUF4aGtuNmhEeUpNa29nNnJWblJURnVtQldIZExLWDQ0?=
 =?utf-8?B?WjZFc3Voeld1WVlKbFk3MWRJL3NYODNIOWhCNzdDa0J0N3VxNUp4WGVFb3NX?=
 =?utf-8?B?ZVlUMU9rbVNFSU1lZGR6SWxYYldKNGgyNHlEcDZmSTl3Z3Z3T0Y3YWhDWHAw?=
 =?utf-8?B?SFhZYXNYYjhHbGxRMy9EYmRORkJGZHp3VUhqYU55Z1RoeUtKN05MVTZkVkxr?=
 =?utf-8?B?eTlkY0V4T3BzWWovY3grRUYxR1BUYzVRZkNvSUJtVmhFUUZQeS9hdnZQVXN1?=
 =?utf-8?B?UzlxSmpHODBDZURrT1pkUzhpemJGeGlpVU9JZVJHY2JqM0FpbEZIci9BMkVp?=
 =?utf-8?B?VklsWFBhakNtUURrVWt3RXFsV2lHaENYc1FMbEw2LzQ0SXU0a2JvMm8rcVc2?=
 =?utf-8?B?Y0RJeVkwQU5MdjdTYzJmL2hGSVJyWXdhekVhWGVIL2prWVNOKzhEcmRnVHV1?=
 =?utf-8?B?L2xSaFV0akJIalhrd3Z6SW9EK1ZqWlJza1ZEVEtpTnZSTlk3bnBLcStBaGZi?=
 =?utf-8?B?Um5RZ29tVXU3ellUZDFiTGtRaDFmMFJBMm5JWGZNSytTcDZIODNDTzNtU1p4?=
 =?utf-8?B?VDFMbFdGWHJhZTVmVCtXSHZOZUpqYmJFaXpvZDRxUmlIdFZiVFJoOXc1M3gv?=
 =?utf-8?B?eEZ6eXo2OTdpRWNaK1lxWEo0NXVtbTVhN0ovdDAvd3ZFOWJhWGNNa3psc1hs?=
 =?utf-8?B?UVVlekJtUTdqTG90ai9HVzJiSGZlYUcrSklLanVxVEdsUkkvdVVKYTAxSG9B?=
 =?utf-8?B?eDZvakx0bW50NDlWWUt4bTVaVUxnd2RmQldWNmpCWjAyeXFjaGVBYlRMRjlC?=
 =?utf-8?B?eDkzR0VISzY5QmpMMGZoMlBmT3ozZmVEMmFXRE9kQ3EvMEpDNUsreDYvSGRi?=
 =?utf-8?B?Vk1ENnE5cVdoZDdaakl3bWJkNzlSaXZRbkp5SklHa3NQQ1NIQktab3g0dXVn?=
 =?utf-8?B?TnNBaGRTbFYyQXJZL01OZ2dMMVluUjVpbEtCa2FBQjFLQjRpQU5VWFFDSjhx?=
 =?utf-8?B?S1RLVHJhcy9CejBMTDd4Uk12V2dDNU90MGcrZGNwb2N3L0NGcVBuS0NoY1hO?=
 =?utf-8?B?RVJDZDAxUG1wczRxY3gvNXFHamtRZWhpeHU1T3hrOGx5RnlianNCRW5ORllW?=
 =?utf-8?B?c3hSSWRoVDY1VXk0dWxJSUFwTXdPR1ZNbmdJMmhNTDZaeWtoa092MGpua2hr?=
 =?utf-8?B?L0tYVW15a1lwNFBseENVaU1na0c3NGI2MklnQUpXZmt4cHJPYWlhUlZoOVhi?=
 =?utf-8?B?L2tCUUsxbm9UTWdWQktPZ3VDK0FZdGdOaVhEUDgvSGhiYWx5d3MyenYwN1lD?=
 =?utf-8?B?RVhDOWtZaGt2b01kLzJtM0dzcGRxKy9hL09zMVpUUzdOTnlMK1JUODZ1ai9H?=
 =?utf-8?B?SHRRUDkxbkhxKzVNeDBhYzVCNWg2U29LWWt0ZnY5ZHdzRWU1OWtWVUlVcDIr?=
 =?utf-8?B?cFp6RXNvWkR2TThVUFlPY2RXSWtPWUZnV3lBa0xOcU5rckNhQXVkTlVSNWw2?=
 =?utf-8?B?UWY0cnhUekptVzB6U3FnckhCVVA3eUY2U2pCT2lqQmNRKzZNTUowOE9ZQk1H?=
 =?utf-8?B?WGRSV3Y2b0tCakRsQW1yYXBJRk1uc2F6TTdQdk5uS0F4L2VCbXNSZmk3b3Rq?=
 =?utf-8?B?OTJwSjlESkgyZU5UOFNocDJRYy96U2tKNkNPSjh4K25qdVk1QUJUdVdtUXpN?=
 =?utf-8?B?cVRmZXpFWFlvejFlbmZ6SHRNV3UzKzRyTmhrdU5jVzU4ME55QWx1OXNncWk5?=
 =?utf-8?B?L0prWm1vTVI2NlFkREI1QXdmaUlzYlVVVk9vR3lrUE9XanpFN2hXV2VVVmpu?=
 =?utf-8?B?bDNKMjA3ZDU4OE5GL3BvRU9yLzdMU3JUY1FyblRzTXZNSGgwSThZamFRT2U1?=
 =?utf-8?B?a1hyMDN2R0VmWm54bllzb0NmYitRa3NFYkh4UFBmc3dTajB6Z2FvYkNMVVQ5?=
 =?utf-8?B?UDU1WXRDTkRFbmMrQ0g2SFFVaUpITnhxUVVjSzMzSXppWVlPaG53L1NZcm5B?=
 =?utf-8?B?bEFXUW1JRElqNU51UXdCYSswaUk4K1Y2NXBmZDQxWmpHRGluUFBIYXpta3Ny?=
 =?utf-8?B?MEFEVGVKaWVkenNGaXFiOXAzN1RsOGRtczNVSTlNQmhQM0RjWWVMQUhRVDFt?=
 =?utf-8?B?c0dVUDBpV3NnZWhvY0ViaWcwaHExdlhRUVdwcndZb0VUdDFkU0twTUZOZG8z?=
 =?utf-8?B?YUlEQlUycGI1dUFNakYrTHpOaGsrenNtWnpoeFdwL2JDaWhBYTVqUT09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d69726-1cdf-46ec-f0ee-08df31179779
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 15:09:10.8694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4nXm0PJQnO9zqSyWO9z1SfkFADNv36PxfNdbPVvFnvq4f0bO1JA5v4aPoUzxfEydfte4WacK/FF/pRmLjTs+etrm84oOBMserBB+N3gb+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18397

On 10/23/2026 9:28 AM, Krzysztof Kozlowski wrote:
> On Tue, Oct 20, 2026 at 10:14:58AM +0100, Diogo Ivo wrote:
>> Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
>> SoC by adding the renesas,r9a08g046-i3c compatible to the OF match
>> table.
>>
>> The controller is very similar to the IP on the RZ/G3S. However, for
>> instance the RZ/G3L variant has no HDR Exit Pattern detection interrupt:
>> RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16. A RZ/G3L node
>> therefore cannot be described with the RZ/G3S compatible, as its bindings
>> require at least 17 interrupts. The same point applies to RZ/G3E, that
>> requires 3 clocks while the RZ/G3L requires 2.
>>
>> >From the driver point of view there is no difference between the two
>> SoCs: the driver only consumes the tclk clock, the presetn and tresetn
>> resets and seven named interrupts (resp, rx, tx, st, sp, tend, nack),
>> all of which are among the 16 shared ones. No driver changes are needed
>> besides the new compatible.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
>> ---
>>   drivers/i3c/master/renesas-i3c.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index 4fddc1b4fdbb..80a6df1151bf 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -1625,6 +1625,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
>>
>>   static const struct of_device_id renesas_i3c_of_ids[] = {
>>        { .compatible = "renesas,r9a08g045-i3c" },
>> +     { .compatible = "renesas,r9a08g046-i3c" },
> 
> So fully compatible? If so, drop this and express compatibility in the
> bindings.

Ok, I will drop this patch and use the fallback to the G3S instead, as 
per Biju's comment on the HW differences between G3{L, S} and G3E.

Thanks for the review,
Diogo

> Best regards,
> Krzysztof

