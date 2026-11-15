Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.102
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794752661;
	b=zQQt5gpBsxTMZyXbptfRh+nZOkPt6gIpTry3q4a7H0qJWaXD1X8PMjcxS2NcPCywJTPz
	 a7W8Evgzkzre6gnTOwHelbA6bRVSjCx5sjtarLdam04r6XGRS0OSLC27sSnXV8hqexWcZ
	 9qikN4hLogx/ZOEtnMeMt3CEAfpOjI2ea+DGLd6/u4f0f1Ckgkz2MEj8iy1a34lKPfKNP
	 l0K4nJA1XHr5GlJ8ERQiy15yiJYBfWltglEYoCF7zurrXWIbHgNL96gjjhlXIHiaj7Suo
	 +9EB8Kz0oo/runCLzSmLai5rNwMMYw7Z2sSBPuDSQRavDGm2a6n82Q26dwCE++XT74g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752661;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=Ak2APjZLX/4ZgckmrnvZ0hikovt0ErGAfzwBbwS8GmM=;
	b=arvr1GwB9u907/tt5UgfmnhmXBtOq3GE/1fLPXqWh0weVrDLzjwcY0KnpLSmQxKwOEDy
	 u0rhpUCmk9gSl9YllECEmPYSTzaUA6GHcePGhPWkysys9igIiFxRs6sIfkEnjjsEBqrHO
	 ZQx+XSFKeUEFyIQqucYAV6R6SlQgZQUAJZs3JRV3nj0O4/1l83xQb9Xp4EA2fuIM7mEy9
	 q/5ANYuHZM5bc9mdHeMzC/3bypd/M7V+UD2pXBfN6CrRZMFIUU+OW0uRyooY65kX2Zeua
	 yFu89ceilAtR0iGxtSAqTEry12A0GQ0WP92QPVIo0G60ReGFPelOtkkIiXxzsvnNw0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iopsys.eu;
	spf=pass smtp.mailfrom=genexis.eu;
	dkim=pass header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=o6JXAQmf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.102
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021102.outbound.protection.outlook.com [40.107.130.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313DB606A89D;
	Sun, 15 Nov 2026 14:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313DB606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=o6JXAQmf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1LaOVURb39xmqujPy+SLpoonIQWAwJ3GxYNZaZ5GyFUrXedyj+46MtgPHDIlzaQ4C9nVT4YlhfUHIv2/U9SHd8/bjty15BBHMlMb2TG48SfCPTPL8HtvjBeZ4ryouEEtcdgH91is7ozPwrb6zcQSU8VpHz1/x8POMp583k4jywyuvE2WNgoRQCXahTcqaunWiUvv690FGUfhYkFoVrj0byPXd/X0z5NCQQkarD9SyPZgtjQGh5JzU1VTSAsIOH7ViXhld1HnF8m0VfWFwgky+pQvs3tYr6WShzqtb1lU0pY3dYQBSpvbX0DHJML3X/fqaWImMwaiS7lkk/78TsvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak2APjZLX/4ZgckmrnvZ0hikovt0ErGAfzwBbwS8GmM=;
 b=yuxlwwijCuiGDPE8XNpOJT5KFtmMHJZgdGzM4SEeCEz7j5ELAG8ssZFLbnqZkeFJASiYSum0vy+0MgphDmbuYAfn8ey46PAXaiEVVYpPHs+QnSzB58E3zV8Iz71SaKH11rOVqMH2YTPXad1ubi0zrpsy19kpDBlIeB97Jgb/ZRiIfO/zS3PddmbozLS99X9zo1J1rOplTQxCYlwgMwGmd1EEfW80Mj1xKUajPKbopKRJ88p1thgVOlqnuSyzbhS31fpJxCKVFxsS8/281IrqcrQHksuB0GjyGEbIqNl5JHGP7FoAiDSHpTYH1d98x+9f694aj+H68UFNa4xBMJfHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak2APjZLX/4ZgckmrnvZ0hikovt0ErGAfzwBbwS8GmM=;
 b=o6JXAQmfRELeurZD9FDLSvln0RG0pXvJafJir7RViEynFARocawcnDF+8fZwDBjL4aaAsGs5Xhqg3oZHDcALlwYBvTzWHNzBfJveqfWdOrhDmkPNWMaIgsaA5oAkY5MYdRVDi7+937hTOnmeyo/lci3XbGadB9Kgi1IzvkI7SyD7ZBu5A7JnqjW5iHNQwMEg8vI/vq2HhwAcKWmyHx93Pr4WFlvQjJmuCJmVUdGVTtQ8ieqCnz7xrnBDwajapaueZvQPbAwukMMAV3KtTzmVPczvdbrrlPeGLP3CY3trDGyO7YyWRxKp2oj0Gw4VeNj+aBZIKA5qUwGvrnZ79jdJ+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DB5PR08MB10163.eurprd08.prod.outlook.com (2603:10a6:10:4a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sun, 15 Nov
 2026 14:24:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%3]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 14:24:15 +0000
Message-ID: <d5ad88e8-132d-4da3-9fcb-e98fe1022f31@iopsys.eu>
Date: Sun, 15 Nov 2026 17:24:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] pinctrl: airoha: en7523: use force GPIO mode for
 GPIO requests
To: Zhengping Zhang <zhengping.zhang@airoha.com>, linusw@kernel.org,
 lorenzo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 brgl@kernel.org, naseefkm@gmail.com, benjamin.larsson@genexis.eu,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lei.dong@airoha.com, ansuelsmth@gmail.com
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-12-zhengping.zhang@airoha.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20261110094339.749110-12-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DC11.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::26f) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DB5PR08MB10163:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8684e7-5e23-4a34-6114-08df43242053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|22082099003|18002099003|6133799003|3023799007|4143699003|11063799006|56012099006|261102123227099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|10067099003|261009221227099003|261022105027099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	rJgN2EJ7gGkXZh7+eIeg3kYHydpr76nsN7WQ+eEmRdym2ZbwdHwpKkE1ZTQyPAzlkcgF3euoMXHaRMrHbvf3MmjGfjC4GONnYjaJg4xDLXbPexBIENz/4qDeZ3NI6AEkE9LU4VgYJblABpODByKW1wvULWNo7qkHSLCid45vv24ZcQSwiDkgkWgneMXKm44vRQtUshvqnSrs6ndEkO73Cpy6N5kWhcEh8vqb1L/UT5vmGgGXHGXN4XKRcbHcpRlht8tsPUNduFbfQNBidhHE1y7nJiMjcolxfsWpQq9LiXt1k9plSA/b0GKC3B+9w6LnKwPfQxTVl31NZTjmqaeagSaNwrwS8XDFJ0Gn5+LVM1gvwjAH8p/dHRctizlnfxa2n4gmGFG2yZUv4dSTssMFgCX4E86tD4ZxGMgF+VdCwaRJ7epkeDktuMYg9CfVxth+86vIP3rGDaDcE+pehRiQe9LZN8UdnRvAzb0d/CPpGEQDUaCF6SWBhFyLzQ/krKHOG2wbwvI/nDLamQNHskaY3OFKiGCkRy4Ze5wXF9u2brK06z6JJXoOItGGZn3UFm3Y27CB0/s+dji/9K1MWknDw7QHRIh7F9gFj4oHB+3ENSG36tqtIsAestPvSPnb3E3Z6XbD06oIntcVbmUN/oO5upLqEnjdOP0/N5YIpf6+m7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(4143699003)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(10067099003)(261009221227099003)(261022105027099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MThxUlk4aEJUK2lQcDQvanNqemxaL2pTWkpHY3ZDWVZGdGhJa2hrUUg1Q1o2?=
 =?utf-8?B?MnJaZHFsamNaY25DeE5OZ0R5bWxNT1FnL3JnUTBwd3JBb2pDVkF3aVdvTWMv?=
 =?utf-8?B?RUZzQmdEbTd6cmxVOEVxeXBvd3dnaW1tbVU3cGE2bFhZcDJndWllWW52cnd1?=
 =?utf-8?B?ZzJ6T1haR1lUeVFZdnE5aTdrMkhSaUNkVTRoRDBxWE9LZHR1anZxdkIvalds?=
 =?utf-8?B?RDRFbXI1THplcUVJMVVWYzdjbEMxR3ZNRjFSSnZGNkV4Ky9GK1hWNCtWMWhP?=
 =?utf-8?B?RlB1VUF5eThNNDNlK1dkRTMwc1cwZ2YrenBjRi9NbWp5Z3crSEJRSDBZZGxG?=
 =?utf-8?B?R24xNEZFNWFZeFJBTFhTMisxeGpXNTFlM0pHQlFZZlpqUGZzbkY4bytTdVhT?=
 =?utf-8?B?RDBvVlJFU05Dc1dQd0Rva2hFWEsrTG1SclRoM0NTUDVWcDdRV2FuRVlqblkx?=
 =?utf-8?B?end2akNkdGZFcVFNRGIzRkloVS90ejdEUU1seFY0dVRIK1ZUVjVZZ1FBTENx?=
 =?utf-8?B?bEc2bFFzd2tOR215WW1tbTVLS2JjcnNUeU1WK3hPK25zRURiUTR0eTFRM3Nj?=
 =?utf-8?B?cFRnVHZiS3hHaWNTb3RhSEp0S3hHYk1jVnlxSFBqWTFQeGFlSW16Y0RjZ1dr?=
 =?utf-8?B?amFPR1QyWUF2dHhUUTl4bHd3SUx2SkRJL1FTeHB0Rk56b3RZblJ5R3NIYkpC?=
 =?utf-8?B?azFzZnhxaFBRK0RPSjNBQTJnNGhkOTlraGVWNDhSMUhsOUQ0eXFBWkNLR2tR?=
 =?utf-8?B?WHRhd2ltZzk1azBpTnZNMTZmNHQ3SmJNanR0eXY1RFJ4bXpNVUN5L1ErNmI2?=
 =?utf-8?B?VzZYamRXaEpnYmsxTFEvZFRkcWl6djhUT2FTcTJXR1VNYUR4YmpQdXJRTWhs?=
 =?utf-8?B?cHNzRjlsbUxzNHllc1o1K3J0N3RrYktjdkdjUkdndXVsc3BGWDQxZmJVS2ln?=
 =?utf-8?B?QWtWOVdLRFZVSlFUWlp6NmV6NEgzSkE3S3lOZU1lQlhVcGUwVUpoUWtXOW5Z?=
 =?utf-8?B?YW5WY3dXVzk3V1ZFaUN3U0QzSERvbmtDQ05ySWd6RGlEQ1FySjhMa1dwbWRq?=
 =?utf-8?B?WGxLV2dMTExRNkFHNFpkRzlHY0VlLzJqbjZQL1dYVlgzdHloNk9KOEhRZVNZ?=
 =?utf-8?B?WTNNNFJJYmpaYmZqdzlxeFdIRks2T3JtL1VLY09WZzJTUVZNQ0xoN0JVTGFv?=
 =?utf-8?B?emFHa3FSajJDd3BRakJpZzk2OTUxejRicGpDTGtVUWdJMEdyaElIRlNQSnMv?=
 =?utf-8?B?SGoyR2pxVFM0NkZyamZUWEhDNWdmMndjU2RUbXFJdkZFNEsybWVKME5qNkFB?=
 =?utf-8?B?T3BKU00vblpPVitBZzdMVXlqc0N0ZFpkTHVPaEJWSmlqYmMwM2ZKbk1BV2M5?=
 =?utf-8?B?c01pT2xpZDVXdG5ML0pmTjRDckZPOWJINmlNdHlybmZWWmNJRndiRkVGbWpX?=
 =?utf-8?B?ZE1OU2tUUXh0TlR3UnB3YzhpRmpDd1h5TFE2Q1BueHhGc2g5SDYydWJQNmY1?=
 =?utf-8?B?cUQzV3FTVG5PODBsREtyT1RsS1BndmZuN3dQMU4yalU2WmpvN2UraGJqeWJD?=
 =?utf-8?B?Y0tsUDJWN2hIVWpYL1ltMUsrMEYrSWhOUkRubEQzWWhORGhoQ28zemE5aVdD?=
 =?utf-8?B?T3V1KzNMeVFIZGRlc1JYb21ESVlqd2NhZ05DM3QvYnhhbFhLWlUrUEJsK2lT?=
 =?utf-8?B?ckRQQnhkenhLUFVKRDVwandWVG1iajNJVGI2d2p4NWU4dFBIWktUbWVqNjVr?=
 =?utf-8?B?WHpzZU1lVW9YSzVKUmh6QVZZbDdxQjN0ZU9NK1JiRUJZVFZkd0lsM3l1aUty?=
 =?utf-8?B?UDVsODZhSk43dzhYK1JRSnlHSHMwK2NWSUM4MnN5ejBVYUN6MzAzcVBLRGZW?=
 =?utf-8?B?UTZsSjk3L1daUCtqN0tWOHJ1OWFPRmdpRnhveVFGNEJ1Si9TbzRsMngrdUtQ?=
 =?utf-8?B?aUNvcHNublBRRWVDSkxUOGxhN0txWm1pVnNmMkd2d3R1SXB2ZnV6azNHL3lO?=
 =?utf-8?B?dnlWVHR5bERVbWtCZElzMXQ3MkVxZmVTUitEWWNweEs2Ym5VRktNSzEraitw?=
 =?utf-8?B?STVRWkxOSTd4VWJqTU9yeEVNVk0xcExQQUROWGwxNjA4blU2UmQxejI1WUxq?=
 =?utf-8?B?U2lIcGkvY2tCWmJaWXd1OWxjdEE3NXd4MEUzNUt2elVLdSs3MFF4K2d2RlFK?=
 =?utf-8?B?aXVHcFFyZUtVaWhLbzZQcG5FSnRIWjVVaW84ZGpXQXNvV21zVmtGMHJFOXgx?=
 =?utf-8?B?clQ0Y21mekt2anRrWUJVcVJldlF5SG83Q1FzQkVQM3NpOVllL2RFOVpEZEFM?=
 =?utf-8?B?ckM4MGEvMEFYelh0Umc3QUtPU1gyZXNDcnJoWFpvMUJSaDQ0SHFBcjAyc1V4?=
 =?utf-8?Q?cDGg7zJRxK3XkWBE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8684e7-5e23-4a34-6114-08df43242053
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 14:24:15.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRoKlNRujcHrPiv3b+vfRSd+I6xJLoVs0UCl7IQ4Usd/GfUWJPfHHZkiP1jywXrzVQjK2c/YaPMsfcj+QjkDgxE215LOHfmEcXMx8OwlKDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10163

I think it's better does not play with force gpio registers and just
disable (if no conflicts) functions that put selected pin to non-gpio mode.


On 11/10/26 12:43, Zhengping Zhang wrote:
> [You don't often get email from zhengping.zhang@airoha.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> GPIO requests can leave pads controlled by alternate functions selected
> by the bootloader. Extend the GPIO mux groups to GPIO0-29 and enable
> the shared GPIO request handling and mux conflict checks. GPIO consumers
> and explicit GPIO pinctrl states then use the same configuration tables.
>
> Use per-pad force GPIO overrides without disabling shared peripheral
> modes on other pads. Select GPIO mode using the following SCU register
> bits, where n is the GPIO number:
>
>   - GPIO0-29: set bit n in register 0x224
>     (GPIO0 -> bit 0, ..., GPIO29 -> bit 29).
>   - GPIO28: also set the PCIe reset0 GPIO selector at register
>     0x218, bit 9.
>   - GPIO29: also set the PCIe reset1 GPIO selector at register
>     0x218, bit 10.
>
> Unlike AN7581 and AN7583, EN7523 provides a force GPIO bit for GPIO0.
> Clear the requested pad's PWM selection when selecting GPIO.
>
> When selecting a peripheral function, clear the corresponding force
> GPIO overrides so an earlier GPIO configuration does not prevent
> peripheral operation. Enable the overrides when selecting PWM output.
>
> Exclude the software-controlled TX_DIS/RX_DIS pads (GPIO16/21) from the
> hardware PON mux group. These signals serve the PON interface but are
> intended to be requested as GPIOs by the PON PHY driver and controlled
> through the GPIO API rather than driven by the PON hardware. This
> avoids ownership conflicts between PON mux selection and GPIO requests.
>
> Correct the 128-pin PCM SPI CS2 group to use GPIO29 (pinctrl pin 41)
> instead of GPIO27. The share-pin table assigns GPIO29 to CS2 in the
> 128-pin package and GPIO27 to CS2 in the 156-pin package. Keep the
> 156-pin group unchanged, and clear GPIO29's PCIe GPIO selector when
> selecting its PCM SPI CS2 function.
>
> Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> ---
>  drivers/pinctrl/airoha/pinctrl-en7523.c | 579 +++++++++++++++++++-----
>  1 file changed, 473 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
> index b0c5e60f0aeb9..041536790fd8b 100644
> --- a/drivers/pinctrl/airoha/pinctrl-en7523.c
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
> @@ -211,7 +211,7 @@
>         }
>
>  /* PWM */
> -#define AIROHA_PINCTRL_PWM(gpio, mux_val)                      \
> +#define AIROHA_PINCTRL_PWM(gpio, mux_val, force_reg, force_mask) \
>         {                                                       \
>                 .name = (gpio),                                 \
>                 .regmap[0] = {                                  \
> @@ -220,10 +220,14 @@
>                         (mux_val),                              \
>                         (mux_val)                               \
>                 },                                              \
> -               .regmap_size = 1,                               \
> +               .regmap[1] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), (force_mask)                      \
> +               },                                              \
> +               .regmap_size = 2,                               \
>         }
>
> -#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)                  \
> +#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val, force_reg, force_mask) \
>         {                                                       \
>                 .name = (gpio),                                 \
>                 .regmap[0] = {                                  \
> @@ -232,10 +236,14 @@
>                         (mux_val),                              \
>                         (mux_val)                               \
>                 },                                              \
> -               .regmap_size = 1,                               \
> +               .regmap[1] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), (force_mask)                      \
> +               },                                              \
> +               .regmap_size = 2,                               \
>         }
>
> -#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)    \
> +#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val, force_reg, force_mask) \
>         {                                                       \
>                 .name = (gpio),                                 \
>                 .regmap[0] = {                                  \
> @@ -250,10 +258,14 @@
>                         (smux_val),                             \
>                         (smux_val)                              \
>                 },                                              \
> -               .regmap_size = 2,                               \
> +               .regmap[2] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), (force_mask)                      \
> +               },                                              \
> +               .regmap_size = 3,                               \
>         }
>
> -#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)      \
> +#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val, force_reg, force_mask) \
>         {                                                               \
>                 .name = (gpio),                                         \
>                 .regmap[0] = {                                          \
> @@ -268,10 +280,14 @@
>                         (map_mask),                                     \
>                         (map_val),                                      \
>                 },                                                      \
> -               .regmap_size = 2,                                       \
> +               .regmap[2] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), 0                 \
> +               },                                              \
> +               .regmap_size = 3,                                       \
>         }
>
> -#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)      \
> +#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val, force_reg, force_mask) \
>         {                                                               \
>                 .name = (gpio),                                         \
>                 .regmap[0] = {                                          \
> @@ -286,7 +302,11 @@
>                         (map_mask),                                     \
>                         (map_val),                                      \
>                 },                                                      \
> -               .regmap_size = 2,                                       \
> +               .regmap[2] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), 0                 \
> +               },                                              \
> +               .regmap_size = 3,                                       \
>         }
>
>  static struct pinctrl_pin_desc pinctrl_pins[] = {
> @@ -330,7 +350,8 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
>         PINCTRL_PIN(41, "pcie_reset1"),
>  };
>
> -static const int pon_pins[] = { 28, 29, 30, 31, 32, 33 };
> +/* TX_DIS (GPIO16) and RX_DIS (GPIO21) are software GPIOs. */
> +static const int pon_pins[] = { 29, 30, 31, 32 };
>  static const int pon_tod_1pps_pins[] = { 21 };
>  static const int gsw_tod_1pps_pins[] = { 21 };
>  static const int sipo_pins[] = { 13, 38 };
> @@ -352,7 +373,7 @@ static const int pcm_spi_pins[] = { 16, 17, 18, 19, 24, 25, 26, 27 };
>  static const int pcm_spi_int_pins[] = { 15 };
>  static const int pcm_spi_rst_pins[] = { 14 };
>  static const int pcm_spi_cs1_pins[] = { 22 };
> -static const int pcm_spi_cs2_p128_pins[] = { 39 };
> +static const int pcm_spi_cs2_p128_pins[] = { 41 };
>  static const int pcm_spi_cs2_p156_pins[] = { 39 };
>  static const int pcm_spi_cs3_pins[] = { 20 };
>  static const int pcm_spi_cs4_pins[] = { 23 };
> @@ -466,7 +487,13 @@ static const char *const pcm_spi_groups[] = {
>         "pcm_spi_cs2_p156", "pcm_spi_cs2_p128", "pcm_spi_cs3", "pcm_spi_cs4"
>  };
>  static const char *const i2s_groups[] = { "i2s" };
> -static const char *const gpio_groups[] = { "gpio28", "gpio29" };
> +static const char *const gpio_groups[] = {
> +       "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5",
> +       "gpio6", "gpio7", "gpio8", "gpio9", "gpio10", "gpio11",
> +       "gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
> +       "gpio18", "gpio19", "gpio20", "gpio21", "gpio22", "gpio23",
> +       "gpio24", "gpio25", "gpio26", "gpio27", "gpio28", "gpio29",
> +};
>  static const char *const pcie_reset_groups[] = {
>         "pcie_reset0", "pcie_reset1"
>  };
> @@ -511,7 +538,16 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
>                         GPIO_PON_MODE_MASK,
>                         GPIO_PON_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(17) |
> +                       BIT(18) |
> +                       BIT(19) |
> +                       BIT(20),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -524,7 +560,13 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
>                         PON_TOD_1PPS_MODE_MASK,
>                         PON_TOD_1PPS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(9),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "gsw_tod_1pps",
>                 .regmap[0] = {
> @@ -533,7 +575,13 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
>                         GSW_TOD_1PPS_MODE_MASK,
>                         GSW_TOD_1PPS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(9),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -546,7 +594,14 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
>                         GPIO_SIPO_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(1) |
> +                       BIT(26),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "sipo_rclk",
>                 .regmap[0] = {
> @@ -555,7 +610,15 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(1) |
> +                       BIT(18) |
> +                       BIT(26),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -568,7 +631,14 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
>                         GPIO_SGMII_MDIO_MODE_MASK,
>                         GPIO_SGMII_MDIO_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(8) |
> +                       BIT(9),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -581,7 +651,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART2_MODE_MASK,
>                         GPIO_UART2_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(8) |
> +                       BIT(9),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "npu_uart",
>                 .regmap[0] = {
> @@ -590,7 +667,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         NPU_UART_EN_MASK,
>                         NPU_UART_EN_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(1) |
> +                       BIT(26),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }
>  };
>
> @@ -603,7 +687,14 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
>                         GPIO_2ND_I2C_MODE_MASK,
>                         GPIO_2ND_I2C_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(2) |
> +                       BIT(3),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -616,7 +707,17 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
>                         JTAG_UDI_EN_MASK,
>                         JTAG_UDI_EN_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(22) |
> +                       BIT(23) |
> +                       BIT(24) |
> +                       BIT(25) |
> +                       BIT(26),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "jtag_dfd",
>                 .regmap[0] = {
> @@ -625,7 +726,17 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
>                         JTAG_DFD_EN_MASK,
>                         JTAG_DFD_EN_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(22) |
> +                       BIT(23) |
> +                       BIT(24) |
> +                       BIT(25) |
> +                       BIT(26),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -638,7 +749,16 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
>                         GPIO_PCM1_MODE_MASK,
>                         GPIO_PCM1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(12) |
> +                       BIT(13) |
> +                       BIT(14) |
> +                       BIT(15),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm2",
>                 .regmap[0] = {
> @@ -647,7 +767,16 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
>                         GPIO_PCM2_MODE_MASK,
>                         GPIO_PCM2_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(4) |
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -660,7 +789,14 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
>                         GPIO_SPI_QUAD_MODE_MASK,
>                         GPIO_SPI_QUAD_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(2) |
> +                       BIT(3),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "spi_cs1",
>                 .regmap[0] = {
> @@ -669,7 +805,13 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
>                         GPIO_SPI_CS1_MODE_MASK,
>                         GPIO_SPI_CS1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(9),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -682,7 +824,20 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_MODE_MASK,
>                         GPIO_PCM_SPI_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(4) |
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7) |
> +                       BIT(12) |
> +                       BIT(13) |
> +                       BIT(14) |
> +                       BIT(15),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_int",
>                 .regmap[0] = {
> @@ -691,7 +846,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_INT_MODE_MASK,
>                         GPIO_PCM_INT_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(3),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_rst",
>                 .regmap[0] = {
> @@ -700,7 +861,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_RESET_MODE_MASK,
>                         GPIO_PCM_RESET_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(2),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs1",
>                 .regmap[0] = {
> @@ -709,7 +876,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS1_MODE_MASK,
>                         GPIO_PCM_SPI_CS1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(10),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs2_p128",
>                 .regmap[0] = {
> @@ -718,7 +891,19 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS2_MODE_P128_MASK,
>                         GPIO_PCM_SPI_CS2_MODE_P128_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(29),
> +                       0
> +               },
> +               .regmap[2] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_GPIO_PON_MODE,
> +                       GPIO_PCIE_RESET1_MASK,
> +                       0
> +               },
> +               .regmap_size = 3,
>         }, {
>                 .name = "pcm_spi_cs2_p156",
>                 .regmap[0] = {
> @@ -727,7 +912,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS2_MODE_P156_MASK,
>                         GPIO_PCM_SPI_CS2_MODE_P156_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(27),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs3",
>                 .regmap[0] = {
> @@ -736,7 +927,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS3_MODE_MASK,
>                         GPIO_PCM_SPI_CS3_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(8),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs4",
>                 .regmap[0] = {
> @@ -745,7 +942,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS4_MODE_MASK,
>                         GPIO_PCM_SPI_CS4_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(11),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -758,15 +961,104 @@ static const struct airoha_pinctrl_func_group i2s_func_group[] = {
>                         GPIO_I2S_MODE_MASK,
>                         GPIO_I2S_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(4) |
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> +/* Force overrides select individual pads without disabling shared buses. */
> +#define EN7523_GPIO_GROUP(n, pwm_mask, force_reg, force_mask)  \
> +       {                                                               \
> +               .name = "gpio" #n,                                      \
> +               .regmap[0] = {                                          \
> +                       AIROHA_FUNC_PWM_MUX,                            \
> +                       (n) < 16 ? REG_GPIO_FLASH_MODE_CFG :            \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,                    \
> +                       (pwm_mask), 0                                   \
> +               },                                                      \
> +               .regmap[1] = {                                          \
> +                       AIROHA_FUNC_MUX, (force_reg),                   \
> +                       (force_mask), (force_mask)                      \
> +               },                                                      \
> +               .regmap[2] = {                                          \
> +                       AIROHA_FUNC_MUX, REG_GPIO_PON_MODE,             \
> +                       (n) == 28 ? GPIO_PCIE_RESET0_MASK :             \
> +                       (n) == 29 ? GPIO_PCIE_RESET1_MASK : 0,          \
> +                       (n) == 28 ? GPIO_PCIE_RESET0_MASK :             \
> +                       (n) == 29 ? GPIO_PCIE_RESET1_MASK : 0           \
> +               },                                                      \
> +               .regmap_size = 3,                                       \
> +       }
> +
>  static const struct airoha_pinctrl_func_group gpio_func_group[] = {
> -       AIROHA_PINCTRL_GPIO_EXT("gpio28", GPIO28_FLASH_MODE_CFG,
> -                               GPIO_PCIE_RESET0_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio29", GPIO29_FLASH_MODE_CFG,
> -                               GPIO_PCIE_RESET1_MASK),
> +       EN7523_GPIO_GROUP(0, GPIO0_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(0)),
> +       EN7523_GPIO_GROUP(1, GPIO1_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(1)),
> +       EN7523_GPIO_GROUP(2, GPIO2_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(2)),
> +       EN7523_GPIO_GROUP(3, GPIO3_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(3)),
> +       EN7523_GPIO_GROUP(4, GPIO4_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(4)),
> +       EN7523_GPIO_GROUP(5, GPIO5_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(5)),
> +       EN7523_GPIO_GROUP(6, GPIO6_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(6)),
> +       EN7523_GPIO_GROUP(7, GPIO7_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(7)),
> +       EN7523_GPIO_GROUP(8, GPIO8_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(8)),
> +       EN7523_GPIO_GROUP(9, GPIO9_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(9)),
> +       EN7523_GPIO_GROUP(10, GPIO10_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(10)),
> +       EN7523_GPIO_GROUP(11, GPIO11_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(11)),
> +       EN7523_GPIO_GROUP(12, GPIO12_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(12)),
> +       EN7523_GPIO_GROUP(13, GPIO13_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(13)),
> +       EN7523_GPIO_GROUP(14, GPIO14_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(14)),
> +       EN7523_GPIO_GROUP(15, GPIO15_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(15)),
> +       EN7523_GPIO_GROUP(16, GPIO16_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(16)),
> +       EN7523_GPIO_GROUP(17, GPIO17_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(17)),
> +       EN7523_GPIO_GROUP(18, GPIO18_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(18)),
> +       EN7523_GPIO_GROUP(19, GPIO19_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(19)),
> +       EN7523_GPIO_GROUP(20, GPIO20_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(20)),
> +       EN7523_GPIO_GROUP(21, GPIO21_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(21)),
> +       EN7523_GPIO_GROUP(22, GPIO22_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(22)),
> +       EN7523_GPIO_GROUP(23, GPIO23_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(23)),
> +       EN7523_GPIO_GROUP(24, GPIO24_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(24)),
> +       EN7523_GPIO_GROUP(25, GPIO25_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(25)),
> +       EN7523_GPIO_GROUP(26, GPIO26_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(26)),
> +       EN7523_GPIO_GROUP(27, GPIO27_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(27)),
> +       EN7523_GPIO_GROUP(28, GPIO28_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(28)),
> +       EN7523_GPIO_GROUP(29, GPIO29_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(29)),
>  };
>
>  static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
> @@ -778,7 +1070,13 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
>                         GPIO_PCIE_RESET0_MASK,
>                         0
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(28),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcie_reset1",
>                 .regmap[0] = {
> @@ -787,131 +1085,199 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
>                         GPIO_PCIE_RESET1_MASK,
>                         0
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(29),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
>  static const struct airoha_pinctrl_func_group pwm_func_group[] = {
> -       AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
> +       AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(0)),
> +       AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(1)),
> +       AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(2)),
> +       AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(3)),
> +       AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(4)),
> +       AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(5)),
> +       AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(6)),
> +       AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(7)),
> +       AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(8)),
> +       AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(9)),
> +       AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(10)),
> +       AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(11)),
> +       AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(12)),
> +       AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(13)),
> +       AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(14)),
> +       AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(15)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(16)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(17)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(18)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(19)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(20)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(21)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(22)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(23)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(24)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(25)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(26)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(27)),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio28", GPIO28_FLASH_MODE_CFG,
> -                                  GPIO_PCIE_RESET0_MASK),
> +                                  GPIO_PCIE_RESET0_MASK,
> +                               REG_FORCE_GPIO_EN, BIT(28)),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio29", GPIO29_FLASH_MODE_CFG,
> -                                  GPIO_PCIE_RESET1_MASK),
> +                                  GPIO_PCIE_RESET1_MASK,
> +                               REG_FORCE_GPIO_EN, BIT(29)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(22)),
>         AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(23)),
>         AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(24)),
>         AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(25)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(22)),
>         AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(23)),
>         AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(24)),
>         AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(25)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(22)),
>         AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(23)),
>         AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(24)),
>         AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(25)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(22)),
>         AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(23)),
>         AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(24)),
>         AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(25)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(7)),
>         AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(6)),
>         AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(5)),
>         AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(4)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(7)),
>         AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(6)),
>         AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(5)),
>         AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(4)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(7)),
>         AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(6)),
>         AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(5)),
>         AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(4)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(7)),
>         AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(6)),
>         AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(5)),
>         AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(4)),
>  };
>
>  static const struct airoha_pinctrl_func pinctrl_funcs[] = {
> @@ -926,7 +1292,7 @@ static const struct airoha_pinctrl_func pinctrl_funcs[] = {
>         PINCTRL_FUNC_DESC("spi", spi),
>         PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
>         PINCTRL_FUNC_DESC("i2s", i2s),
> -       PINCTRL_FUNC_DESC("gpio", gpio),
> +       PINCTRL_GPIO_FUNC_DESC("gpio", gpio),
>         PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
>         PINCTRL_FUNC_DESC("pwm", pwm),
>         PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
> @@ -1104,6 +1470,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
>  };
>
>  static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> +       .check_mux_conflicts = true,
>         .chip_scu_compatible = "airoha,en7523-chip-scu",
>         .pinctrl_name = KBUILD_MODNAME,
>         .pinctrl_owner = THIS_MODULE,
> --
> 2.43.0
>
