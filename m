Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23513BFE4C;
	Wed, 30 Sep 2026 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760062; cv=fail; b=m7Rj3OmQXunTZxdnzLWoS3BXwtvPVRcsedJp0sOx8PBb6/vR9ZaN1OKk4UgDG26Pu68b09yToeWQNdpO4XF/MPK8deTyHVmq5ILcSgwz8gMAembkLIMRqtdma1IU9MuROFYe7Cm9VVHp8H6k5kP1GxwmTkfhNhvmvLjmo+Suhas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760062; c=relaxed/simple;
	bh=h6q1f2ayXPssc+oXVHF2Kivn7TbOT0QdzOgz+dmAoeg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sz28OFZ2hnJzZ1P5NNp58tV+mUCSJdqfMaBEa7H2rqOIikOIQO3ehM+aKD4AeNSkhGyL02x4uyNtXbdHHyEtuuv9ldAJqbVU65idWHZk+bLtkklmybki5Zr8uObbZltW4RZW8toDXEoCn1YTEHSW1OhVgSjwUnzisClzLUk49Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=VslNtSzc; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=KhoeHJyh; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="VslNtSzc";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="KhoeHJyh"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7bncl2303265;
	Wed, 30 Sep 2026 04:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=k8L7HGqHs+oXA
	f6wzCHgMvHpZNSrP7S2FomosMoGcYU=; b=VslNtSzcrB+Q34Z3+oojRVy4MqyuA
	mohL8+uGBcA2K6J40MwTM/UhjwP6hEsG8Afq4Oob+MxMotCuberdO/6m5R5500ML
	37wMJVkHkfKB9PP7MHrnodcqvnPp+mNWs/t5GCqp3Np84YWFo+DaD929gw72heNE
	OJPW8QSS8iRDOOikR+fre7qfmvOad0U1aZRA56Sr5VPfUlCiXrXpvI7cWQZsiDBP
	ewsnOSwSQcReDCE/xbv8p7dOHvwp9B9ia0EFEgoM6hHdETcThYlQ4wXDojwyGY58
	5T7GLozgasV7rvw/B3Z4ULE4D8HASEvtxyhk5ztqBfPyVYNAjvi/tJwHw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fc7tk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 04:20:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XakkynfxlEzvF7lL+LM2TQNFTSt44LwB//dkiNPINxeLc9vI6S4L1kci/m1Jnn3mYlghYO3wuptTQ2ZD5GZMm8lly5/EMZvsPJ28FL7Myaf8T/nhQc/y+8+k085xlUkC0if942YO/ro3fjYF+3EzNMN9IIMAbWr9y7MbjK7HHAipVMY9zgNxf4ydOKs7ezNMRdO45ux0S9nfksvguR2qRUYTzfk3oDuyRflueqPXyai6dLIXnGTsQM3DSyVjVsu1EF2WBs176aNhJeXagqYs8N/pcs3Bw7/BFmC3xzt9ETq6icZdvfV4WB1j+HMa1EcsZfUNebla6Qr9ZBlKck4o7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8L7HGqHs+oXAf6wzCHgMvHpZNSrP7S2FomosMoGcYU=;
 b=A1w8pE9vYjIshf1xU/x8WYE0HB7TvPMB/+nY++YEcaNFq1NurALQ3Y21p8mVuDh/IXfhAO6l9KBUcgkBuq5+1+3cI5ubFgsHCaZD9brH7fORkKY0VwFkdEGsT+e5sXhytYKQwmqTzlWQgvTLpUwbaaZ+VdfOjNtbpqrsa7MS9kQbObPMxGsVmrEzmzJAygBmsjNfFEVBw3H5EQCoPFyVqh5tWNBCSTXURPAozTgPcZbI0PF6VzBq6cpnVileUXmTlYVoFHdbSBNxgK7GgTfYyWzZysv/1H8EUS+j+RATKWQ1Av/4C434glWeq93Qz0FJCkmRRR2N0RemtRQ1pu71wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8L7HGqHs+oXAf6wzCHgMvHpZNSrP7S2FomosMoGcYU=;
 b=KhoeHJyhxgtoRnmKHxLKlGJzhPjS46wB4SSkE+fnrjfcl8cRqahTZGEe7a2lQ38eqd4odP4rqAbi9bU3pN41Bwm4i2jcEOs2rx3SFSAURrjob09BcAuU+8rXqL5YxDJImnhiDgrYCg8YQrNzqQ8uK0WkuVGnc3/rWXtDkk7rbkU=
Received: from PH5P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::16)
 by DS7PR10MB4832.namprd10.prod.outlook.com (2603:10b6:5:3a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 09:20:48 +0000
Received: from SJ1PEPF000037B7.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::2f) by PH5P222CA0005.outlook.office365.com
 (2603:10b6:510:34b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 09:20:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037B7.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 09:20:48 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 04:20:31 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 04:20:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 04:20:30 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68U9KQKw2847827;
	Wed, 30 Sep 2026 04:20:26 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 0/3] Add pin controller support for TI TDA54 SoC
Date: Wed, 30 Sep 2026 14:50:17 +0530
Message-ID: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B7:EE_|DS7PR10MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5f3167-def2-4969-27bf-08df1ed41d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|82310400026|36860700016|18002099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MQbQ3NZztN0XfH1lhMqBKTEOAJgg0tNtVMKSZzYQS+pSOr4eQzdspIadUxE7+uCrv5LL4uh0AFlbXUCNY5oSwnM5/r8g+3tvmNpvZtUYgELzPmmFznI56vvrbRKzVl/yV7Oh5FWJzGndKns5mSWONWS334PHsg+nM/A+ky0wmnx3/P6xriNkwnx+GffGLzQDwiYS7wFjzjQFdU4ahRSbJsH/WAgHp8dCGcZhVjBU02QIbc6aTfyE+KD2cn7ytEIaqXZ+AOgI2o3ScF8+aDn00O8kloxDk+x7L5SwLZhctjV7yeXwJhYO9AtUlSaFwb+5W0iwHu623gdqjtF347t9fgCi3XZ2fhaIY2PemyrDMG+4bpyfQmsWnuwfSMAoGqcvVC2GRq2CKvVQ1udSFxkKSF4zUhfK1h17doPKcPD59xEjHt/BhOnE+hUn1+IRP8mmqR4gkYdVGT3RwzXc2Ou9IAvqzQymHwsIg4+hrOZmhWrreDDbWJ86Evwb4NnVOFGjVFrRXtdmC0aYNdLZULTeL2KIr/U9/kzZuGVYgtIcuKgdzHXF6D9Z5EXjs/ZkXPampPsfjJZHLRG7mCxFC3gwYsfatEbbL1sSLXsPAsMzZCcB9i2+r+CpAXvt9eX5CpQvxMxbzbXPUBbMpR71j36oI1Gpmy2pz1HWky3vugrZQ1woAMunknsHnFAjxJutD1Vg60wxJ1pOWmLPSX6aXRtg+g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(82310400026)(36860700016)(18002099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xd97ScRXmFpm+6BfauHim8dEuVr3BV+vuIoDjjlaPbOUY1gSvGz/t22IR0dkE3lJYTumh1slWQFT6vOse1ypx7oUZ70UA+tW3rHbqYTLjHV2AHCoIAmkeAqpfhhhcUruwW+8lx1hDcgftSQp8r/D75Wj8CnDWUi2f5EBmxTho5/Wxm9AHjdK+oG5FxiicGbHXf2JJd9KPwI/AClFsrhX3fKAPheRjMiB7QwEZe7LPYVktzZtLUAXZJ+OK439lKdikvVhmsgm6YnvKyykplTnYjxBYqYMBadLX6Cgtg0kaFCnhU933DrtTzJsQZdx17z2Hvg4lAnePkrR5vE5szNYIxxOkZqCbtZEEaDajzaG9hqP6YU9oHenXAqRbZUwMShU8tP3tvMxiM4LsN2fkqfOnRCtT/VdtwO71H8Jyr1L2+aaH8s3a9O9bTmxXpSubYmF
X-Exchange-RoutingPolicyChecked:
	B8VksOTRw3ZIdZppS6zGlIMzqTDONUP+eAj6TaN3fHIvJmHBKDZh1lNFdHHwhPP0a41js5usXNFIWrQopeA6Am8Awn9KOhAH4+FSBXbxy2nVtIDCKRKvxUwu62KyeKCerR9jqFlQl+kg1Y3ViaCBXWfbXmvrDGdRhprqvjk9siaiSTOs38NlT9LNZ/7ljugbaRWz0kWOsvJicZs7A4jz5fbCRS/9aU1bb0VqzoIMx/sTjIbSUZkezj4BXoZ95iCQEfox59+cWF1hFKkaKq1aeUeUclUIo0SRFvfGeN8HKm/bXHDe62f8KJslAZINrDaPNk4mK32r5jcNvqeJEE5n+g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:20:48.2506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5f3167-def2-4969-27bf-08df1ed41d55
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4832
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abcd476 cx=c_pps
 a=WxwGY4H08PlrDVivH1wjUg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=LDThxOofbWAjp33PbZ8A:9
X-Proofpoint-GUID: bmMtNecg5N4EDMYmGLpfG88oQsT65FlN
X-Proofpoint-ORIG-GUID: bmMtNecg5N4EDMYmGLpfG88oQsT65FlN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfXyd1tsOi+kC2+
 +XPbgV3BsENinkWRF/RrNBg13Ymq8Rc3AZ8nkv5Tc8rMsCPtokOS8upjYcdgmntyFAUCSTgnrBd
 4/8I4BshTYCZ1hMeT5Q2tmJq5OHr9+5iV3hynU29XzK8uqc3EzipF1d6LpeTgPKCLFu8r4963oS
 bDt2FjCVgXSpvrwXjMYdOxe5EVuxcw8enyOAutLiAX+aJcV3AUoBKv/3QaFxBcY+ASZhopX3x91
 7TBOxx5AEeHEOVME2kBIUlHCntKtO7DqEvkFJdMApNMUO7nOe44jf6c17kMcO6MgI7LFf2PPM8z
 apGkC4gsEFKW2xWnnbwN+Ybkl2X2hrBc0KoOpMnj5aJRfVNtYnTtIldi1gqwIDikpc6rsmkP4p7
 RtDtK3OlnxxFDHIScuobPq2yZ4YGqbawOq9WD2GBxN+qGL1OZ1ztkHVMQ6u9YTNZt2+YictY90p
 T4Awf5YV4KOSt9UzqoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX4mQIr3hH9Rhn
 gmpchYbhnK92+L/iPMBwzF3kxvTe5Z79xkTc1hk4AVu+3IEVmOXRof5lAiZk8fDhu+xe0Qj0oFJ
 /FhSWgRw6q2roStmiY3kqdjcEDKQbLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300037

TI TDA54 SoC uses a different pad configuration register layout from
other TI K3 SoCs, splitting the pad configuration across two registers:
PADCFGA for functional pin configuration and muxing, and PADCFGB for
wakeup and retention. Hence add a dedicated driver.

Note: I understand that patch 3 goes through the SoC tree, but is included
here to give reviewers the full context.

Yemike Abhilash Chandra (3):
  dt-bindings: pinctrl: Add TI TDA54 pin controller
  pinctrl: ti: Add TDA54 pin controller driver
  arm64: dts: ti: Add TDA54 pinctrl header

 .../bindings/pinctrl/ti,tda54-pinctrl.yaml    | 209 +++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/ti/k3-tda54-pinctrl.h     |  29 +
 drivers/pinctrl/ti/Kconfig                    |  10 +
 drivers/pinctrl/ti/Makefile                   |   1 +
 drivers/pinctrl/ti/pinctrl-tda54.c            | 794 ++++++++++++++++++
 6 files changed, 1050 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,tda54-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/ti/k3-tda54-pinctrl.h
 create mode 100644 drivers/pinctrl/ti/pinctrl-tda54.c

-- 
2.34.1

