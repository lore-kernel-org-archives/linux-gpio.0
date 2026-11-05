Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851016;
	b=4ZNX+aQDqnFrWNn0O88JnqjeJfSDy7Imcc6w4PmqkKS+T+8MJ09J7JT/aGcjAchh19Ok
	 S8fAL2cw1VdWc4zlD9BSKDba/D/Jn/Sr4hkBqAMh7LJNqi4O7C9HS49mFOuWYtmU2tVRV
	 yhCOXiZY9F4bqq+5MhsgBeEBQ57UA6Sf4AJ0pak8BLokR6ZYRSIAqmxcgvi6/YpXcEP6D
	 +Ay4+5tllRrhU+F8BAsxqOZ6qUEzlL9PW95tVLRDuNI1ugvWuUzRVIMfshEpnyS+1C0J8
	 0sHHNZkJnmETHel8CcCptpfOcjfk50axjNNhoY5yo2irlGyreBq5gxihN6LrdIpU0CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851016;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=0QO9YnVCkt7ThdRVqFV3rRIURk4t5CMmX0eW0eTkPDI=;
	b=15xk5/+jMtSEP2d5IH/8QKh7RtLUCNZms/E4HzpFiz6zCJTTySSqeee5NIVGGXJl5v/4
	 n22mENcKRb/7AKf3HndGrr9Iq4SA1FVyD3Hyz+P3Kap2YP5owACFiLsbYsT8BN60PweGR
	 M6zgdtOvL6ctZHnexOtcpXhKuD2zABnUai3i4N4IsAYw8+EQ4Br7PXPnqIZSVuDPtTfvV
	 saQtVICg1c9hzjVeBmcGVyUXqIz+sQDcGI4zxbTYP//ZLT1m5JR93F66BGngod66Oeh2R
	 ckXwIPn+1jOCaka/i9Q2b8o0MvNkNMUKv1qHlegAnhM2y9Gc26Q6WfKz4N0E3XW1ZJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="vvpYY/hE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.41
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32837606A33D;
	Thu,  5 Nov 2026 03:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32837606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vvpYY/hE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZV+CARociN7dsJU0s8V2OYL7PjAwPfNbLvtL9rnjkM+QBWzSk+Lw6jk4NX1ozBxf74Bm8qTZX9ts9IrvSM6P5D/mNF1+RNod1vj9NSEeUpcjGj8rtOCeB022vm+l5vZ9SKkSKe85Bp3GAGPLpU4viH3GFFlJ93WArpu4VNBxzC+6NkxQMyLC1rNu62jpj6A+h6R51m+Keof6cULf9q8r5InwVLFPq8cbtdT2Tnqe24PxWq5kg8/RfBxZO7JWwPQCuIb+5xqm7Gxvg+vlS925TOTBxpcokTIhh0FvlxE3tHItm6TZLYzOLbEHcw4MPbta9nOxRFlXztKdPACxMJxRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QO9YnVCkt7ThdRVqFV3rRIURk4t5CMmX0eW0eTkPDI=;
 b=SuOQXBmceZ04K7cWAgR4yo87J2BweWyTOHPQNzSSs1TW+5M/uVR0tNOJk8ZJ9kvZ11T23CXtepvlWug55FVidgZpGtkQbEBZlp5ncZXzPw1q4C0wmaSce0VA/xqLsmwRqEAWoz45ExeFNubUROWsxX0tcoOBZp/ZaHvjWDa1ddjRjVydTZHfQ5THeSgn1XIYL46TOUViBpXqE/3i984FWLsO/iOcvJeQouVigr3oOInKIhzrXgIgfTysgBl5zhG6l3ntbnSt08EHj68dQr5IOFQ4MjauVJHrvrnJnJR1mH5uHfT2jCuY1mtC7Ypc+bjxUS1cVzDLQSfW9LR6RJceXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QO9YnVCkt7ThdRVqFV3rRIURk4t5CMmX0eW0eTkPDI=;
 b=vvpYY/hEuAPKGYRM56XkcSYRdCqQC2UtsUSWtKFGS88uEGc9VmojsOeEhzCFuuqKqPEUi6Xyu2+8zQSMDQKl8ZMgolPqRIK2cdYDI9/pLyVueZuAr9zBnr7AndlC4jnceQvSLdu1U+8eUaOg0z1Y422byDpdNXCzR8IIZ1GTc0IerJ9AOUIil+lSNFK2QHl7sKj9pg8xIBZZlR+ewy0K/7UVAYM/7mP+B2jQA4x3Qal73DxQ9hGLv8ZV4GnJg0OtXzMET2EYzC6OYQ8hSFCl4DuQCorc/wZWzAzJbLSbAZ2kFicKRKRQo6sTZ7OceOPfL/CGqjClcOvPS5oJ6Yg9RA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:56:53 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:56:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:03 +0800
Subject: [PATCH v3 05/11] gpio: vf610: drop unnecessary wrappers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-5-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: MA5P287CA0225.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: ed03f966-29a3-466b-b844-08df3af0d41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|261028144727099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261102123227099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	aoMTNXyAHtPNXq7zCXn68BYG8z6OuDSOgQwRprqSk368I6SjwXCq23s9V7NmhEhS47vKMtC8Yi+bvXhaMwdiA2JKMH7uUoH+d6FXPMFc9sRD/gI3wdk9GdKwh9k1C5TFD2s4V25udt1p0xSq2SoCgwIXSyyXaD2vE3p1+rcHy3+Ox6v/K8IpORwUdPvcqtGN51rzmcyw9lhiENTKFFQI1rbWdS9NyeX9mV7WkO2hG/hIUAo4TEAme//J5ldmp4lI80/I973MLponFM+v79+udvOZUTxj7rjvV2LGua6+hYTE1xbzRZcK107dYK0HAOUQlQWOOEDLsyW1shJUfdVNNRUnZanfY9G1JCnaiPlK2DJbOHQz2xjXJPR9wx9shbQsZv/ldYN+7RecUQ87ODrEjjvzSN4z2Tnbq+eDxKyv6F8+Sf3ZoVoXr7nxD8d4POypf5hYsjp0kS8N1IsVaJHeAGgzA1IqUChe2wpmMyNfSW6yS/oTDexKSGIvieI7iOk9Bhqmrn+VMBruUjQONpz9gzJ/LA6V9QwwmW6H7IKBGb7GkhTjQfJVhczFOlmtcK+6yx/qS/jef5agF3e7OyqRCxLTsrNLavYCzqyUk2sZZ2Qwjae/toFecQFYkodUechmY41VZgSWl1t0//d509nMMqd01tP/i4MzkFzcAzYUHvhgv9eepRNRZjWhO4MYbMAwxT25hlZIWeIPPTDprRWbiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(261028144727099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFQ0bCtBcjFmV1c2K2xISktzeE9VWnpBUE5hSjJtVTFHYU1qejJQS0R4ei9V?=
 =?utf-8?B?akVMM2lIcHVELzdiRDJ2ODFueDFrOERKZlJlUGFkRUJiTHFuVzdjcHluQ1oz?=
 =?utf-8?B?Q21tQUhmY0syc1RILzZMU3R2MExsbjdMMDh4R1B6Ny9hWEZ0ZG5nemh5bUg0?=
 =?utf-8?B?dnlvSnY2NHpFTW5KU0lMb1lucnJJSE1DTy9lbW1qOUdpVUdNNGZEdnJuS1hw?=
 =?utf-8?B?NDJlbVdsZTc5T3VLT1BHaTFHcytpNHA0bnVzMEYvTXBpdWZ5OUtmWm4yZ0pS?=
 =?utf-8?B?VFVISWc0VmVhbzlVTTZRM1VtTWViYWpraVJjdk51V3hGc2JRUWJxWllNdDRi?=
 =?utf-8?B?UHc4MndWUkZDc0tZNGdlSlpaSzd2UjA5Uiswckw1dXZsU1NUSzhPMVFIOWRO?=
 =?utf-8?B?YmZsY3l2N3R1V1BCanFxekZuSWM5bm5XS1dUVzdNT2FSNklZQVB2SmhkQkhy?=
 =?utf-8?B?dGJReE9SdEs4SmFzSEJ1ZERueDFpVjlCcm9UaEd6WXFUQkNISnIvc0hpbGVu?=
 =?utf-8?B?QnBDampCMkgzMUdjZmlpTDZoZktvcmVkSmdWK0R0R004NHY1bEN3R0hySFZC?=
 =?utf-8?B?V3lFbXo3ZEpnVGVXT2VzSmxUall4SHlxTHdGQmN5aHNwcXkzR1VXeVd5MHBW?=
 =?utf-8?B?VkdqZW1IZnllUXQ2dGJjb1ZheldZNnFvdElBaVBQU3Rzc0d1Q0NLd2M4RHdY?=
 =?utf-8?B?Y21UZ3BJSlBsdmhJTkFNSEtwcUQ5andPM2FNa2hmUnhpMzhRS3Rid1E0Y01F?=
 =?utf-8?B?b1pqb243Y2NheU41dGQ3SkxRRGdkT1d6bUEvZmlkQjFRb1dteEpKcDhnTFF3?=
 =?utf-8?B?R0FNT0lFT09RV2JuWXRmSnF6dEtOZ3M5bG1EK1kyWXVsbnVhb3A2WVV5VnBq?=
 =?utf-8?B?M1lGTUNEaG00T0cxMEI0bGVXV3VuU2VNRjdrekVSTFo2TUhpc3ljR084Mlk5?=
 =?utf-8?B?SWpUVFllQkxtMXBkVWQ0TTcxMFRpd2dYNW9mYzFGellKU0llcm5KeUpBYStY?=
 =?utf-8?B?NGlJWGR0a041d2QvSCtEdWd1U05lR2ROQVVsSWJMVjhpVmdxZldSN1lSUUJk?=
 =?utf-8?B?Y1JkSlU2dXR2VWFITWVpNGUwSWQ3VmVjQnFHQUtiTW5iZGlEL0ppQkcwaWF0?=
 =?utf-8?B?TnJ5QkpiZWI2R1RvQzdyaXNlTThIeU9DK2Q4V3JQVEs4L1Q3K1hXcnppQzFF?=
 =?utf-8?B?VkZFRURHY2dQTnJQZzZlK2g0Tld5OFVkRjUzRUJrckRjNWtQRVJkb1h0aVZn?=
 =?utf-8?B?L3M1ZU9relNGZllJYkxUZU5TZnFoYmFqK291QitaeVdXYWJNaFZxK25qWnpp?=
 =?utf-8?B?OHlIY20zY2d4QlVWWVNFNzVXb0xpYXJGOWZ5Z0V1dXJ2Rmh4TVlhT1VRUnVy?=
 =?utf-8?B?azYyOTF5dHJuTnZ5MXkzWXRzckdudGZEd3hNNlNiWmRyRUlnUXI0ZWtldDRT?=
 =?utf-8?B?MnpyR1JJTDhGMldISVBMaExWRnlqcnkvM1hPU3hSMU1kdkM4QnovOHU2b2M2?=
 =?utf-8?B?Qkh4QUh3OENBVmRlK0xkZXBpVmFtT3RQdTFHTWNiazREUHN0SDcvemdJRmxu?=
 =?utf-8?B?UUVpWkwyZExFYm05L3lSK0czazcrWXNxWngvY0Z6SDRGcEcwVjU4Y2tSOUFv?=
 =?utf-8?B?R2U2SUE2U1NDYnZCcGtadHNHUUlyT3lNdTQ5R3NPczRXSnk5Sk1wTTAzQjVT?=
 =?utf-8?B?K2tMc3F4dUZiUzUwd1oyUFJzTTkzY2R0NGh2T2NOQjMwc1U0MG4ycmxyQ1VN?=
 =?utf-8?B?cFQzcWNmVnIvb1N1cXRreE1lODZ1UVd5UXhlb3I4T2lLVk54L3VLL0FSZ0FZ?=
 =?utf-8?B?bHdyVUZ6akkrbmM4dXB6Z2d4WmFnVUZIWnE2VjNFcHJuNGhTU2hrdVNzbFRa?=
 =?utf-8?B?MUdRdENKKzAycDRYZ0NQS2ROQnJ3VVFVWGJ5VzIxQW1Bd00yVWhSQjllWkNt?=
 =?utf-8?B?anN3MlN3VGI3Y1BoKzRucFVKZTB4c0taTGs0R293Z0h1WmxxeWxFVWp1eEg3?=
 =?utf-8?B?OXl1Q1FWMC82b0NRbzBKdWc1UXpLbDl6dmJhRksvSElYY2dNUlM3OVhYSWtQ?=
 =?utf-8?B?bHd1WDRuT0Frb3h1UElZOG5Vc1JBOHFxSFV1dlFNVmdJOGtzeis4T3c1RWk0?=
 =?utf-8?B?Tm5OZStUWFhpUUQyRUx4dHZGa1JIQ3pxdDhkeDFkbXlnVG5FZ2prcHg2eGFq?=
 =?utf-8?B?YXdOWE9mYVl6UDlEb1R0dFQ1VE9nTmdETDhIZ2IwejYra2QwZU9UTUNPalhU?=
 =?utf-8?B?bUdoL3h4KzNmTnRucnhDaEp2UzRKdmtyS2UwcGpISHAwMG8wZHFwY0JvczNk?=
 =?utf-8?B?UUJEZU1pT2FEQTNRak96TzdYRWlWazl2c3VqR1hkZ091b0pxblFETTlLVU0w?=
 =?utf-8?Q?7Xik/PknITOqp2tnQxWffeeQ6eOaxtMsVW1p/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed03f966-29a3-466b-b844-08df3af0d41f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:56:53.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CvjglcKPlZ/qnOujP2Dk3ihR6HHkHDlC9Up/5/20Qli5TJrk/KP8lGwJEqr3XONsk9nDpe3p4136ATkX6s8LoLSp+2W7keZTbVG2uGfSAOpM3X058fDMhA9jogEI118
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

From: Peng Fan <peng.fan@nxp.com>

Remove trivial wrapper functions vf610_gpio_writel() and
vf610_gpio_readl() that just called the relaxed versions directly.
Replace their usage with direct calls to writel_relaxed() and
readl_relaxed().

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index d14cd5515293..0ef220eacd3b 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -82,16 +82,6 @@ static const struct of_device_id vf610_gpio_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, vf610_gpio_dt_ids);
 
-static inline void vf610_gpio_writel(u32 val, void __iomem *reg)
-{
-	writel_relaxed(val, reg);
-}
-
-static inline u32 vf610_gpio_readl(void __iomem *reg)
-{
-	return readl_relaxed(reg);
-}
-
 static void vf610_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct vf610_gpio_port *port =
@@ -102,10 +92,10 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	irq_isfr = vf610_gpio_readl(port->base + PORT_ISFR);
+	irq_isfr = readl_relaxed(port->base + PORT_ISFR);
 
 	for_each_set_bit(pin, &irq_isfr, VF610_GPIO_PER_PORT) {
-		vf610_gpio_writel(BIT(pin), port->base + PORT_ISFR);
+		writel_relaxed(BIT(pin), port->base + PORT_ISFR);
 
 		generic_handle_domain_irq(port->chip.gc.irq.domain, pin);
 	}
@@ -119,7 +109,7 @@ static void vf610_gpio_irq_ack(struct irq_data *d)
 		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	int gpio = d->hwirq;
 
-	vf610_gpio_writel(BIT(gpio), port->base + PORT_ISFR);
+	writel_relaxed(BIT(gpio), port->base + PORT_ISFR);
 }
 
 static int vf610_gpio_irq_set_type(struct irq_data *d, u32 type)
@@ -165,7 +155,7 @@ static void vf610_gpio_irq_mask(struct irq_data *d)
 	irq_hw_number_t gpio_num = irqd_to_hwirq(d);
 	void __iomem *pcr_base = port->base + PORT_PCR(gpio_num);
 
-	vf610_gpio_writel(0, pcr_base);
+	writel_relaxed(0, pcr_base);
 	gpiochip_disable_irq(gc, gpio_num);
 }
 
@@ -177,8 +167,8 @@ static void vf610_gpio_irq_unmask(struct irq_data *d)
 	void __iomem *pcr_base = port->base + PORT_PCR(gpio_num);
 
 	gpiochip_enable_irq(gc, gpio_num);
-	vf610_gpio_writel(port->irqc[gpio_num] << PORT_PCR_IRQC_OFFSET,
-			  pcr_base);
+	writel_relaxed(port->irqc[gpio_num] << PORT_PCR_IRQC_OFFSET,
+		       pcr_base);
 }
 
 static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
@@ -292,10 +282,10 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 
 	/* Mask all GPIO interrupts */
 	for (i = 0; i < gc->ngpio; i++)
-		vf610_gpio_writel(0, port->base + PORT_PCR(i));
+		writel_relaxed(0, port->base + PORT_PCR(i));
 
 	/* Clear the interrupt status register for all GPIO's */
-	vf610_gpio_writel(~0, port->base + PORT_ISFR);
+	writel_relaxed(~0, port->base + PORT_ISFR);
 
 	girq = &gc->irq;
 	gpio_irq_chip_set_chip(girq, &vf610_irqchip);

-- 
2.51.0

