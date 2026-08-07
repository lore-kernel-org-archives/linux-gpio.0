Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022093.outbound.protection.outlook.com [52.101.66.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A492032939C;
	Fri,  7 Aug 2026 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786123351; cv=fail; b=KFFmSBbsq9zNjYPiY4B7t9fsHF90iYHpo+DKM+6IwR2OK5BEH0GDwOqtMiA/FCYDqdwmyTxKvKOy4NbNHMJf1+gxKQplP47tJ4BpIMw2q1gLsMhfGVbp2KtFeOCTmGUDtMwaKLo/VImxVHzaGf4JySZPeFwhrLrn7w7BLIIx11U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786123351; c=relaxed/simple;
	bh=yWxvt/RH4mKw1Voc9O+Q3DpYVm7j9kIDhphJ7Zk2Vgw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NCo9tspAq+JnpZ0GoTBGwf8Z5B6tgW+rUrQaAV2fQ8XonvhzirJ1pyInvyQanZmma5hHghXYw077GoHjMAMnmNRr3Y8SM698KYbVKRUNmFSO0vGjzgGwuQsGPOpt046S9Q8lxb3mkIUeXYm0qLetUpOzPDI1rw4xpeqG/3oxoBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Y3VsaYxt; arc=fail smtp.client-ip=52.101.66.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Y3VsaYxt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsjn2I0SVNCkn7fcAmmgU0MDhl+qNZezKon2mqO/8om4jlEqVk5HffdhKSGOLm4ypglptLA1/kNTwVgva2YHBfWER38p4OKpBy2XDKM6C6zNLNmVsxv1/Kp3hq5eXXx35FGd4ohWoLT8IrnhGlmKrnuQTWLOoldfXQGRt3u3QQsxDch68PA5vRyHXo1jvOMnjaYoyagzkJ5w9nYMM4idy3vDIedlm1SMUQn6FrSqddZ1jS2wb0XQXUugPkduNhfSkn8VfCLRnYbznhOyI1/mejsg21YEiS0KMs7x/VgB4DoQc/bZNqi4tw3pH3ZY+G2+lfRqnHHEk16IN7kqQ2e0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7xx1IAkDeEBGvSzYk1w96YKKkHc1z+16oFwcpiNfnQ=;
 b=gnl9dTzsQ+HvbUoeoOHavt2tj9VneccL8HDnovPbQr3s/SeAkNue39GqVf3syNrJCKfYh1u5/9J52pRFUlC21JBxhIYD5o58E9JzhZvH8vTbpO4ySpzXFj2mjfOfbNZBxhq7TD2Upc8677lXoaJ/1gXCIXw8WVdIXfX7tx8w4xcT8Kx8I8E+XLr5gdm2yylakkVv2syIsUiZAFrffljId60tvPq5Ugg9N/GqRBdrtTjFtKzxcUWJCV+PdUS51f8KKT1e3K8zI0BOQmfLmvzce02XjyqMLCwjTYTdCJ06hm4wWflXcZoiRNFwNg9jXZbDyAgTPXxhfFwiiiaP0ZZ4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7xx1IAkDeEBGvSzYk1w96YKKkHc1z+16oFwcpiNfnQ=;
 b=Y3VsaYxt5+Hzm9MFpVWSYN2tzvfyf3OPYh8idb3o1E2nEQC7zJRt+5cYUQI3PFxDRiKcKw5pEnBTdMQYlzqX0hbWFa+PutqMhCX0lpVend0xHExuEPfxMytsadZqTB8zkgmdmMgdCyOIIkstCOCke1OBTYKJGj1tddFgDl+nhb1ckwOrj54iosLnI6FAV9UgJiSuHuIwDv6fVjV+0NVj3QWe1Ja7gG5U7lrnygsbrpHtkMTzVrqeD1YH85JrOUrUZ9Q+4k3gPDG7ELqRpu3mnQSGlfsY+0DRHJ4V4uV727lQpnTXcm4EJyPhjRMfUqTGX6pudUSnCVQ9BvUCLTNN5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB11342.eurprd08.prod.outlook.com (2603:10a6:150:2ca::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 17:22:23 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 17:22:23 +0000
Message-ID: <9c28eea8-30e5-4c11-9fe0-564d6cbb585c@iopsys.eu>
Date: Fri, 7 Aug 2026 20:22:20 +0300
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
 <4c0f22af-6124-4118-8ebf-0725e8fc89bb@iopsys.eu>
 <CAD++jL=8Ki5cM9buRVRNNorC00Lug=Zxyvco8jx7fQi-cqT8wA@mail.gmail.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <CAD++jL=8Ki5cM9buRVRNNorC00Lug=Zxyvco8jx7fQi-cqT8wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::19) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB11342:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bf3c1f-53e8-4d0f-95c8-08def4a871b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	rH5knNVIRRXruQLGjvuWLvxYbzMcIM+puq0poswZAGTBE7n2i4/HORFLHIVT7weTJ1lPNs0HvNt8QW9LuQx4fSRjYvbX/XvTjcqDiiaUcld0XGWi6hqX9wbkBTk6DjoZUa9LGL/nBFm62f1FB51yNwm8ObRnX9ifKeb1Q0+/dK8N/y2QQCi/k1TmeqkFygFUUID96e1Yf+MFtIJgfV50CL5BM/MGDl6tg6PM/ExcP/hm0O3i98yRCWbuxYCScRhj8o1z/EY5LlHHowazLkSYOcXByuYJxmEe4f5u6yu9laNLbz2NkBd1dzx8imnJxlBNzwpAbczGwyDewAjaTC5hG1Pjw5fzZFShcq9i4NC7oIkuNSZ8eTkDkAfI8FQWtdeupC7MHIf9g1bUdcmnrZcIcTwcJuN4lS/N9nkn6pTW+1JxhhFtzgJjDPpav+k8wNGBWh+ZVLHSmAmYRGvgNc7kF+25Yhdp9fNYfRl1emSeM0gaWnjyHayvxv1a7hLtzYBa+Ys+f/iqnE92rGHCB4OhuHSsvVMbUkutLe1MjG8UabxexKH9Fc+aG9kT+R8KGEGBmFgdROih/niNnZaxLI3HUE0TmOsmUrJ/wydvAOJND8/UowWXxZuy7la+ks5Oe9kxzZuj3wfi6yxQOn8jdvW+pzgDzXAl5+/XwX35l8yNECA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tldndkt2c1hJTkF4TUpQdHd1TWIwRkl0eDRhRzZXZnZJeldxUDRTNUhxRHUy?=
 =?utf-8?B?ZDQrK3NFRXRqN0VtTS82Y2t1bUZQaTRuN3BXK0lrQlM0YTRUUHZHT0tlcTlk?=
 =?utf-8?B?a3ZBZlR3blN3d0JPM1NwQnBkT3JZdDJZM3kxb3RXK1BGbE9EdGRBRTJGMGFv?=
 =?utf-8?B?c3MrZ1A3YzR6QUVkUzNBbVpHTzFPY2h5cmRTZW9qbjMxZUx3Ym1Hc3hnV1F1?=
 =?utf-8?B?STBicTlKQkxvUjk1SFpNd1RuSVZnUk1tV2ZkYU5RWGNWajUyYnBqOVl6NXFm?=
 =?utf-8?B?dDNPZmJtKzAwQVlFY00ybHZ2T1REZitwRUx0MlI4MDFYL2xtOG5NL2VLNm5s?=
 =?utf-8?B?cmxvc2ZOTE1oYW44TXNXK0JrZ2IrVExLRXpDRjdsa3NUeGVCWjJPUWpmSlh1?=
 =?utf-8?B?UVBUSDM4VjRTZVRtemlyNmVKTkRsSWQ4N1JHWEQ3aVBvTmJ0bFVyLzR3Mzc1?=
 =?utf-8?B?cWV0Y21PNlMyOWdxSFl6VTkzZnBYZHZYU2lqWlJYem1WQ3hZcDlEVXUrYzVT?=
 =?utf-8?B?K1dQU24zbVhGbHN1QWgwQTd5NnovL3dvbWc5Q3ArMTkzcklRTXRZNlhzaVRs?=
 =?utf-8?B?SUFpT25SNlExcXRkYWIvaTI3cDhTRmlmOHplUHY1Wmk4WHd4UGdxRi9PR1Vw?=
 =?utf-8?B?SmR5emRzYmszVVJRQnBSc3ZIeWtKZGdZQkpCWFFFd1ZQRzFTejNZeFFROGpC?=
 =?utf-8?B?UGZ2eTdUMmphS1F0UGlOeFpVMW80bDBhVHVTWEJyN0ZtR09RMXpXS0xORVVN?=
 =?utf-8?B?c1hnbExRS0lrNExqRGR3cm9GWGRKTGhzUmxmdVJxSm1ZTFVXc0M5YWpJZ3A0?=
 =?utf-8?B?Nmp4Y2hXSGY1WURLSzJva0JKaHl0Q2lZVG9LWUg1KzFTSGF4aHRrTnNpKzZi?=
 =?utf-8?B?akR1RVdoTjV1OHRiK3l2QkJmNmE5L1JvR2VxTHhCa0NxczVjVDd1RTRrbGR4?=
 =?utf-8?B?YTZMNXAzaEVWV0ErWXVXTnpiNjdUaTllVHM3RTIxWStEYVZxRjE2U3ZZZGFl?=
 =?utf-8?B?RW02Q0UyQUt5UFlhbmhqdUxmYmxZcHFISUtPQUpUaVdzcldOTGUyZFRtWnpZ?=
 =?utf-8?B?bDJTWDlqS3VPcWNSUHFrVGVMVnZMNjJBQTlWTVRTczFGSysydlk3eGJSV3l1?=
 =?utf-8?B?am4xZDdSVzJtNXU5RUFCWkw4cndvdXFRUnlNNHdOV1BXSUtpczdpUWJ1Qmgv?=
 =?utf-8?B?Y0pIMzl3UG5XeFF0STU3TnIvcjNKNXcxSi9sWDFTS01RV09OcEVtZE5sS3Fs?=
 =?utf-8?B?TWt2Z09lTWRuOTlrRDYxSkYvQTJqdDlnV2N4dld3ZWt5VHhhRDVWVzJ3bVlz?=
 =?utf-8?B?MXAxRVQ5R3k5THp3TC9lMG5STjc4OHhwMXN6RUJ5OE9CV2wrL0pxOUtiNG1z?=
 =?utf-8?B?OCtOejExU1BUVHJhRmdCSjFYUGdvbTRtRW9nYithalZJUndTQTZBdUZPVTl6?=
 =?utf-8?B?Q1Rzd1d1VG0xMzFyZTdIa2NWTFg1WHVNd0lUVSs3WitjUlVDRGl3clQ4RHBO?=
 =?utf-8?B?cHNaSzdoNEJjRWxMRlVhUWxodGFkVitjK1p0SkpNUnhFdUhRcXFpMHZNM2F5?=
 =?utf-8?B?MVBZdk83Z08yZFFEdzNPQ05YMzJlR0tzeGlwZXFaL2dIbCttQVVZVDJ4VFNj?=
 =?utf-8?B?b0J0SXMyclhEa2l1VUFFWlRGMlVJVllUL1JQUUp6eE1tZWV1SXJXa25XQ2NC?=
 =?utf-8?B?K280ZjZ2WExmdDFzdDFPMFF5MnFneGtVRHNmbUdFWGh6VnFnQkdQTHVPRGZI?=
 =?utf-8?B?VmI2bzVkOTdqdUkzVk9YdXQ3blVYWnd1NWJ4b3JoKys2bDREZTNkL2J6U0d3?=
 =?utf-8?B?UkdIRXZlV0VKWFZGNkVYYkFnUzV2WUhrcTFlSVlXV0E2ekVNQWZFbEV4Myt1?=
 =?utf-8?B?SFNZTXR2SGJBVTlLanhHdHE2RnczMUtQb1M0ZHlaYXBLWHdYRGx2cVpsTlFT?=
 =?utf-8?B?TEF5ZDF6TFVVdm1rWWVMai9hc1picUxPUjJCbHNTdXhYUGt0N2V4WjVlcWZB?=
 =?utf-8?B?cW1HZEprT1VOLzVpRDhRcDR3UHlLUVB3c1N2alRLZVpPTTJBOUtYRm1CRWZk?=
 =?utf-8?B?MFNMNWU4VitoS1hoSXlIVUgxMjhYREREd1AvR2hSa0wvbGZ6am1jLzJjeHYv?=
 =?utf-8?B?bWIyRjJGUU9EOXlTQWJpR05UK3ZaSDJ2SXhpNEpRSDFlN01KWUZjY3B1dndR?=
 =?utf-8?B?dVlPQmxBUXFVS2hyaU9aL3RhUmdmRHAydWNpWGwwWnZlcXVpZ1d1bkJPWGEw?=
 =?utf-8?B?Q1o2MTErNWtSN3QvOTAyNTBybEppNDFNSXdCckx4ckFuSFNvR0FabjQ3RnR1?=
 =?utf-8?B?U0ZZZDFvbjFwdnFJVEQ0Qm84c29GckVSZ3lYZnpnQ25oS3JybkpYSWRydDRx?=
 =?utf-8?Q?pKqgvTdRv//c5zSg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bf3c1f-53e8-4d0f-95c8-08def4a871b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 17:22:23.4202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BznvZTtEfZ7rjbfP/Tg3nbrggIiz3VVWnZotzQCXzxO7hNssmg4gMeJzpPU3AW1i4K3PlsVrqjHvQykz9fsPm30oDfCVH/3mkPmp9+L6B/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11342

On 8/7/26 20:20, Linus Walleij wrote:
> On Fri, Aug 7, 2026 at 6:39 PM Mikhail Kshevetskiy
> <mikhail.kshevetskiy@iopsys.eu> wrote:
>
>>> This patch set began with 11 patches and is now 37 patches.
>>>
>>> Is this becayse Sashiko is touting you to just fix more and more issues?
>>>
>>> I think at some point we have to draw a line and say "let's fix the rest
>>> later".
>>>
>>> On the other hand I appreciate your efforts...
>> following reasons:
>> * move binding changes to separate patches (8 patches)
>> * openwrt upstream changes (4 patches)
>> * issues found by sashiko (5 patches)
>> * new features (3 patches)
>> * code cleanups (4 patches)
>>
>> so growing from 11 to 37 patches looks reasonable
> Fair enough :D
>
> Can I ignore the  new Sashiko moanings and just slam this all
> into my tree for linux-next now? I.e. are we happy?
it will be fine
>
> Yours,
> Linus Walleij
