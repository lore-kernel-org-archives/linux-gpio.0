Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C029BD9A;
	Fri, 16 Oct 2026 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125162; cv=fail; b=dxLpHaBrvg5k/Vw3H9oXRKVXOyF1mOeQVE5jc/S+pDf1y5YHZKzWJsNI9PLGvXLj79ovxRGWJV5DCYB8WG7tJ+rsGKtggHpbpnOokAFE7trqs4GDpf/MbcGc/liQs7XdgA1FhNKpTPQ0euV/clwRF0znzPje+daJgYpYdylJ4WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125162; c=relaxed/simple;
	bh=QRolHkI3NAZL0h3+uAIC5lCWGsRXcb0X1/2obPMB8W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=i9ov3u70ofAGmbTJtEuOjEwx/2RX9qSEcyc6/ZLiHeHpKvTIJboZLpv1fGArz8K9/aeyi6oBudrwuCZ/qLZqR/BIBlcYD66hYuECmMvYItQp96ijy3MNcDEtbtqgrgyU5mUCu9oz6jwLTi63iCcZqkquGS3aOd52rqXGrLgdIUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EK5lt31b; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ZpuTAdD2; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EK5lt31b";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ZpuTAdD2"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2sl1C2484849;
	Thu, 15 Oct 2026 23:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KBxZ1niohUt7mFnY5zbiWUTEN9EpHDfXR06cR4QBQ
	UE=; b=EK5lt31bM6HWYPhh+jFqOWoV4Lwa1mQ7Z03L5fOrsyVOJEDRv079rAtfU
	ui4gfFmHL477LIOk6Xf3iqWwr91S2qZgz3sssofO0bYjVxfINRbqjkpH67oRiKW3
	oeZSwuAhfAILH5Lst2ZHSTcCpOo07VFOHIBLWk6RJOHqEsVH38y6IcAoBz5aNUlg
	6fmZRdYT4lKvyVR3IzsIHcrGPlpOW1TcgYCq2R6CWpbARNPCoFNJd+/WhFlpJoyK
	DUtRLjbu1XrkxIdJ1fwngFUZNvOwIju/1cI7wgUCKErpQWOlsHfkEMXJSHCEYUr8
	QnWS8KcNAp9MlFwsky/QzPyd4haAQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013024.outbound.protection.outlook.com [40.93.196.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hb4nyth5u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 23:32:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDHeQCr2D3Pu+Gd3QeR+LgCjWz5Zm0YbPqZEGu65ySbttbktOsbEF6ibIuEqK1gR4XT+fuKKy4ARkvXHn1SYfSCkYnP31Np0yUAg/QeWY3MPjH4g+P6UsmUww1eH6Aurh2sh9e2B9VwwHIXJ20oV+rmgzoHMdgBXRnlV4ZjpmGedxaQ1v9NXg+hzZTW6yiKyfs6t4wkEwcAt91TVMmRjzuGjxYWcnLaqVdXD5biZCNmN4Hqqv50rw0h47jvBO+icLPcodpNEXFzRUbxAK5Qpn4HXEJg7IHQFoexssAlnQhYCJk4EOYSH1FKwmDInGsVo2i/SD6YNRZipiYqIQXEXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBxZ1niohUt7mFnY5zbiWUTEN9EpHDfXR06cR4QBQUE=;
 b=L6ty9Fchy5myUIc24JLA9F0bBjzdXKWnsEOIYXZOukq6aAa34HbnTLz0K+PCTH0JIkaEnydT4bidhZB9tOui0/YAYwXdG/Exd2gPUpkj0RO7qLGs0eNr9MBX7g4cS4jXrbTyIrVG7OOP0Ur7uIcMKbQpFwdhyH8PR2IPEk3eQe6QczkdCGIRCIKqG1axjQlMLXmRz8apFD2JYSLjwbXL4h5yVYXhAYNUZeDgbEelK9W3TbPV4V+XXUCqOJsh5q/YiAHlRbTb8BQknlEo5ePx78QIKhZNROh2AQYjHR4zziLbUSm4cvBz1A/W7z0w/khEg+g5JlNEmloew13Jhj6kNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBxZ1niohUt7mFnY5zbiWUTEN9EpHDfXR06cR4QBQUE=;
 b=ZpuTAdD28PEMGkIWYdongFg64JYYzijHlFu/AJ2yBZgxHnODfzjN7zcDOoS+YuHwtzj9jCYDi81MNmFHdY25S+Yl9P4CHUE5+9xkPvOCKP0WcXCpxheX0ArgPgbfEsQ+Se6qf+CnybdzwMKVlhL0kqHv1pCewdYvkLWkGxNFNKc=
Received: from SJ0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:2c2::8)
 by SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.8; Fri, 16 Oct
 2026 04:32:36 +0000
Received: from MW2PEPF0001467A.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::85) by SJ0PR13CA0033.outlook.office365.com
 (2603:10b6:a03:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 04:32:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW2PEPF0001467A.mail.protection.outlook.com (10.167.249.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 04:32:34 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:49 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 23:31:49 -0500
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69G4VUkb593387;
	Thu, 15 Oct 2026 23:31:46 -0500
From: Aniket Limaye <a-limaye@ti.com>
Date: Fri, 16 Oct 2026 10:00:39 +0530
Subject: [PATCH v2 4/4] gpio: davinci: Add ti,tda54-gpio compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261016-upstream-tda54-gpio-v2-4-5c4f8b10cdbc@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW2PEPF0001467A:EE_|SJ0PR10MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b14fc51-46dd-42ad-4de7-08df2b3e7ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|56012099006|261009223027099003|22082099003|18002099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	t4dYbN9TGKjJ7A0jUy+VCshnBBcfLy+Gx5o0tDEeYQArPePPwFgkHhD/pYMgGKhIh0vNWbUfWbXo2JHUtgqS/GIe23tjUKXNGhybeGjHSn6KWBK6OUNWz4ZwbY8ZdZoM6QBuiBuHouSpWIGK+j0lnQu5SAj5MnVyVXUSC3DC3ey/VeRz9R5L3lntlhCT0UxKEyuHVcSDTiKxuYihaRWW16pZzjH3nqu/45L3CTIT6t/Vj3BIW503LbZ/LMN+wPWIsZxRf8A6RklYT7jvvS+3FbTbKmUt1kXEZamQBxq1QamGeRIxsQrsRyxChevyk7JdrpsrJZxXYXJCO5vRjwaxEY/TB5O+TT1kXUBQfnM8sB4wie/yFenvvl1qFg0oZzmTO+VrPpGAEqBKxAc0PYkize6sbZgGDmov9ZT9r1q52BvCfGwpr+NavTRRduZNwgSKT9vIezgjhcxb5Bwkod2RGINo4xpe0fwJUWkYISb9z8t2dUy3/ofH6SwAgMhWwASWXyS41EqleHqZlbFNYLvIyNu4J3+RSnYpgJt/wg13mINt4XJINHrQ9bbJ4/CJHons0LWNyXF6V+kXdlBx8UWHIAYUy36uYOI01a5du624RcQVM77DmjpjoOJTME3AzqJxg6MzNNvfQ6Izco4qksBTW7xtS/10XgVNaugDgWLBPxLq1pOZgQQUb1Nb3v89oZc5jXi+smgy+Ai4oVVH+L9m2Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(56012099006)(261009223027099003)(22082099003)(18002099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y6/T1ayoz/KgOhUfr9hCwZOsNw2iDbjRLN+UDyVMy/Se7cUfqEHkcaG3u8+Tf0sHxgERrEUBeiutq+E4DlMeym+sjIbRboA74Bx1NR3+oI0B9Hsz1GuE4Ldr67Uid3n2zRhT+mg/td2GUx43l/VNm3oB+V/XQM+0FthYDrFWiLS2uMECImi6zY11ChTybr/ed/7smCybCLoCtg8vaTHj8TNLL4q1BG2nK8kgGIRN1RlRK+LeOhEKDbzwBmennyvDVIXmByJK2QD3ytshuZRK///NRCN4MVYJek4QGjlMJhKqokQlZ1GcbktKWvjOF381I2XnMLwZoDvVBYI365qDKDAh6pJ5Uz3uduKvKHCuq6FsFi/+Pb8FJRJ+44uSzYA+uopA93YfYVMS1pWyKK+5izMHYna4vtH2nAD2dmo2QF3W2PSoUGyBJ0tQNZls5g05
X-Exchange-RoutingPolicyChecked:
	OWnnO2wpY1weNrY997LNS+DignrPLjiQbEJwoNPzghBKagyVt/BR4Are/D+vJJ7zR4Dz1UO7PEXEJTXiXb4cg0X9+IQOUOnD66EvAhLuGYEcATcxi+ldHaN0CB1pbNq1nk/r7inB3tyg94ytk517WUfhUvc7sbVbvuyisvbu5Vg9HeGSiemOHff9dgo9MUYx0BS913+W/FdNro+UMqvfGMyZJFYffgI6j0AVejapG01Vlo+EeaShQ6hTendOGQAczm8Z/NfKKLKGaMsKLRBR1OZIRejqHqKVBabkiWYhfu7PpVLSeeKnjuJgU4lCMoLedi0277hOPM/UOpz5o2x2Fw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 04:32:34.3266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b14fc51-46dd-42ad-4de7-08df2b3e7ff3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF0001467A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4542
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfX7fZrwcrALMPg
 CafY6EC0F70I+gofNUMgWq5h0cIa4SVpA+OucNBJehRnh/OpnMUfCwSWVd7v3zB3HESEom7UpOV
 Q5JuS4A2svQGSz4sJydi85eDgDETsow=
X-Proofpoint-ORIG-GUID: wmJc4AQ861jZlw8XxuHKDu_J48ZsTcA_
X-Proofpoint-GUID: wmJc4AQ861jZlw8XxuHKDu_J48ZsTcA_
X-Authority-Analysis: v=2.4 cv=FMWOVOos c=1 sm=1 tr=0 ts=6ad1a8e5 cx=c_pps
 a=SvXgiSASQu/JPdBzctYFLA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=dobktXTTa06qOYsQkFEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfX8IAZrXuiaMMq
 K3Wq2MIjUuV8MN1jA2WDwG875WE6iithW/XeY7oRnP0memr90mBUXFJeiyzBLwT+8KOyCkVcLMS
 ZI9eGjL/Wc6A+09oukNkUHiN9X+Ct2HL7xIrRiOi5A/1WWS94y/ERQipof+WI9PKTPekprAjcAV
 xpzHzofcjkzVGO4TaFQhYhYMjIQZ4ag1x6stSfpBXEs26HLbRCrks6HsNGOtUYfRR+c6UcS4IKg
 SPOrRwKhHHK7gq+aDlwuikdMbocVxSxJh7mDoeotNF4Jwbi6VdB2HIkTxPR59IdCx8vljnGwiLR
 xHTCLghmq7na4lL4nAMxE04/Ua/OVSqF/HroDTLxFo1pXllArROK2HRJrxsjbccG/ayKYKDrsio
 Y70wB4ty4kHUJr4wzsl9gJZo7rR6llEA5ZkPqOsVVoTFP3lXMEFzRnl7RByxCyXoscNlK1GvU3Z
 vSf1uR9gUDWZp2P8lhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160017

Add the ti,tda54-gpio compatible with extended registers for
level-triggered interrupt support.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 drivers/gpio/gpio-davinci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 8d0ebf4afd169..db1f722693e0e 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -535,6 +535,11 @@ static const struct davinci_gpio_match_data keystone_gpio_data = {
 	.get_irq_chip = keystone_gpio_get_irq_chip,
 };
 
+static const struct davinci_gpio_match_data tda54_gpio_data = {
+	.get_irq_chip = keystone_gpio_get_irq_chip,
+	.ext_reg = true,
+};
+
 static const struct of_device_id davinci_gpio_ids[];
 
 /*
@@ -791,6 +796,7 @@ static const struct of_device_id davinci_gpio_ids[] = {
 	{ .compatible = "ti,keystone-gpio", .data = &keystone_gpio_data },
 	{ .compatible = "ti,am654-gpio", .data = &keystone_gpio_data },
 	{ .compatible = "ti,dm6441-gpio", .data = &davinci_gpio_data },
+	{ .compatible = "ti,tda54-gpio", .data = &tda54_gpio_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, davinci_gpio_ids);

-- 
2.53.0

