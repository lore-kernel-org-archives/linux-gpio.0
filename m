Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993F31B101;
	Wed, 30 Sep 2026 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760105; cv=fail; b=WjVw8wuqWpRMs5Lp+AnqP7HQ9IFYjxo2AaQgCbXiE4XquU1Sqt7u6uOnNDUpX1ocSn4JOTcXaibaktT8RO0+DQBNq+z8/jIFgCfd4zC/+iiXhVbtXcI4f0Kft89s2lsJtXdBOxwRmo4xIBA/BXPY4zO3XN3CefV0X8XpWZDGSI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760105; c=relaxed/simple;
	bh=zh+2cfuk88iOY/YMUC9RdGgHHlotLWt4pFkYpsmZLH8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dWmZWP/NuebeH6w2t2stpzqi2eAxGgPC7qcHJC+cuGzW5pnJoy6ZBzEN6imlUB6NhhcEF64Zq0o8yXNCYSEwpfblvc7W7cyt3k70OzM/X3RIm4nj1sagF+Mnn5EOL4AfWib3yDnAouoYJbgGdFdh1bv4uOOaJIJZfCJP2h6VV0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=krvbaoN6; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=J2wuAzvK; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="krvbaoN6";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="J2wuAzvK"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68U7bV4K3158895;
	Wed, 30 Sep 2026 04:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tb9LeoiTH1JIZh9lDlNxdmGROBuXWq5KtBVTkvYMN
	/c=; b=krvbaoN6gUUR66kpB9Yjw8HF7f9vbCwrECyiJGRzLOklG/khLLDJxsG7e
	Un/WJ9RANIqLZqQg0tcUABCdLNT6mS7OVnubmlzpulNbFQ/gpMA5Qs+bOVFYA/9w
	g4xDNmvKIOz/9goCnJUzYJdRqA8NsN4rfU67KIgcLBVI7yqaQVQF1ISRMW3Z4SkB
	8Wa6ZYaOScdqCRqtfc88eq2K/lMI5t9qVaRXGz/opL3+7b5TBcLUtzEPX1B1ptLK
	BwefobXgDaZp81dMZ3GJWLssv2jz+8BLV045rKErywsW3DTKnyFSkU1uc1yERTML
	qO7JTjCbB3oxcyQ2ZnjoU4AsDxxbw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h0srrtbr1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 04:21:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIWsXR2u0s4Usp98F9cB6ivbNcRp83ERj51n6eo7JD1sgo1gXJBicJFXaKHIc2+Icec59c9DD63qmlgddVA0DrKzgSJIxTA5qRcKTGbg3EQEXq4lhrgYU4R1LXCGrdcN6fnJCKQpoxPjAwrGeTJnWayTAyiK/CkJw/iTdVKdlWS5q/GubPaTYowZ2Tm0V76bsvUAriyMtqsvalq/dEb3Bq/+GfcuT+e3OhBmdZpPOyvoPORlHt5AXp7dVYDkanNQxdutqiBkO2693gtK9hBIFDTDNF1VWrsHr5TR7ufYn99xBr332qyERB986/vrKOU8tjzA+c8IgAwlspZSKTxqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tb9LeoiTH1JIZh9lDlNxdmGROBuXWq5KtBVTkvYMN/c=;
 b=TG/1JsYCrXIJwfz+FBa2itZZ7Tmaw1brmhxZeURvaPbbxD0dTK5YfheR567QlZotnMTdYJU2uI+TmnMfYZ5EoTMlni0X7bLh+lr3H1LajgJONeZkEf/ec/XU1727AtL3d5f6o4p27sMyYOIAEtHHyo2ibp9mCgwC+EbZQ3CsSpqP4D7UYNQq2DecMEw2b1Rnrs+W06QPM7Wl575M1KI8BolzEp1O35rkIJjtJkc+x4K3uaglHnjaav5zMeiIQFz6xdpR+qF/Z38Y6DavYPqXCiuygSUxw8FeDVNNi0iu4+n6n3uNB6KL27FUvyVIkS6DgbDuEoKxKArDIVhcRKURxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tb9LeoiTH1JIZh9lDlNxdmGROBuXWq5KtBVTkvYMN/c=;
 b=J2wuAzvKHOBpwJ13Giv3STfZIgGhhVirjHjz9cSV7nJ2+uoFv2c17IRwy5OwxFmKy72+5bo4sv7wrLIAD+cBC5c9g9wjpXlQDU9wfsVHEB3GIqQyQ3yLFKMGfmb7Zh8F2LfOYrJbjluGZGB7oIUz7uG9AqrhD6d+zv9bis+fBBA=
Received: from BN1PR14CA0008.namprd14.prod.outlook.com (2603:10b6:408:e3::13)
 by BL3PR10MB6236.namprd10.prod.outlook.com (2603:10b6:208:38f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 09:21:31 +0000
Received: from BN7PEPF00000096.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::a0) by BN1PR14CA0008.outlook.office365.com
 (2603:10b6:408:e3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 09:21:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN7PEPF00000096.mail.protection.outlook.com (10.167.245.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 09:21:29 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 04:20:50 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 04:20:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 04:20:50 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68U9KQL12847827;
	Wed, 30 Sep 2026 04:20:46 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 3/3] arm64: dts: ti: Add TDA54 pinctrl header
Date: Wed, 30 Sep 2026 14:50:20 +0530
Message-ID: <20260930092020.1047221-4-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000096:EE_|BL3PR10MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b2534d-7ec3-45e7-8224-08df1ed435dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|1800799024|376014|82310400026|10067099003|56012099006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	6InrC9FUFanUJTbl9ipTk8c0tc9qYrCHvczowMNs99ede5JHIvS7fu+IMZBxWK9DLzxN/KEoLXPNV44LGmO65VB27XnsrkEXjuVzHveyaKofd9g5SsYPRmO/mxXkj8w5mZI9oyVqfSUQ0Dyd4YBgPou6tCWpNKioOmV6//QgKb4XkUl9/PCuWo1QV49TpjJTqoPIZtopywgeHfskkfAYsJJgOcCHk9bppA4VrMQi3wN1s98izZvQy8bMDXPP3YQSvn79E+qyrjfACuvAfY449Qb6C4WXmkLPBMzMdOrPwLyUQk8uUBg109VVxK8YHp0R4JJrutDlff4TwsZEpkQTtfOY6DG/WKwb4/5IJf1Q/yMX1TCR7wjnXh0cMg9OL+SSM+235j5BTD7itK5KJrEfwuxRKo+hUc7MUTZwlvi9TLrcCMOb5pDAdBj68uEr9XTMYhHRike3rIRz33QDuurmfo+wyxa2uRTrKwSRW7IFK+QXLV1M8rzcEmrp8QQekSw34UITr8K9iO4cH+ONkJ3qhmDUDB7XbKoLJAC4cBwFn1c3wRqXhBvcDALo1vtfb0VTD0+pB7ckJhUgYq7NlFc4al20nTXG0XL10+FAtef6jvnYpMPAa3M9H6ToqIwf4AsLfJWFJeyQZ3CdstzTVJeWfA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(1800799024)(376014)(82310400026)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6SnFdos0fbMHqWRIVaBQ1aw5iMr6p9fjiKwr+dmfsntBSVE9GnNWVg6GGx1PMFcawD0EgLgwS2bTcyzd/vZbRjlbnyrONI8RtLMXoQbWb4dm2Zdx/GMHtu9hiVzr2Yi/lyr72hl3gI/8xEF1qurFV3cWy6xqGNCF2HslBShuBOfPgWKJrHfAv40LdTFZSjWmweuY4q1FbWKY8M2naaD2ZSiNNavjzAgRmHmOkZ//VAsY55yaekJ855XDEwvo1qoksXAyqkt0HUzkzuDroVhC0d0zZkxc01ssN+BlF+AK8k3MpZxBmrLG1dXmv2DkmhKClQRNKV+/zkc67EXbCppxYGpIZdettbBxhbZypiyGbBeyoBw/dEs3UvTE+JQmg5g7xNuAzwMVndoyJrcBSrM6ZHbiVSerppZF0U533ktKcKt5S8OxQut79UWEJWTGaGrP
X-Exchange-RoutingPolicyChecked:
	QvfwyFVNaqMtLFWBzgEJh4lV/t+kYSQ3+m+fJw2G2FJZ6gnjSF80J3qUl5f0E4BoDWcoki5zSts09ca4IVL4qeBXrYNv9w+2w9DgRdYFykm2FPwlHAPFoBy8L8CdBRiL5KTADnQ9w6XuWs0S/GBGYljAV5yG9dnWly/BD6xtT94HY5ml9W2q5wZIXxQuq/tWFvi4KbJHgvucBcRw4FnwmpBQs2F+f8dqSGxVxPXC3BaMQy/8+C07R9JMrKv31t30EsMTpaNo2bP2BrxpG6gdCY/y4Yfi7I05XylDhwkUdVpeTkz/u8C/cwIpxWviwamu+iKnY1QLqERAyvMw6zBleg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:21:29.4231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b2534d-7ec3-45e7-8224-08df1ed435dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000096.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6236
X-Proofpoint-ORIG-GUID: xltPM_2puQEdEzLd7D9weX2AF02fewiQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX9iZWZhcS4uO8
 UjyQF0qhVvvq6ZuHd75+oC7bZ8i0jwUa46xnfOI5SnLFVqsm1PI2yc3rEFdSx2BG4w8aIHxf0Od
 o+/GbgoJamkWjElv8JwAPM9tbO/q8b4=
X-Authority-Analysis: v=2.4 cv=Q79HcI2a c=1 sm=1 tr=0 ts=6abcd4a0 cx=c_pps
 a=ZKvdAGA7hMB+bqOj1cvlrg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=TcpxRHR5wTggSj2QoxUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX/CmB5/ozl2Ct
 Rn185Dne2v/HVF2l08tm+m4RcmadPJLZSmAyHLTLYoTMNEsjlW2svDs548smSYBIa0yPTkGbm4o
 C5HNuEXwG4+1fvBPLJI6EY9Ek2pKjeyIobBIz95yYkMiufeTuGP5w/nNJep6heQ5CZE2veeVnIS
 WgMoHvJ8RyQFGAh0lC33BLhBxedqPLU0/74NnFMHCKQqwXR7bsvBDkwFzpDlv+YlP4SSbwGZc7h
 1JPcJaA5lgzFMpCIIAaiSf1msMZXOTxYkPgDL/jLI0S4j4/3znk4V2d+S7at2dVuBoAwy6gTcMB
 e23Y9RUvXTpWw3pMGcPY23Z6w0zI+U1XR8YZddzsd4OnWK7tu61WQmkoEvb21RJtlMB9QRAp/xu
 5QxrBC7HIBstzOrkvciA6kcIMhDmSe0I1k1Zzg0Xx6HJIHpBsVCv3JAY+sTm4zQijfuKfHKPzt9
 Lt5J3xjpcVltNB3cxmA==
X-Proofpoint-GUID: xltPM_2puQEdEzLd7D9weX2AF02fewiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300037

Add TDA54_PINMUX() and the mux mode defines for use by TDA54 device tree
sources to build pinmux values.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Note: I understand that this patch goes through the SoC tree, but is
included here to give reviewers the full context.

 arch/arm64/boot/dts/ti/k3-tda54-pinctrl.h | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-tda54-pinctrl.h

diff --git a/arch/arm64/boot/dts/ti/k3-tda54-pinctrl.h b/arch/arm64/boot/dts/ti/k3-tda54-pinctrl.h
new file mode 100644
index 000000000000..a3e730e103ae
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-tda54-pinctrl.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * This header provides constants for TI's TDA54 SoC device tree sources.
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+#ifndef DTS_ARM64_TI_K3_TDA54_PINCTRL_H
+#define DTS_ARM64_TI_K3_TDA54_PINCTRL_H
+
+#define TDA54_PINMUX(pad, mux)		(((pad) << 8) | ((mux) & 0xf))
+
+#define TDA54_MUX_MODE0		0
+#define TDA54_MUX_MODE1		1
+#define TDA54_MUX_MODE2		2
+#define TDA54_MUX_MODE3		3
+#define TDA54_MUX_MODE4		4
+#define TDA54_MUX_MODE5		5
+#define TDA54_MUX_MODE6		6
+#define TDA54_MUX_MODE7		7
+#define TDA54_MUX_MODE8		8
+#define TDA54_MUX_MODE9		9
+#define TDA54_MUX_MODE10		10
+#define TDA54_MUX_MODE11		11
+#define TDA54_MUX_MODE12		12
+#define TDA54_MUX_MODE13		13
+#define TDA54_MUX_MODE14		14
+#define TDA54_MUX_MODE15		15
+
+#endif
-- 
2.34.1

