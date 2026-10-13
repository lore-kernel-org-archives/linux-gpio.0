Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98E2E737D;
	Tue, 13 Oct 2026 06:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871285; cv=fail; b=ZV2H6xjiocpLsmKnalBEODlCcpIQ2NLxMRR21hIXYG4+ZkK7UopB6TLX2XOyqqN8wn7aL4Jpa3HDmlUqjs1PSBPlVs+I7jLlUQR70yrzJ6mNP+ZTNFU4hWHQ0yPmTkrMq5MUAZTfH2UmVXsO6Ggri7m3i13HAhQu2UoCgvuNqWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871285; c=relaxed/simple;
	bh=2ZoYLVzr40yTuCztzd2nFq1UKFaikMzsUBs1WWGehg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LH+dT6rMiol+7Nr0J3tAUgVArKkE7AJ6uqrTNkult2uEqaZ2rude+r0Liemhx1OBbdjO6Ko86ftJpVRKGfTHJWVQPHH1HFmRWoyI06qS2kI30ApoAOE/tIjBXQPrlwIZdstvyF3Aelv6tao1qpCxQ7dQD9zJzkY3jjeFJVe7/Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Dv0+joP/; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=lCctY0xC; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Dv0+joP/";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="lCctY0xC"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D23jFI3249029;
	Tue, 13 Oct 2026 01:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HcFRkbB8F9UxLvPsW60LttK3/xb4xP1Hd/KeORXdp
	4w=; b=Dv0+joP/bIlk7TVRTx9/dS+KS5GLjkSiyzkqgfeqmZZvtT7IGyKvxTDzY
	5tBp4s0Oj4tBRZ5Tmfhv/PvxcHmZFiuWNJtT6XuUS6IYIL7UngT2GsK8fQMsyA7r
	h7wNr/yXWn1dKAfNeaC76XpTYTF11dH6wnDqbWAjuB2PEJMvNu34xU1bVj+8LDGr
	Mljr7J0k+x1Dn+xm0o5mg1w6RMyIfHQjsYb4dDwtieeoOz+duh9Dfp6owwzQIkAY
	kbNcmnfDDjKzTG+flNqn0LT5PQwnUneH3XzxaF0TalThFfxkS2IJPDLECG9hNOwb
	CA/BOc+AtV/9VEe+lXbgLSjvZqGNQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h96tnaxe7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 01:01:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXdjM2LGzZGbxU/z1GVOVNGwWDcbvnBsO7dlG8e8cg0BtT84xVXvf3zAbtwdlGJckADGDvSUa99bg9xus+2wQHgEBIvCl5UhzZ2RuGSAs9efXxO0m9hMH3rW7JjUmtfivx8lqt8eyFYv+t+ZNUgzRyMaYNdfD3nvQ5v33mF8wrs2TeL8dwAk2EDyX3ElGc2qTT/ncfAhAjiumnN8rD+7RpdVX9TMc2z9r73YOXQsYRY3Arcyuz4iXJfSd5IRs5n12rNmywOYZPBzx3akdIuIQD0nlwtSeKZ7iMjwkjxr/uxSplGUOuIyriyN1IQGg8XPnsdCIpDFEgZZAzV0bM6V0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcFRkbB8F9UxLvPsW60LttK3/xb4xP1Hd/KeORXdp4w=;
 b=fTM0ZO3uCDC7+wqLvyuqs7wOz3vArYvFruBzGwKsXdnIsQ2Iop4ESDCPJj22EJO4rg9ca72+F0fl+hYy9wg/uw3EtmE9VFrk5hM3ZZxjgm2mqyOMNc+kSJVYnw86o58w6zmY9yYyxlOCLFzMg6rumrUrum3eAme4zzwTNKzX7edqAbmaOVjV58y4Jm5bQFgvhRgCVtkQzpzScvKHeqpWCR7dcrE0/AwGq2wtohaKKHeIJZzytPoVsX8OQcWWIlRjbTtEHXn2eIi1nXBGspsly8M+Tnr5BeaP1FQfkA8eeWgrWjytdxS+oMh+Fo1sPh/DbTtVGpHGTIxmkoeKvJWkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcFRkbB8F9UxLvPsW60LttK3/xb4xP1Hd/KeORXdp4w=;
 b=lCctY0xCGg7fl5EnzRBRp8nB6HoE4/nRMrxPti95H2TWo8E/r1xrBuZ2Fh+58V+uXViCP3jayL7ePzEW9Nhi7NI8aS1M06XUkQvoOcrbenRXx8tErR2/3yBr6/XwOLmWA/T45bGfBeabfddB+OEXaA38axZfs430/syoGG82EH4=
Received: from CYXPR02CA0062.namprd02.prod.outlook.com (2603:10b6:930:cd::25)
 by CY5PR10MB6011.namprd10.prod.outlook.com (2603:10b6:930:28::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.7; Tue, 13 Oct
 2026 06:01:06 +0000
Received: from CY5PEPF00000E75.namprd02.prod.outlook.com
 (2603:10b6:930:cd:cafe::12) by CYXPR02CA0062.outlook.office365.com
 (2603:10b6:930:cd::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 06:01:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY5PEPF00000E75.mail.protection.outlook.com (10.167.247.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 06:01:04 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 01:00:25 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 01:00:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 13 Oct 2026 01:00:25 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69D60L412934168;
	Tue, 13 Oct 2026 01:00:22 -0500
Message-ID: <7f734f4a-d54a-46b0-947c-eb7cda00fafa@ti.com>
Date: Tue, 13 Oct 2026 11:30:20 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
To: Linus Walleij <linusw@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <brgl@kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-3-y-abhilashchandra@ti.com>
 <CAD++jLm462gGw38acBk1VzwKZq0WE6xfFUKoMsoiVxy4iqfEtg@mail.gmail.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <CAD++jLm462gGw38acBk1VzwKZq0WE6xfFUKoMsoiVxy4iqfEtg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E75:EE_|CY5PR10MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d86fe3-3a20-4512-a309-08df28ef5dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WE1IsWpstLGQ7T6X2Ir46waZKfsIH2+KqJxmaWnGWLbz7i19DLKsmLJE/BrsYuwrAw/6d4g5OQoLITv8quYVji4dyfoiZmHLSv+0wfXo8e/dwMfdASYO3zoY2/C8n/XO58kskKkELkH0pQgW9GOO/ddYigkGD8f+MTq1yvRpw2JhPWZFme2rIStuRsnWsPvPnYB8c2VhTOq4rFqok759CiVTvFIhFrm72yFnkUHE3fhvHj2Mdc9STbeVYVjeOyCrCog3W+6cT8Px4iPzV3jN3kuSFOonPV+zvjgjmsPv5o/rkiylUEsPzxGZhqndlvjoZtcXqUflMHbG2y/fnwlc8AR1mRfdfiIZVC1LwWvTV8cgJ42Ry9rMTD5vus6Iw/CDj0QavMj5ids8RhFfhymbt4cGi04uo4vXSlJjT7tUgzgVRFodb4eR1trHsubw90Ji695+2n/T2Xfl9fXDyJf0IbFNvBeUJBy4jed2sBUsN4N/0DzCgtQ0oVsbMQjvxRvVMWvnzZHGi4pFdu39RVmuY4tueUUa8UAVicSwzq2uPBZrBpnAaR4EXkdn9ZSPeLlkISxobD5YK/EyJMtN5OLyLmXs1M8EjbHXBLCEiYgVEyVc+/hXimFqPE/Uv51g1N/+H+6x09iFCgZKXdFl9iEy+9q+8qq/viQyhQe0Si99y30GE5GrwFR+MKeVxSaeQ1W99zQuoUd/JQ87s+U25CFV6w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+Ps/FNbVF0cH6j/PSNGXYY7MzkwFVx+EEWuaRuy1iRdJUjQTcK1OHZXJXMwu03SoLcjlGNm5Ly14i+40Glc3jndqxywQJ8PDIbPi9xUERVbM8q4hxtD5nOHKIuvHdBAwXfHLkffARO+cF/U860sygUHM3K4Ia4nfW0Vp941i3tlttpWIwvyBuTEhuTdW7w+iaeMHzZjM8Oo0W9iam4VhduAk1ryIGSxPdmXdwrL+MYnXqO9Z0hsQ4v+0uhV59dtFx4kwBDcsN1Kh4Z0qwBngLjrZLyfCeMcQaQ/ZbU1LgAuwtGwP7XDTLPTfchinXHMsiXJaNG3L5HOz+6IlPgeYnB/seW1vvglpGPJR3XjjknyReL3uPL671xk02Z4W2mDs0DRjnuMih1rcyY2EBJihrOHQxQfq9gzNMXNlxIabWHUm5d6kpiqCl7dBTJefnGeR
X-Exchange-RoutingPolicyChecked:
	kGyJ6Lb/TKJD0TY7DQhf8+xAO+mNqLvaD9fxS0mwo1YThZ/It5QxO565RzPflRZsL2LIbwBO+tkkzBB7dHHzx8WKSYgHI4/GeIa8/EaikoIpfWGtCMciKd90dQrrlsUjXYF/dc6eokEdZcc0ocxH3ZrRJuJBZNpWiudGBsXowtlzP9ubJC15YQY7Wmx8bvvZJY4zwXmUJ70JNg0sKI2lJSDYBZCDdNLQbkwOZJX6Zfhi+evlzWSbsVlbCzbU0/tYqZWjR4F/AMbbteWx2VYV+u1nvANzA5E/PdQlFcJxNYc67VhqySTjU1N7JbHWsPNl7K0DqmC/XS1JOhaLqPvmQw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:01:04.8354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d86fe3-3a20-4512-a309-08df28ef5dff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6011
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMyBTYWx0ZWRfXy6MyvGrmxyHq
 +sWRz+P0K6a+f8+WE9Ts1n4Z0ec+qxRP8Y15eUka4yUKG3kGn62baWMD2Eg0PA5cNsYy712pLfw
 FluNyqbq2di1dY9vEP7Q+p3yAOQNp3elSE81mfgaVDNuppcZCk4r+92fP0kHErz3pUNavatNQjp
 0OLH7YVHY98zShaw3AkeddmHjBbav7Esx/wyremNxOJs1lZ7+qUskT2kC6ii/doMVgtuM/yS4DD
 /N/xG7o5KFX5Sm5EiP+dZ9SPm7GDsSWw/hKtuDyfZ4RgugSIeg6AyNPmL/LaHgut04ht5DyQVO2
 hpyJpD3N7HPz7/GDOV+2AqS2F69hzWrhuGGtiOQjvX2RQwvZQUKcQMyCGc2S9xhDyRwmUGwQACU
 SrVLGgOYIKytLgqxXGBFD6OAgj4Z/9SsSeLw3sPwW9lcjM6nAv7eTqR6VfqllMxuoUSvGuJ3Fa0
 e39tK92TX31kPitpjOQ==
X-Proofpoint-GUID: GP5F0QhZ1RdqwChi5L-5NjnNmF-kk--d
X-Authority-Analysis: v=2.4 cv=Gq7XaU1C c=1 sm=1 tr=0 ts=6acdc926 cx=c_pps
 a=ZmKEHIpmlwdLtedhitE7eQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=W13oF0KrnftOtnmiiEwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMyBTYWx0ZWRfX/eS/XfJAZ9kl
 BxrTV4PhvWDQLfmmLJC77ACr2Cx8wqZ4H0EHoq6lGNWNzfEis4xAMYpH8vZHQ+8SJLxboC0g816
 zdOA856EZX6f2xXnokbTIV7eb+krDLA=
X-Proofpoint-ORIG-GUID: GP5F0QhZ1RdqwChi5L-5NjnNmF-kk--d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130023

Hi Linus,

On 02/10/26 02:22, Linus Walleij wrote:
> Hi Yemike,
> 
> thanks for your patch!
> 

Thank you for the review and apologies for the delayed response.

> On Wed, Sep 30, 2026 at 11:21 AM Yemike Abhilash Chandra
> <y-abhilashchandra@ti.com> wrote:
> 
>> The TDA54 pin controller splits the pad configuration across two registers:
>> PADCFGA holds the mux mode and the functional pin configuration, PADCFGB
>> holds the wakeup and retention configuration. The controller also supports
>> two proxy addressing regions and claiming of registers. A register claimed
>> through proxy 1 becomes read-only at proxy 0 and can only be written
>> through proxy 1.
>>
>> Add support for the pin controller in the TI TDA54 SoC.
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> 
> Overall this looks pretty nice.
> 

Thanks !!

> Check the Sashiko reviews, there is always something
> interesting there.
> 

Yes, found a few interesting things there. Will reply to that
separately.

>> +config PINCTRL_TDA54
>> +       tristate "TI TDA54 pinctrl driver"
>> +       depends on OF && (ARCH_K3 || COMPILE_TEST)
>> +       select GENERIC_PINCTRL_GROUPS
>> +       select GENERIC_PINMUX_FUNCTIONS
>> +       select GENERIC_PINCONF
> 
> Just
> 
> select GENERIC_PINCTRL
> 
> and you get all three.
> 

Done. Thanks.

>> +static int tda54_dt_node_to_map(struct pinctrl_dev *pctldev,
>> +                               struct device_node *np,
>> +                               struct pinctrl_map **maps,
>> +                               unsigned int *num_maps)
> 
> What is so unique here that you need your own node to map function?
> 
> Can't you use pinctrl_generic_pinmux_dt_node_to_map()?
> 

I can, thanks for the pointer. I wasn't aware of the generic helper.
Switched to pinctrl_generic_pinmux_dt_node_to_map() and it works fine.

Thanks and regards,
Yemike Abhilash Chandra

> Please consult the code in drivers/pinctrl/pinctrl-generic.c.
> 
> Yours,
> Linus Walleij

