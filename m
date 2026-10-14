Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904414D37B1;
	Wed, 14 Oct 2026 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972998; cv=fail; b=GQqF9XSuRz9s8oDKbHSj21P0/y+X3Lki8OXxE6qCDGHkl3YQlqlqYoo14gV5d8TNqcCX9ju2A8hHGZi04xpF5QJb5bkbm10aWN5tf788jpuP9GeZWTsH0pQUhXkwg9Iz8Mequ0rDKn6ukwbqIXt33zZIYXlJXeO/z+ahYi62N1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972998; c=relaxed/simple;
	bh=n8pWu0RfW/eXhLSIn4qyp+DMu2WTJxk8DExuP4Dhgmw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jFnDO1qEeeGc23YxwuHw/ry9zuo81qFK7UamdIr7L2gzNs+KqSXBiiSZmP4gKH3hseswZ6LgfmrBkHUmwa0HhzWoCGI3J8Fu3XOF/o/3fv7paBe9/Jkj3vhyK/4qcb7X77YVoj7XT5yYuEu/o8KDQace864C/qR5Je/yJgUNsQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gYt+Calp; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gYt+Calp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScSNPT2OM81qCWn82Amts1MwcBfa0MpOvdjSlqd+TZ51WWCmtQq6HJLxdyVovuWpPJsxIZ41dEgpZ8eDFY4MppnUE+H+7V6eyOHQhvQs2s5VpQBl6umdiaiP9RhBKtSK5yVBXsOlgNifrQhvkC5rO42lJHD3yrWJWHud6A/Ro3O3r3VxJMVvr828LU+HU+tEPtgBtsRU2TtuJCqWVQSNNLPUzOjAkysBmMvoTxV4znLunEj6W5LaEOXtZsZpp9x/IdkunPe2bbw4mFYmWF/72VzD/SG2XVc7rAL0X9zJY8bBro9xWYaWLBNaBnylJeRqmov3u7jgFxAKNVh3JK3ZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C/6VlzuRgMaS+dUYVXwHU2dZZz8l/oqXUSOmD+kVks=;
 b=svuxaxfRoM+Lb2ZIvx1xgKMgaOOnzEScJYcD42TGsXGq1U2m7U7ctMo5m41IgStKBhhSY9bJo040JjkJtl+xcZKkfSfk0Lb3C4wB5W4OnLk5zboH7JgRanFHq13nABNdEqsxEsPqsoQGC6ORqnc140pnWY8P7UPJwNp1RQ/NYmi2q4dzJyfRCkS98YzqTysLxQg4Ye4YcFcS44AM/rS/tc71cVhuHxjzxUg9BTX5bf8kTU1ADiVvZ2XGJEb6lsrs5rcv/6wrkg6hp6OTckfUOvrh22I6cHai9LJHKRZh/dR93uXJ/qDnj3jxnbRLK4MFDinp0NpLHT//x/iPDV4gDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C/6VlzuRgMaS+dUYVXwHU2dZZz8l/oqXUSOmD+kVks=;
 b=gYt+Calpm6zAz6JQsvFPm75XH/SNlH+0NCujLX6pMZvwTwEXa8/9J22dzKcLuhikDK2Atu78Z+fJPlGVfNde/0rtZrNA1IKFlUbEbwkXplGHdh+YIX0ALj6zxJCg2L/ux0OYnxV3qgTtzm7itGYELwqPguG3t3IYKzOgsb216OVVwM8XX9Vd7+c3p41wQDnNd3sBObkA0bqpeMLtTX62h0z08DMWrvlae6soCUYTNVbuOhlhEJCN2eTzRBvrCdL6bD+jpk9ILVk481NF12cHK/pJKw6bgrx+u/qtOcutK6Nl2QG+BM5tJ7G4V5LKu807qTO6cb7PojcTs7/GByJZSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA3PR04MB11202.eurprd04.prod.outlook.com (2603:10a6:102:4b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:16:17 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 10:16:17 +0000
Message-ID: <5738951b-4856-41c1-8766-c41f2e63f3d2@oss.nxp.com>
Date: Wed, 14 Oct 2026 13:16:06 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: s32g2-siul2: describe EIRQ
 input mux registers
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
 <20261008071436.596651-2-khristineandreea.barbulescu@oss.nxp.com>
 <20261008-1e3e0aa3fab167d544c21e68@squawk>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20261008-1e3e0aa3fab167d544c21e68@squawk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA3PR04MB11202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6293c43f-8b5c-4f77-aa9a-08df29dc2f02
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|7416014|376014|6133799003|22082099003|18002099003|10067099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 IUYW22JlShIYg0XyA2SLJoO5yehqSO6LVTDq0Cq5tLRSgj9nDIFy/CKk3pBQ6A4t5ExQ2rVnxSFvprPrJWYtYu3iXTDYVFFq/1XB1YyYvrK36+rzJnKZAX5dpUHh/Biy5e7edJyggUG9ODBaglK0Qp1ljNOWoY7yV7J+730gE62rx2KOp3fTTf0IzVqPVRkdDNvP96BwCb3fKKqXFj3rsHVg+BwP5uPFgbOdFINtVwA3WEWJ8iIwld/Sd9uy/1klSooZXU7LZ4OrFZLcPqTvOqLeTp0FyMmqG7dyrML9QSCafxD/sDGoT+kNprjuSHFdgkp0kz2Hl1Xz/mqAEkxwdHqghuztXGa2eW7JsrvsHEf2IzseNSeEAn2IPoHoNdEpp5Akhgu1bu6txBk+gLvMsPbt7MLj37BVK/vDtMJryWasTLJFnCRUVWAUBNAEpBIvHjtm+Xin69/B+ulj3/ukA9NHZFSdv6O/UnuIxQFgzwfcxl3q2MILQNXLEoh0dQW97ydYCsNBFHH5jeoYHpNCyVBGN43UDNY06H8sEiLGxFIm2MhAenj1xAril604f6vE8FvhKMbztckBosfYa4yZG1w3sVR2hiynS/St7ToeVzfcfYHxIilNiotpuyWn5Uy63TcxLeUNSVwtSSJeptjVuTYIDIDwPQ2XV4dJ0AR4mVY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(7416014)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?LzlIT2dXRStRT3N2L1R5NGRaYWtxdFEwODdmcDN2K0VTZlEyaEVhN2IzZTFz?=
 =?utf-8?B?bE5FZWpyemdtNVUzQlRVVGtSVkRYUTNQYXhxVVQzUDNESWxhUUVzejltUUFp?=
 =?utf-8?B?MFFpZFcxVW9MSDA3MWJpeDRybHUzMmxubWN0blR1dmtTMHJINDRpT3BHT1ZM?=
 =?utf-8?B?L2d4R3hPcjk1L2c2SUQrZ1RqM0RiaTMxY2RRRUlDVFBObmUzU05CSmhVNHR6?=
 =?utf-8?B?MzB0d1BhUWdzc0Zsa0hkb2Jzb3FyK3ppbnQ1anZkZExoNFVxZVB1YVExMVIx?=
 =?utf-8?B?bWJDSFRLL3ZPN1RReWZuRWxJemlkbWFGSGFvZ24rbklWNWNLeEdtMzZEd1FP?=
 =?utf-8?B?aG5wbS8vSU1idzhUUDVyU2txTEQ5RCtlRWltdWhSSktPUVBxRHlaeDJrUk5j?=
 =?utf-8?B?TmU3SjRZR1duYjEvKzZpUXcvcVcxcWN6dTBFUHVNT1pDa3FQbmVST0VFeU94?=
 =?utf-8?B?UUhVdmhmQXdQUTlpK1pRSTExaE5UemN3Y0xqWkJwQmloZ21CQWpta0JmV1pL?=
 =?utf-8?B?SlJMRUpqNDgzODJtQndFRllETTFxdXQvdC9zRmpYVlBJdS9FLzA4cHBmL05P?=
 =?utf-8?B?YkJkTW5iaGI0MVlENmdscklRS0h1VFVieHlPdUtNQ0ZWNmFjZXA3VUxvY1RF?=
 =?utf-8?B?VmZWcVcrVWhjcE5BT1FJenN6Y0I3SEpXTTI5cmxGbC9XOWZvS3Y2c2h5Yy9Z?=
 =?utf-8?B?N016Z2thQ3JxZ21Gb3lGMWg5N0dnYkJobUZCMlV4VkFFdTZtYzJiam5ZMUJ4?=
 =?utf-8?B?a24yZlpIa2dSVlRLUDluY2Npbmp4eTFiUGZuUHdtS0xESkpoZDZaZmt1WmNv?=
 =?utf-8?B?OVViMzVXM1JRWUlvTzVhRFdXMmg5V0tJWTdYRFlJN2wva3dwUGJ0aytJTVFn?=
 =?utf-8?B?WGMwQTNxb1EwVDZBdmNkUzg4ZFMvUUJSaFJkS3I2dzhMNjFZYVRwUmh3bWVP?=
 =?utf-8?B?a3FvMHZwWUNYTEtlU01pbWtkek9vTThyM3RkWDVlcGZydHFJUDRzcWFvL0xu?=
 =?utf-8?B?dXVYUWRqdkQ5c1lQcTlmcEFCZi9nWVdDSHQrMWtwT3JSUzJTNFlMV2FlN1FU?=
 =?utf-8?B?bEdJOWdhM3NrMDFZcG5DQ24wWWtSeHNlWnhoVjFMTUFpRG9rK2hJRndDcko1?=
 =?utf-8?B?ekZQc1Zza1FXdGJ6VEk0NytyM3FMTy85L09ROXpVN2tYWFlJWlkrZTdHeVRC?=
 =?utf-8?B?aUlON093K1hubnhKYWJGeGdTTVJzdkoweWpBck5UdWxmYlhGbzFtZWZVM1pm?=
 =?utf-8?B?ZXNJdnVmWXZjeXh1RkFjQTlxSDRXN3d2VzdxaTgxTkJLWnkyWjJDM3g2Q3VD?=
 =?utf-8?B?TmRLeGhCRFd5NnFwR1NQRlZBbnNQR3NXeVorckc4bXlST0xYejFaMGtwQzlN?=
 =?utf-8?B?WDJuNXBndlM0WCtXaUc2dnJ1WTdUUk5sU2Y3VHF3OVdZSTVmUkFkaGZVTDB1?=
 =?utf-8?B?N05NTHFhVFJzcERCTGFHYkNlR3hyTXM5L3M1SkQydUoza3FKMjlrYjBJR1Az?=
 =?utf-8?B?ckZhbGpnR0ZqczI5d2c0US9Zb1VGQ1g2OU9zbTdoOTRjVTA3UkZMeVpxYVZq?=
 =?utf-8?B?YWE3R0NQLzBWMCs0eFBaY0lLL0lRQUFtR000bkU1NlRFY3hVbFhLOHZxNnlW?=
 =?utf-8?B?MUNzSnNVZVlwWmRVUnJkRVFSOEVwdFBiSjdXeGNaSENsYnY2YkdNdWQyK0dK?=
 =?utf-8?B?cFBNWWcwNHpZcjFyeTVOME5JeDNvRFBpekNNZmp0OHNUT2x3d1YxVGJJMnA2?=
 =?utf-8?B?SzZQd3k5Y2hZb1Z3QUFHN1p3VnRjc0NaRFZ3dUsvdHVNMGtJUlFCSkNLK01p?=
 =?utf-8?B?ZFhtQkl2MXRiSUpMOU1md2FGZnRtcGxERy9mWWN4eEN5bVlvS1RRSCtBaTRi?=
 =?utf-8?B?T1ppUFlkNnZ3NXUwZUhIeTZJOWJJY1YvUHQ0NUpsZ240YktLZTRjQ2tKcGtP?=
 =?utf-8?B?RkRQM0FTS045c2tyVGliZC9hOW43VlRiK3l3OC9sc2lSOElxb2VzWW56emdo?=
 =?utf-8?B?YkRKejJCQ0RjeS9iSWlpT215TFBrNHU1RlorTG94YWxZcGtLUklsQkM5MGlZ?=
 =?utf-8?B?N1d3K0hvdFlTQlVCUEluajdjTGFRT0FaaStWZ1pvcXdPNmp2RlppcFVpZzlN?=
 =?utf-8?B?T0plRWFhMlN6V2lDc09vODBrMzE3QVVvM1J3b2NyOVJEa2xUZnIvNTB3dklr?=
 =?utf-8?B?d0ZXdUVpOS9ldGh6Nk9JTzlINTNTZXU5MDJxUm5UdWhZWTh2NzM4UXJ6ZXhS?=
 =?utf-8?B?cnBiRm9Wb3lpSTkvU1dCcUk3NFdUODhMSmo3MzZBTVh0bUZQSVNzR3VoMUVF?=
 =?utf-8?B?c1VMa1QxVXYwdXBwMUlDSmpjcnZJUWFzbTNMd2RrVDROd3VzcWxVZktUY1NN?=
 =?utf-8?Q?oIm21aiB8ykUxCqZU/zn3bhChymwbPztz/MfV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6293c43f-8b5c-4f77-aa9a-08df29dc2f02
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:16:17.0605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtGWa6bKSaDueY5/PVCmzKcE6mZopBPBIa7uAOhstqvAZDvrA8ZHav0WTQ4/9pr1ZaEFKaWtjo/nV/APL1qoXLNz6+gc1+r8B47HGmw//qFZDZ/3vzHEkUBfdVq2+ZE8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11202

On 10/8/2026 10:20 AM, Conor Dooley wrote:
> On Thu, Oct 08, 2026 at 09:14:34AM +0200, Khristine Andreea Barbulescu wrote:
>> The SIUL2 external interrupt lines (EIRQ0-EIRQ31) on S32G2/S32G3 are not
>> hard-wired to fixed pads. Each EIRQ line has its own input multiplexer,
>> implemented by the IMCR398-IMCR429 registers, whose Source Signal Select
>> (SSS) field selects which pad signal feeds the edge detector.
>>
>> These registers were previously listed as reserved and were absent from
>> the reg list. Add a dedicated entry for the IMCR398-IMCR429 EIRQ input
>> multiplexer window between the two regular IMCR groups, update the
>> example and the minimum item count for the GPIO/EIRQ variant, and drop
>> IMCR398-IMCR429 from the reserved-index note.
>>
>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
>> ---
>>  .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml        | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> index 36f2393fa406..ecf6d61a80e9 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> @@ -23,7 +23,9 @@ description: |
>>    are used for external interrupt configuration.
>>  
>>    Please note that some register indexes are reserved in S32G2, such as
>> -  MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
>> +  MSCR102-MSCR111, MSCR123-MSCR143 and IMCR84-IMCR118. IMCR398-IMCR429
>> +  are not regular pin IMCRs but the EIRQ input multiplexer registers,
>> +  which select the pad signal routed to each external interrupt line.
>>  
>>  properties:
>>    compatible:
>> @@ -53,6 +55,7 @@ properties:
>>        - description: MSCR registers group 2 in SIUL2_1
>>        - description: IMCR registers group 0 in SIUL2_0
>>        - description: IMCR registers group 1 in SIUL2_1
>> +      - description: IMCR398-IMCR429 EIRQ input multiplexer registers in SIUL2_1
> 
> Isn't mid-list insertion here a compatibility break, since there's no
> reg-names property here? Seems like this can just be added at the end,
> without an impact on existing users?
>

Hi Conor,

You're right. I placed it mid-list because the EIRQ window (IMCR398-IMCR429)
physically sits between the two IMCR groups in the SIUL2_1 address map.
But I'll move it to the end of the reg list in v2.
>>        - description: IMCR registers group 2 in SIUL2_1
>>        - description: PGPDO registers in SIUL2_0
>>        - description: PGPDI registers in SIUL2_0
>> @@ -141,7 +144,7 @@ oneOf:
>>        - interrupts
>>      properties:
>>        reg:
>> -        minItems: 11
>> +        minItems: 12
> 
> Why is the new reg mandatory? I didn't catch the explanation for that.
> 
> Thanks,
> Conor.
>

The current driver just ioremaps the EIRQ region unconditionally, which is
what forced the bump, but that isn't a real requirement. The EIRQ
window only matters when EIRQ is used.
In v2 I'll keep minItems at 11 and make the window optional: when it's absent
the driver skips the EIRQ IRQ domain (already tracked via eirq_present) and
EIRQ stays purely additive. Does this approach work for you?

>>  
>>  additionalProperties: false
>>  
>> @@ -162,6 +165,8 @@ examples:
>>                <0x4009ca40 0x150>,
>>                /* IMCR119-IMCR397 registers on siul2_1 */
>>                <0x44010c1c 0x45c>,
>> +              /* IMCR398-IMCR429 (EIRQ input mux) on siul2_1 */
>> +              <0x44011078 0x80>,
>>                /* IMCR430-IMCR495 registers on siul2_1 */
>>                <0x440110f8 0x108>,
>>                /* PGPDO registers on siul2_0 */
>> -- 
>> 2.34.1
>>

On timing: I'll hold the v2 respin a bit longer. As noted in the cover letter,
the series still depends on two changes that haven't landed — the rebase of
94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality") onto the GPIO tree
(currently reverted by 04b3818c3bbc) and the reg_mask_xlate alignment with
6c53312b7e2d. Until those settle the series won't apply cleanly.

Regards,
Khristine

