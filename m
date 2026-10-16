Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104A12F3C1F;
	Fri, 16 Oct 2026 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125162; cv=fail; b=chByzdQ8r2xcLwz9EVrfcRsJ8AmpMSfzGQq6DYBfN3fTFfcDsPaAKzxqN72tOWUJr1FSEFh4Vru/m2Zz7dbRx4JqR1RkKcpBjrUxG08LgDLkvg7Lnv2cpz/sbOGnodk2VjMSxZVuEfGZSrV04kIV4mHilHyUkNqr7BadVsIi4KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125162; c=relaxed/simple;
	bh=Tgx7URc7oMfyG7vag8JxD9Rl2R/YGmoGZuGjyArHL2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Zeek9NJ9otIzTkPkbO0Kr22U1LmX+9nP9fgMFaAEoZigRqGBVIv4XX8eRUfT27HTaQVsJMztbLo5dKH/5aGmvWS68h9RJQxaTlrj2MwqAa853xAljx65LDlYMM3xRi3jcATjHwJ7MvEGiQpLz4IDjkTY13+UCXls6OctI8ySNWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qunhcPec; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=V09Pald1; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qunhcPec";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="V09Pald1"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69G2YjnR2062727;
	Thu, 15 Oct 2026 23:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xDgOCyMhd12KbbKjvoha1Hx3r+14+aACvXJUs3zJ1
	Jk=; b=qunhcPecKJ2B4UeO07a2BZsRo3ybIYYh97nq8XEwutoTko31f708zq/ED
	jplFcI6xlyAk+paZ9TPqr2gU+STw4Z5e64i67b7ZZU39GHnQo+ko7OUmhnIIIGJe
	cHESncGi7KDvFJGG7meS1UjIGVTk56MDBDhu+9hjt1t7jw8xsS/8izOF7fxsYZjH
	CyDjc7fTujihklv/YQzIztW0I5p7ZPDbx/L7naEmHlVcxSw/mkF52zgfNf2bTJQr
	vcZbKXVhYQndppVbuQop7UW9GV4Md4BVQLAbhhUq6jW44GAoS5alcIbEZG0wLyQ1
	z/i+Ll8tSg9ephmV5F9YUZdaro0hg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hauwke05f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 23:32:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5l+vE3f0N2vTvP+Cxp6LKjZba1tCcP0Ey49WQwRXg2wTm2hriooOiWM5whXnj/YcM81DSbTy2QFoVTuB+TjvUdCfopE4siDJF9lBWnBvHgdGfhP0ZPzbdzw0D8CHEn4jdEtO+hWPx8urzdGBZFZyqBbExrSskoggLMmBeuA4YfftTrU+CUde9GKtfpPHRmUE0zlYASBhZWhXdQsvC8rBzSkyoN2O5/EQt/xonhdsq+ZYDl/mEZjUHGYpahyty3tgbm8awh34Wc5+qcNgfKJNvv+Lr/evWGJIBEMyJGcwKMD2N98e6d2zT+XxUeTMNHxq5R9kY9AiyTy9C4860kgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDgOCyMhd12KbbKjvoha1Hx3r+14+aACvXJUs3zJ1Jk=;
 b=NL4xTiqdNCMTJlOTcx+kDSXNV/i8AOQKHEdcdz5hmaqJDk4l26YVgfpNAE5jmInXajVf51K+Jt83uK2hcRsua8CRpXsy2tF5XV2EEGDSgY9eIOYs7Yah49Olypc7uVZhzX3VSz4Yhk7wjPBG1nC0wRHu7JA2B+Lm/pknCRsqxtOu9TO93qa7lHMMNSv6FJwwrMCdV72c16YESoWzLOMRk7AaWlO7chIXVWA4vMWeKeARjJiqoDI+2vLPFBb1kKOAsNU2FP5yzUKUkg9gx2Ax4f4utbACHmaqO0mBEli+J2oJUROk0OjY8YL1n2zpgdBzKkg6CxznjR+uPtdAQ4Tngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDgOCyMhd12KbbKjvoha1Hx3r+14+aACvXJUs3zJ1Jk=;
 b=V09Pald1fWZ5svFrsbnEPyr8cZlnYCg5qo+fTsoIE3KagmesduF46m1J3Yn5B2kFWb/ZXvY3TAdijfH644qL2QNxmHPeIfoXnPw0g9YDFWdmGbnZYQDPUmLvxlpRaBnLeraemhmJ8Zn1lU8pFxEYYTApJdE8lGUGzy9TO1kzEv0=
Received: from MN2PR01CA0053.prod.exchangelabs.com (2603:10b6:208:23f::22) by
 IA0PR10MB7232.namprd10.prod.outlook.com (2603:10b6:208:406::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.8; Fri, 16 Oct
 2026 04:32:34 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::41) by MN2PR01CA0053.outlook.office365.com
 (2603:10b6:208:23f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 04:32:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 04:32:33 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:46 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 23:31:46 -0500
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69G4VUka593387;
	Thu, 15 Oct 2026 23:31:42 -0500
From: Aniket Limaye <a-limaye@ti.com>
Date: Fri, 16 Oct 2026 10:00:38 +0530
Subject: [PATCH v2 3/4] gpio: davinci: Add support for level-triggered
 interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261016-upstream-tda54-gpio-v2-3-5c4f8b10cdbc@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|IA0PR10MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: e67230e2-24cf-423f-aeee-08df2b3e7f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|56012099006|261009223027099003|18002099003|22082099003|10067099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	TdBbhyFXCDm3X9T0+/pq+w7q2JjNauSfcguylbCfwmSjdTqT26wc9cimHHYn2fAZntXGOe6E58jmsKNTgQOt/MZKIoPNSz09kGnOhreVWRfatxh9/EX+UjqUN7QWQAE0ep+N6OGo4iTJ6g1Zx7yhj8otpd/mCzC3sv/6FeIxVMWoyt/0jwj2DFaioSHVB8WQDE9BpeAXI5Mog83gROlPdJJdM3c0GpTR1WcrX+mwzBXuDX3AqGZWN9ldnQbfBf/48SbmHe0CNMH0FVHDvmPasU1bLGS01liDxqvde5fkzTvhqzcP4lbLo/PLgDSvSf6YM8ETb+NhU5LH4PC9vry6XiiWMGG9cxWEvXzVqWqq0Rpi7YCCco5ajw8uj0/3B1ID2to3E7X/mnW9mUaWtRUFBpliRWeIOcRMztvi8A9V5aUTuwWNExyAd9qVoV/8TF+dR9YDkyMyInJ9JmID1qWmDwbtsVzgYvOvSWgvf1GYRYImOblUC/4fNvoXywLoUiqMy+v5wzxRTZ9Q7Y3Iak9UlwaMsd3LHJG68H4D7tdPhqBN/Ep+wlDP9dxJzz05INZ6T9uLToBtbOJmLs+4ZY3Wck9nMhT2r4Vq9Xbs2AiDB0NSlHy5MayCIkAXCzJPyWHZP9ociWsOuLE7b0B8Z6Q/6g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(56012099006)(261009223027099003)(18002099003)(22082099003)(10067099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LKexed8R2K+DqrRilm9AfmlASYvUwDfIukXYpsyX4L54UnH+VSTnaPXMhJX7yPexELHtWaGgCf5el3Qd5mJeOeNsL8NMVY/ysgS6aXqhl6ZD/sC8OCI6QnJyt9BzZ4PACY1W/b9U3IH4ig0pVhtElnnbs+dWq1D8NsVtqfTUBcSmQYFuPTq2V3Zs5XtO1SVDyrbg4lmMt0y6ZWp9UNehl3YoW0gVuGlWhk5ocgj1Cse8ILOdb5zol9L3/pYMUT6ANB8uiEblAVRYYQg93WR6F4qjFG2BpL4PbAsyx67LUUY4VaOWzoJR33qCcgKpX40PRe243cLe27S0fLYOv7azfLXH95U7e5Z2a88F+SlPi163GdVsPNdtatDMXK54OByq6H0oV/vPT8MzcboRD1b5xlfGGcjBi6qkewhW9YMCA4IBhDccedo1Ttpjj4NI6qJu
X-Exchange-RoutingPolicyChecked:
	v/LCQ+jFHJ2ujadmM5o7BjHC7u2CqS2pf3soE7+c3kglo3UkHlTFj6mnRhfIhy0bIknPX2cb52btqqi7wLIdXS0/RpWh1glPXhQr3BadwYbsvKMkhwfHVK+ixSq41ZIL82xpoWHrXLCORdpZMKIzpZ2vp34FLbpvSH9Y3HOIsmU5r059eWPPoaGh3jmQsEcJlQHhpb0AkZ6Hh5JZG50pOr7qq+cTQIdwyZw7zCsG1QJfp9iOVb9+ulTNCarq+CPue907EyPXX26MQtDLcVkbrQcqRIg+6f01i7Wg/SVbR2LVllnHUshqKwqhH59cQRT76YxeIsBjhU5FSn2X55a/6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 04:32:33.2422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e67230e2-24cf-423f-aeee-08df2b3e7f4c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7232
X-Proofpoint-GUID: jAI1qba3wYalPCZdbyeP1XnpuiMp2Swh
X-Proofpoint-ORIG-GUID: jAI1qba3wYalPCZdbyeP1XnpuiMp2Swh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfXy7gYQsfYb79v
 jn2we0lgDXWZQg9hOJ544iCtHCiIvehDFSwsBoTWT7oq8M3AAQ7cDTLtNKLKjZVDWuCowR3jMvM
 HROqw/WpBHo0mPfLITNyGkoaEZa8QSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfXzfANOr5+BwfC
 J1mkCualOLZRPTGgg8GYGNH0VP09bnNGFub25jtDaJ7J2vByw3Vnk2H8/uLeCnnRN9aZDK41jwo
 2DEhgmcdHsm+dPMQ5906/rAIx8YOu8P8kGImLkE2O3klXJy0YpjuXjxc/dLAajdFmLgXuaq05ls
 U9laveNZGSGCiiQDSjqgUh7gX8QKewKASkVWSDhQVS2Ly+4XENVQz+nf1SgQ5FTwZqIdjBUfJT0
 2FVdejTC8aDmnDwkH4zUSgBce1y6QnCXnxRmGsdxpaznkqrmzVwOmdQcOX6qLcbkpggS0Sb7hpe
 ZvVQ2dNYX281Q8PWtw7YfettWQr6NkFFL19CMS636rFtIrtOEc0nOIY0FK1xLFnxRc4go66qI1q
 RKpC9vZxhqyCPGu8iOmI18Tem1DCvFR1o3tIhJ5bcY32nJiacV0h4SwFQtEYFbzy0g6DokSul3U
 biIVxDj2bAoX/eWd0DA==
X-Authority-Analysis: v=2.4 cv=DOsacCNb c=1 sm=1 tr=0 ts=6ad1a8e6 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=RjqJ477x7VvO0F8QJdkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160017

Add support for IRQ_TYPE_LEVEL_HIGH and IRQ_TYPE_LEVEL_LOW through the
extended registers: set_high/clr_high/set_low/clr_low. Extend struct
davinci_gpio_match_data with an ext_reg flag to describe such
controllers.

The level enables are cleared on setup and are only set when a level
trigger is requested, so the default trigger of both edges is
preserved.

No existing compatible sets ext_reg, so there is no functional change
for current users.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>

---

Changes in v2:
- davinci_gpio_irq_setup() now only sets IRQ_TYPE_EDGE_BOTH by default
- For level-triggered interrupts use handle_level_irq()
- Link to v1: https://lore.kernel.org/r/20260923-upstream-tda54-gpio-v1-2-d1a0a199c836@ti.com
---
 drivers/gpio/gpio-davinci.c | 113 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 108 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index ab1b465dfcd15..8d0ebf4afd169 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -39,16 +39,25 @@ struct davinci_gpio_regs {
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
 
 struct davinci_gpio_match_data {
 	gpio_get_irq_chip_cb_t get_irq_chip;
+	bool ext_reg;
 };
 
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
 
 static void __iomem *gpio_base;
 static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
+static unsigned int offset_array_ext[5] = {0xd8, 0xe8, 0xf8, 0x108, 0x118};
 
 struct davinci_gpio_irq_data {
 	void __iomem			*regs;
@@ -62,9 +71,11 @@ struct davinci_gpio_controller {
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
 
@@ -172,6 +183,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	unsigned int ngpio, nbank, nirq, gpio_unbanked;
 	struct davinci_gpio_controller *chips;
 	struct device *dev = &pdev->dev;
+	const struct davinci_gpio_match_data *match_data;
+	bool ext_reg = false;
 
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
@@ -194,6 +207,10 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get the unbanked GPIOs property\n");
 
+	match_data = device_get_match_data(dev);
+	if (match_data)
+		ext_reg = match_data->ext_reg;
+
 	if (gpio_unbanked)
 		nirq = gpio_unbanked;
 	else
@@ -239,8 +256,11 @@ static int davinci_gpio_probe(struct platform_device *pdev)
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
@@ -271,10 +291,15 @@ static void gpio_irq_mask(struct irq_data *d)
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
@@ -284,12 +309,16 @@ static void gpio_irq_unmask(struct irq_data *d)
 	struct davinci_gpio_controller *chips = irq_data_get_irq_chip_data(d);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	struct davinci_gpio_regs __iomem *g = chips->regs[hwirq / 32];
+	struct davinci_gpio_regs_ext __iomem *g_ext = chips->regs_ext[hwirq / 32];
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 	unsigned status = irqd_get_trigger_type(d);
 
 	gpiochip_enable_irq(&chips->chip, hwirq);
 
-	status &= IRQ_TYPE_EDGE_BOTH;
+	if (g_ext)
+		status &= IRQ_TYPE_SENSE_MASK;
+	else
+		status &= IRQ_TYPE_EDGE_BOTH;
 	if (!status)
 		status = IRQ_TYPE_EDGE_BOTH;
 
@@ -297,6 +326,31 @@ static void gpio_irq_unmask(struct irq_data *d)
 		writel_relaxed(mask, &g->set_falling);
 	if (status & IRQ_TYPE_EDGE_RISING)
 		writel_relaxed(mask, &g->set_rising);
+	if (status & IRQ_TYPE_LEVEL_HIGH)
+		writel_relaxed(mask, &g_ext->set_high);
+	if (status & IRQ_TYPE_LEVEL_LOW)
+		writel_relaxed(mask, &g_ext->set_low);
+}
+
+static bool gpio_irq_trigger_valid_ext(unsigned int trigger)
+{
+	if (trigger & ~IRQ_TYPE_SENSE_MASK)
+		return false;
+
+	return (trigger & IRQ_TYPE_LEVEL_MASK) != IRQ_TYPE_LEVEL_MASK;
+}
+
+static int gpio_irq_type_ext(struct irq_data *d, unsigned int trigger)
+{
+	if (!gpio_irq_trigger_valid_ext(trigger))
+		return -EINVAL;
+
+	if (trigger & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+	else
+		irq_set_handler_locked(d, handle_simple_irq);
+
+	return 0;
 }
 
 static int gpio_irq_type(struct irq_data *d, unsigned trigger)
@@ -307,6 +361,15 @@ static int gpio_irq_type(struct irq_data *d, unsigned trigger)
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
@@ -391,10 +454,12 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 {
 	struct davinci_gpio_controller *d;
 	struct davinci_gpio_regs __iomem *g;
+	struct davinci_gpio_regs_ext __iomem *g_ext;
 	u32 mask, i;
 
 	d = (struct davinci_gpio_controller *)irq_data_get_irq_handler_data(data);
 	g = (struct davinci_gpio_regs __iomem *)d->regs[0];
+	g_ext = (struct davinci_gpio_regs_ext __iomem *)d->regs_ext[0];
 	for (i = 0; i < MAX_INT_PER_BANK; i++)
 		if (data->irq == d->irqs[i])
 			break;
@@ -404,13 +469,20 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 
 	mask = __gpio_mask(i);
 
-	if (trigger & ~IRQ_TYPE_EDGE_BOTH)
+	if (g_ext ? !gpio_irq_trigger_valid_ext(trigger) :
+		    (trigger & ~IRQ_TYPE_EDGE_BOTH))
 		return -EINVAL;
 
 	writel_relaxed(mask, (trigger & IRQ_TYPE_EDGE_FALLING)
 		     ? &g->set_falling : &g->clr_falling);
 	writel_relaxed(mask, (trigger & IRQ_TYPE_EDGE_RISING)
 		     ? &g->set_rising : &g->clr_rising);
+	if (g_ext) {
+		writel_relaxed(mask, (trigger & IRQ_TYPE_LEVEL_HIGH)
+			       ? &g_ext->set_high : &g_ext->clr_high);
+		writel_relaxed(mask, (trigger & IRQ_TYPE_LEVEL_LOW)
+			       ? &g_ext->set_low : &g_ext->clr_low);
+	}
 
 	return 0;
 }
@@ -421,9 +493,11 @@ davinci_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 {
 	struct davinci_gpio_controller *chips =
 				(struct davinci_gpio_controller *)d->host_data;
+	const struct irq_chip *chip = chips->regs_ext[0] ? &gpio_irqchip_ext :
+							    &gpio_irqchip;
 
-	irq_set_chip_and_handler_name(irq, &gpio_irqchip, handle_simple_irq,
-				"davinci_gpio");
+	irq_set_chip_and_handler_name(irq, chip, handle_simple_irq,
+				      "davinci_gpio");
 	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 	irq_set_chip_data(irq, (__force void *)chips);
 	irq_set_handler_data(irq, (void *)(uintptr_t)__gpio_mask(hw));
@@ -481,6 +555,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
 	struct davinci_gpio_regs __iomem *g;
+	struct davinci_gpio_regs_ext __iomem *g_ext;
 	struct irq_domain	*irq_domain = NULL;
 	struct irq_chip *irq_chip;
 	struct davinci_gpio_irq_data *irqdata;
@@ -551,6 +626,11 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		g = chips->regs[0];
 		writel_relaxed(~0, &g->set_falling);
 		writel_relaxed(~0, &g->set_rising);
+		g_ext = chips->regs_ext[0];
+		if (g_ext) {
+			writel_relaxed(~0, &g_ext->clr_high);
+			writel_relaxed(~0, &g_ext->clr_low);
+		}
 
 		/* set the direct IRQs up to use that irqchip */
 		for (gpio = 0; gpio < chips->gpio_unbanked; gpio++) {
@@ -575,6 +655,11 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		g = chips->regs[bank / 2];
 		writel_relaxed(~0, &g->clr_falling);
 		writel_relaxed(~0, &g->clr_rising);
+		g_ext = chips->regs_ext[bank / 2];
+		if (g_ext) {
+			writel_relaxed(~0, &g_ext->clr_high);
+			writel_relaxed(~0, &g_ext->clr_low);
+		}
 
 		/*
 		 * Each chip handles 32 gpios, and each irq bank consists of 16
@@ -614,7 +699,9 @@ static void davinci_gpio_save_context(struct davinci_gpio_controller *chips,
 				      u32 nbank)
 {
 	struct davinci_gpio_regs __iomem *g;
+	struct davinci_gpio_regs_ext __iomem *g_ext;
 	struct davinci_gpio_regs *context;
+	struct davinci_gpio_regs_ext *context_ext;
 	u32 bank;
 	void __iomem *base;
 
@@ -628,6 +715,12 @@ static void davinci_gpio_save_context(struct davinci_gpio_controller *chips,
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
@@ -638,7 +731,9 @@ static void davinci_gpio_restore_context(struct davinci_gpio_controller *chips,
 					 u32 nbank)
 {
 	struct davinci_gpio_regs __iomem *g;
+	struct davinci_gpio_regs_ext __iomem *g_ext;
 	struct davinci_gpio_regs *context;
+	struct davinci_gpio_regs_ext *context_ext;
 	u32 bank;
 	void __iomem *base;
 
@@ -658,6 +753,14 @@ static void davinci_gpio_restore_context(struct davinci_gpio_controller *chips,
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
 

-- 
2.53.0

