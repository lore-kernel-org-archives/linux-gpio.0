Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012037.outbound.protection.outlook.com [52.103.23.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6287939CCE5;
	Mon, 10 Aug 2026 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366451; cv=fail; b=bcc1wt6frevCbq0lJVrnYk14CbmvAgIO+zDBZNwXWkS7hLqMChfXyr8xilVSUEvdlf+Vymno0MYrsQyu5V9sY0W4UzLW/CBMRYNL250/hfBpuDs1KkoMG3WML8ZaUAECU2yF/2fRo0YugFkhFTxtNm43lNFIp50YMEqA9eWmyDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366451; c=relaxed/simple;
	bh=eLQ9adDM59xgoBHe83NIf2g2wQqJmreB3EHGLbfIln8=;
	h=To:Cc:Subject:In-Reply-To:References:Content-Type:From:Date:
	 Message-ID:MIME-Version; b=H6lS60uVDWUOo/1Gl6I03Q6h499umlDejHffnaR4qjwOLjHrLb8yh5czfhXejoseKFo6fMYHAdXXqbgbgXIWnBD1f93uhY7lQPv4tHpuh6wwmEcSqW6q/tJuXiNQUI+lT0SLTDJpcd1j0t+l6/UyruL6PgnSe0/lHIH2RqUQIDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mZG59U/+; arc=fail smtp.client-ip=52.103.23.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mZG59U/+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzVu1UpJYysHwaPIB0lBvORscq4M8IA8gvxVJbUgpwDTR4EVnk83h+Zb/2jfsrF/AExYi4JbAtMMviP6rRI3yeX1lgdoAfWNsSg4+Qu4lqIlFCCf0B+kzUFBV88bL2rWItTcW5F2yuOLuYaVDkyixYQ/TDSRn0sgoDf9qUlXf3QzPpMi9RXxnmEug6LiCDfTfRCgKBxTbNeAcOFLmrGVD6C53rMrvQFpFSB5x5ARfdK1dd5fAErxRPb/ir/Pq+Qsvg8a8ve3MLDVSKCPX9BHLIprJBWJgm1XEOviZMYOEg83y4mT1WTf+MLrFYYuVPII+Mv0l1iJjK4HBdSJnj6ivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLQ9adDM59xgoBHe83NIf2g2wQqJmreB3EHGLbfIln8=;
 b=uzaMkJtlqSTROsrcvWJ7T9JdHmOecQMpUjM4uEY8uDppD4sC6Iy8SnjUoGG0bsK/ihRfzLZnMxRu5gxFMPnmGd8v3sFw3yINVfPzaGjA2xMuowdMCS5CtSRXcj3GwweTbUy5EGPWo1WDuaul4TpRI6TXkf7X4odvVUzONVLqmp6U9Hz5jbBVVFYKST2+MgHEgncL9DFwAcoU9XK+1qOpsMIhVf4lwODE2FQYDSHqbkUJfiOMPaWvydEhHirOJUQ65L2dhb/tVqOqykzJIlNrBBgO/Qvq70x9x5+/wfYn4s77M+JIIiw7Kxhq0C4nTJp1edxwXFa76EWnPagZwtzfkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLQ9adDM59xgoBHe83NIf2g2wQqJmreB3EHGLbfIln8=;
 b=mZG59U/+CPTEd8AQDOa+SZa4eKhrzwggvONzj0Mdxl6nAkvlPUJjvu3YIBDBm3LME0g1+BRlPk2wBYD6XARWoRgouIbXU1UckPazZxEmAmPYCtHlKP29K4rr3dawMZXhb6t/FjZHn/zoC81zuA8IUO+hql/tVsPC4W3QO2WVM8rLrJaevwjgERkPsr+tcQM4fc3Aipa7i31G+mFHUYcoD4UPsOP5VM6yDk7o3K/wzzNEwWNnQGdlTvxF7tOVebvzHzRZBuevwVlENV4ZZZLamwuc3bIqI21OZhd4uPBimpVWDg1g6o3gm9vubpViRx1fuEn5ULahc7Ee1OV1gWIUPw==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB6109.namprd19.prod.outlook.com (2603:10b6:510:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:54:07 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 12:54:06 +0000
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>,
 Lee Jones <lee@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Linus Walleij <linusw@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 mfd@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/9] ARM: stm32: add STM32H7R7 and ART-Pi2 support
In-Reply-To: <6c926423-777e-475a-9e28-222d3fb5798e@foss.st.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <6c926423-777e-475a-9e28-222d3fb5798e@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
From: Liu Changjie <liucj1228@outlook.com>
Date: Mon, 10 Aug 2026 20:54:29 +0800
Message-ID:
 <MN0PR19MB6091BDFE3DBD8AD6DDC3F77DACDE2@MN0PR19MB6091.namprd19.prod.outlook.com>
X-ClientProxiedBy: TPYP295CA0056.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::7)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <178636646929.268083.8176274173003069719@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8c9cfa-2f84-42d5-4f83-08def6de764d
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxOqkWTFX5UGk/2pyNZnU53xV6d54l6wUaXAO3pwQigW1uhQ38aY5HhTPh0ar4doz76rmA1u/D5bhQ90U5+2p0MbZdr34hgDayH+jcvTIzkjzgg6bEM0A/0v+0V2rufgyvx+908JlM8kA5epqd+iXG7cWzYaLAUx+Z1Rf9eU0yoRSP2qlo3S0CHVGez94TiQXGBFyfgQabUm7PqyQpumcw7qk4/KqvHMZNXGKHQdVOPlWOGwfrvePWDaRmW5C/O79KTLsuPPjAqX1J6fD/zgqv9BAFk8E7iG2zV6AtmlXVdelcTSX4gDyQAQZHycbN9uqlTbqwEaHBTG51KnuDRgRxQRNP3htSqQO2UP/Epmq3tTMycNnhbRu/RoHrzETITLkMKbXSRY6un7ONyVL8J9YDtbjTnUl8koGMotKZMof0c1mnw2J37fKMW7yfJpUlKP8Uj5p2AKn3jR/Yyz0y765eJ319JTvlUQ5r6Nsh+eKHEJUNTd70XEfTYuEHKwKumKVWVL8YVEqp0C0DVGrADYRcPdnfJ/eU6yk/lqoWCzA8LAUjZ0tzbRtknb/zBYuNxPV6rPHtH09Aq3GG9dl9VYrTU04JEsAzB/v9myA7XqsuYT4XXPTOavRzvOyNTA/LCpvw7fw0RaxTVtm/8t+bANYGBX+R4DzvV1Kh7PAgaDIvj8yAMOk/Mb5CQGCeBUqOgcfBvVqa3+/FBHo/gYwZ+Gzm8SW+vECpeaDPmV+NPEf8FItU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|6090799003|51005399006|15080799012|23021999003|5072599009|25010399006|19110799012|8060799015|3412199025|4302099013|26104999009|440099028|40105399003|10035399007|2607281247196008|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFhXeHVQVk9NeVRIZlVtUHY3MnVKZ3hvYjFsV3pUV0VZeU55MlAvaEJYMWRP?=
 =?utf-8?B?TFltMUFKck5CSlJkcE1LZ3RCNjZ6L2VKSEZ6NEFXVWs0TnNIalNJNG5rUlZI?=
 =?utf-8?B?STRTbUwvMDVaNmExVkpBL253Y0V0WEowQ0tqcE5ZaWRXTkFUbW8rL3Bld2RM?=
 =?utf-8?B?dXdKekRHa3FQd2Z3N3NUaHVOY1lDQlQ0d0dPY2RDUVJva0FMQ3dKREhWbkVa?=
 =?utf-8?B?WEZGMHpZT0wra2VTLzFKZjJ1dzhTeGxlaGxjS24wUmpOZGpWdGtyMkVieG5h?=
 =?utf-8?B?L0t1bWVDSXNQcDAvb1dmbHRPMzVWZmcreEg3QjN3UVpJYnBweFhySExJcWdt?=
 =?utf-8?B?Q2RFVVpkSUdYRE1GcmdEWmtadFZEbmNBeE9IZG92cnFVU21wTkZDOFpMSm0r?=
 =?utf-8?B?TnlFOWp1dDJEdmFVbEpNNk5TSThQNjJPcnNYbFh5NUdpRUVhQS9QVVhjSUhw?=
 =?utf-8?B?NlBHTklQaVpjU05YY3JBOHppOTZXYXZIeUtkaXFQUENEYm9UZ0lOWnJlbXM5?=
 =?utf-8?B?U0g4MHdaUXFpRmtmNlZkV0txbFpHc2l3cVhHYlFNS0RzTXJ2bG0xcFR0QjEx?=
 =?utf-8?B?clZ6eTZJeEh5eXdCbkdKSS9yTjFaK3N6Z0VPa1BhekpORkhRT3creU5ZckdM?=
 =?utf-8?B?N3p6TG5iRFM3NlVsTmtNQlZaamdwSlc2OGxvYVcyUVRyVzhXM1VTQjI0ZjhZ?=
 =?utf-8?B?a1BOOGxhdUJtWWROZFMwMG11YzlOSzRPenlKbUlIb3dERGQ2ak1WbnRvRWc0?=
 =?utf-8?B?WW01N1JWd3I0dCsyZElNZjdjZjNoRGZjUndRRWRrZlArYVdsNHFDMGNUM0xQ?=
 =?utf-8?B?TkIrMHZ1N01qc25MSnRnL2w1R0w3RTF1bzFZWE1RQjZiMHVsRHgzZ1B1UG9r?=
 =?utf-8?B?aUZXQldwYVlZZDlGN080SXkrYkp6cHErRUhzSFZBbElEcFBQVVB5ZzExUzR5?=
 =?utf-8?B?My9hcS9VMlgrT1lJRS8zeEJhbE83NVR0YTNFVFhnM2U3TnAydW55UzNBTkhz?=
 =?utf-8?B?ZVNBVHZub3hyQjBTdk03VHYweklJV1A2eWIxblFKRGY2bGdiNzV4VVJoVEF5?=
 =?utf-8?B?T1R0YWw0cFFrRE9kKy9ZSlNFeWRFY3ZVK2NhV2tNSTV0VXRNS3NNODhaU1A4?=
 =?utf-8?B?VTIyUndhbkpPZHBTdGVUbTRITkpVcGJVckNiZWZBY2wzZmpTZThjKytPS1NB?=
 =?utf-8?B?T3QyaC92NjBuaCtGS2ZBRk9YL2IxYjFMUmNzVWhWTkVPRk9xMXFZZmRwQ0Fs?=
 =?utf-8?B?dEFJMGdsVnE5ekE3TlkvZHdveExhVytrbnhOc1RkSFMrNjJ5WnMwS2N6T211?=
 =?utf-8?B?OVRGNHhPMU9wc25lZDJsd2RhM2pjWWxmeW8zUy80MnJEbG9WMmk0QS9nVzFI?=
 =?utf-8?Q?p6AOoIpCjQOgdQuvdGg/NZ0vaRElYpDg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R29XUm1HUGdDVCtmU3c5ZU9IRE1kanZhTGRsZ1R5TkFUSlhML0NGcEg4SFlM?=
 =?utf-8?B?VDNRdGg3NW9kcTJrRUlPSnpBVmhYSXB2Rll3UFVuRUFKWDdXTTZmUXQwZTA3?=
 =?utf-8?B?bnBXK3RMTHYzaGdZTWduWVNGMGZFL0VvVzFJU21DSjBUS1hxb3pDZGliTnBD?=
 =?utf-8?B?U29jWWhicUhLWmpFdEZkMkxzNzNtZWxrcTNWSWxvbks3bjJENnFNR3NmcldZ?=
 =?utf-8?B?aHgybEVwbHJEbkxONHEwclkrb2lCSVJFNG5wSUNTaml5Vi9UQWNhQ25MVTN3?=
 =?utf-8?B?eFp3ZXU0bytUUWJocE1aZ2lCamdmTDFpb05pRXozNHI1K0dNOGcvZCt1OEFy?=
 =?utf-8?B?SnhOSGtNc2N3QVlGRXdtOXhBL2ZLU1VvczMxU21JbWVhaENkeFg5endPTXds?=
 =?utf-8?B?SHljVmhuVkFod2JNaXFQNHpVK1VIK2lVU0VkME5RNWI2a2ZRZXkyQSt2Y0tW?=
 =?utf-8?B?SXE3aGh6R1VUdTQ2TkZiUG5Hc3c0eXBHT2NJdklVSXd4UHQ3Z3ZwVFRjSGlO?=
 =?utf-8?B?QnpJYno1YXZQemtZTytRRC9UU3NkK3dFdmZaQXVaOGpHbXo3ZUFpOFRkaXFO?=
 =?utf-8?B?c09WMUJnSytrSDJHOStXVTJQQ0hkQS9ibEdHeG43VFJINlpra3NOT1ozbmdH?=
 =?utf-8?B?a05QNnY4UUdodnIvL3JnallkVzZSNStBR3dHVVZNUi9hc01ydzdTSlVvaTYv?=
 =?utf-8?B?blBrSGZDSy9hUjVueWxwaTREZHRheFhkZWUyRlo3Vm9iVlIvb05TYnJjZDIw?=
 =?utf-8?B?VnlxQ3dsdTljU0s4eldaREx2eHpPalhBNmJFdElHVE82SXFqT09lT2RiZWhI?=
 =?utf-8?B?dEtQR0VySzZLRG1kdTI2eTNmcUIyTzNpOXFpVmV2OUtlRi9yb3dDc1k3NGtG?=
 =?utf-8?B?TTNYUmdYUXlCSlNIclBXQTJxdTBVVTNCaVNjWTlQcjV4amhEZlpZYi9ZNWV2?=
 =?utf-8?B?T1dPZk9OanB5MnYyQ3NxRFJKTHFZNDBZZFFIcWlyMVhGVnNBS1ZZRy9Zanp5?=
 =?utf-8?B?Uit6Yk04Uy9IQzJua3hZYTBpK3pDMFFySGZ0bGxYYXBmR280bWVtWTltNHQ5?=
 =?utf-8?B?MjRmTHNFRnhxQVI0TUJ4ZSt2a3MrcG1URFFJVGJaUlRWaWpIZnV2MGVmeVNE?=
 =?utf-8?B?YUozZk8zaGlwRkcrSGNsUEQwZDUxbVJ6ZWpaVkNOdmFKMHNiZk9JUldFOVE0?=
 =?utf-8?B?ZVdBUGcydmdyc2YwZ2F6N1I2Kyt2OE1Xbi9zUCthbmlTSGNPOWR5WERoblNh?=
 =?utf-8?B?ck1sQU9kR3pCQVB4dEppUWJXYUo0MlhnUzN0REZ6aldWanFuK051K1JJdE1O?=
 =?utf-8?B?TUt1d2U1c01VeWZVeG92eHcxT25zeWNyQ2ZiR3JqOEQ3ejZ6QUJlWHdoWEo5?=
 =?utf-8?B?OXk1VlR3a1FWREYyUnc5bG4yeG1aSVQyMDRwWGdsSmVndFNiUm9YMGtIWjBt?=
 =?utf-8?B?TXhGbVdPenhEdWZkZHUwNmpUY3d6SnZTNEk1NjNYK25NZmFEMW8rYlFzVk9N?=
 =?utf-8?B?QUc0ckRrMUlXd1dqcnRhK0J2Y2lBVkh6SXVmMGk4MWhOYnNlYzlaT1VPMHNa?=
 =?utf-8?B?UTZPRmttbmZORUZxRGpVRTNQb3dKbkNtNmdjSmswMFRZL1JmTHd1aVkvZDVu?=
 =?utf-8?B?b1hzWHBsSnRvSElYZXJpUDhYWm1kOTM2VnlJSUhlWE1uMlFMa0FvMlpKRi9s?=
 =?utf-8?B?Vm9kZy80NnRUb2hvTXFsVDF0Z0FMbEZyNG0yS09oSk8yTjFSbjJZUW5td3Ew?=
 =?utf-8?B?WmdXRDRnd0pSWmxQVVYyRWlWQmZMaGNIN09sWkNkMUJOZCt3UjRkMWlVQnYv?=
 =?utf-8?B?UXdtQWJBUlEyTVRkV0xERm5UQllCWVd1UEZtTm8zdE5zNEYvYWpBVzJ6a1BG?=
 =?utf-8?B?REo1ZERpdnY0MmkxbGlzN0tzN3lTaEVkYTJwN01IZVhSRHc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8c9cfa-2f84-42d5-4f83-08def6de764d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:54:06.8840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6109

Hi Alex,

Thanks for pointing me to Arnd's deprecation series. I understand the
decision not to accept new Cortex-v7M board support, and I will not send
another revision.

I had already sent v2 on August 9 before seeing your reply. Please
consider v2, and the series as a whole, withdrawn from upstream review.

I have archived the hardware-tested patch set and boot tooling for
downstream users here:

https://github.com/HosakaSu/artpi2-linux

Thanks to you and everyone who took the time to review the series.

Regards,
Liu Changjie
