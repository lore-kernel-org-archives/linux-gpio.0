Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709448;
	b=mqH4HknuqdGKlX3PdDWRMRokPrSZfw8Z8T2/3AJ7l2N9r4UH2rJVtx9pozX24veRr/47
	 OH7JIPJ/lEUUoZWYyv+Ug6GpQPJevmgO09Fj+SI/uEz6IOqKRzlyQ2DPx7KSXF+8quNWK
	 TcDG0tTPRWUHnZaD9RilAbD9DfAckuCS6DWuclsTulfU6wP4kD/7ifhbhv8D3xsBQseCm
	 kg5rtGL+thX1aG9wDsSG8L6IX32N6vf4WQR4gIQBs8S7FdgUotWZHKls/URahH8GO+YAv
	 YzqLx0WfkexE6Wq6GfjSFM7jXq01pXWPC/IB15nPh13K7TgjhVwgWV0TvjcQ4OdKqmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709448;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=B9+EBnT/mu2LHNd46nsmLx9yGac2o6F/b7Q4WrzfGn4=;
	b=hJmBfMjQl3m5P5Y0Fuv7bhnwDw7DjFUjh8wQ/544hJKVke45j6k3i0D07AU6IvHEpgDJ
	 leW1LHM7ndjry1C23YQgWj6luvMszMvqzQsREcMWg5GfgG8Xfb6HgMjoATXr5QJcLnbHj
	 h3z0xCrR3f9wauvkyMWvZ2vAh94iXUwBlyccuXKVEVZBPJ+VQJPu1yGWo4B1LiXzm2KL7
	 seyMXFQ7sUXR8be1d9Ctzrvf29L0p//PU4kL3s+tXY/o+CGHxVFPTD86tTq6OnTm/VGOF
	 JSI4V86Qe2trDCJdTB0j7aMCvRSkNY2lkXfxVbVXTgUGiLbQbmlUSKc3RxZ+O18xaAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=kUKfjxJ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.38
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447E6606A31C;
	Thu, 26 Nov 2026 16:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 447E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=kUKfjxJ4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDVyK2Xjusz3kb+MFqIPGVQ5/E60L92kXHMOecpRO/n0Mc968XoRJeNYm5tAhbfzqodOtVcPLChQorK6S96L61YgB6E/JuZVYfpVe3n/uAJDZ+LDHdbJCqJvBwj3W0S0X1nkL8Kmi5JIf4L1PRGdHGyvQSPYygOeApgGIdOcoJ0iCwOhjwsw+VJNdhl8WLwb0sbJlusMZ6HH8IDlfiHMtcoqmTyxJvdMTzX9vsrvvwYZMdPdUysvxcYhGzJQjjiTU+Z4FJZIx+DhVM1sS6Wp1S0PGVVqdG9msi84CYBBXiwAhMV1N+wERYxdZubjdtwS14WpMhOc8BanmsoZaTFs2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9+EBnT/mu2LHNd46nsmLx9yGac2o6F/b7Q4WrzfGn4=;
 b=pLlGdSDU+BLz7PwA8RKXUaDQqzFKtnFtr2je1ZwB/9z8lMV2Z1vVeRn3e23Kbgy0Aht8coC5AmgTU2iJil0FXb9vy1dyNmeOhHSm4YCRnuWujswEvJOYqJBcE9o3mhIwJG6HhTRUGJCxxMIgA+upXYxKRfriVfnuS5tdeQ/VO/vfA2jOLoOsRyEKO863q7seh+mfHTBpe7OfI2HfN9o47KlModriJLlatFIZcjkYyMziekpcS1hxQbZpeL6RkZLTTrO7LSyjcMGy+EW7xbuOsRH0SNz0VvWN3jUX0VUAjYMzB53oiR/hjyCKSjOLQG51JRGzVEUOi9aeyE2MGpj33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9+EBnT/mu2LHNd46nsmLx9yGac2o6F/b7Q4WrzfGn4=;
 b=kUKfjxJ4F8aWtUXiucSzo8+m2wyl7zPTcUB3szqHN/CVBJ9bbRAFC1GyrDQprgKDbWjCmNbyvHUZNUQgKYe2zdquOHnjocM3v2tmG2irGYUpT8MVCo5YoY0ziZni10H+o5jNK6aT8reJv+MQ/kk1VNMR6mirRysXT5WJ7o7V2/E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by TYWPR01MB7306.jpnprd01.prod.outlook.com
 (2603:1096:400:e8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 16:10:45 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:10:45 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Date: Thu, 26 Nov 2026 17:10:25 +0100
Subject: [PATCH] pinctrl: renesas: rzg2l: Add suspend/resume support for
 OSCBYPS registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-tm-oscbyps-v1-1-c9eb905c83a7@bp.renesas.com>
X-B4-Tracking: v=1; b=H4sIAPBZCGsC/yXMTQ5AMBBA4avIrDXRSpvUVcSiajASP+kgRNxds
 fwW713AGAgZiuSCgDsxzVOETBPwvZs6FNREg8qUkVIZsY5iZl+fC4vMaudU3mjUFmKwBGzp+GZ
 l9Zu3ekC/vge47wdeqDq6bgAAAA==
X-Change-ID: 20261126-tm-oscbyps-095aa23d5e59
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795709442; l=2622;
 i=tommaso.merciai.xr@bp.renesas.com; s=20251006; h=from:subject:message-id;
 bh=74ABKku7QFfEaNoKyAb2PHyDTR5HVU26q4ouDbAsb1Q=;
 b=2X5RNShz0DIjem0GpOm7r/VHuusuOn6F2FoFCoJrn5Voo1m93MMo3YUCcTL4RaqPwZC21zjs7
 AGXWIZQkPF2BKuF/1+mNFC+Oi+Lzxjav6vN9mVNCJrPOV/YEXEHY28A
X-Developer-Key: i=tommaso.merciai.xr@bp.renesas.com; a=ed25519;
 pk=J15CiW2gJfhl906eXCszPfqo+ddBW7v9wVMkAFyVDys=
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To OSOPR01MB295138.jpnprd01.prod.outlook.com (2603:1096:604:521::15)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|TYWPR01MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ebcf96-a48b-493c-182c-08df4bd7d3a5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|261102123227099003|10067099003|261026140227099003|56012099006|11063799006|261028144727099003|261022105027099003|261021121427099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A7Kw/QDhNNJOGhmEEZUmFO8nMBdXmXKLCeC2/cdB4oopE2ia9Li+RGputyQ4kxiv8GlPqSeqFx3uo2hkU4dEcqIQ4x66jr5IKEPQuHLB7OtPNqwcq51VMQjRMOR7ZYpslCO4dyObIACd44IUYtQt2t+r26nQ/wxppLfURJvew/J/U5+AFFb0/mXpxiiK0QyF4NkouvxQy+oRSRp9Bbe52BeDTbXjxv+hQzdR/e5Na8alzEsY3oOq9i9wTph9KcSlDwmcpyE2AOI4Gfly2Ot89jY3LXoSVfiqvlOZkJAWOT3ryYt86mL1Nle0Fw4T8VstJxKk/4IFuGVLU4BNcPSWSXmfnMT1FzYOZpTWX6rdJqAiD/92p/2P0UInJD/G8SFc7E4MTCQFpTaCgPAhIp/qR7R65JWpThNg/880VLT+QGIIzUsmgziQ70gqaiWvYkpdZ8xzRg/VT0ymviBZarid8zZDWRPzmaVQsMTLWqetChmhlcCACVjOSopptSogqOPKppsdFZfE/vlyNVq/xSPKRg49oHlX/BroeH+5GeUjiKgB6XlHK+wJJa7OL07s0gw7F/qVspLMGQ3i/uF7SdMj0ssjCGs9XVGPSxVMXOb4yKeHyj82tIjo8yorMWhyPNNM8o8xBfajwWoOQKmo9F9sIdXLfHeBNsaMoVhoUdzIAxUVOEeZg5ULr1rdLLcC7Ec8gYNBg0fkWUpEz+42JwF0zB4FAh21CA6R5MA64dmAckY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(261102123227099003)(10067099003)(261026140227099003)(56012099006)(11063799006)(261028144727099003)(261022105027099003)(261021121427099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtxR0RxR3d0bTlCa1ZDb1ByZFh1RzhHdzlFS1F2NUlBbWhNWnZEV1lycW03?=
 =?utf-8?B?b0tPa0tmRmdXMkw1ZTEvcC9vWlA1QlRwTS81N2c0ZTB0dG04RGI3T1dKT21j?=
 =?utf-8?B?WW1PcTRyNWhGNkNNVG93bk9uS1VxTWZteDB4cHpBaUdxY0FMeFBNcHRUY1c2?=
 =?utf-8?B?bXI0RVAxOXZmc3JHUTNPd2dLSkRXS25MMlB0dHZHYnE4dGFzSTVrZVNCMEVh?=
 =?utf-8?B?Uk9PTmltUlk3WjY4MnBoU3ZTclhvZTk5TXM0WFhRdzl2MXlNcFRDN1dFdlBq?=
 =?utf-8?B?RGl0QVp1MFBzYUo4VWJ2S0dkSVAxQXUxL2Z2aStGWXY4d2J1UkVtMW02TG94?=
 =?utf-8?B?UG5pTG84cit5Q0Q1NE9QMWVDQ25Jb1Z3MFBwbCtjU09jeUdDWktBU0Zma3VK?=
 =?utf-8?B?aGpGSEdsSm1ONVVwa1psVHJ2QjVGNGh6L1BtREUrbmxmbCs0cERjRi9Zd2dw?=
 =?utf-8?B?RDlaS1Y5M2hhZnBmSS91VHlvak9lZFNxRXBiVDJaaFlQTHZ3UWszcXVNT3d4?=
 =?utf-8?B?aDMwNEpMS0EwajFOWTRHMHJBMW9iVDdjQ1Q2Zm8rWE84T3hxdGxGczJueTZ0?=
 =?utf-8?B?a3ZoaXFHRVN5MXFZNVFtbmt3OStpYUVZdFlJNEppRzFmMzUvWGVCYVM4Zmw3?=
 =?utf-8?B?U1p0S1dNd01oV0xOY0JuRkdPU05ISlE2cXFmQlRwY2xjM3RBU0F0NVlKWm9p?=
 =?utf-8?B?UzZqak1ETGlTNXRza1k1WTRHVjZaT3hIMW0yNkRKNDFjeUI5Vms2aXJsMS8x?=
 =?utf-8?B?MXdCMEdwbHY0VUhkdVZTYkdNMndDcHNSM25pOEtsNkIybGdCVVpUQ1YxTlNZ?=
 =?utf-8?B?WmE0cE5wbU5qcDJ4cVZlQVNSYzJPK0lLK0ZrdWtNb3UrYkJhTTRacjBpeTNx?=
 =?utf-8?B?RkhaZUIxWmlESkpadTBYV2hjeEgvc3FzdEVaZEMrcXNxQUZxeVJpUmh0TU1x?=
 =?utf-8?B?T1k1b2JDREhIZFV6ZGN4K3oxUzBiUkp6N0VrNjR2NkZjcUNlN2hkTGhwcEtv?=
 =?utf-8?B?Z3l3dHljbGZxUHovUTI5RjlmSjhDc2ZpK08xWTVPakpNNHNoeEN4NUFOb0tm?=
 =?utf-8?B?RTBRazVwMjF0eTd6MTRtTEx3NU1sclFIcURqNWlaVnBvSmk0L0p3OWxGeE16?=
 =?utf-8?B?U1RYQzhuVmJ2Y1FsQ0NLWG1pcHZJdlVuK0tCVysxUlpUZmd1M3hMdjVvTUQv?=
 =?utf-8?B?UTEvdmFUcUxpM0xvem5NeE5zUFo0eGpZc29YN3RPUk9nR0VGK2pRd3FWdkJY?=
 =?utf-8?B?azVEbHpSeHFRVkUraGdDOTR1N2s1WGRjZHdVVVNqRkQvMzQxWDdzUWc2S21t?=
 =?utf-8?B?cGtETThMaUE3WlZEVkZuS2NRbHhlYlRYd3VWYlVaeUxpMzBlVDBrWmkyMHlM?=
 =?utf-8?B?Z2gyMTBzZXJQK29SbzNQMEdhaGM5RndtL0cvWXdRdXNYKzhpRStTS2FpcGlI?=
 =?utf-8?B?Z2hRZmw0bDZkVmI3Nnd6V0JrbjAyaWFlMlJoV055T2twL3AwbGIvR1JTVjEr?=
 =?utf-8?B?NDUwOFV5RXozT0dscUhSckl4N0RKck5RWHpQVEt0MHZmK0U5SFRqWnVCcGg0?=
 =?utf-8?B?ZHgrZDRhdzlHcG5jVW1uRlFXc0Q5dzlQUGNDK05aaXJ1Z1N3dXBxWEhxN0Rv?=
 =?utf-8?B?QTFjQlJtVFdsMnZjVlFtU0gxZXYxTlQxKzJmaTdnTjdsSVNzL2E3U3FtQkpJ?=
 =?utf-8?B?RDVKOERCVmd5YTZFZWF6RHMrWVZoSUhFajBWRHcwYkVzc1ZmRnJieHpUZ1lu?=
 =?utf-8?B?V2FSd2tDYi9HUTl5YmMydE4zVFZnKzduZUlERWJ1YkIvK1p3VmxBcG41cnBa?=
 =?utf-8?B?dXU3blgydWpOUGRGSnVWREl1SFZtdDlRcmY3MXNzNDN4WDdzUS9YaTBESU9T?=
 =?utf-8?B?YnVtbndtcTFtSk9kNUlvV2NiVmlHOC95RmpuRGZXL00wR1BpeExBYzYxaENH?=
 =?utf-8?B?cHE0L3Q4N3ZPeCtkUngzYWE1U0htSFdpV0lpeFRNcTBqOWtJUVpDRmsra1d6?=
 =?utf-8?B?Ly9JNmo5NWk3ZnozMVpiN2VHOHBqQTA0MFE3TElKUlowZmgvMHl1WHpLdHRl?=
 =?utf-8?B?Wm44SytqYXFOL3FUUUpYU3U0MjdBUEFpQ1A2dnVyU1l3QXc0VzlIaS9ldnZn?=
 =?utf-8?B?WVB3RHp6U3J2QVVmNG9YVE9tYWlQMlIyS3JwRlJvT3hUTW9aSFNZTTlFY0ND?=
 =?utf-8?B?cE9uMGFJYXBjdE5HUHg5dHRHcmQ3Q2w3VGoyb2svcHNuZU1iejV1UXp1b2lC?=
 =?utf-8?B?LzQ1NzFyNERsTE9mRFY2TDNDZmlxWDJXdXA1eUtGSTNob2dTQW9ieEdiMklq?=
 =?utf-8?B?Q0k0MmE5dnFOZS9HczFMbHJhQ09qZWttVUJUQ21CaWkraDY1WTg1WHFKSXdm?=
 =?utf-8?Q?EbL+pslq59DTo/+zhoGwd9ebmSbWpBr+LWMzB?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ebcf96-a48b-493c-182c-08df4bd7d3a5
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:10:45.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxNBXsurUaQff06/t+pwOM1ZmqlrcVvZOszGG7SrvGPDXKOsZcpz6m34iC63L/j533hVVQk00LNjrNmxYtJUjWNUx5kJOJk1SMN42aEi29kMngURRTIM5QUYscSejv7v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7306

Renesas RZ/G3E supports a power-saving mode where power to most of the
SoC components is lost, including the PIN controller. Save and restore
the OSC Bypass Mode Switching Register contents to ensure the
functionality is preserved after a suspend/resume cycle.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ca2f36c46c39..3b58f55da76f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -258,6 +258,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * @qspi: QSPI register offset
  * @other_poc: OTHER_POC register offset
  * @i3c_set: I3C_SET register offset
+ * @oscbyps: OSCBYPS register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
@@ -268,6 +269,7 @@ struct rzg2l_register_offsets {
 	u16 qspi;
 	u16 other_poc;
 	u16 i3c_set;
+	u16 oscbyps;
 };
 
 /**
@@ -404,6 +406,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @other_poc: OTHER_POC register cache
  * @qspi: QSPI registers cache
  * @i3c_set: I3C_SET register cache
+ * @oscbyps: OSCBYPS register cache
  */
 struct rzg2l_pinctrl_reg_cache {
 	u8	*p;
@@ -424,6 +427,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u8	other_poc;
 	u8	qspi;
 	u8	i3c_set;
+	u32	oscbyps;
 };
 
 struct rzg2l_pinctrl {
@@ -3814,6 +3818,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 		cache->other_poc = readb(pctrl->base + regs->other_poc);
 	if (regs->i3c_set)
 		cache->i3c_set = readb(pctrl->base + regs->i3c_set);
+	if (regs->oscbyps)
+		cache->oscbyps = readl(pctrl->base + regs->oscbyps);
 
 	if (pctrl->syscon) {
 		int ret;
@@ -3858,6 +3864,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 		writeb(cache->other_poc, pctrl->base + regs->other_poc);
 	if (regs->i3c_set)
 		writeb(cache->i3c_set, pctrl->base + regs->i3c_set);
+	if (regs->oscbyps)
+		writel(cache->oscbyps, pctrl->base + regs->oscbyps);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
@@ -4009,6 +4017,7 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 
 static const struct rzg2l_hwcfg rzv2h_hwcfg = {
 	.regs = {
+		.oscbyps = 0x3c00,
 		.pwpr = 0x3c04,
 		.oen = 0x3c40,
 	},

---
base-commit: c88442c97d6fd84b86eb1e29f006b9c71cba2528
change-id: 20261126-tm-oscbyps-095aa23d5e59

Best regards,
--  
Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

