Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BA730D3F1;
	Fri, 16 Oct 2026 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125118; cv=fail; b=PD94eCocJOdVOBDUh5XVTWiX3/rPgtq3qDOf84rzMA9OPv8Y4ISryOHbjacXM5oazvvQ7a2FjyjzUevIqdkmsdwRJNxCCrv9d6JgHnkR2JsbgG5E5F6nHMjlF9dQr8TstY/0ALFb0MH6WqwuQQ/wMKxaDhT2euGg7DnSizJnfuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125118; c=relaxed/simple;
	bh=R7REyQ3gUEqRpBCzQpUub05IGz/fdppKSFPFXPmneJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HZ2IwL5oGNyzbGQpIuYdU65w2MY18NIsI88KYlcE/iYfbdUlaHZ62UKZqRF1t4kG3JMeYcnjf3TciSvKlCf2JIusaggogTbRYdKk3Km49KI6DltW8wuuFYdeE4E0YZJbezMOFG1xgYIGSSF66SPXP7vEpVUh7kL+tZ4xMCG6P7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GLFw4NpI; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=eNuxjz5V; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GLFw4NpI";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="eNuxjz5V"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69G2R9MG3635224;
	Thu, 15 Oct 2026 23:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xDY92lMDdMZjdHe/zeaMV8/O8bSA8kxntCOQtYxeW
	ug=; b=GLFw4NpIKgZ9olNY0f6yzC3V8N/tc4UPKtdU08EZ+dMAFxjsfK5Vs0t4w
	bgTOSsqcGeBEsHhEWHYO6i5ntOoYHcdyvSIiX/FpXC4qmOSDgIM9id6orBRjuyRT
	oUYRkHGkwLMva3iunc9fhwk7uxkxXk4O1sYem8PJAjlOapTkuWNe0u346Aqy/uSx
	1fuLg6ele5iHPWJsY9f8FxDyNDhSE05yhnR1xKz1AaMACM9zqfsFYTATD7FW1JVz
	Zsn+aq/gUBz7Olet+9I9hEQEFj37RiDWB9Hgjp/2iE+2uTaxaLqnclxe2dNW5/q4
	ZYBz9s1DWZTeYXgkkG3w2LCFNJh9g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hbb558gdn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 23:31:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrMElx0ua+D64G7P7HDEel/GBeaz9EvRQpeHRENCFNt78iD1FmnzZRzyJ4OlZFaIKn8+GzUUDd0rNAZcaYc5wYV5fgFxpUzBT2AZz++4biDYmo/u8d1fwtmHjrTv48mqM+EY0gvZGirklJHOph9Qoj7qisFwswbo9X7OeffBeO5K5NrjvT3+Dk+Dwu520TrdhNIhSKwlkVVwtRb3QAQUvBgCvVVcuKJP7sWKUc/lPu2bf5tsjBsvcfIxN+sqnOKYljkmIkdNcI8x4dgbgsavWNqIYR7UKeLSpTzezRp6zi22L0qPgqhz+qYvmDQwSIMf+EPHksukyRwW9yHKwRTf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDY92lMDdMZjdHe/zeaMV8/O8bSA8kxntCOQtYxeWug=;
 b=r9VbXgPrV0iSWqUnOr02XtT8siYvJmI4gtGTHeSTlOo/izpQPacoqcTXcc0JgUYyWwXUabySuQrJBLgiDI0og+M+eBBwm1NMTUei0DC1Y4QdteZl09cqps8MXHrDHEJ/wZ7QNBIlxca4gnc6CXzG7ygglYXUs3Zuwapm0VK8HhShCpI1UJQJ8ok8GEX3IYRaLBDy4IoH+QPnnB+7KYvu3EiM6GM3BhyjM6BpaIHPZwg66e5bRjf/+FdwDk38by+9rNN68w4YIV6yxu7UdcZ/c5f7kIQNZt//wvRQ0yckXezpL8+EhGSs+bFphrd1sANLJF10L//IaEnasOjzYyzPSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDY92lMDdMZjdHe/zeaMV8/O8bSA8kxntCOQtYxeWug=;
 b=eNuxjz5VfvsQai3HvTW+oC47gUqUCYvJPLVlWFubAPLcM0h6B+EvnwlMwxvcApStbGisDDiPcPPZuhZOFixFa43a3HHdz9CjHcdneuzTHJpjqAMO3iua1A6q/bwl+bCocmNw/LINctopWXEVSYbkEEsaZiL/KEjE0YzaNJE7PvM=
Received: from CH2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:610:57::13)
 by SA1PR10MB6446.namprd10.prod.outlook.com (2603:10b6:806:29f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Fri, 16 Oct
 2026 04:31:45 +0000
Received: from DS4PEPF000001C0.namprd21.prod.outlook.com
 (2603:10b6:610:57:cafe::12) by CH2PR12CA0003.outlook.office365.com
 (2603:10b6:610:57::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 04:31:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS4PEPF000001C0.mail.protection.outlook.com (10.167.23.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.0 via Frontend Transport; Fri, 16 Oct 2026 04:31:44 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:42 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 23:31:42 -0500
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69G4VUkZ593387;
	Thu, 15 Oct 2026 23:31:39 -0500
From: Aniket Limaye <a-limaye@ti.com>
Date: Fri, 16 Oct 2026 10:00:37 +0530
Subject: [PATCH v2 2/4] gpio: davinci: Add match data struct for
 get_irq_chip callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261016-upstream-tda54-gpio-v2-2-5c4f8b10cdbc@ti.com>
References: <20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com>
In-Reply-To: <20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS4PEPF000001C0:EE_|SA1PR10MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 6133c167-ba05-4fc8-b166-08df2b3e626a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|261009223027099003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CVk8OoCqoRZL2u0WFLmgheV3HyO2/kFlg1PTu8HCoA4ZcvO2tIIo+2MHNSCKYzYgV7pS5o2fwe9oJH59cIpAynNjTdXu3FQGTCNjMpk6gNNcwJT67IRIRRp6dxPvR6abt3Dp9TmiWugl/CQzRCevgxaWb/ZZefj51lxqBYXsQkq1+l+7xY50qjVzaFWH/DPngEAHuW+ZWnV64hnyZGy8jKrdxR83gLlvBDE2m3NgmR1mqdodj0tPTlFRITiFd6wipSG80Yfi2ChMm6ii9SO+d38nmCpqTLWUprebNyO16BKAwvBcEYkn0MCpQ8VVz4+dogJ9nH6TUHjz1nOAyqMa7PC6N+3zFhgKFiMCwyCjkIqYk8cz252uRk7a7KbmplG43mSflWP1HDMTd3/hvd1GVpHWrfwS5yIqaVpjjU/o9SWKgFRO9bfqf6eOo1UO5UGDBiWy11Edxu7a0t2rVJstMRZ+pwH2vXhG3zB/NV+0xWHldnj6C3qSpqPkcG6iqwfxFr5Yc96LPwgDrmZbPzTLjoll6lv46Bs0NLtZ452pz4zN5L3ybnD5Ar6JttDsdckakYj/ml/kkQiXLSbAQ0TlEOYTbpPlcuXf0vu8fetgkd10q0Zynct0guIyQmsB3hELUGNiioTr685vQRyGfpEKx5D4T+RLckR55fG1K3PhGoM0RTAMYbFbbHSwhR+LfR9VG/Xeu8z3lQoO4xMEdg+9Sw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(261009223027099003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZyKLlTN5XG7C9k5/URU7Uj3hiKrIhCPvpUyiAFYts7G65fwHuYDTDuRMGC8/xfMSDgWw1u0xeACSBYycagiwhWeKC1Mr3PLr3Q4njhavCpp/9lZnQkLw+zJUpQoxS23BOW2slga1kDrrnfTQtxwBMqiHZniV6C8I+UC2BHMqVWeaYdp2108sGe8mDliA7+isATcoihmUawcJh7B8DdrdoC6HE6vk3njmKfYJd72VKYyNZKqM/xe0jEOqps5xkjZHAa8OgGRKp7SdjfsL6IcQ7WxbDIXu4fTR/U0elFq6iczOoTmNULzEGiVqh2yEbyywOJEszhlj10SjKdBic0izMOTqeZOCLCoK1mWfiOFb4RPHfhybgawkUsW32RYySD04uZGAqyQQHu3+upJvTxmI5ne3p/kHtJLykHW7Ro8yRb+8Tp9nixYU38ePRUsS/6L1
X-Exchange-RoutingPolicyChecked:
	gfR6jH7xNEIpMwZjEQeJpJc9yCErpGoymY4DcGcZZG4A1IUBMCWFnIaxP/UrBg/BhvgBHmBddQZR+GhBQeSGLxzev4Lj4667ir2VI0dzjCEXynKaySDHk+0FrFVjsdMXJuw8Qoms/6Wg+KWQcmjrRSsdHC++qWIv+EiQITOCALAHJ4jkkOeCY8+O1ShPH1otNNNRM/Pv4PrFa+A1I2P/+V4riUrJ0zqKRFZRdSsbbrTWSqP2KVwpmoZ4GgGrXY2+kCJwF1s2S/T+zC11w7JJ0LrT2K5WBgIdWpYxttlKVyj5CTOpVVGhJffird24IT9063LuGWxaYCPMv6SrEX77Xg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 04:31:44.7987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6133c167-ba05-4fc8-b166-08df2b3e626a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS4PEPF000001C0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6446
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfX09WUIquYK1f0
 ugnagG76w1ZuEv2v1BdCJYdeemjX8dlPTNp8qsZHcan++x1wz28FBTmNpY8EL2xLGoodMibzOR1
 666sEkFwRZGD7m+8KxcRiHImCxeTXsk=
X-Authority-Analysis: v=2.4 cv=fK6sTpae c=1 sm=1 tr=0 ts=6ad1a8b4 cx=c_pps
 a=1lugHNwfFMYeWqdp2xp0VQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=scuhAdRB1l8OEGLGFK4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfXwu+uQBCHOE6g
 lnEObC/wvZM5CH7yQtAtwur54qBm1m45iXZvHxV5Vyr1DF/iXWuuB314YRIVGw80Fde1XqX62p6
 5ZiCEta5Lj4ldU96J/xa9sUX9WfrZOa1MyNNZXtG6HFU/+adhA2IWmrzmbGB/kwzyWN0CjakzJu
 RarAGGa5VTqu+nqVcgFSC0+2DOQ0E3aDQ4cYv6CwRpHZwtCukAd7n6NPsyA5oKwv3A4stc6/Efy
 X0WicE5VYmsM7uZOtXArwMm0hIk43XEupB/1CX2E7ma2UX61j+mc9WXwUWh/tecuSvfRipZVoVo
 d7IUww8YjOtbK8me1TaY397I7HSjTWFlfj9YoeokYra290FsQvd+WqZLEIhfmP08rz5cMzLN7K3
 WyqqSOukJTh18ey1Kp7QDrVypM/1Qy6Pt/Boj9D3wsKg7un/uXGaKUaIQjodNNlVPixXUb1PuHK
 97Brgvcbqr2p8htEyiw==
X-Proofpoint-GUID: REq8dDpgseH-6SvEQjTAbWQcJiFxu5lo
X-Proofpoint-ORIG-GUID: REq8dDpgseH-6SvEQjTAbWQcJiFxu5lo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160017

Introduce struct davinci_gpio_match_data and move the get_irq_chip()
callback into it, instead of passing the callback directly through the
.data field of struct of_device_id. This allows describing further
per-compatible properties in the match data.

No functional change intended.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 drivers/gpio/gpio-davinci.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index cccbaea1dec24..ab1b465dfcd15 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -41,6 +41,10 @@ struct davinci_gpio_regs {
 
 typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 
+struct davinci_gpio_match_data {
+	gpio_get_irq_chip_cb_t get_irq_chip;
+};
+
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
 
 static void __iomem *gpio_base;
@@ -449,6 +453,14 @@ static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
 	return &gpio_unbanked;
 };
 
+static const struct davinci_gpio_match_data davinci_gpio_data = {
+	.get_irq_chip = davinci_gpio_get_irq_chip,
+};
+
+static const struct davinci_gpio_match_data keystone_gpio_data = {
+	.get_irq_chip = keystone_gpio_get_irq_chip,
+};
+
 static const struct of_device_id davinci_gpio_ids[];
 
 /*
@@ -478,8 +490,13 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * Use davinci_gpio_get_irq_chip by default to handle non DT cases
 	 */
 	gpio_get_irq_chip = davinci_gpio_get_irq_chip;
-	if (dev->of_node)
-		gpio_get_irq_chip = (gpio_get_irq_chip_cb_t)device_get_match_data(dev);
+	if (dev->of_node) {
+		const struct davinci_gpio_match_data *match_data;
+
+		match_data = device_get_match_data(dev);
+		if (match_data)
+			gpio_get_irq_chip = match_data->get_irq_chip;
+	}
 
 	ngpio = chips->chip.ngpio;
 
@@ -668,9 +685,9 @@ static DEFINE_SIMPLE_DEV_PM_OPS(davinci_gpio_dev_pm_ops, davinci_gpio_suspend,
 			 davinci_gpio_resume);
 
 static const struct of_device_id davinci_gpio_ids[] = {
-	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
-	{ .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
-	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
+	{ .compatible = "ti,keystone-gpio", .data = &keystone_gpio_data },
+	{ .compatible = "ti,am654-gpio", .data = &keystone_gpio_data },
+	{ .compatible = "ti,dm6441-gpio", .data = &davinci_gpio_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, davinci_gpio_ids);

-- 
2.53.0

