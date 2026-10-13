Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078093B71D3;
	Tue, 13 Oct 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884280; cv=fail; b=tbcbRAOPY3wOwhbiEWme2H36fJvcc5BBhHEC+3O4/iFyVn4835RDyAyNhCoXVgbGJUNLKbBRe/k8MWSxNLT1Gqh9L78xwdi3xFcRVuKJBFMdBhoBFVk0bVXtolg/KbhidP+vF+7xK/ekvt+1uxrzTRM6CzKZ+mapPw3L1YdeCzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884280; c=relaxed/simple;
	bh=FkK9ov37JD8wGjioGh3ICbw6lcTZAg/21OQhn9RX1UM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q1wY6BgEs8WcWbqp3nroI2VQ2sxLXamViJzv3J4rKQy2u5N3r5HmArrYj3oqzQhjQdLVr09oAIwrd5CTCRBgUrKpvSIog3VeHT7v8wKNajKTUdwdA+0A/0Px+zeqlpg6nNEPZKg+6A4De9o1704HLeSizJi4BpCeSP0PfnN9jt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kE1LUBtY; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ShxuF9oA; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kE1LUBtY";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ShxuF9oA"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69D7ABZk3045872;
	Tue, 13 Oct 2026 04:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SsCDkxC4BRn6Ckf9J11dqC8WRWkqzw77J9PWQKsyv
	t0=; b=kE1LUBtYYKqzImWgQUHTrK8l0SpnscVhTNXHZFrPDgOZlfvCMeSFZVmIL
	XAVFFBmyxPmcKgeWu76fpVSeFQ2ZtrjKRuKpVjcvboex9Y8QUrSJtmXNJ9NDvpAd
	mXiUR1WS9Peu6xdazkiI42Q/J8MP3QYXoXaXtrHcUqWBN8h5hf5G9NGzJJK6UrPW
	owVT1fR49RFhNuEY09HR0FTc1smmPpoOcsSiGbVj0oZbeQHK6yGQ3ZoufDUrey2I
	i93MHV6y/VNZhCwUuc+Z/ypd2EKWvDzQADf/9NZ+1+IlzmaAnF4Q0hp6hzpV7m7k
	Jyn3lX05iaL8SXWoNB9PEiClGov5A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h99uhaxyx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 04:37:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcVx3NtzXHm2AYhjs77Sc5N8eiNnJ1LDLdYW4m/JgEN+r43FwiY37kOV5BcelvKvfTeXxJiFzROK4MhegRK/VWSb50gN4hmEKyUBERiyTfVvhaAuOu8zkL9bXcOMFXogz10p7Jm/49eZO8Gur1BLX/jqYLF1MlPGJp7AW7CPDzjb4SkhinKXB52t1W0rG5wvdlfLls60TOsG2Cld35SKHJFwCzI7adAydQgte/JhvSk6AFkVZKijih9LQiNE1xsb92G1IEaffshbSYTj1TiRVqArB9NOuKI2LwUVUiJkf9P9gLm2TQz9Pl6Ke6EyXPerBVuEeDaf2Aqzq114QILjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsCDkxC4BRn6Ckf9J11dqC8WRWkqzw77J9PWQKsyvt0=;
 b=bk/1dhv22u8joc2TlR/7bQGC3OQ0hXVvFfLpJdC5hEx+C2pMjwjtKzOIvaHdSpJipdzZfbQPY4ZACLKDSGI6PqjlD8txc7mWroZjadWgFa3YQ9GWuSzYH/F/xK4OD8Dlcb/hzWbpka6p+eZtg6EeUZcmG39nLJdm6zgSvWcPguECSbvCuiGtz428yrkpFxrbP8qUD6CB90JDcH83KyD9L9YJa3a1vBqKxU1KTRIKDsZVnO9lGB3oJC63k7c/dFXqIXqMhYP5SQa4Ho4XusiF4KTiD4/9Eu2qpIumUWsC4qyTNVOJDYa4/VCmPZ+Obv1j0FSCi9sFfz5tWoLruNmg2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsCDkxC4BRn6Ckf9J11dqC8WRWkqzw77J9PWQKsyvt0=;
 b=ShxuF9oA8Vf5/+Ml2W7HWBJb15r7pXsMPo1jBM6CZsyKC5TS6sjrk/JawZLkpzRyAJ3DIza7qS0x6DgaRQEzOSJzVf4o941BWTRHVCJz8yFIBlNMYyBKuDwVlfH0W3BHLRsTc1nqqAXxybobklXO+OQJ0qjTq8iSu1oLs8d0DMk=
Received: from CH5PR02CA0014.namprd02.prod.outlook.com (2603:10b6:610:1ed::18)
 by PH7PR10MB5748.namprd10.prod.outlook.com (2603:10b6:510:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 09:37:43 +0000
Received: from CH2PEPF000166C1.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::94) by CH5PR02CA0014.outlook.office365.com
 (2603:10b6:610:1ed::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 09:37:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF000166C1.mail.protection.outlook.com (10.167.252.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 09:37:41 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 04:37:12 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 04:37:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 13 Oct 2026 04:37:12 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69D9b9wn3265578;
	Tue, 13 Oct 2026 04:37:10 -0500
Message-ID: <8115decc-b340-4bd2-bf64-7f972d5cb75e@ti.com>
Date: Tue, 13 Oct 2026 15:07:09 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
To: <sashiko-reviews@lists.linux.dev>
CC: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>,
        Linus Walleij <linusw@kernel.org>, <alexander.sverdlin@siemens.com>,
        "Kumar,
 Udit" <u-kumar1@ti.com>, <linux-gpio@vger.kernel.org>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-3-y-abhilashchandra@ti.com>
 <20260930094715.7B7F31F000FF@smtp.kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20260930094715.7B7F31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C1:EE_|PH7PR10MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: bf73a0f5-6653-4b4a-8912-08df290da079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|13003099007|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pojI4teoACfAh+oE/cI7OiIi0ifd1z+wEvfBMvV0v0jQ/dm/Fu/Lt67kWc2Zc3zZ7AD8x+rZvrzaf5GeFBR+oi/JUrecOmDvDGEKKrNI5c1p7T4v0LUP+TFLU8DBWkkCLJ0uzL71EzIGUIVtvZA7YKErs5UeOPmi8xcsUhXZsHHVGfdOYjIG6BZFr846nyDGgKrCX3u429MJvf40u9WqUuA/Xfo0BG6mn3wPgdomcwn0/qzKx9d15drBT4JSPYzQy2TeVWL92XRr6KhfQeqsgis+A1soLJQf2WlszBV2hJyMQF3P+c84RAcvzG8jD9K4IltbM0S7B4o1IJctiqRQgD4+D7EKQkQnsDXDUS/b9J4KgJA0v29X/kANK0fe62NHIeUNwzRuN/tm+N/qQ4vsJ1GZ1rMZjogcvZnkWUKDMI9TJVdh7yEa31BdiVbxyJPxA6M8+IxojwWUa1rwIeJybuB7hlzz0bPnF8yNmvgpxb2DRsTbEfSGr+VbWehempMMaHBAtw3pFcqcj3kUHRxZ0qL/lxD0DHs5UsOq8zp6K64ZY1NcXLR9YTqa+q46HXK2U/FC3XqvLVGE13ZLHl7t7xKE4e1sJ71AzJV/dxRDJcJTZ0pTFJRJJjGQOnwy1JOWm6q7gLqa3qVX4Yr12xVgTiRo/HLnLLk75yCukq5WXrw=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(13003099007)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N+MxivYB6BySE8M6xzaA5/XsRAF2vpnCOzgSrm8Fj3SxKu5SYgvd6jlGaY8P84nNkKY4boEE4cqF1FUrfA4PaIDu30lqrahHrdDc2anTqoUZoC/SMkT97vgKRTlVpmvEBrJWOuKsFMybwOCNusoHxsoyk2kfbHeE33PLlYColQCAiWGu+d89CmkgpNL4HTbSckBkWFZchO4HAGc1XWOgsdo/Uk2jKaZ6nJAximsj0UOh88xSlMBe/+IYYNnh6Kskb/qjKzILORyG9kfOp+PAByzpbptZfUuy+tlqJ6KEXqGeO39oQG6jDnBlH6MO2yhVwkzxdvmYklr0rBgPGs6X8cMJ0MoMkNFq/1m0YwpdkMMJBnWFx4thuGOchyvGULQoMqGUxzAmZPvBMo7pn/7fusxVSPP6wtzU7Sv7yccl2doWSs229R2cgTpLUtFM7oIl
X-Exchange-RoutingPolicyChecked:
	ctcqxqzK6d3UEqSRV5Q/5AIEuTdaG3r0oKXJm8JU1ZxyMU9iKRaOINbQIMPXgFAOaqdtzG5MgwJk76cXciFLqLd29hSvZU7LjsEs3U3Y2HgS+XugXSh8lpVJrFE2qgymccstVYBBBHjLovJNeUbM3IMViXGXd41wjasusipOPbcGknhYkFZN9mglkuBNGhaET2bNJA9x9weFqE0kK0xdiOjxmggHX5LTQqpzHvLTgxYwJrBirrVbmvJ1PylSih+8kCSWdIxQTp2YGDDAWIYgZqDsUnB+BhCGSBD56OdQt0MFX+ArxyLktA5IUH+o04PeavWr3BLGOGijrhwIp+XgnQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:37:41.2816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf73a0f5-6653-4b4a-8912-08df290da079
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5748
X-Proofpoint-ORIG-GUID: MNgavHIicuCt606UpbnXMPCAnFo8HtJn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX/cmOijG/kaAa
 WgTb9mStOsalZKPSS6w2l8C94++uJZr7648sNufsUR2mNNFG8/Wr2Pb13AYV24PDrXjBjKrppje
 bGIzVHl7kj08Z56yWAodBxGqTu3G7OM=
X-Authority-Analysis: v=2.4 cv=NpxE4MdJ c=1 sm=1 tr=0 ts=6acdfbed cx=c_pps
 a=yyl0I9/pvHNpizRH36fpSA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=a_U1oVfrAAAA:8 a=sozttTNsAAAA:8
 a=lK5e7eeYuTKZ84K6TDsA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: MNgavHIicuCt606UpbnXMPCAnFo8HtJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX6EES9oH+K81V
 2SJsy5IzfxXycMttZaboR3l+rN0lHxjbJa7DP/lvBrR9K+T11J5QamOA3eH63TBtNNp5oeH2do4
 ejehsDTdiZI20on28sSC/C1ZXOZFTO7IbzfOEyQbjvMaNT6AZ0AXW7tBLklKfOPIi3zts+vZwXN
 JXB+Lpp4k13LdHQYJAgGg/9JhmlM6JprZ1+zl43u25bYwpreAAxdm0atNNQCsPvfAIVeJOXsccX
 1OU+HWCpzwpset7dw9gzzIxxOvrmjVtftA6t8RpuknjkGJTW7va625LD6YWlGeboTOxwW/yKMjU
 dkuwkT8PnkfAAVEx2QW+MaDboEeRBOImV2aYX42f0qT0BipgHmrjyL7hcUk4r02KFEmIZv0dpuP
 0pdj7aq/8Oj1c9rzPNnJjKTyVbU+h3v1hV8ejc1gz97e/rZt0sX5zdRz21FaOt+1D00IbuvGZRo
 KPTW9kuUahicDaJasew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130038

Adding Linus, Alexander and few others.

On 30/09/26 15:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] pinctrl: memory leak of devm allocations in dt_node_to_map
> - [Medium] pinctrl: erroneous removal of preexisting group on error path
> - [Medium] pinctrl: out-of-bounds MMIO access due to unchecked DT properties
> --
> 
> commit e697f1ea4503df3b1dd2739d4e9326a68689dde7
> Author: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> 
> pinctrl: ti: Add TDA54 pin controller driver
> 
> The TDA54 pin controller splits the pad configuration across two registers:
> PADCFGA and PADCFGB. This commit adds support for the pin controller in
> the TI TDA54 SoC, mapping device tree configurations to pinmux and pinconf
> settings.
> 
>> diff --git a/drivers/pinctrl/ti/pinctrl-tda54.c b/drivers/pinctrl/ti/pinctrl-tda54.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/pinctrl/ti/pinctrl-tda54.c
> [ ... ]
>> +static int tda54_dt_node_to_map(struct pinctrl_dev *pctldev,
>> +				struct device_node *np,
>> +				struct pinctrl_map **maps,
>> +				unsigned int *num_maps)
>> +{
> [ ... ]
>> +	grpname = devm_kasprintf(tp->dev, GFP_KERNEL, "%pOFn", np);
>> +	pins = devm_kcalloc(tp->dev, npins, sizeof(*pins), GFP_KERNEL);
>> +	gdata = devm_kzalloc(tp->dev, sizeof(*gdata), GFP_KERNEL);
>> +	grpnames = devm_kcalloc(tp->dev, 1, sizeof(*grpnames), GFP_KERNEL);
>> +	if (!grpname || !pins || !gdata || !grpnames) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
> [ ... ]
>> +	mutex_lock(&tp->mutex);
>> +
>> +	gsel = pinctrl_generic_add_group(pctldev, grpname, pins, npins, gdata);
>> +	if (gsel < 0) {
>> +		ret = gsel;
>> +		goto unlock;
>> +	}
> 
> [Severity: High]
> Will this leak devm-managed memory if the group already exists?
> 
> If a client device defers probe, or if multiple nodes map the same group,
> pinctrl_generic_add_group() will return the existing group's selector, which
> is a positive integer. Because these buffers are allocated using devm_*
> functions tied to the pinctrl device (tp->dev), they will persist until the
> pinctrl driver itself is unloaded. This causes a cumulative memory leak on
> each probe deferral or repeated group mapping.
> 

I switched to pinctrl_generic_pinmux_dt_node_to_map() in v2 as Linus
suggested, so this code is gone.

The generic helper has the same pattern though: on a repeated mapping
the core returns the existing group/function and the newly allocated
copies are never freed. Alexander's series is fixing the same issue
in pinctrl-single and ti-iodelay [0].

Alexander, since your series is trying to fix these issues in other
drivers, could you also include pinctrl-generic.c? It will likely be
used by most new drivers.

Of course, all of this only if Linus and Conor think this is
a valid usecase and the right direction to fix.

Linus, Conor, any thoughts on this?

>> +
>> +	grpnames[0] = grpname;
>> +	ret = pinmux_generic_add_function(pctldev, grpname, grpnames, 1, NULL);
>> +	if (ret < 0)
>> +		goto remove_group;
> [ ... ]
>> +remove_group:
>> +	pinctrl_generic_remove_group(pctldev, gsel);
> 
> [Severity: Medium]
> Could this inadvertently delete a preexisting group in the error path?
> 
> If pinctrl_generic_add_group() returned an existing selector and then
> pinmux_generic_add_function() fails, the error path jumps to remove_group.
> This unconditionally calls pinctrl_generic_remove_group() on the selector,
> destroying a preexisting group that might be actively used by other client
> devices.
> 

I am not sure this can happen in practice. It needs
pinctrl_generic_add_group() to return an existing selector and
pinmux_generic_add_function() to fail at the same time. If the
function already exists it just returns its selector, so it can only
fail on an allocation failure.

Anyway this code is gone in v2, and the generic helper does not remove
groups in its error path.

> [ ... ]
>> +static unsigned int tda54_padcfga(unsigned int pin)
>> +{
>> +	return TDA54_PADCFGA_BASE + pin * TDA54_PADCFG_STRIDE;
>> +}
> [ ... ]
>> +static int tda54_pinctrl_probe(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	of_property_read_u32(dev->of_node, "ti,proxy-id", &tp->proxy);
>> +	tp->base = base + tp->proxy * TDA54_PROXY_STRIDE;
>> +
>> +	ret = of_property_read_u32(dev->of_node, "ti,npins", &tp->npins);
> 
> [Severity: Medium]
> Can an excessively large ti,proxy-id or ti,npins value from the device tree
> cause out-of-bounds IO memory accesses?
> 
> The proxy offset and npins are read directly from the device tree without
> being verified against the dynamically mapped IO resource size. Since npins
> is used to calculate register offsets like in tda54_padcfga(), an unusually
> large value in a malformed device tree could cause the driver to access
> memory outside the mapped IO region.
> 

ti,npins is the number of pins on the pin controller instance, so it
comes from the hardware description like any other DT property. There
is no real upper bound for it that would hold across instances, so I
would rather not add an arbitrary limit in the driver.

ti,proxy-id is already limited to enum: [0, 1] in the binding, so
dtbs_check will catch a wrong value. I will anyway add a check in the
driver as well in v2.

[0]: 
https://lore.kernel.org/all/20261001085217.1778645-1-alexander.sverdlin@siemens.com/

Thanks and regards,
Yemike Abhilash Chandra

