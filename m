Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5FD35E1A8;
	Fri, 16 Oct 2026 04:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126254; cv=fail; b=Ijewbj8YNBTRBHQQptB5z9P7lFUuQ9AoaAuYWEaxhfin5/ZfdK/XTEvtGLw+D5AiFBzIIhS389MEIqfSdU/xvxEOtRsnBcNrZ3UV9H0yF8u+OiV9fiCVFjDC68+glkcr+W3uDfTcRLBl3b3UbjhmxUFp00kwmYCSPVEeXMM9+PM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126254; c=relaxed/simple;
	bh=OxrTPPL1/m6R9c+DV71pb5qC5k+X4j1TUiE/l1fmsFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q+Csi5lvfMrvh7H2ey2Nm4ZOn3ina5Z7dbVXTrwtfUh/v37nPO46YK6Fd8Y4vQXZHN2QO8uXl4ldLG0pAZAyrMPdCltji0sgBY4rJX+FypMRbYgcONzf8ciEUMYcx8PWlsubEtngO0uASVcmmS7nva0eraeCOFgoW7L7aiYjXfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=d28HpL0U; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=RLwBeQ+2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="d28HpL0U";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="RLwBeQ+2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69G2foDg2062768;
	Thu, 15 Oct 2026 23:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ceGxR6CT111p0jkwl3pSCB5oq4VLvn5sA8S26jhIq
	ik=; b=d28HpL0UyxS2xxAFErP6bNeJyeqN2RfwukVIluZZVzeLMnJPmt8LM7RMn
	S1E7BUOFL6J8zsljc5rrdPCntmdznRNSSIYDPMD5H1wyHZ95kWspEp1GkxRwLddk
	CfmLEQiRuqs+hhgS6xUJQ0tE1eMKjkuw5q+C/UV+LbE3/rkHC7QgIjduxoYxyhlV
	YL0iDWLk31164ipA45CdzvrMBiw1H6DCh4/QPx6yx/Gv9Z9hFr8y1NbiHqlKhxnw
	5/jqJBuscXzEZLfCZ1MKNSR9FPtoQAxYSNPfRtmpTG9tGddXwEFjtsjGonrcD2sh
	BCTd7XHvtdtIZ5XWyjtCbUTheqPcg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hauwke4dy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 23:50:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YImIDtXBarHORE6uAwbpiRtC5ojpzwEkhb3474y9fEkQBoESSGdSdPnH5YBrdZ7T+EakDQdJU0zWqr7dP81N3ieaB60Le0x0VnjqbpQGKEQcdraTfrSZbiSbfGgookt02/lJefv9yiffFWU+xca2QGoN8gcAsnI6l6ZGxnzCWUzzX7xSxe7p8wViUFiWOSl797dymUVCnnRqQJE8RNZ5CuYMs9T6XEMkclMQAbnq1GpMlqRqnkYNyUlVIM9s34/D+JOPWxziOxJzPkyJuFt3ENlvKSCxdPRMmBN0reWVRwey5wkqDY+yQZEyBGQpTUfsl5rsaoPOxY3eqf3DVG5n4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceGxR6CT111p0jkwl3pSCB5oq4VLvn5sA8S26jhIqik=;
 b=X5DUH9wMPBVzlsQcFGhCNVVSwNQq2jENgXLyFX9Y8869DZ5Rjn/iDruwFPq/bzezZ0DFP1E4KSEnjfzT55zBwx4Yzm+MISUZOaaT3sc4S7yGP3gvDmBQfjhC8rfwBk/opFuWIoTe9SYoGezsSOkWTDxe/l9pTYE57IDEiggePOuoZm3ybe1IRUbw5yS/w1pGQtSBZl3T/2qBJ3RaQ6LlPINvsWr7+rWX2xs7KGphSsB3wxYA3qCHalkrVa3TxTKCPYbBmzKmDt6L4M+Tjvf65lsNaY9HMxhwUiVqDMKeCGS5edzTAQzrFrAJgDeywMOvaBsobjl9zX1Aeyi860ZeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceGxR6CT111p0jkwl3pSCB5oq4VLvn5sA8S26jhIqik=;
 b=RLwBeQ+2QUvYnjwXhjUvZoQDY8nwjU1AAdTdENCOBLIsCMbonFYLSHKLYE6nNXAGvqV7BGTiFrmQ1cMaAnx0yMl4RVibhoeMLG0RkAt+l7rQTynitiU5hXntxsW1ywE5iAz4KA5YQj93AxOW/l9YUowkz/ppeJurlKVJ8loO5K4=
Received: from BN0PR04CA0055.namprd04.prod.outlook.com (2603:10b6:408:e8::30)
 by CO1PR10MB4609.namprd10.prod.outlook.com (2603:10b6:303:91::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Fri, 16 Oct
 2026 04:50:48 +0000
Received: from BN3PEPF00022BD6.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::a5) by BN0PR04CA0055.outlook.office365.com
 (2603:10b6:408:e8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 04:50:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BD6.mail.protection.outlook.com (10.167.248.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 04:50:47 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:50:35 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:50:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 23:50:35 -0500
Received: from [10.24.51.24] (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69G4oVxO620505;
	Thu, 15 Oct 2026 23:50:32 -0500
Message-ID: <cc3b5bcf-8bb5-4c66-ab88-2e8589a0708a@ti.com>
Date: Fri, 16 Oct 2026 10:20:31 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: davinci: Add level support via extended
 registers
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
 <20260923-upstream-tda54-gpio-v1-2-d1a0a199c836@ti.com>
 <CAMRc=MdJZgut-46b20n7o51_MKqLk4uHsyRzs+QYoj9++5ydoA@mail.gmail.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <CAMRc=MdJZgut-46b20n7o51_MKqLk4uHsyRzs+QYoj9++5ydoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD6:EE_|CO1PR10MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: b05260ff-3b71-451d-edef-08df2b410b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|6133799003|18002099003|10067099003|22082099003|13003099007|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lJDJthElfAbaPGl3kp0+neO994vCIdZGVnNWhfTNhJole+u/BRMbx41frZUpvU00/qStEwie7s8gBjWYR4uU4hf29oNab/AMv+nfN49ZLDO/4Reeeas010l4dIFWT3wQILmgcuk5Zw38Fu44Cynj0WQhGXwp/AngYkvxFIGo63I3laZOpJ4XxUSjE3fNL1OJG2OWfS9zVWKP8/T/SdLWP/WslodIY3JtgqyGRwvjdYHrITy1fedWpoE7c57jJjuNT8NXGVBqxXmLDBYbbdtv8yJxkK1xVQDUe7zc0hoj4yezXYbx6QSOaLKC8ZsrE1yNsGmLS7hsPWEdCBXeKgnOQmL5rPg74gyxr8UDTvn11s+g7m06pLaVKniPez9MZzhnjJbC9kqnwHvElJDRjb1od8Y8+EFHO6rL7nwdXiB4nR30Jfv7j9YLPQVud1TlkN8zoc3y9E65W8WydyGSOxp1uyNhWpavp5kU2E2pdOgC0c9nufT7LsvTjKrKIbprn53PQyR9bAUzoveHYZW7fm3IOEjm75XtL8YVY/vFhc3wGJmb3+q0ZXsmCL4jZO4/NT0g5xrTaRXId4J5bWQTzo9cF8gILkzEdXwyGYNeoTwdFTjY1pz4GZYp3FCBAr2J0af94dLsuKAFVx+qLaJQ293fz5e66QJj3K4LEdXx5PqSCpk=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(22082099003)(13003099007)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ksynH86fm8cVPipq0hu2OBA45Jo6bgOXWowhTzac0+mPTrzvgxaheRsh5jt2FjgZ0nj6PeAbsa55rm31WMh/s6yK8Yf/PiqxoNOg1Rl2NadcBDDLckhHaAP5cwrk+YL9dZgBgEKea0JZmTJNlKzLaZI2GRVNZeHq4uGN8u8DDt1BYtGxQSknGqSKSQw6ofZK+eLXFdDbEdiPCA/J7YWQcJTVvpWFWVcdqcJ8aooEuAKaauhpk6vgD4rPnQ26zViryOmbo3UFO/IOV71e5r1RwAbPTZSRi+qOtmS+0r+xMEpYMzddFYLdRWTWR+nQKmsZRLXQ5yO3giZ+s8Vskws23mJY2sZEYfLZlqrbYSKp/7xUAmYzPUWLjk0++qypT54NQw0Vek9Qc2C/rA3oFNA/vWZ1Bs7HHwimeYesQVbjMXDmT3cH7ubkjYVxqLa6ofAS
X-Exchange-RoutingPolicyChecked:
	qIzhpLjJfRyHJbS5kBMjx4ZBQX9sxCNP65NUqPzZPuHXmzVWF5WuDw2Hn9aqZ501X/FNtq99uLJhMgnbc1mQ4dGxCP5Bw4+Q7x6k38MOS9LbxZjmRbmnIqA5ikbi/ZvOMpeZEl9yon1McKMbF/HaMsgV5cqhzAdxDEBkqqq36YGIPVaFjST8T868XPnHbYsLAxzwiswGXq+YPLElrt9o1nKIDFcdsV8YsZ1hvZKDdWUoadpckZta8em2r7yQJ+iOxdoPc2Op1wroPG5aRgnU3FX0v/XpZvGRplKH/eJgbLElzDq8xN8ZB5HQRNlsvSkmIhJtzXZglr9E53GNIJhuIQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 04:50:47.3919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b05260ff-3b71-451d-edef-08df2b410b75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4609
X-Proofpoint-GUID: cI8mUAQ4fEEbWSwIMN9yH7x_FJwa5GRN
X-Proofpoint-ORIG-GUID: cI8mUAQ4fEEbWSwIMN9yH7x_FJwa5GRN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX3P1BtpuXZVWC
 Pk4irm5ARbaGqTaA8N1tD2dKo5mZ14UAzyTGeDFrRdg0Ok/VFEUB43mxPg/fTrZcD1+j6ch3HkZ
 3xgJG8Rw468IMzpP+Yb8H6Uh+/DM54w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfXxVecZQshzWaS
 gSk5UVUWpyNXr7nyTx+gbIjKA2FPlzEu+ZJ7EjSkaAV5ZUIzU71setrDS5KaCQax/6Pp9SG5O68
 Jv5RPgPYqzQFOPcqdTyRiwoQ68OJcsaZEsjP2iQN+aIZ7gsiPOgi1Tr3WXefix+ZBd1Bq7Qs90x
 6DZiH+ANn5r+Sjv9R1Wa04PWQUy21L/j2PVGNTLUGO2EZsWSj09g6jml8fRtJq28q1PRyzxLcCY
 c7hhzC1tpj+f1SJfovwtFEF8A1F+rocQ8PREUF9Bz6cpphWBoPrGWku/LIU1splICU5FrD50RSb
 0rOcCXZnT/hEsS7VaWHDTskblpDIe+zOM3KHY9NJ85IvmGSb5KfpWNQ4sGVcWh8pT8vJz4bifFu
 wHqLZJjEjBVdEDtAoTWEfnuXMthKGgp1pwhDvDqS4iUCbe0bJ4EuUmAGFlms9WI3MlD42vP1tHh
 xPly6MsrMQ1mz2HAXNA==
X-Authority-Analysis: v=2.4 cv=DOsacCNb c=1 sm=1 tr=0 ts=6ad1ad2a cx=c_pps
 a=PJn3dW4q50A9PoMJtOr6Ng==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=9zk59SSz3NMohPRiXr8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018



On 28/09/26 18:17, Bartosz Golaszewski wrote:
> On Wed, Sep 23, 2026 at 2:58 PM Aniket Limaye <a-limaye@ti.com> wrote:
>>
>> Add support for level-triggered interrupts (IRQ_TYPE_LEVEL_HIGH and
>> IRQ_TYPE_LEVEL_LOW) for TDA54 GPIO controller via extended register sets.
>>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>>   drivers/gpio/gpio-davinci.c | 103 +++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 97 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index cccbaea1dec2..e5a3abe6b9d3 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -39,12 +39,20 @@ struct davinci_gpio_regs {
>>          u32     intstat;
>>   };
>>
>> +struct davinci_gpio_regs_ext {
>> +       u32     set_high;
>> +       u32     clr_high;
>> +       u32     set_low;
>> +       u32     clr_low;
>> +};
>> +
>>   typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
>>
>>   #define BINTEN 0x8 /* GPIO Interrupt Per-Bank Enable Register */
>>
>>   static void __iomem *gpio_base;
>>   static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
>> +static unsigned int offset_array_ext[5] = {0xd8, 0xe8, 0xf8, 0x108, 0x118};
>>
>>   struct davinci_gpio_irq_data {
>>          void __iomem                    *regs;
>> @@ -58,9 +66,11 @@ struct davinci_gpio_controller {
>>          /* Serialize access to GPIO registers */
>>          spinlock_t              lock;
>>          void __iomem            *regs[MAX_REGS_BANKS];
>> +       void __iomem            *regs_ext[MAX_REGS_BANKS];
>>          int                     gpio_unbanked;
>>          int                     irqs[MAX_INT_PER_BANK];
>>          struct davinci_gpio_regs context[MAX_REGS_BANKS];
>> +       struct davinci_gpio_regs_ext    context_ext[MAX_REGS_BANKS];
>>          u32                     binten_context;
>>   };
>>
>> @@ -168,6 +178,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>>          unsigned int ngpio, nbank, nirq, gpio_unbanked;
>>          struct davinci_gpio_controller *chips;
>>          struct device *dev = &pdev->dev;
>> +       bool ext_reg = false;
>>
>>          /*
>>           * The gpio banks conceptually expose a segmented bitmap,
>> @@ -190,6 +201,9 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>>          if (ret)
>>                  return dev_err_probe(dev, ret, "Failed to get the unbanked GPIOs property\n");
>>
>> +       if (device_is_compatible(dev, "ti,tda54-gpio"))
>> +               ext_reg = true;
>> +
> 
> Don't do it this way please. Instead: split this patch into three:
> 
> 1. Add a new match data struct and move the get_irqchip() callback
> into it instead of passing it directly via the of_device_id field.
> 2. Add support for level interrupts and extend the match data struct
> with the ext_reg flag.
> 3. Add the new compatible with its dedicated match data entry.
> 
> Bart

Thanks for your feedback,

Sent v2 here:
https://lore.kernel.org/all/20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com/

Regards,
Aniket

