Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C33A1A56;
	Fri,  7 Aug 2026 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786129357; cv=fail; b=RPWHzoveKPeMeVSIt6pGTSMbb6tHYP8XoeK1UJ27aSscFsnLHnhRHDVEG65jem4W20gf65++Ozl/lAIHkAuCWgvgQjGLOKeJAJw6rQbuNmVEHMWSH9wHJ8+8jKMX96AkBRIZRrjdGO0Z1hEbMmJIvb55kthO++gOGzZJ23IR4qQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786129357; c=relaxed/simple;
	bh=DwnuEO/sIUj1ruhEhzMno54VCTkNEoUCJ6lVaSrfb7o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A3AZWEEHrtap95ctBESytMGCf3e0p83IbTDcJs5jjFT402GPHQBr/cCh8T6iMRnP5Y6CDymZ9AYAjlK9fejX4k92yC3HkIko9R+UhH0d2zfTqDldBTXzbsiqxPpYlR+L26l4Ypm16Vc1BxwMx8OIyl3oWCRSlgcY5n8e9/tXQxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=TJdR7fjK; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="TJdR7fjK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LupCAZmjupIVyz511EVQPVXJsMfWsDyjQM9Y3FdkQVNxJsonambAx74Aw2a429WGWZKw1hfGdpnXOLqJ6ekfcntusPIGNLrvfT+bu+tflmHjp2Axbkkk1srhCsnio6qm3rslfuuSxN5UR57Oo5ez5pJeW+8eNtC2NNv9KsBVf0cmsWj9t/GrNNxCLAIrG9IK9Dm6oLnEaVYTr6fiHrBXAboIybAbQCC9DiGsJXb9p8MG7rdBheTtDa4M4WW0RZxkzahnjHutNJaRiqeBB/7KC75d/PhjCHqp/kJywN+2Inknqh4FOfmhXTTc9x51HRwx/YrSQDtbEu8Du6w6q1Ew8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJap/bmC9vQlDiFKj1rCVkPs9Zluz0CvJ58Te/5WhtA=;
 b=tGqbIBHDg2ODCC5GFvx3QHP14aeeGAtWns+XFs10dA+vkHmpDTpQ166HRjgzs3QGhW0dj45tw98dwYlM0ZNIXhkcU7z8ZoIi9t+gZ8SwiIF965w6q4ldAPM6mkr8cHtjka7lJQ+UZR2kG9V3vk1XYq+GmCVkjjZX/xpNHJL6VAyV71jHScY9a0fwK+NGeNLwTjt7oJ+ct0gGkDV5QJWUM8BVUUOrRsRfhuVFlJ9OOsmvTDeW6dAAQSBehMfqr3Xl1WBpiXInRtsRp6iwDPZV8J3FgtJ/34JPXj+DLQYuELuPj5ZewUaPGHuVm5dkrKuSYhRJEqeRWuPXOg9206ZZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJap/bmC9vQlDiFKj1rCVkPs9Zluz0CvJ58Te/5WhtA=;
 b=TJdR7fjK1nM7EqWhTMtFvoEfNPoDtfc82vAzFKM4Dq/o1Rmcv3f81b/Dqq8U/GY/SABKErMtVF7cpCVNImdkzuZcw9zfY9tDvR8nQkdwoE/3uIENUecf4MrQs2EvC5uSTD42Wg7Qb0vmCdIt9f0xkMxJArpQ5LtIZNuezWuPt4tSB/KG42/Rj9j+gXvKNdr8VCXu9LTq0g9gcGLhPlAnPg1EPrZzUYXeXHxNfvES9adHlywsOnQmv8HHPI3XJgOtAyuCOp4iqE6o1x3DEgfeuzZv5BWsdBBPSFZqR/I262F0Vz2Gw8MGOQo1vjswitpxbK3Zaa5ZREIO6KiHJRQRQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS8PR08MB7695.eurprd08.prod.outlook.com (2603:10a6:20b:520::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 19:02:26 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 19:02:26 +0000
Message-ID: <2aa7ed33-396c-4ebe-8421-f2743d93fa35@iopsys.eu>
Date: Fri, 7 Aug 2026 22:02:23 +0300
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
 <CAD++jL=2vt6qJcXdnyuCSEWMTAdZA0-=yhKtsXX9Qqzm9scjEA@mail.gmail.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <CAD++jL=2vt6qJcXdnyuCSEWMTAdZA0-=yhKtsXX9Qqzm9scjEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS8PR08MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e383f1a-0ebb-48b0-8cf7-08def4b66bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	2lFjh+l5azA+GTr8mVqEDdy4XBf3w8DwYcN6WxDriZX2HuFMltZK+jTTQhKNe2RuI96Bb0efY45FRWA6ts8s/C8JxjHQJeBarIBRTsm9QZ+6RTf3g4Tm+R00gDZpAM9KQx1Ja9Xz2dC+f37lJ6bHyi20S2LmTH008ngFZERXoqTe/qyxCCxY5tD5LYJCxuqnUSb6/gUxI18wsF6Esynibx4lnGg1kMsc2nf0pjxZvPBwgfjXkKMA/GRuVzIRQqnhVMHFmMRy2vuhfqYwbpwgoMgKoh5rWo8hiYNH2jbjW3hrPcm7ZrDNAzV9zw8l8DY3yButNWr9Re35yVZW4b/PrvgZ1TSV2pNr5NDWQ2w0qYF1ubZDwlaDtPKX1OJxgUdfD5YB27aEr6yOv3gJhc0gl7xjU6ZQG2AWMVa2Jy6O9q3UsFZlqAs8cDzPsXu5/RYoaR2tyAGR3pu9LVka5mIBE2kgesdqxPjDaFWt/zKqN2ztutTZaoEKeefr2tkKLGMG1c/RPymX3UMv1m5LiNRDIw+g8qdcPAt12QkOeKua8F7IBG0qR3yq+BZzvTkZFzKPXty3JmZFQYv/KGvJ0nGqr4yP96dk1zgW5HrvmkSU949EVKs7FxmZxaIiFMxw4+kHAJQ9mT2UBhthd8oVDUSI0jQiSdHBmdL84F/L+KJeKiA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnhQYzl4c2hUZW1LNEJGNWZUeUhETXpab0RTMGs1U2F3V2xkZ1U2cytQbHEv?=
 =?utf-8?B?eFA5andQajNZMGQ3T1krZlhMTUdrcmxRdTRtQmk2WGJvanhpOG4yNXhGUVdO?=
 =?utf-8?B?MzlFRDF2cmxncURQVHU0N1M3dGJxODd3MkY5UUtFRGlubXgwa1BNdlpIa3Fq?=
 =?utf-8?B?SXdMVStPUUhZQ0VlcG13K0FZSHREWitGU0NDV1NCZTI2dXFndG8vR0wvbVpM?=
 =?utf-8?B?MFkrbW9XTFM4NzlPRGNRek5GMjl1Nit0TmllR2FOc1lsV29RRjZDK2lRcWR6?=
 =?utf-8?B?bmxBZWczcStEL1BYV2pyTUkxd3llUFplZlg1Vlg0a2VjeWtpSEMvUnBSZlo4?=
 =?utf-8?B?WC9SL2NmY0ZZMXdDMVNzeXFMdDU2cmJpbmVpeG9ZN1RwRGx4SXU5ZDY2OWlu?=
 =?utf-8?B?Z2dJdGpaaE9iNzQrSVAzN2s5VyttMk91UWpnYktQQTNYeHozQVlMRFlvNmJD?=
 =?utf-8?B?Nk10U1JoT2hiK0tuc2RUYS9BT2swajN4SmVKZVZ5UnpSNjhtQTBNTERSMytE?=
 =?utf-8?B?MXFSNXRHdVg3VlpScUtjYk4vTTB4T2pJLzdmWFByZmxFbFhVUnJiWnpHZTdD?=
 =?utf-8?B?bjlOcUp6bDdhKzdVWUlmT2ozb0lOUStVbkw0QmhnUVVuQjBSOGcyYzlibXly?=
 =?utf-8?B?dkV3OVBJOElpTzU1b0k5SEk3Q3VNRkhqdUE4bnlkV3NoeHpSaHBBYmxSK0tM?=
 =?utf-8?B?K2lxRDBHaGlsZmg0bWRVUEZvRlpGZDJPTHNDR2RvZmU1Zm9WUUNUSnlwbkpa?=
 =?utf-8?B?U241cHJsMXVvL1lLaVptNWtZMVpwUjBXV0lBRXpkcFpuUCtUVjBZMTc1UnBa?=
 =?utf-8?B?S1AxL2lLTytadWM0c0k5Wkp3aW90RTRlY0Iwc3lGditaWEpRdkp3WUFqQnV5?=
 =?utf-8?B?SHlGajd1QkhaYklMWHd3OENnQm5MaUdJWVl4OVpSWjJjbmZqZTlUYlFlYnRt?=
 =?utf-8?B?bi9kQ1hrUUJOamdDRW1XeFpJRmVRVjN5LzRNc3IxWXFUYmFrTlp1dnJTdDVx?=
 =?utf-8?B?MkdnTEJEa252VkNRM1BNK1lMUTFTb0t4VHUyZUVlYU9VTGhvdGVEM0hxeWZa?=
 =?utf-8?B?ZllvVXpiaU4rbjFKNVMvY3poYlJaZ1Q5eXpuekhDVnpLNGRaTlFTSk1heXFM?=
 =?utf-8?B?dERRL3pYUnByUVgrS2xuK0dPTGdoQXFWcXMrbldWTVBvUXVsa01ZYWZqY3VG?=
 =?utf-8?B?aEtnRk9ManM5OVRrQWxpNzZNWWFGYWNMR0dLUDFOMUlwR0pWNU42SGhIQ1I3?=
 =?utf-8?B?a1dUVUhqSmRnUkxoMUNNUlFJZXJTRkRnVHpuVWtISjRwYkw0amk3R2hhMzM5?=
 =?utf-8?B?Uk45aWdGSm5iT1NBUzZ5ZnArc2Z3OWVrV3FYcDBqYlJQM2o2RHF2L2loQ1Vk?=
 =?utf-8?B?d2t5SW03OWFGTWFXNmxIR3lZQU9jQ0pNaEJSUWpmc0drRkpCZUV5RWxKWmtT?=
 =?utf-8?B?TjNPaENuTE5Pa2VyLzF5K2U2SlcrMGpreE5EUTJpd1BSWG5LVzNBNXVJbDg1?=
 =?utf-8?B?cXBNRXJyV2JzZHV5R0xWNmZHbFRIcU9XNzlnUzNYY05xbXVLZ3ZVdWR4dHF3?=
 =?utf-8?B?ejVEa0JGQVpVYkZJYVlOaU90QzNMVTdNV3pITTVwTVByN1hRZmM5UGtkNGlm?=
 =?utf-8?B?eDJxUHIvOU9TclJvRXMvd3h0UVUwRE9TMXNURUVsVHhxV3lZQXE0WDZFRGZ5?=
 =?utf-8?B?VHIrR0F3V2h5d3dQdWl2WmxvcXQva0ZFZjllclE1YjMxR1B2aGxPWTJocE5D?=
 =?utf-8?B?ZUtJb1JvYmxPMEJJRmVocmhvb200RkMvWW42SHpjWS9iTlgwZElyWjVLRUhF?=
 =?utf-8?B?NDRXMzdNYldERVdWaDBNZmFXSWY0emxNYUZhcldvc2NLdjdjOGU3b3JCUC8r?=
 =?utf-8?B?VDl2a0gxUldMdVF1SVZzdFQzME1uaXFWT2NXaHJleUJWekRLRjMwYk9oZEF4?=
 =?utf-8?B?aTZSRU50VWFYcG1CV2NFandaMVczbkpDbE41eFA1c2tMUEtwTDZBajZMS0x2?=
 =?utf-8?B?WEVCNjI0V2xpYVdBVzFYOWhuNjV2czFUZnpjWUQzTFNsN1JHWWRtMnFBbGxO?=
 =?utf-8?B?Mncwa1d4NTNLYTVSTDR5aUIxMGcvVlBLMU9Lek5XdkIyK1hQVyszN015SVRF?=
 =?utf-8?B?QUlRYnpnTVF1Tkh1ek5kMkFrVXZqTHhyMFFjM3dISjZQODFIQkJtWlRoek9t?=
 =?utf-8?B?Nmh0eVRGOGkyNUpaQjFzdzlERVYvU0NvTWRWQkdBMmJRdTJZOXMvaGxJRDdR?=
 =?utf-8?B?aHgwcEJXNEdiZENNRHJTSi8vVmhFWmlrREtCQlgyVFJQbXRtaHdINE9ML0pz?=
 =?utf-8?B?cmJiM3l0VXAyejV2c0JYd3VYQVRCVkNkTllNK1M5Rk4xbklZWHMxdDVrNndU?=
 =?utf-8?Q?RMvzuxKW4miRE4pQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e383f1a-0ebb-48b0-8cf7-08def4b66bbe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:02:26.5096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjQSXxhWW8JGMUZMXCHCgjy1mHizeYwSggrdjkaz/+UR2dFcAYD3/1Rb3ZJW86glkMpgH8UgdgLZdIrt9xdHpg23CCC0dPWQdNzmQ23Yw/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7695


On 8/7/26 21:45, Linus Walleij wrote:
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
> Patches applied!
>
> I had to manually fixup one patch due to orthogonal changes,
> check the result!
looks good, thanks!
>
> Any remaining nags; let's do patches on top of this.
>
> Yours,
> Linus Walleij
