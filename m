Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560934A2058;
	Wed, 23 Sep 2026 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168311; cv=fail; b=MjCQ3AvokfdfDSEOCVnuK6oepMEoEw9zfN3vMYKwHVjneiVqjT5tGni3uzZLhavLQWs0mW1kHw32J5GGiRQ5E/ZCIFw3MYogJa6xXsaDef1IYtiivceG5edCB2Nes5e6BQu7cvVpHR15tIRSn8ZLyu24Ac5zlrhvO1fzhpZTBng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168311; c=relaxed/simple;
	bh=6heOfDLgqIjLJDq8+E4Uz/f7y3eG0g0hkYkekCQsWvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FjxPAszmjzV5acuws1RfY7gUL/rfyMnsJsCDw21JpEbEGVzATZyQZilCZn3V+aSXtS6C8+jfL1JFd4ww3dDz8M29QXGxhvL0I10ZQY64VwpsKtcZ+V44xhwlzOWoysc+bybL5d1LFrQiAbc/gGlSWN2+5I1g2jIlMFupqYUG9oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IYLD9zRa; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d6liRr2m; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IYLD9zRa";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d6liRr2m"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JCKD775598;
	Wed, 23 Sep 2026 07:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/2E9f5l6hGhiKe47exbJckB9p5QQB9Y8Mhh/QQeWn
	r0=; b=IYLD9zRaFHwgeRISUXZCk4mcOfYNJ2s9igSElO+lLVY24Q59iDwSJSu5n
	UkZ2KrN+Sx+FVcuKli0Pgx99kFzHwEmDyXQ46TahwnymlT9eSMpX8XbSO7t59zLb
	18+0nKanPgWmD+IiJm9+tevGDQ4IOdAbfaLUgI2SiiOHe6abYU296chJXuCz5sVd
	mHPXhX+Xaf4Xs1+76g5aR1VONmcwUJLy+vuMQA938HOB+/FpUNTm27RvJN2rgAbU
	wi6T8vBuEFx1jVOfw69Gd/0vhu5TzYAQy9UeL1ibbIe6Q6dAKleQpEdmAhSAHPPp
	CCAGuo3SQRRBhPhwE7n8rK5NPsKyA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycv3jq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 07:58:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esEQ1R62dGYPFgQpbj9AzQaJKNNYyM6oRpSU2icf1l4+7Yj/SIPfDUz9tLAfnsq1LEAtoZ60AL2+nAVJB/JNBX7kFW9BBajo131UBdzyJNUS2MAu04IyDD2V5Zo5VVZtjSoYMZSU8gCsAuw7fX/TskEc24Qq1W8e4Ehk4b2W8bukr5avL5ZQvqpmQGnIA/DhNQVJTm+H2YCGZXZHeo3m3GSTLipNP4MqN4T7zF0crKYx8Vpe5FkCJaLDpflnBoQbzv56+xisGCAkSXZZbYA8ji/CIWYU4D2+wPA11+vY+fF0GIWxiuOkGWe+cSJ6ir/yW/8jwYXuc/A3+TvXg4jBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2E9f5l6hGhiKe47exbJckB9p5QQB9Y8Mhh/QQeWnr0=;
 b=xZf/JgUPvdZnuTXFDWH4XZVJNyOd/HH5beYIFhJmDyXsf4a4RnS7FlVNvczw20o2gPwgBEE8Ce33NBQ2ce1UQZkoG+6I6U3AXzrE3SbwOBb+ZkOuHNM/+Qj4CSaJClb5G8BZDb0TxZWlFixHzGOZtZizfNR/DIYC77JkKptMYH54vPuL9eE17cpU11uOp4CSAk8FLLxPy+OCOyqSkkuS5IOAFp6jqSXPrBb+4Mv0K/UPMOGTbRhCjOU5jgeJV7ZsVptu7Cb36G+g/wPj3LGo9EhQyqGN762BZy9DNjIxaD0uDarDDhGRXxBAbhutiDYzZperiQ/Vdlb2A7Im+PSWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2E9f5l6hGhiKe47exbJckB9p5QQB9Y8Mhh/QQeWnr0=;
 b=d6liRr2mEkNZd7s9xig3Dgf9YOlJegZ+2ESVTX5v2mFAqlx9eCyKV99BUQ+gkBRDN7vBwkDwu8JYmOFDGvfDHTqJlR/qiJM5vei2Ehr9ZugakjSZi+GnacUSwwLd6cVCQwBpgIFOSb1IcU0QXUEd6l87c1cIU3+S9FRRWuufzF0=
Received: from MW4PR03CA0262.namprd03.prod.outlook.com (2603:10b6:303:b4::27)
 by SADPR10MB455763.namprd10.prod.outlook.com (2603:10b6:802:103::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 12:57:33 +0000
Received: from MW1PEPF0001615D.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::ac) by MW4PR03CA0262.outlook.office365.com
 (2603:10b6:303:b4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 23
 Sep 2026 12:57:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF0001615D.mail.protection.outlook.com (10.167.249.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Wed, 23 Sep 2026 12:57:32 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 07:57:12 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 07:57:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 07:57:12 -0500
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NCv0Uj2948874;
	Wed, 23 Sep 2026 07:57:09 -0500
From: Aniket Limaye <a-limaye@ti.com>
Date: Wed, 23 Sep 2026 18:26:45 +0530
Subject: [PATCH 2/2] gpio: davinci: Add level support via extended
 registers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-upstream-tda54-gpio-v1-2-d1a0a199c836@ti.com>
References: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com>
In-Reply-To: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        "Bartosz
 Golaszewski" <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Aniket Limaye <a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615D:EE_|SADPR10MB455763:EE_
X-MS-Office365-Filtering-Correlation-Id: f23ce278-11a6-428e-c9ed-08df19723b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ht7cPUpiWq5YeVp8/VPE1V96EmaP9DuhRVseE9VWvxBHWbgjeBRuLE2ZQaJBiowqHyPlqm9X+qc909N6ETUHjGTuyFwF6cf6hhSRewq6EpDR8FV6Rbadk4U05PmZBOQUd6qAcbylIccaILjJUvZRnJNAJzmChLd2hSm31wd42UY8JYDs5eLKDyROTdY0yUalE1AcTMpU9hSDolaqyAFfQKSEZU73wLxlDwZ/vu2wsspYhyGOEwT7buQMoI/I2Tumdmjk/oFnTrF5Qjfn2tWVVwbjmgjpDCuy/dyVfEfPuXm9CEi1zqM2fyIYRSI6GU3TzQsfXhjKFmD5DQVkGmo/oPj6K/9YUJ07V18sPgxRfHKzDlZwDz5Sgqr6EfyduuSODbStO/GLm2PvMRWCPMCUV/f1y+jsFuS9ekV8GMCz81U8zlwUd4EzCmnP6flQ0ra2lRM/Rruv7yFvniluCOUnmAGOx8rQDvzh6SDNVE7O8oeg9qYFK+J9Mn5ZU+G3nr6jmHp5RjN96Ye/PSfNs/gW+3KsEOnf5lEXs+26mBOsOIkLIM0YhxMIb67ujdmxwbbhEDki8HqBAJzuDrTECRUFitVG6Yp6NCcdGp1CDI2oItOeugf92I390AAoOS+li+l3DVPPya657RmevgwLge7eoIWWQXOZQ286If9hf2aVdDmFIrLb3oV1TF1NEwj2WY9NM7vXt9iwBrjE9EngqOwEFQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4GOXuMqJkPSLuAtMtqG1EsgOrBSJaBoLDfVNv+6biPnn2mNhF+zJMiPe9VGhT/TrxBLxI2eVOG5tZN+8pSKitEx3QcGWx2+k9+YJNqNBlGLHEfiF2qGM8im+YBS4TVif4nqprNpXWtgq66WikKMZNSkWyXNQLa0a0Oes11nQ7cK8S0lEA3I15/aJC5JnpRzvgB0Aym1npUP9bYR1O+b6vEi+OKUETAkkSyqWukMiaKBjuru+g0B3YrtFb6kpV3ReCS76P7w7/tF3PK/VaReBBi408u0kKRJyv/zwF2QTotIPJRtwdNwnACFWfuGS6oZxz/THnqITeV9qiFYNzcuh+ud0U3Uz6KF5rjOdygm/VzvoiIFXHKrYQeM0fm2WvF8KxmPw9B2vRe4d7zemY40ShjRdLh0Xed3DALfbGmr3pVmmHxfh8lMdJUB8bVgpGZwb
X-Exchange-RoutingPolicyChecked:
	kQz+fvuAwS/v5fiE6pfml2ORFVplbdbGdFPTYgGKAPfU8ed/UrpQNC7tQQ9jHcKgO6W8kK8AA3EkMO5RKvi/bi6VmRLq7jhjpWDpnpVTzCZJYzzSJWcDsZdhmC0+UjPYsD0kTdMs6KKNYolyQLvKQo7E4eNr/EaoJqASoPRhyH0/vmQkOBdNDXprktvpxiGkTnxzStcWg9tK5EI3pEP4vk+p9EAJe73BGq/zMP9IYzbPHTzHyOWApzvZNIRiwGTycFvDMzhnBDMW8RAs2QYd5j+TbuKMl0PDnUhFhYZVzRJRqimTKw00FcNRXviHtqGHPT9CgD9Ehu1obTw4oUiiKw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 12:57:32.3226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f23ce278-11a6-428e-c9ed-08df19723b77
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SADPR10MB455763
X-Proofpoint-GUID: 5jHa9K3M5yYpunopBiVSFCuH31KAcs5W
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab3ccf2 cx=c_pps
 a=F5APu9G2MQgGAPAZFPwQAQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=wwoLOrtC34tSDUuPpy4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX9GFDhIuJJm55
 tdPdq468uXdkN1h4T+uAVxar31MNdScju1RzP2FquvoK4XcKdu6tyKFIf6wzS3Gr1JHe6jPl5Hp
 qQYAwd/u0uO5rzpfX58n68WImR+myfo2BdKYwT8bk0Rd23KLAHKtYLTAVozonvE2suWMzdtG6Eu
 1qlIsLbj5ApnIvS3jOO3WficqjgsAsLxVqsTcb5n5C4NjLMPeZgFp9bSQtiD7TApDCySh62HDBS
 UwLXlY489nO2WmD/KdSzQaRO4eju9VPy6i+qiroCo30Jp3Bz0TpuFzXRmum0n5QGmGG3cPeqm9N
 hNW02bbehl4aZRf5RHd6f3KBo+nbRZmxhmuNBgF1SomjnU6WKdQMaPTbGRl9O7xoHzVXzypuUVz
 2WMhtfHPTKOsOEmDBnOp4Jkip5wFK71MJXc+HmK5V+a9vaVoxiXQTIGP/a90NcEk0d0gTMSL5ZC
 3AhDdg4Npa2baTbBZPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX8FQ5nk3kBteI
 hbUHoUxeM9KSd3y9wc/vP5yiQiZ18vQoFNehDzhZlLv682yhYCUnxK64eL3UcRh69gB+Nep+Vv8
 of+U8vnLECTDwuiYNICH1haksS8qEmE=
X-Proofpoint-ORIG-GUID: 5jHa9K3M5yYpunopBiVSFCuH31KAcs5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230051

Add support for level-triggered interrupts (IRQ_TYPE_LEVEL_HIGH and
IRQ_TYPE_LEVEL_LOW) for TDA54 GPIO controller via extended register sets.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 drivers/gpio/gpio-davinci.c | 103 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 97 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index cccbaea1dec2..e5a3abe6b9d3 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -39,12 +39,20 @@ struct davinci_gpio_regs {
 	u32	intstat;
 };
 
+struct davinci_gpio_regs_ext {
+	u32	set_high;
+	u32	clr_high;
+	u32	set_low;
+	u32	clr_low;
+};
+
 typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
 
 static void __iomem *gpio_base;
 static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
+static unsigned int offset_array_ext[5] = {0xd8, 0xe8, 0xf8, 0x108, 0x118};
 
 struct davinci_gpio_irq_data {
 	void __iomem			*regs;
@@ -58,9 +66,11 @@ struct davinci_gpio_controller {
 	/* Serialize access to GPIO registers */
 	spinlock_t		lock;
 	void __iomem		*regs[MAX_REGS_BANKS];
+	void __iomem		*regs_ext[MAX_REGS_BANKS];
 	int			gpio_unbanked;
 	int			irqs[MAX_INT_PER_BANK];
 	struct davinci_gpio_regs context[MAX_REGS_BANKS];
+	struct davinci_gpio_regs_ext	context_ext[MAX_REGS_BANKS];
 	u32			binten_context;
 };
 
@@ -168,6 +178,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	unsigned int ngpio, nbank, nirq, gpio_unbanked;
 	struct davinci_gpio_controller *chips;
 	struct device *dev = &pdev->dev;
+	bool ext_reg = false;
 
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
@@ -190,6 +201,9 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get the unbanked GPIOs property\n");
 
+	if (device_is_compatible(dev, "ti,tda54-gpio"))
+		ext_reg = true;
+
 	if (gpio_unbanked)
 		nirq = gpio_unbanked;
 	else
@@ -235,8 +249,11 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->gpio_unbanked = gpio_unbanked;
 
 	nbank = DIV_ROUND_UP(ngpio, 32);
-	for (bank = 0; bank < nbank; bank++)
+	for (bank = 0; bank < nbank; bank++) {
 		chips->regs[bank] = gpio_base + offset_array[bank];
+		if (ext_reg)
+			chips->regs_ext[bank] = gpio_base + offset_array_ext[bank];
+	}
 
 	ret = devm_gpiochip_add_data(dev, &chips->chip, chips);
 	if (ret)
@@ -267,10 +284,15 @@ static void gpio_irq_mask(struct irq_data *d)
 	struct davinci_gpio_controller *chips = irq_data_get_irq_chip_data(d);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	struct davinci_gpio_regs __iomem *g = chips->regs[hwirq / 32];
+	struct davinci_gpio_regs_ext __iomem *g_ext = chips->regs_ext[hwirq / 32];
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 
 	writel_relaxed(mask, &g->clr_falling);
 	writel_relaxed(mask, &g->clr_rising);
+	if (g_ext) {
+		writel_relaxed(mask, &g_ext->clr_high);
+		writel_relaxed(mask, &g_ext->clr_low);
+	}
 
 	gpiochip_disable_irq(&chips->chip, hwirq);
 }
@@ -280,12 +302,14 @@ static void gpio_irq_unmask(struct irq_data *d)
 	struct davinci_gpio_controller *chips = irq_data_get_irq_chip_data(d);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	struct davinci_gpio_regs __iomem *g = chips->regs[hwirq / 32];
+	struct davinci_gpio_regs_ext __iomem *g_ext = chips->regs_ext[hwirq / 32];
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 	unsigned status = irqd_get_trigger_type(d);
+	unsigned int ext_status = g_ext ? (IRQ_TYPE_LEVEL_MASK) : 0;
 
 	gpiochip_enable_irq(&chips->chip, hwirq);
 
-	status &= IRQ_TYPE_EDGE_BOTH;
+	status &= IRQ_TYPE_EDGE_BOTH | ext_status;
 	if (!status)
 		status = IRQ_TYPE_EDGE_BOTH;
 
@@ -293,6 +317,18 @@ static void gpio_irq_unmask(struct irq_data *d)
 		writel_relaxed(mask, &g->set_falling);
 	if (status & IRQ_TYPE_EDGE_RISING)
 		writel_relaxed(mask, &g->set_rising);
+	if (status & IRQ_TYPE_LEVEL_HIGH)
+		writel_relaxed(mask, &g_ext->set_high);
+	if (status & IRQ_TYPE_LEVEL_LOW)
+		writel_relaxed(mask, &g_ext->set_low);
+}
+
+static int gpio_irq_type_ext(struct irq_data *d, unsigned int trigger)
+{
+	if (trigger & ~(IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_MASK))
+		return -EINVAL;
+
+	return 0;
 }
 
 static int gpio_irq_type(struct irq_data *d, unsigned trigger)
@@ -303,6 +339,15 @@ static int gpio_irq_type(struct irq_data *d, unsigned trigger)
 	return 0;
 }
 
+static const struct irq_chip gpio_irqchip_ext = {
+	.name		= "GPIO",
+	.irq_unmask	= gpio_irq_unmask,
+	.irq_mask	= gpio_irq_mask,
+	.irq_set_type	= gpio_irq_type_ext,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static const struct irq_chip gpio_irqchip = {
 	.name		= "GPIO",
 	.irq_unmask	= gpio_irq_unmask,
@@ -387,10 +432,13 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 {
 	struct davinci_gpio_controller *d;
 	struct davinci_gpio_regs __iomem *g;
+	struct davinci_gpio_regs_ext __iomem *g_ext;
 	u32 mask, i;
+	u32 ext_trigger;
 
 	d = (struct davinci_gpio_controller *)irq_data_get_irq_handler_data(data);
 	g = (struct davinci_gpio_regs __iomem *)d->regs[0];
+	g_ext = (struct davinci_gpio_regs_ext __iomem *)d->regs_ext[0];
 	for (i = 0; i < MAX_INT_PER_BANK; i++)
 		if (data->irq == d->irqs[i])
 			break;
@@ -400,13 +448,21 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 
 	mask = __gpio_mask(i);
 
-	if (trigger & ~IRQ_TYPE_EDGE_BOTH)
+	ext_trigger = g_ext ? (IRQ_TYPE_LEVEL_MASK) : 0;
+
+	if (trigger & ~(IRQ_TYPE_EDGE_BOTH | ext_trigger))
 		return -EINVAL;
 
 	writel_relaxed(mask, (trigger & IRQ_TYPE_EDGE_FALLING)
 		     ? &g->set_falling : &g->clr_falling);
 	writel_relaxed(mask, (trigger & IRQ_TYPE_EDGE_RISING)
 		     ? &g->set_rising : &g->clr_rising);
+	if (ext_trigger) {
+		writel_relaxed(mask, (trigger & IRQ_TYPE_LEVEL_HIGH)
+		     ? &g_ext->set_high : &g_ext->clr_high);
+		writel_relaxed(mask, (trigger & IRQ_TYPE_LEVEL_LOW)
+		     ? &g_ext->set_low : &g_ext->clr_low);
+	}
 
 	return 0;
 }
@@ -418,8 +474,12 @@ davinci_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 	struct davinci_gpio_controller *chips =
 				(struct davinci_gpio_controller *)d->host_data;
 
-	irq_set_chip_and_handler_name(irq, &gpio_irqchip, handle_simple_irq,
-				"davinci_gpio");
+	if (chips->regs_ext[0])
+		irq_set_chip_and_handler_name(irq, &gpio_irqchip_ext, handle_simple_irq,
+					      "davinci_gpio");
+	else
+		irq_set_chip_and_handler_name(irq, &gpio_irqchip, handle_simple_irq,
+					      "davinci_gpio");
 	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 	irq_set_chip_data(irq, (__force void *)chips);
 	irq_set_handler_data(irq, (void *)(uintptr_t)__gpio_mask(hw));
@@ -469,6 +529,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
 	struct davinci_gpio_regs __iomem *g;
+	struct davinci_gpio_regs_ext __iomem *g_ext;
 	struct irq_domain	*irq_domain = NULL;
 	struct irq_chip *irq_chip;
 	struct davinci_gpio_irq_data *irqdata;
@@ -495,9 +556,9 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 			dev_err(dev, "Couldn't allocate IRQ numbers\n");
 			return irq;
 		}
-
 		irq_domain = irq_domain_create_legacy(dev_fwnode(dev), ngpio, irq, 0,
 						      &davinci_gpio_irq_ops, chips);
+
 		if (!irq_domain) {
 			dev_err(dev, "Couldn't register an IRQ domain\n");
 			return -ENODEV;
@@ -534,6 +595,11 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		g = chips->regs[0];
 		writel_relaxed(~0, &g->set_falling);
 		writel_relaxed(~0, &g->set_rising);
+		g_ext = chips->regs_ext[0];
+		if (g_ext) {
+			writel_relaxed(~0, &g_ext->set_high);
+			writel_relaxed(~0, &g_ext->set_low);
+		}
 
 		/* set the direct IRQs up to use that irqchip */
 		for (gpio = 0; gpio < chips->gpio_unbanked; gpio++) {
@@ -558,6 +624,12 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		g = chips->regs[bank / 2];
 		writel_relaxed(~0, &g->clr_falling);
 		writel_relaxed(~0, &g->clr_rising);
+		g_ext = chips->regs_ext[bank / 2];
+		if (g_ext) {
+			writel_relaxed(~0, &g_ext->clr_high);
+			writel_relaxed(~0, &g_ext->clr_low);
+		}
+
 
 		/*
 		 * Each chip handles 32 gpios, and each irq bank consists of 16
@@ -597,7 +669,9 @@ static void davinci_gpio_save_context(struct davinci_gpio_controller *chips,
 				      u32 nbank)
 {
 	struct davinci_gpio_regs __iomem *g;
+	struct davinci_gpio_regs_ext __iomem *g_ext;
 	struct davinci_gpio_regs *context;
+	struct davinci_gpio_regs_ext *context_ext;
 	u32 bank;
 	void __iomem *base;
 
@@ -611,6 +685,12 @@ static void davinci_gpio_save_context(struct davinci_gpio_controller *chips,
 		context->set_data = readl_relaxed(&g->set_data);
 		context->set_rising = readl_relaxed(&g->set_rising);
 		context->set_falling = readl_relaxed(&g->set_falling);
+		g_ext = chips->regs_ext[bank];
+		if (g_ext) {
+			context_ext = &chips->context_ext[bank];
+			context_ext->set_high = readl_relaxed(&g_ext->set_high);
+			context_ext->set_low = readl_relaxed(&g_ext->set_low);
+		}
 	}
 
 	/* Clear all interrupt status registers */
@@ -621,7 +701,9 @@ static void davinci_gpio_restore_context(struct davinci_gpio_controller *chips,
 					 u32 nbank)
 {
 	struct davinci_gpio_regs __iomem *g;
+	struct davinci_gpio_regs_ext __iomem *g_ext;
 	struct davinci_gpio_regs *context;
+	struct davinci_gpio_regs_ext *context_ext;
 	u32 bank;
 	void __iomem *base;
 
@@ -641,6 +723,14 @@ static void davinci_gpio_restore_context(struct davinci_gpio_controller *chips,
 			writel_relaxed(context->set_rising, &g->set_rising);
 		if (readl_relaxed(&g->set_falling) != context->set_falling)
 			writel_relaxed(context->set_falling, &g->set_falling);
+		g_ext = chips->regs_ext[bank];
+		if (g_ext) {
+			context_ext = &chips->context_ext[bank];
+			if (readl_relaxed(&g_ext->set_high) != context_ext->set_high)
+				writel_relaxed(context_ext->set_high, &g_ext->set_high);
+			if (readl_relaxed(&g_ext->set_low) != context_ext->set_low)
+				writel_relaxed(context_ext->set_low, &g_ext->set_low);
+		}
 	}
 }
 
@@ -671,6 +761,7 @@ static const struct of_device_id davinci_gpio_ids[] = {
 	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
 	{ .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
 	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
+	{ .compatible = "ti,tda54-gpio", keystone_gpio_get_irq_chip},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, davinci_gpio_ids);

-- 
2.53.0

