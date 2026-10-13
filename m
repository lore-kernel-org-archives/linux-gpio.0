Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A44A206E;
	Tue, 13 Oct 2026 06:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871825; cv=fail; b=Dh4p4nCCD5Nb0dFUj+9BdwFUZYvyea4DdznCF4/i9HXtEdZS7JJss1A6ONY/y0p0E/NJHi0mErpan3pgPpD1gBfFbvwMa5TKYB61ZuxdT/Gki428tu5ZZ+/1qkA11rjoRq33s2XELk+G0HYCKDfzG+dWGMpq5XZ02eiNIQqk94Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871825; c=relaxed/simple;
	bh=mb+fgBMoR9npRLvYhRyq9JyxHXgcmaMPN5ybzRRbbmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nR2zNDBXqr6Xt0hxYO9n6IyYI9aNJETCAv5mznRJC9usYpa8QF+oq0WDBTRD7gIk0cazkOPt7LjgC5yDg1eTreQbCb9xH2mHK2pI745goVb5OhuTCqobdz9tUidgEAUy8HO26BewGeYhZCJSqFO1B0vlq1ZrEMF6G4cSqiXi//M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=JJEboOEo; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=aDpeeg63; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="JJEboOEo";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="aDpeeg63"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69D22vls3045872;
	Tue, 13 Oct 2026 01:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0AY1zmjQbnBV/s967wdGO8CrJ+bZ/8yqQ6dNNp2xS
	fA=; b=JJEboOEo2J8N14imYIRYqqshzvsoWZbH1IIQGCC/9q/la4G+VDyQlm98P
	jR++RlLPw5/GaaoQDvdS+yxIO92zCL/CVdAtEjCNDN6xeo/ZN9jOAvhjfrM7OO2l
	b9cjWnsMDAOrp1LUMx4/P/q8eEr0sHUFm87wANKH2sLRu+WrvVeZOHK2w/PCJNvj
	eLX/dQxhY+nvjtMTkyp+FvcZtaN2xJwXI92LeLoysnC3s+IcumRcf0D4wrgOlOMy
	E4SherF7J1FHhUCSALPjUmwSiiEwkG/Mru3CR/Kl46ZBkochT0DMxikvLccJD+ZO
	UrWd/lxFtirBxPnStQucdkvUJS4GQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h99uh9u2m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 01:10:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4xJ0ZlaUt1Xuhh8TWW3slO3arFNiZkOZhVH2ZBi2/W3A6F3eC2HZXe19tV+Bye8RPzuYi1Cjk/heFYr4aIW4iVOl13P9lNIfbPcc3pGHQ29MmTgr7CAPQjVQOtjWU4vA/JIj+gJfvpTtUIJ6xgFKULC074N6z6aYPTQJOIc1/Rzdsu2Ek1Dkb6rvFMdSXbGlXqK7oud2gGWrAmFo18MwFiaostMcbaohRWvrGresrT0AJJb5i10uIAqN1p5ou5x4sSpIrZiftBjXaXHWuKa6kewL7hpeswU4LHVxJsORCsg0LcdrZXq3iyzS5RmX1I4YdhsYMbJ9eDuIrrjg4vRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AY1zmjQbnBV/s967wdGO8CrJ+bZ/8yqQ6dNNp2xSfA=;
 b=hN1bD3JtnXeszYH5Hxh6+moEURqP4Pjzr180RwRrDrzjFILnPLLhsaGRpsLrL6K2ApkATjSOw9Bz84TVvytwkLRxWyA2WnCM7isw5q8l4G4Z5w7Gh9K5zXIzTxUhjk/O+XXomxvtualyVVatkzP2IojFomIaQmWhnXGnb4Js3126eEjiAuoQKXHTLuV6CPTpf1BNcDR+KZ9qf1sXg/YG21xmbyyd/A4kw1HM4WYKleW0Sukt9DCKWqqnVl6R6UG3SswGmu60eita0AffsMqQhyoz2/SXw3a8IVC77c0bekSJDZdvUZAqTKxa2C9uQSOGMZW/JirQ9WEIldtFcotPgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AY1zmjQbnBV/s967wdGO8CrJ+bZ/8yqQ6dNNp2xSfA=;
 b=aDpeeg63vNmIJ62/eecTiCByMC+U2Bdgh+/1CUUmMWoHyaQzP42oigzLUC9oqSBTurqTROuxTARcYnk4dGY9Uohga787jtQx2DNHmLCAZ0fN3v98Ct3J9eY9NMPxfjpTWQx/F81qS8L9DK9wsd4SrfbDUnYtRrhpo78/0jpAtjg=
Received: from PH0PR07CA0031.namprd07.prod.outlook.com (2603:10b6:510:e::6) by
 PH7PR10MB6459.namprd10.prod.outlook.com (2603:10b6:510:1ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 06:10:08 +0000
Received: from BY1PEPF000264B1.namprd02.prod.outlook.com
 (2603:10b6:510:e:cafe::74) by PH0PR07CA0031.outlook.office365.com
 (2603:10b6:510:e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 06:10:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF000264B1.mail.protection.outlook.com (10.167.242.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 06:10:06 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 01:09:32 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 01:09:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 13 Oct 2026 01:09:32 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69D69RZn2947974;
	Tue, 13 Oct 2026 01:09:28 -0500
Message-ID: <82b4e933-f36e-4eb8-b087-85002b85c0b5@ti.com>
Date: Tue, 13 Oct 2026 11:39:26 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
CC: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-3-y-abhilashchandra@ti.com>
 <aswXWWBwo22nQ4RR@monoceros>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <aswXWWBwo22nQ4RR@monoceros>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B1:EE_|PH7PR10MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 61577ad9-5710-4df2-9793-08df28f0a0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SpAYSYxt/yIuuDJ3LtqiBNUzsNx/badqxJr4FyDYsWga987PGlPT1HPW1lk2PnkUQxdMiErROyU0S2x2ER1Ry2glwx+vHnjR13bK3dIN/CS6t6Cowlv3c3K6ECh4SplIB+XN+/v9nl8IyTyamUDshgIoojYDI2I0ZozHREaeOaYKYGvpY9s36itGM6NNV65dDiTtrbMSLKb2VnRUuWpHXK7pVyHT2LNkVhu2u108LUbImE4LffAcD5UX3fOB4/uRQYXYhf9T1EK6vYnIWlzzj+m69yBCtGs0+3b1S44shKpI8YtzKI4B+jRUg3RziJO3AYCvdtfdHktp+4hU8i3U0pma0QO6vmXn61AFzkmX01jkVFD+C7lm3QgwK+gGn4QHGhmxzO6zwv7SP7MJm2wKUvD0cvxELbuhAec4BsnsmkoN5580iGUy1x7FiBf3MN+G1FAnmXrF94CBCJcTnBfXesnZdRUaw1aPz6fmqhBmDAZRxpRHWaHTgYFzNBVIondZUTj/dVqOgMCdsHIMrPKWjQvzvGP8tRbvaTcho+x0CxyuaFTyn0O0NWpjngEJczOy6pEckSO8mfr7VLtu8FXep8CbrJFUkyvUWvGNFXQxobsLQiu+ICdfHt+AUJbAuivaA/f52UJxFu4JthaDVHhLrqyBcvuKlo2DumX9OXs7jGgtA7wbkU5laugLoHQOvrQtXg6hPyx1JnCl8gTyg4tXaA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oIxVRYuVnp7oas6qQH5pag4IIPAgOZJ1uEMTP4OOoJpg9Zj8ARBBE/SE4v8vjjx0mCYyUfk1GscoeawDhRZQYq++l8fORgAkRux7MnuoNIBiyVStul4xVEXYl+dvB6dl2nXQQD9PUQzBnC3LJFLvXxbJuy2uSfxLULvBAea3K74Bt16D4LQJ/x7R+n6fBJHjcjvX2iw61h10lMj6eTI0VogaLr7Si1i7MZe5ya+yFcJq97L4iSjjRnAcTY0gu6Lf6oJWP94FEar/QU8406ARPB0rbwM3PIchj5ul5tOuq6zZ6HEWKAfseIYlefm/K3Pb1n+LnzbaapuXWTWPHe+ZXwA7D/1eUoro92E29mfHv7lH6VbFnJcPYfiy16BmRu+Mq9ryKedT9lVTRj5vXdhLTj4ve5Y6rJX2F6zcXS1TXXxy329zeupDQl2pa1XEa/7g
X-Exchange-RoutingPolicyChecked:
	oI6xcRdgn+FiceTHDF2kHmInpy9oJf3lFXB+tp4S4qSc5B+WxEG/D2NJkvs2OS49duY6elmPEzBa7nmBVVY61vITUxIwVx3YJ9P+Fo+UePKEj2e7yAe/+LkjKnoLWEn8OtmHFyJvjcSYgpcUFSvAvuCETkCoWnr9vLNsGBRbmiQlhJYjBu1NtmtV6w1l5sZXowp3qIY6vkavJ7wyhY1bxrEcl8X0zIJSmiHGbF4Uwyi1PJPBJ+bpwXx6SOwfkz1DHq1Xi1NGB5UjXvws4NDypEOZAvnZ4+ZVuts1eI2gKlIdq4ZeV3qNdCApfdqImqnxBHxCNyrYXdIvzwVWJLpvWA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:10:06.6458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61577ad9-5710-4df2-9793-08df28f0a0f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6459
X-Proofpoint-ORIG-GUID: uuvYh_3lENSIuZb7ZdICGNsg-MLK5-U6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyNCBTYWx0ZWRfX/C7zq/xfSXKS
 J9BaFAyOX430lSeoDed76Sq/qOmyGmiMzHixDKmbU2iaRse9VCAe6qRNjS+Nh+FPmT8uL7/KL7R
 dOwl21bOnFJLCgF9yLgG43yAXNgUAOc=
X-Authority-Analysis: v=2.4 cv=NpxE4MdJ c=1 sm=1 tr=0 ts=6acdcb42 cx=c_pps
 a=fQjKmEXVym7+EbnoMZdWAQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=lBE2LWWzgZyXkuzl8EcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uuvYh_3lENSIuZb7ZdICGNsg-MLK5-U6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyNCBTYWx0ZWRfX6WqRzKCfsuRN
 FCfzkf7uHGftvsBn+eXV6jTxxMaGtcjjA7UZgoKHpbF0ig2R87+gfeUUBVr5Zc8Ivx+TVy9e2Hu
 oAyKnQbT8o8IX84dxolpOINSyb5Yunwbb0gi0V97GOt2fQwnyecTcVNugOmw3gjgZGCrsjf50x9
 AdhsUaJiM2fhrJhd+IGvY2hHSRiLBlst5T/w+Vqz4paMLDpCd43qEKBsHsZLcXOu0P41b6QK5EP
 DtrNzYLLv9qszNY7vPSmeTIefATb/T5c/pKeJ2/1kF3L/Phm1+o1TtFPMq5FtRIesHMPQRk2ht7
 t7Zd1Kbtvz+zhqHPLxZxtkHQQNjGCeFlqfNCrDLuhS28PVVZWwykoJCiveMRUbNZRalhEcVjKWi
 jlCt561Xc88h0aqILU8hBB1szgtkrKIdPuiNEW//hzM1Holm4JiyV1EpsQFUocsmBqWws/2Z2+H
 XOebxrLu6zNlOXPeOkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130024

Hi Uwe,

On 12/10/26 04:41, Uwe Kleine-König wrote:
> On Wed, Sep 30, 2026 at 02:50:19PM +0530, Yemike Abhilash Chandra wrote:
>> +#include <linux/mod_devicetable.h>
> 
> Please don't add new users of this header. You can rely on
> <linux/platform_device.h> to provide of_device_id.
> 

Thanks for the review. Sure, will drop that.

Thanks and regards,
Yemike Abhilash Chandra

> Best regards
> Uwe

