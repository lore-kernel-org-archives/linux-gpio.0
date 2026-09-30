Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758364718E9;
	Wed, 30 Sep 2026 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760084; cv=fail; b=JDGjepsEluQ20s/o8yIv106+zomXl9/ZYRDqnnRbmLdwXz+84yr6mPWd9X6XUreMc6DYEMT/NLpvvgZRQXnKrMnISjhdUag6REXQupVay49PqjtxZ+Bb7rHJPgacgU4sP3GmDlYySjpOoRmXu0NeWRlAdwsMIYgbKDXSVkss+98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760084; c=relaxed/simple;
	bh=Z6uqaT++l8KZZIcuE9cLGt3VsjoBhZycAuK5ClZuLwI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HaJOccY54DukfEZDEoB3ht258bxGWVB0zSDXoYns/x/EriqP4rdZ8M9vtZ0rmg91H3yAhRdQpMbHnCHiMgf/O7WVMTxbWAXyZbtk419TkaVakXa6o2rpVI79qHxZMRb+fq++hVNtmHWcWmPtrUpfs1ROLsZovOA3Z4E9VJsSQE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OMk0iXRq; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=AENhy7e/; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OMk0iXRq";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="AENhy7e/"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68U7bVoA3158896;
	Wed, 30 Sep 2026 04:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gC3P6fP64WVgPnmOWPmtXsHi/ax6oiptBrpMlU6cw
	oY=; b=OMk0iXRqq795QJiHeVNBmzBIvm9X8L7/YR7MOSgsRvP0SkUZ22gX7v2Mk
	+rEzVhN8ZA1jI1B8nYGBPPc5xAvt500V7zCpX9hd5KsVmBCA82rtUKAZfgXw0moG
	ohhXXgdVuE3dsG4dJfgrPMBCxODjJnmLZf/52HMlm6Aa96m0KTXSZBzdTbiC23Gr
	VZvVFSgPB6ji5Lxm2Em0pqL423lQEqaMVL2B6MfXLg4t5VHlShOAT4Hu0qLMTri+
	S9iAVLyUk6aIbQDsdulq3zXit1QVHfP/ZMbYdOP7HFVzOPoSmSh/Lv+9WWkEQY7X
	HGfaKK5Rv4EONT5Dd9pmoeA6IVm1w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h0srrtbnx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 04:21:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQkikEZJNn6Aw6w1dQSwdtt/U+QvcOqT4L4wMdiJ9tnozwDxw+YXME+iPrVe7rjhuJ43S4V+6g6gf66owC8sg4LexWb+VbdG0FCI3HBz/kxyOsUg2ph9pLVlVk61Gs2Q4q7gArzborNXt0hxcHIoMi8PaSz0kVK0KbyUoXJZgCcmBqMKxtucYh/wRyXH0So+18hDw8L4gtbImvr1FMeUmo/EApI+Lh9OkrAooKkBfcMtGcAieYLP1wlC1TU7PIfSrMb3st/fxqCJQrzPnBdZCMtZ4X+gxlKrNR9mVBdo7x2l7TSnP2jx8oLCEYJzOZJjx+qauNqpvBSK8BFdssoYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gC3P6fP64WVgPnmOWPmtXsHi/ax6oiptBrpMlU6cwoY=;
 b=S2sPUPCvQt5Gh0PwKxdRG3gWX2e+IHPTg7+6LhIkCo8BEmy8bvYiAMyBBjBvz3S3Ipt1kPhPKkAGj8M42oo3zbeoQPQQ4ZbyzY3+2nq95O1sgbkM7GA2+LmLNzyGNN7f/9AoHxsJ6UgShyZFshcPSpDNM3FKewWz9IuGHkiWINl9LZ4JYIcZ3z+O7UFFElQBP5tMFFkgFW1WwZDP6A4OWbXOoHW1dKTPjkwfCu2cpBMLtm6Z21mmF4YxCc8ddVujzPKL/lCrspBVKeFPTISI9PwAhiZrmPXsYYT/gYGvkojKOtDgsCtfOZreLAPZ0pFtIAdQ3OVbf/U2eaXK9l5q2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gC3P6fP64WVgPnmOWPmtXsHi/ax6oiptBrpMlU6cwoY=;
 b=AENhy7e/BQUCvLmSkHB7W4E4JogsOfAg5g8r/tUvYN3nPY4wFBcFWt1/rRx+cPP6Jp5yIflamc+AqMML3bWR1OTtJHjmUDLIDXh2Yup5/cxprK2R2BYn34zm5Rgn768ed4twTgzrkskEEecAUEEdXHOFtciahQeUrfCiUhILndg=
Received: from MW4PR04CA0154.namprd04.prod.outlook.com (2603:10b6:303:85::9)
 by SJ5PPF0AE915473.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::789) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 09:21:00 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::51) by MW4PR04CA0154.outlook.office365.com
 (2603:10b6:303:85::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 09:20:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 09:20:59 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 04:20:44 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 04:20:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 04:20:44 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68U9KQL02847827;
	Wed, 30 Sep 2026 04:20:40 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
Date: Wed, 30 Sep 2026 14:50:19 +0530
Message-ID: <20260930092020.1047221-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|SJ5PPF0AE915473:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa5c99d-2dc2-465b-9982-08df1ed42404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	kSp3Q+5+FC88wncw7LBDgRyM8/vbx3GSOEfSb6JVL6PnEPAd/8Vjq5TJNdpS+bm8RXG4Xs41zHoA1KQgkltThmhoTaqMangcQNmQnGDXk8LXoTvpAUdmeh7JpFVLOs3UlzOkxV5FWNxNgpa9bt557pFTLkUSQnKJAGfgaGVD0t2xJ4sJT/pte+fNyOEcWNKXwqODEaO6/HpM2tiGREop1Eg5jUkfquhWiENiWGKgCpe1cLxL/MxbvrYgqB6Sw+FBTvpdx89wjVfCDq7O82bjXWKhDjF11uncNekqT1PT6HuFek6ZT+wHLvVa6Louzpd6J1mihOuGssW2Z0W7fCJIY98is9T5diqF3tr8P6Lw7XCaoyfoNmD8HsQlO43+lMWUwm3BfKGmPcHC9jSZA2s0B7ppqT+G4uAS++7i5IHwwmz5CpONYrApxu29ZcglZYJ6MC0ER2WodAU6jHIGGqbeOVFEAMHlF4OKkWb1zl7Uu9u3PNAerz78KaGrjQS0S8baYDhOcxKkYRNMv2YpOSRIeSvhs0CMH6EDHsZqVq0OmR+bX/0rIS5JGXLHsws6Rc/XdvEwbe2dpBmxzU3xCIayd4FqnJipuX5gkSYJIE8Rsyg+lv4EJ3olP9rg8inod4FqFnuTex4saIqne7BG5QsOqA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5TFUqsmGYf9EwQAXBS3tgZyo8yZMxmKZVup4Unt3ApLtvpw5m0TROq2fBtsgTzyWsQe42NidJh+R5vnntO9ljg1clD2vc88yreQfsT+dajSUZeLVPbsWPTpO4uboJ5jIaBSx2osHWSrQ5hFGg/JU79YG+89fMbbIcd3oTyDHer8soWTQU0eNDaJTL8fUV5V6hq/qgYwaB8S1tiavhu+H/S2ODb8WTEXWPtg7tzcrfdBkE87OtrHwUBm7oXOoOWfJK7EU9ybO8Y6VfkVgXVGUqcUMj/sNcmDRnqRV1eAnR4dua/niw3brfoNCeEQ9h7ZPca4KANlV3rUHsPJrqsYGpOtFrKazSk1V+LkO3He6PXrmDNaTO8tJ1ACnBAtlnanW3GZ2Cg0PBNf7Y+3PaUickNjU6NK60L7+5cuc6m0lVyuCBG4ARowBoyunTMd85ngx
X-Exchange-RoutingPolicyChecked:
	MxTBY4KMzkeI0e2a40xeZUPNJjsZPEIaSdGA6Rh2mCSejNZGLxzfAltp4QxbqzOZcM8ev7LUZf9GE6vuJq65Z+Lev/isjHahmUne5/IKKhTEXilXqIrYaEcnbq5KosABi4yJLUZ7KhFrux4gcbmovfS4Vy/MF2hrQGm3MMw8cBtJWb1eumB8nb1/JqIAHGrynVQz8DDmZgtnRg7bO5luHrvYJDiWSqYam9HeXYlPIH3G4LBAPLzvHh/1d/4SAn5vaixDDOe+ty5v7/RSh3irhxxQh08bbQmHAMFvetKByU11HgsjE6LA+vA/Ef7eR9ctxrL0nZPAfcj4do0GSRqT1g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:20:59.4748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa5c99d-2dc2-465b-9982-08df1ed42404
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0AE915473
X-Proofpoint-ORIG-GUID: kW2cK79niETIAPoxwqCOpP9WH3kgo1lM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX7zC8GrjFc2bN
 3pbNH9Km+xQqkqRsKupeF+moQ/fIfEXhbBRfvHd2d9mrgIPrx/Qp7N/3LlJu2cTluEiWcPSZGec
 VJHabLfoewRjisZSfcZHTBAJW0rCUyk=
X-Authority-Analysis: v=2.4 cv=Q79HcI2a c=1 sm=1 tr=0 ts=6abcd481 cx=c_pps
 a=7sXfYZKWL/+VDStniiEWIQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=lo7hCSqnAAAA:8
 a=P5u94WYTD08Jy0khQ3IA:9 a=dR1tM_truTP7UPXl:21 a=O8hF6Hzn-FEA:10
 a=LkNurY91FRSyUmvXzpeF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX/aDlo/lwCH4m
 1R+2qtW2jYFWZtgBzISKFEE1Rw2wMm/eRFaG+7hY4Hk9oAxxieQwbZ0+bRxK/I7+SnpHwrn9U27
 bQA3mGKtmJZNcsSXLRCgIpr9hYdjDBoW/aYegiK/TyzOd0iVnWAkbyEZbU+BOlvm/A1Hp19EkBC
 bGkUsc+A6sBTh7abvHRBP+bCGhHpMimoR544pKaBdORqyq1M8soe+yTmNSOgkWxEERSJo/MOSh3
 9s72Z1FjwIcRssxDPJdLscvmA685rV2AyqoGim0LN80qsshuKc5iqN0DQjCf+ga6e0vPSM3jUAr
 nfDJVJ/n6LlnmyiXmj0o0uN39992qFdhPS8d1MncjGXbdLlPHVRG9wKpbq6YM4lSBvQAReQgH8u
 +xJd3+ovrPvA5/BLo/jOmhnZd40l0w+RXlo0y7n3BqvSgJ55N0YV41MC9F3ATG4lYmAFNE76jYt
 4Ad3CqGp44Tj4y8/Inw==
X-Proofpoint-GUID: kW2cK79niETIAPoxwqCOpP9WH3kgo1lM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300037

The TDA54 pin controller splits the pad configuration across two registers:
PADCFGA holds the mux mode and the functional pin configuration, PADCFGB
holds the wakeup and retention configuration. The controller also supports
two proxy addressing regions and claiming of registers. A register claimed
through proxy 1 becomes read-only at proxy 0 and can only be written
through proxy 1.

Add support for the pin controller in the TI TDA54 SoC.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 MAINTAINERS                        |   1 +
 drivers/pinctrl/ti/Kconfig         |  10 +
 drivers/pinctrl/ti/Makefile        |   1 +
 drivers/pinctrl/ti/pinctrl-tda54.c | 794 +++++++++++++++++++++++++++++
 4 files changed, 806 insertions(+)
 create mode 100644 drivers/pinctrl/ti/pinctrl-tda54.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 60aa8483301e..0f996757d2e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27870,6 +27870,7 @@ M:	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/ti,tda54-pinctrl.yaml
+F:	drivers/pinctrl/ti/pinctrl-tda54.c
 
 TI TMAG5273 MAGNETOMETER DRIVER
 M:	Gerald Loacker <gerald.loacker@wolfvision.net>
diff --git a/drivers/pinctrl/ti/Kconfig b/drivers/pinctrl/ti/Kconfig
index d7cf27991c55..b60f9988f430 100644
--- a/drivers/pinctrl/ti/Kconfig
+++ b/drivers/pinctrl/ti/Kconfig
@@ -9,3 +9,13 @@ config PINCTRL_TI_IODELAY
 	help
 	  Say Y here to support Texas Instruments' IO delay pinconf driver.
 	  IO delay module is used for the DRA7 SoC family.
+
+config PINCTRL_TDA54
+	tristate "TI TDA54 pinctrl driver"
+	depends on OF && (ARCH_K3 || COMPILE_TEST)
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	help
+	  Say Y here to support pin multiplexing and pin configuration on the
+	  Texas Instruments TDA54 SoC.
diff --git a/drivers/pinctrl/ti/Makefile b/drivers/pinctrl/ti/Makefile
index 0599e414f61a..b070f4f355e6 100644
--- a/drivers/pinctrl/ti/Makefile
+++ b/drivers/pinctrl/ti/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_PINCTRL_TI_IODELAY)	+= pinctrl-ti-iodelay.o
+obj-$(CONFIG_PINCTRL_TDA54)		+= pinctrl-tda54.o
diff --git a/drivers/pinctrl/ti/pinctrl-tda54.c b/drivers/pinctrl/ti/pinctrl-tda54.c
new file mode 100644
index 000000000000..eb74f0c2b18e
--- /dev/null
+++ b/drivers/pinctrl/ti/pinctrl-tda54.c
@@ -0,0 +1,794 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Pinctrl driver for the TI TDA54 SoC
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinctrl-utils.h"
+#include "../pinmux.h"
+
+/*
+ * Each pad on TDA54 is configured by a pair of PAD Configuration registers:
+ *
+ *	PADCFGA<n> at PADCFG_BASE + 0x100  + 4 * n
+ *	PADCFGB<n> at PADCFG_BASE + 0x1100 + 4 * n
+ *
+ * PADCFGA holds the mux mode and the static pin configuration. PADCFGB holds
+ * the wakeup and retention configuration.
+ */
+#define TDA54_PADCFGA_BASE		0x100
+#define TDA54_PADCFGB_BASE		0x1100
+#define TDA54_PADCFG_STRIDE		4
+
+/*
+ * Each pinmux entry packs the pad number and the mux mode into a single
+ * cell, as described in the binding.
+ */
+#define TDA54_PINMUX_PAD_SHIFT		8
+#define TDA54_PINMUX_MUX_MASK		GENMASK(3, 0)
+#define TDA54_PINMUX_PAD(x)		((x) >> TDA54_PINMUX_PAD_SHIFT)
+#define TDA54_PINMUX_MUX(x)		((x) & TDA54_PINMUX_MUX_MASK)
+
+/* Size of a single proxy window into the padcfg register space */
+#define TDA54_PROXY_STRIDE		0x4000
+
+/*
+ * Every register is write protected by the LOCK_KICK pair of its own proxy
+ * window.
+ */
+#define TDA54_LOCK_KICK0		0x3008
+#define TDA54_LOCK_KICK0_UNLOCK_VAL	0x68ef3490
+#define TDA54_LOCK_KICK1		0x300c
+#define TDA54_LOCK_KICK1_UNLOCK_VAL	0xd172bc5a
+
+/*
+ * Claim registers, bit b of claim register i corresponds to
+ * the register at offset i * TDA54_CLAIM_BLOCK_SIZE + b * 4.
+ */
+#define TDA54_CLAIM_BASE		0x3100
+#define TDA54_CLAIM_REG_STRIDE		0x4
+#define TDA54_CLAIM_REGS_PER_WORD	32
+#define TDA54_CLAIM_BLOCK_SIZE		(TDA54_CLAIM_REGS_PER_WORD * 0x4)
+
+/* PADCFGA */
+#define TDA54_MUXMODE			GENMASK(3, 0)
+#define TDA54_VIRT_GPIO		GENMASK(6, 4)
+#define TDA54_DEBOUNCE_SEL		GENMASK(14, 12)
+#define TDA54_PULLUDEN			BIT(16)	/* 0 = pull enabled */
+#define TDA54_PULLTYPESEL		BIT(17)	/* 0 = down, 1 = up */
+#define TDA54_RXACTIVE			BIT(18)	/* 1 = receiver enabled */
+#define TDA54_TX_DIS			BIT(19)	/* 1 = driver disabled */
+#define TDA54_SLEW_CTRL		GENMASK(21, 20)
+#define TDA54_HYST_DIS			BIT(25)	/* 1 = hysteresis disabled */
+#define TDA54_BIAS			(TDA54_PULLUDEN | TDA54_PULLTYPESEL)
+
+#define TDA54_DEBOUNCE_SEL_MAX		6
+#define TDA54_MUX_GPIO			7
+
+/* PADCFGB */
+#define TDA54_WKUP_LVL_EN		BIT(0)	/* wkup_lvl_en: 1 = level sensitive */
+#define TDA54_WKUP_LVL_POL		BIT(1)	/* wkup_lvl_pol: 0 = LOW, 1 = HIGH */
+#define TDA54_WKUP_EN			BIT(8)	/* wkup_en */
+#define TDA54_RET_PULLUD_EN		BIT(16)	/* 0 = pull enabled */
+#define TDA54_RET_PULLTYPE_SEL		BIT(17)	/* 0 = down, 1 = up */
+#define TDA54_RET_OFFMODE_EN		BIT(18)	/* 1 = force to OFF mode value */
+#define TDA54_RET_OUT_DIS		BIT(19)	/* 1 = output disabled */
+/*
+ * Retention Output Value. As Per TDA54 PADCFG documentation the encoding
+ * is inverted with respect to the field value names: 0x0 (LOW) drives the pin
+ * high, 0x1 (HIGH) drives it low. Named after the level actually driven.
+ */
+#define TDA54_RET_OUT_LOW		BIT(20)
+#define TDA54_FORCE_RET_EN		BIT(24)	/* 1 = override Device Manager */
+#define TDA54_ISO_BYP			BIT(28)	/* 1 = I/O isolation bypassed */
+
+#define TDA54_RET_BIAS	(TDA54_RET_PULLUD_EN | TDA54_RET_PULLTYPE_SEL)
+
+/* Custom pinconf parameters */
+#define TDA54_PIN_CONFIG_DEBOUNCE_SELECT	(PIN_CONFIG_END + 1)
+#define TDA54_PIN_CONFIG_VIRT_GPIO_INSTANCE	(PIN_CONFIG_END + 2)
+#define TDA54_PIN_CONFIG_WKUP			(PIN_CONFIG_END + 3)
+#define TDA54_PIN_CONFIG_RET_BIAS		(PIN_CONFIG_END + 4)
+#define TDA54_PIN_CONFIG_RET_OFFMODE		(PIN_CONFIG_END + 5)
+#define TDA54_PIN_CONFIG_RET_OUT		(PIN_CONFIG_END + 6)
+#define TDA54_PIN_CONFIG_FORCE_RET		(PIN_CONFIG_END + 7)
+#define TDA54_PIN_CONFIG_ISO_BYPASS		(PIN_CONFIG_END + 8)
+
+static const struct pinconf_generic_params tda54_custom_bindings[] = {
+	{ "ti,debounce-select", TDA54_PIN_CONFIG_DEBOUNCE_SELECT, 0 },
+	{ "ti,virt-gpio-instance", TDA54_PIN_CONFIG_VIRT_GPIO_INSTANCE, 0 },
+	{ "ti,wakeup", TDA54_PIN_CONFIG_WKUP, 0 },
+	{ "ti,retention-bias", TDA54_PIN_CONFIG_RET_BIAS, 0 },
+	{ "ti,retention-offmode", TDA54_PIN_CONFIG_RET_OFFMODE, 0 },
+	{ "ti,retention-output", TDA54_PIN_CONFIG_RET_OUT, 0 },
+	{ "ti,retention-force", TDA54_PIN_CONFIG_FORCE_RET, 0 },
+	{ "ti,isolation-bypass", TDA54_PIN_CONFIG_ISO_BYPASS, 0 },
+};
+
+#ifdef CONFIG_DEBUG_FS
+static const struct pin_config_item
+tda54_conf_items[ARRAY_SIZE(tda54_custom_bindings)] = {
+	PCONFDUMP(TDA54_PIN_CONFIG_DEBOUNCE_SELECT, "debounce select", NULL, true),
+	PCONFDUMP(TDA54_PIN_CONFIG_VIRT_GPIO_INSTANCE, "virtual gpio instance", NULL, true),
+	PCONFDUMP(TDA54_PIN_CONFIG_WKUP, "wakeup", NULL, true),
+	PCONFDUMP(TDA54_PIN_CONFIG_RET_BIAS, "retention bias", NULL, true),
+	PCONFDUMP(TDA54_PIN_CONFIG_RET_OFFMODE, "retention offmode", NULL, true),
+	PCONFDUMP(TDA54_PIN_CONFIG_RET_OUT, "retention output", NULL, true),
+	PCONFDUMP(TDA54_PIN_CONFIG_FORCE_RET, "retention force", NULL, true),
+	PCONFDUMP(TDA54_PIN_CONFIG_ISO_BYPASS, "isolation bypass", NULL, true),
+};
+#endif
+
+/**
+ * struct tda54_group_data - per group driver data
+ * @mux: mux mode to program for each pin of the group
+ */
+struct tda54_group_data {
+	unsigned int *mux;
+};
+
+/**
+ * struct tda54_pinctrl - TDA54 pin controller driver data
+ * @desc: pin controller descriptor registered with the pinctrl core
+ * @pctl: pin controller device returned by the pinctrl core
+ * @dev: device backing this pin controller
+ * @base: base address of the proxy region used to access the registers
+ * @proxy: proxy region this instance uses
+ * @npins: number of pins exposed on this instance
+ * @mutex: protects adding groups and functions
+ * @lock: serialises read-modify-write of PADCFG registers
+ */
+struct tda54_pinctrl {
+	struct pinctrl_desc desc;
+	struct pinctrl_dev *pctl;
+	struct device *dev;
+	void __iomem *base;
+	u32 proxy;
+	u32 npins;
+	struct mutex mutex;	/* protects adding groups and functions */
+	raw_spinlock_t lock;	/* serialises read-modify-write of PADCFG registers */
+};
+
+static unsigned int tda54_padcfga(unsigned int pin)
+{
+	return TDA54_PADCFGA_BASE + pin * TDA54_PADCFG_STRIDE;
+}
+
+static unsigned int tda54_padcfgb(unsigned int pin)
+{
+	return TDA54_PADCFGB_BASE + pin * TDA54_PADCFG_STRIDE;
+}
+
+/*
+ * Claim @reg for this proxy before writing it. A register claimed by a
+ * proxy can no longer be written through any other proxy's address until
+ * that proxy releases the claim.
+ */
+static void tda54_claim(struct tda54_pinctrl *tp, unsigned int reg)
+{
+	unsigned int block = reg / TDA54_CLAIM_BLOCK_SIZE;
+	unsigned int bit = (reg % TDA54_CLAIM_BLOCK_SIZE) / TDA54_CLAIM_REG_STRIDE;
+	unsigned int claim_reg = TDA54_CLAIM_BASE + block * TDA54_CLAIM_REG_STRIDE;
+	u32 val;
+
+	val = readl_relaxed(tp->base + claim_reg);
+	val |= BIT(bit);
+	writel_relaxed(val, tp->base + claim_reg);
+}
+
+static void tda54_rmw(struct tda54_pinctrl *tp, unsigned int reg,
+		      u32 mask, u32 val)
+{
+	unsigned long flags;
+	u32 tmp;
+
+	raw_spin_lock_irqsave(&tp->lock, flags);
+
+	/* Proxy0 does not need to claim; every other proxy must claim first */
+	if (tp->proxy)
+		tda54_claim(tp, reg);
+
+	tmp = readl_relaxed(tp->base + reg);
+	tmp &= ~mask;
+	tmp |= val;
+	writel_relaxed(tmp, tp->base + reg);
+
+	raw_spin_unlock_irqrestore(&tp->lock, flags);
+}
+
+static void tda54_unlock(struct tda54_pinctrl *tp)
+{
+	writel_relaxed(TDA54_LOCK_KICK0_UNLOCK_VAL, tp->base + TDA54_LOCK_KICK0);
+	writel_relaxed(TDA54_LOCK_KICK1_UNLOCK_VAL, tp->base + TDA54_LOCK_KICK1);
+}
+
+static void tda54_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+			       unsigned int pin)
+{
+	struct tda54_pinctrl *tp = pinctrl_dev_get_drvdata(pctldev);
+
+	seq_printf(s, "PADCFGA %08x PADCFGB %08x",
+		   readl_relaxed(tp->base + tda54_padcfga(pin)),
+		   readl_relaxed(tp->base + tda54_padcfgb(pin)));
+}
+
+static int tda54_dt_node_to_map(struct pinctrl_dev *pctldev,
+				struct device_node *np,
+				struct pinctrl_map **maps,
+				unsigned int *num_maps)
+{
+	struct tda54_pinctrl *tp = pinctrl_dev_get_drvdata(pctldev);
+	struct tda54_group_data *gdata;
+	unsigned int *pins, *pinmux;
+	unsigned int nmaps = 0;
+	unsigned long *configs;
+	unsigned int nconfigs;
+	const char **grpnames;
+	struct pinctrl_map *map;
+	const char *grpname;
+	int ret, gsel, i, npins;
+
+	npins = of_property_count_u32_elems(np, "pinmux");
+	if (npins <= 0) {
+		dev_err(tp->dev, "%pOF: missing or empty pinmux property\n", np);
+		return -EINVAL;
+	}
+
+	/* One map for the mux, one for the configs. */
+	map = kcalloc(2, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	pinmux = kcalloc(npins, sizeof(*pinmux), GFP_KERNEL);
+	if (!pinmux) {
+		kfree(map);
+		return -ENOMEM;
+	}
+
+	ret = of_property_read_u32_array(np, "pinmux", pinmux, npins);
+	if (ret)
+		goto out;
+
+	grpname = devm_kasprintf(tp->dev, GFP_KERNEL, "%pOFn", np);
+	pins = devm_kcalloc(tp->dev, npins, sizeof(*pins), GFP_KERNEL);
+	gdata = devm_kzalloc(tp->dev, sizeof(*gdata), GFP_KERNEL);
+	grpnames = devm_kcalloc(tp->dev, 1, sizeof(*grpnames), GFP_KERNEL);
+	if (!grpname || !pins || !gdata || !grpnames) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	gdata->mux = devm_kcalloc(tp->dev, npins, sizeof(*gdata->mux),
+				  GFP_KERNEL);
+	if (!gdata->mux) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 0; i < npins; i++) {
+		unsigned int pad = TDA54_PINMUX_PAD(pinmux[i]);
+
+		if (pad >= tp->npins) {
+			dev_err(tp->dev, "%pOF: pad %u out of range\n", np, pad);
+			ret = -EINVAL;
+			goto out;
+		}
+		pins[i] = pad;
+		gdata->mux[i] = TDA54_PINMUX_MUX(pinmux[i]);
+	}
+
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &nconfigs);
+	if (ret)
+		goto out;
+
+	mutex_lock(&tp->mutex);
+
+	gsel = pinctrl_generic_add_group(pctldev, grpname, pins, npins, gdata);
+	if (gsel < 0) {
+		ret = gsel;
+		goto unlock;
+	}
+
+	grpnames[0] = grpname;
+	ret = pinmux_generic_add_function(pctldev, grpname, grpnames, 1, NULL);
+	if (ret < 0)
+		goto remove_group;
+
+	mutex_unlock(&tp->mutex);
+
+	map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
+	map[nmaps].data.mux.function = grpname;
+	map[nmaps].data.mux.group = grpname;
+	nmaps++;
+
+	if (nconfigs) {
+		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
+		map[nmaps].data.configs.group_or_pin = grpname;
+		map[nmaps].data.configs.configs = configs;
+		map[nmaps].data.configs.num_configs = nconfigs;
+		nmaps++;
+	} else {
+		kfree(configs);
+	}
+
+	*maps = map;
+	*num_maps = nmaps;
+	kfree(pinmux);
+
+	return 0;
+
+remove_group:
+	pinctrl_generic_remove_group(pctldev, gsel);
+unlock:
+	mutex_unlock(&tp->mutex);
+	kfree(configs);
+out:
+	kfree(pinmux);
+	kfree(map);
+	return ret;
+}
+
+static const struct pinctrl_ops tda54_pinctrl_ops = {
+	.get_groups_count	= pinctrl_generic_get_group_count,
+	.get_group_name		= pinctrl_generic_get_group_name,
+	.get_group_pins		= pinctrl_generic_get_group_pins,
+	.pin_dbg_show		= tda54_pin_dbg_show,
+	.dt_node_to_map		= tda54_dt_node_to_map,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+static int tda54_set_mux(struct pinctrl_dev *pctldev, unsigned int fsel,
+			 unsigned int gsel)
+{
+	struct tda54_pinctrl *tp = pinctrl_dev_get_drvdata(pctldev);
+	const struct tda54_group_data *gdata;
+	const struct group_desc *grp;
+	unsigned int i;
+
+	grp = pinctrl_generic_get_group(pctldev, gsel);
+	if (!grp)
+		return -EINVAL;
+
+	gdata = grp->data;
+	if (!gdata)
+		return -EINVAL;
+
+	for (i = 0; i < grp->grp.npins; i++)
+		tda54_rmw(tp, tda54_padcfga(grp->grp.pins[i]),
+			  TDA54_MUXMODE, gdata->mux[i]);
+
+	return 0;
+}
+
+static int tda54_gpio_request_enable(struct pinctrl_dev *pctldev,
+				     struct pinctrl_gpio_range *range,
+				     unsigned int offset)
+{
+	struct tda54_pinctrl *tp = pinctrl_dev_get_drvdata(pctldev);
+
+	if (offset >= tp->npins)
+		return -EINVAL;
+
+	tda54_rmw(tp, tda54_padcfga(offset), TDA54_MUXMODE, TDA54_MUX_GPIO);
+
+	return 0;
+}
+
+static const struct pinmux_ops tda54_pinmux_ops = {
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
+	.set_mux		= tda54_set_mux,
+	.gpio_request_enable	= tda54_gpio_request_enable,
+};
+
+static int tda54_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			     unsigned long *config)
+{
+	struct tda54_pinctrl *tp = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int param = pinconf_to_config_param(*config);
+	u32 val_a = readl_relaxed(tp->base + tda54_padcfga(pin));
+	u32 val_b = readl_relaxed(tp->base + tda54_padcfgb(pin));
+	bool enabled = true;
+	u32 arg = 0;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		enabled = val_a & TDA54_PULLUDEN;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		enabled = !(val_a & TDA54_PULLUDEN) && !(val_a & TDA54_PULLTYPESEL);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		enabled = !(val_a & TDA54_PULLUDEN) && (val_a & TDA54_PULLTYPESEL);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		enabled = val_a & TDA54_RXACTIVE;
+		arg = enabled;
+		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		enabled = !(val_a & TDA54_TX_DIS);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		enabled = !(val_a & TDA54_HYST_DIS);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		arg = FIELD_GET(TDA54_SLEW_CTRL, val_a);
+		break;
+	case TDA54_PIN_CONFIG_DEBOUNCE_SELECT:
+		arg = FIELD_GET(TDA54_DEBOUNCE_SEL, val_a);
+		break;
+	case TDA54_PIN_CONFIG_VIRT_GPIO_INSTANCE:
+		arg = FIELD_GET(TDA54_VIRT_GPIO, val_a);
+		break;
+	case TDA54_PIN_CONFIG_WKUP:
+		if (!(val_b & TDA54_WKUP_EN))
+			arg = 0;
+		else if (!(val_b & TDA54_WKUP_LVL_EN))
+			arg = 1;
+		else if (!(val_b & TDA54_WKUP_LVL_POL))
+			arg = 2;
+		else
+			arg = 3;
+		break;
+	case TDA54_PIN_CONFIG_RET_BIAS:
+		if (val_b & TDA54_RET_PULLUD_EN)
+			arg = 0;
+		else if (val_b & TDA54_RET_PULLTYPE_SEL)
+			arg = 2;
+		else
+			arg = 1;
+		break;
+	case TDA54_PIN_CONFIG_RET_OFFMODE:
+		arg = (val_b & TDA54_RET_OFFMODE_EN) ? 1 : 0;
+		break;
+	case TDA54_PIN_CONFIG_RET_OUT:
+		if (val_b & TDA54_RET_OUT_DIS)
+			arg = 0;
+		else if (val_b & TDA54_RET_OUT_LOW)
+			arg = 1;
+		else
+			arg = 2;
+		break;
+	case TDA54_PIN_CONFIG_FORCE_RET:
+		arg = (val_b & TDA54_FORCE_RET_EN) ? 1 : 0;
+		break;
+	case TDA54_PIN_CONFIG_ISO_BYPASS:
+		arg = (val_b & TDA54_ISO_BYP) ? 1 : 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return enabled ? 0 : -EINVAL;
+}
+
+static int tda54_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			     unsigned long *configs, unsigned int num_configs)
+{
+	struct tda54_pinctrl *tp = pinctrl_dev_get_drvdata(pctldev);
+	u32 mask_a = 0, val_a = 0;
+	u32 mask_b = 0, val_b = 0;
+	unsigned int i;
+
+	for (i = 0; i < num_configs; i++) {
+		unsigned int param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			mask_a |= TDA54_BIAS;
+			val_a &= ~TDA54_BIAS;
+			val_a |= TDA54_PULLUDEN;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			mask_a |= TDA54_BIAS;
+			val_a &= ~TDA54_BIAS;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			mask_a |= TDA54_BIAS;
+			val_a &= ~TDA54_BIAS;
+			val_a |= TDA54_PULLTYPESEL;
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			mask_a |= TDA54_RXACTIVE;
+			if (arg)
+				val_a |= TDA54_RXACTIVE;
+			else
+				val_a &= ~TDA54_RXACTIVE;
+			break;
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			mask_a |= TDA54_TX_DIS;
+			if (arg)
+				val_a &= ~TDA54_TX_DIS;
+			else
+				val_a |= TDA54_TX_DIS;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			mask_a |= TDA54_HYST_DIS;
+			if (arg)
+				val_a &= ~TDA54_HYST_DIS;
+			else
+				val_a |= TDA54_HYST_DIS;
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (arg > FIELD_MAX(TDA54_SLEW_CTRL))
+				return -EINVAL;
+			mask_a |= TDA54_SLEW_CTRL;
+			val_a |= FIELD_PREP(TDA54_SLEW_CTRL, arg);
+			break;
+		case TDA54_PIN_CONFIG_DEBOUNCE_SELECT:
+			if (arg > TDA54_DEBOUNCE_SEL_MAX)
+				return -EINVAL;
+			mask_a |= TDA54_DEBOUNCE_SEL;
+			val_a |= FIELD_PREP(TDA54_DEBOUNCE_SEL, arg);
+			break;
+		case TDA54_PIN_CONFIG_VIRT_GPIO_INSTANCE:
+			if (arg > FIELD_MAX(TDA54_VIRT_GPIO))
+				return -EINVAL;
+			mask_a |= TDA54_VIRT_GPIO;
+			val_a |= FIELD_PREP(TDA54_VIRT_GPIO, arg);
+			break;
+		case TDA54_PIN_CONFIG_WKUP:
+			mask_b |= TDA54_WKUP_EN | TDA54_WKUP_LVL_EN |
+				  TDA54_WKUP_LVL_POL;
+			switch (arg) {
+			case 0:
+				break;
+			case 1:
+				val_b |= TDA54_WKUP_EN;
+				break;
+			case 2:
+				val_b |= TDA54_WKUP_EN | TDA54_WKUP_LVL_EN;
+				break;
+			case 3:
+				val_b |= TDA54_WKUP_EN | TDA54_WKUP_LVL_EN |
+					 TDA54_WKUP_LVL_POL;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		case TDA54_PIN_CONFIG_RET_BIAS:
+			mask_b |= TDA54_RET_BIAS;
+			switch (arg) {
+			case 0:
+				val_b |= TDA54_RET_PULLUD_EN;
+				break;
+			case 1:
+				break;
+			case 2:
+				val_b |= TDA54_RET_PULLTYPE_SEL;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		case TDA54_PIN_CONFIG_RET_OFFMODE:
+			if (arg > 1)
+				return -EINVAL;
+			mask_b |= TDA54_RET_OFFMODE_EN;
+			if (arg)
+				val_b |= TDA54_RET_OFFMODE_EN;
+			break;
+		case TDA54_PIN_CONFIG_RET_OUT:
+			mask_b |= TDA54_RET_OUT_DIS | TDA54_RET_OUT_LOW;
+			switch (arg) {
+			case 0:
+				val_b |= TDA54_RET_OUT_DIS;
+				break;
+			case 1:
+				val_b |= TDA54_RET_OUT_LOW;
+				break;
+			case 2:
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		case TDA54_PIN_CONFIG_FORCE_RET:
+			if (arg > 1)
+				return -EINVAL;
+			mask_b |= TDA54_FORCE_RET_EN;
+			if (arg)
+				val_b |= TDA54_FORCE_RET_EN;
+			break;
+		case TDA54_PIN_CONFIG_ISO_BYPASS:
+			if (arg > 1)
+				return -EINVAL;
+			mask_b |= TDA54_ISO_BYP;
+			if (arg)
+				val_b |= TDA54_ISO_BYP;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	if (mask_a)
+		tda54_rmw(tp, tda54_padcfga(pin), mask_a, val_a);
+	if (mask_b)
+		tda54_rmw(tp, tda54_padcfgb(pin), mask_b, val_b);
+
+	return 0;
+}
+
+static int tda54_pinconf_group_get(struct pinctrl_dev *pctldev,
+				   unsigned int gsel, unsigned long *config)
+{
+	unsigned long prev_config = 0;
+	const unsigned int *pins;
+	unsigned int i, npins;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, gsel, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = tda54_pinconf_get(pctldev, pins[i], config);
+		if (ret)
+			return ret;
+
+		/* configs do not match between pins */
+		if (i && prev_config != *config)
+			return -EINVAL;
+
+		prev_config = *config;
+	}
+
+	return 0;
+}
+
+static int tda54_pinconf_group_set(struct pinctrl_dev *pctldev,
+				   unsigned int gsel, unsigned long *configs,
+				   unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int i, npins;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, gsel, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = tda54_pinconf_set(pctldev, pins[i], configs, num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops tda54_pinconf_ops = {
+	.is_generic		= true,
+	.pin_config_get		= tda54_pinconf_get,
+	.pin_config_set		= tda54_pinconf_set,
+	.pin_config_group_get	= tda54_pinconf_group_get,
+	.pin_config_group_set	= tda54_pinconf_group_set,
+};
+
+static int tda54_build_pins(struct tda54_pinctrl *tp)
+{
+	struct pinctrl_pin_desc *pins;
+	unsigned int i;
+
+	pins = devm_kcalloc(tp->dev, tp->npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	for (i = 0; i < tp->npins; i++) {
+		pins[i].number = i;
+		pins[i].name = devm_kasprintf(tp->dev, GFP_KERNEL, "padcfg%u",
+					      i);
+		if (!pins[i].name)
+			return -ENOMEM;
+	}
+
+	tp->desc.pins = pins;
+	tp->desc.npins = tp->npins;
+
+	return 0;
+}
+
+static int tda54_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tda54_pinctrl *tp;
+	void __iomem *base;
+	int ret;
+
+	tp = devm_kzalloc(dev, sizeof(*tp), GFP_KERNEL);
+	if (!tp)
+		return -ENOMEM;
+
+	tp->dev = dev;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	of_property_read_u32(dev->of_node, "ti,proxy-id", &tp->proxy);
+	tp->base = base + tp->proxy * TDA54_PROXY_STRIDE;
+
+	ret = of_property_read_u32(dev->of_node, "ti,npins", &tp->npins);
+	if (ret)
+		return dev_err_probe(dev, ret, "ti,npins property not found\n");
+
+	tda54_unlock(tp);
+
+	ret = tda54_build_pins(tp);
+	if (ret)
+		return ret;
+
+	tp->desc.name = dev_name(dev);
+	tp->desc.pctlops = &tda54_pinctrl_ops;
+	tp->desc.pmxops = &tda54_pinmux_ops;
+	tp->desc.confops = &tda54_pinconf_ops;
+	tp->desc.owner = THIS_MODULE;
+	tp->desc.num_custom_params = ARRAY_SIZE(tda54_custom_bindings);
+	tp->desc.custom_params = tda54_custom_bindings;
+#ifdef CONFIG_DEBUG_FS
+	tp->desc.custom_conf_items = tda54_conf_items;
+#endif
+
+	ret = devm_mutex_init(dev, &tp->mutex);
+	if (ret)
+		return ret;
+
+	raw_spin_lock_init(&tp->lock);
+
+	ret = devm_pinctrl_register_and_init(dev, &tp->desc, tp, &tp->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not register pinctrl driver\n");
+
+	return pinctrl_enable(tp->pctl);
+}
+
+static const struct of_device_id tda54_pinctrl_of_match[] = {
+	{ .compatible = "ti,tda54-pinctrl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tda54_pinctrl_of_match);
+
+static struct platform_driver tda54_pinctrl_driver = {
+	.probe = tda54_pinctrl_probe,
+	.driver = {
+		.name = "pinctrl-tda54",
+		.of_match_table = tda54_pinctrl_of_match,
+	},
+};
+module_platform_driver(tda54_pinctrl_driver);
+
+MODULE_AUTHOR("Yemike Abhilash Chandra <y-abhilashchandra@ti.com>");
+MODULE_DESCRIPTION("Pinctrl driver for the TI TDA54 SoC");
+MODULE_LICENSE("GPL");
-- 
2.34.1

