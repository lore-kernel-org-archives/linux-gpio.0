Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF7399D0C;
	Fri, 16 Oct 2026 04:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125906; cv=fail; b=hyc+g1V5H6tIiQWaE8wN4hsUKKII3ThxuUmrWqqk77tTDOBUJpE/oGdvxu2L2RPcnh2QcR5qGaFQxWcvV8z0hmzIL6LvK9PfeorzeivjL1xgJEGWJ7/etkrzsKIzHNpb+7qQoT7xa86GPeAXG/8Qo9k6vz61yPz3JnNq1D1pcWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125906; c=relaxed/simple;
	bh=VwooJkquW5BlS+D27MWnAG2anRqkrWE9Bdi5G0tkfVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eaWTBmx5chzR5iqeYJl++FCftUB0n6WNdI4pyDvl9Bp8aTRNWbRmPbNINNWeW/yGnPH83+yl10hRoVvwe8InLGfezWMR2er6mYtHnhybdf0WDeMUxBSAP4VYiN+djDz11ZK3yemrsSD/2yN6jC/DCBN/huH5Qp7U6HGByPKC6XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aOxSmSvU; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ldKNojHb; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aOxSmSvU";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ldKNojHb"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69G2kUm82062711;
	Thu, 15 Oct 2026 23:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UxKoXCeSgif6oXZU2rxl5z8b6veBmZWCVI/0ziTOU
	cU=; b=aOxSmSvUPiSPYBL7OuobtdqK9DFWAtIjkA4li8USq1VrRvcEmbu6KzMta
	Ja98giudo/RfP9csPR42BpkTTBx7QDoCcKU5OLuexynLT227X1NBAQq+KhbLQe6P
	3SJd7cs49x364iKyziH+TwO5nv6NR/2Coum1Qwf7xYKwtxDpHqbiVKqUUpkIInyS
	alT9dYcPCdEy3WeLw3+gcCgOOQj2drEfAtPOzuitQ57Nfj1LFz+kMXlHw6mRTMcn
	uj+TW0VkoWBhSZ7tXXrw3ojZmUomJXiItD1WE3vo+xOgFqSOW8DVDM52KNidO0F7
	eR/zetAlWEOeRcIj2arMBUmmLAf8w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011010.outbound.protection.outlook.com [52.101.57.10])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hauwke3t8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 23:45:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDJOcS0UPovfq7cgCoHbORDNJhZJRCTeUV/VF9W+TTOENSLwVhdBYvS9u4InZ8jqd2p+5q6wMzMv2ArPXwMd4A7movPts4LDJwzWIIIcH7QVOV985wRnG3hUts6tIBzIs7DxoWZ5t/FuqEg8iLqQf/FnJ624Ilim7nMQTlPO7qT86Mao/qml80KliJiMlTBf73z5IQ5/xq7dgFavdJ+eRBO8D9zzCfw7+LmfKtIA7gDMgagR6T3W8JR+/ddmPMwIh4HjIk/kcoIvj32faS090lJlUGW0P9dXlV+T5vP7lmwUUkGQy6Oufc+/XxFHH7vXkw0NxltKt+yvN2MbYzFIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxKoXCeSgif6oXZU2rxl5z8b6veBmZWCVI/0ziTOUcU=;
 b=I3NXzoatiAgieFhTwa3OHUNjAT1/LOMWmBwwcaTEeaDZUPhnMgdV6mQMc9Szoc1IwQ5Ael3R+aptcpvXjsA0wGAxdECDhqrl5HZD6oCGmzyVKq7TeUY6DqzG/P32gnsITXkkOTsZILH+FPm9cpFXLKw7VTJN8tzya+ni60Laglrn+8RRcumU8ihf4CG0EBzWuF/OeLAayE04ycEp5xX2J/eFB0D0tZKw91HyHw1yT6kDCsbsSMbJgj9bcmh5jN9k/cSxj4xjWYbf4aLQJn2tmTSBJAG53Mc9Y0QhuPZ6VqghTZyjM/nocAF+5Kh3YcfEQUsm3yN2jk8dt0eBdFN3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxKoXCeSgif6oXZU2rxl5z8b6veBmZWCVI/0ziTOUcU=;
 b=ldKNojHbtbhQRpIunU52GrmDrGTJJlfm1U8YqgxT8m9b5zzOIbR3qEoujYIGrGOvukee/UXxg/5VJw6WYgFGicEX46k6hbx0LENPtPlngm44o2xxEQQsenZsXwAIh0abTCUmtc4o8xwL4c0y5IIFTeA3mPaQAmwo9GkWj+44pR0=
Received: from BN0PR10CA0020.namprd10.prod.outlook.com (2603:10b6:408:143::11)
 by IA6PR10MB997610.namprd10.prod.outlook.com (2603:10b6:208:5dd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.10; Fri, 16 Oct
 2026 04:45:00 +0000
Received: from BN2PEPF0000A993.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::7a) by BN0PR10CA0020.outlook.office365.com
 (2603:10b6:408:143::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 04:45:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000A993.mail.protection.outlook.com (10.167.248.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 04:45:00 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:44:59 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:44:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 23:44:59 -0500
Received: from [10.24.51.24] (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69G4itOq611695;
	Thu, 15 Oct 2026 23:44:56 -0500
Message-ID: <3c443e92-f552-4e04-b408-bd3a6cfbf4c6@ti.com>
Date: Fri, 16 Oct 2026 10:14:55 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: gpio: gpio-davinci: Add the tda54
 support
To: Bartosz Golaszewski <brgl@kernel.org>
CC: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <nm@ti.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com>
 <20260923-upstream-tda54-gpio-v1-1-d1a0a199c836@ti.com>
 <CAMRc=MezO+9L9mepev-ALuk4qjqTOPTGj+odn-8=MbN_9osVzQ@mail.gmail.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <CAMRc=MezO+9L9mepev-ALuk4qjqTOPTGj+odn-8=MbN_9osVzQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A993:EE_|IA6PR10MB997610:EE_
X-MS-Office365-Filtering-Correlation-Id: df9a70d4-40c6-4811-cfa9-08df2b403c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|261009223027099003|56012099006|4143699003|18002099003|22082099003|6133799003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	WULMzGhPxhflJGqXdeqMV65nG3JJuc7WNAH+01yUt4yYtffkZkxowsPDelrDzZHlAaXjPxyJAiVqOQQkhkC8oJbKYfWqlCHuzP3ZZ5fUa5XgNv1oP2goaYaA0vg0oVUjDc3qPIKpai1bL1TKbiAUIm4VAUSh7d2tMJRJAoo6FeoiDlOU67EWHN17ICP1X4Z8lED5Xc9Dk90IwZ8gvQXP0XHj2Lv9G88sszqOhCSMYS021QMkA+CVaKpIfNJr0bBKwxCAdmOg2xt7tVFPWdrE99z/JC0b6YZQa8jr6FDtb7bbWe97u7t8/qwyvx6a9KDr+PCcUlJteUHcaxb7CIqqL6XjpctUEjv1bBCUygCWLkZtkmg2Ym9sjuz1RWA5NOkXInMj3sxp/nus+/KJmydrIRquLQ6gJYc5fUG8VCbHV4ZddFObUAuxi33aEQfG7jDc91D5VFEn4Un/yM6ETuONkn2Xrt9HFKCUBgHr4kMqfHgnDassB/0MmbXqcGrq+Rdz3mfnPCpCLMNc3w5iVbMPigKxZKRFCSRMGk/Yv/vow1BrufE3dnb8plDPXzNXndU0inYoeSowMNsOvplWWgZreIGgZuDgsIVrCSj0f0i2nmC1qX5XrRe/+azs/ZTuF1s2FKBBjIHitxNUkiznavyHyocrGnPi4MCVuCpxLr8gDKE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(261009223027099003)(56012099006)(4143699003)(18002099003)(22082099003)(6133799003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hbhUnAdXmy5F+gbA3TQEScAIa9vdiumv2Cs0KyScvI+xJJNqvc6oFTYLeiALjOgwBzqvXcKrxLcrvWtw9e5vIU2TC302yFCOZ1RkZtEaoPDtN4YEZZxHHtMXMwBjn8m9Dw48/m272Mu6iBmxmR4U5J2nMY6cletREl9at99YJrvuxvtJ9UZnMTsKppIEVezpTiYRUcWkSoBSWKPcDcWOumePvDUT4wLRNaMxSqqFBS45a7bBzxZ90ZaRnN+0aBPMs0XrKC5a5d30Na6CX0AJWq5UN2wulmPWTJ7TGL0SXk+utqOtygbGYKoOTzxG2PMFbJa34L1Jqcyk72gLzXp2KjqR9SDSHBSaioTB2T8DPz9/g8o6ljsHOCSiYhPbZiBSYywkIQg/RA7lXKAs3H5WU9xkKJeLTKXbVREMpT1wvlHW+M3VTfCaVoeUZYeOP2qG
X-Exchange-RoutingPolicyChecked:
	ZFo7RrHg84fOLEv812RWIwec0P17u0R9PAYY+KOv2zTJr4ynOdkiqe1QYd+FpzWOEvuzTWi98UjDqFQvgRDqGcTNMMUUgwqBN98yP8Wk3KqJjsCHfU7Oib6IfdFBdWW/l5y2bPeJl95k9TKPh5FMkoTh15OMjF0W4Jd+FuHqB899RI8E7aB0fowZgBcIL5BvPr3aEHrem1bzTDARSA3SS8j6jRAK5Maglb4BsWuvxBi0zo1nj8Hd/vlWe/109sXysOyGTkxsa305u/p32Vz/IiM74KO1v8vVN/DIYp+cgqrbMJkPZ5L6i9ehDUPl90USB+hT37InY7/lMipbHVvDNw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 04:45:00.1591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df9a70d4-40c6-4811-cfa9-08df2b403c7f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A993.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997610
X-Proofpoint-GUID: spmtg8o1ndGU39j2m4zOcXIQF00u0wuZ
X-Proofpoint-ORIG-GUID: spmtg8o1ndGU39j2m4zOcXIQF00u0wuZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX5l/3uVLF+GQ1
 CjpnH5yoEZr51Ggkdr1o9jikseIb/JzE+jrIUVCJpke1k4bEQ5/RPwdnHYvFsozd3WJ2Qkwpase
 M9FDjI3/3hNkzPW74JlLizdnDvtUKFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfXwqxo5CmeAr+0
 JQiNFgGuW/pMuxBRXJpNGGVIQRUxknWMjZaboCoO38UAlNCp+0U0mHzGWeQHv5id9SMvDECqBoM
 xJ8ICqc2Lj8Q1MeWtR0+eqg0nWPD2mj3rdEi0JBZvJdw3fBryFnkrg28247XHxCb7L/wppgnm2F
 SSi3KlTXN2ChCT57hLgEMO72KJMz9/aHG+hHZ88pQ7yPb4DBDM14Iug9GgEiwUAAy4PL2CdkKAH
 YNtqi1X4TaSm/XjhJXXCf66ukDuJvpAFn1hoxXT5sWg3HGNVzN4fB74zovlk4WuvIdtsHR+9Bs5
 JDTmfEwM/H1NnSyMrdKHNhbwwxTRRz6bX0s9UZoIezshK+qoKUhGPFdV7mZz0BgBEpOpTBykcTz
 FgJeepe8AJ1DLohDHReOWSGKmwP4IjDs+2QXdZtphq2Fv1ByL0Tv6L4TFSz4ljSQWuxbt2iw8AT
 s4KYICXbudTunYjHBtQ==
X-Authority-Analysis: v=2.4 cv=DOsacCNb c=1 sm=1 tr=0 ts=6ad1abcf cx=c_pps
 a=0NfeuCspy0HP0/thZ1bhnQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=pOWtCY_feEBuUAqurrYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018

Hi Bartosz,


On 28/09/26 17:58, Bartosz Golaszewski wrote:
> On Wed, 23 Sep 2026 14:56:44 +0200, Aniket Limaye <a-limaye@ti.com> said:
>> New version of GPIO IP used in TDA54 SoCs adds support for level-triggered
>> interrupts via extended registers.
>> Add the device binding for ti,tda54-gpio.
>>
> 
> Nit: Does the new feature really matter for the binding if it doesn't warrant
> any changes in properties?
> 
> Bart
> 

I have sent v2 with no changes, sorry I missed this comment.
https://lore.kernel.org/all/20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com/

How would you like me to add the extended registers/level-triggered 
interrupts in dt-bindings? The compatible doesn't really need any new 
properties, but does tell the driver that extended register sets for 
level-triggered interrupts are supported by the IP.

Thanks,
Aniket

>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio-davinci.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>> index 1434d08f8b74..02b6b9a436a6 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>> @@ -18,6 +18,7 @@ properties:
>>                 - ti,am654-gpio
>>                 - ti,j721e-gpio
>>                 - ti,am64-gpio
>> +              - ti,tda54-gpio
>>             - const: ti,keystone-gpio
>>
>>         - items:
>>
>> --
>> 2.53.0
>>
>>

