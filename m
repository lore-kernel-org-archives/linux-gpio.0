Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860F3BFE4C;
	Wed, 30 Sep 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760068; cv=fail; b=g3PWMhF7WoH2tBdLcfmuRr4UTBSvap80CfVI8jCfYXVBYL7Ye46IkPsBPUd7niLyaQGIZgdpIcUdvhStxcy02TDAoHivIN+edXPdjoa0FmTVjqtCKwS/5ri8UnPz4KJM30JbTSjDtNmzvXHm53tUi0KEdpZD4xjSru9GO/8G/64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760068; c=relaxed/simple;
	bh=ERQymb9WPlcD97NjyX4yxFqcMPjApDLqmIojYYYnpYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZKAUgiCNplhul9AnHYELdTmVJbjlfK3FZmt9Lc//Mz/HHz+knRci4HfUEUwGN1GxKyZFVxgbfMtPIrIum9KdX/Yh8LaIsYDrCfUcwlORRji/5qGu7H4Wp4lPQycr+ixTlo4fCjc+xvae3Hj+/MkrLhrvHuFG+G7nO30QLcuCZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ekQXYoV1; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=iPQ8GUoO; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ekQXYoV1";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="iPQ8GUoO"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U90bFa2971344;
	Wed, 30 Sep 2026 04:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/LE9YTZLohvJ3Od9PTwh8qK7g/GRfvMe3eQU1WGBV
	P0=; b=ekQXYoV1HxOnoX5UdhXQavEXVBWa9cUFFZH0zqVYTUof2zPT7HV8oGzRf
	vylqmRLVOUYRQaIz5lQCCfChth6v1ecVR3NNfNbi2XDUICjg4RoKsJsYVrzM9Y6b
	AN+PyUdcyX+VgezgGamPYOJl6a0YLQY2Z66aYGd8AEwlytacnC9gSccWTbsN0gfP
	a/rT/Rpesn+aP6xA9YNl4YEVhTxWlHdTM6ZbjFKxWzG6whSL820/ftXL/bO6dq6I
	0OpmHLKvlipvqOCzab2v501jzm/eBQXuxWdB3b/hoZNK6LE1VWA7Eqg68Zw77Xzm
	OWB1ikylFp3Hv2m5D8FirmHTw8Jug==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydv8496-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 04:21:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAqPCOHpdxhLOM9/B/PaGu5nsDyL2C136gdt2YtJDLZcD0cSdH963zJz4STJG/bePC/nMs7aC6MZ25EB6vIOgyc1XbVej2L9MMEuG8hwDvE7TurTNs5Cj8YUuuXOPkCaXH+Hn5fg8mJjzXdLsM68KlKp4jTrBM298mTUz1fK4GkRcV/bRWWPfS+Ui9blvBWiSgspVB6SNpW7RmX563xwrK/vhzVBpSYbUkDru54TrscTCQfLJvQvO0etBxhwFTE8Vte9LqL13bp+TQUsLLB0ma/lJb6w22NFadeu/t2MpZRnqA8WDyVBwB8ldjHMasVNNQ756fH4dhyqHogfoPlmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LE9YTZLohvJ3Od9PTwh8qK7g/GRfvMe3eQU1WGBVP0=;
 b=h6DrwaWnSaztBua/CmZGO3OcV6xEZ+Kjw/H+PY5EJzzHrx7JA7WtLKbBmMvUILR11ylJ4pZ9FERR6tNib2dYOj/LE/uoENu5rYD2sWT06TpvQy+QKBawKX3zIj7uc6jU8PTAKA4zNSM1gcYz9Jf/+BHoNc6djZ3xTnej+0TTJsY8QR/gx4QsGphiQOz/Kfu6b+4I1tfKoRuKowBn0n8ybYtA35iq/+sMtyN8QZzHQj/Bam7z9E4WzW6SZNeM4CDHv/7aj15lr1slxuA6irrqOSFhJb7kCOXRhmB4UvuJNUAngWZKX8g6i3nkkdy3HVFQiNKu+0Yc33pkI6LIvAP2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LE9YTZLohvJ3Od9PTwh8qK7g/GRfvMe3eQU1WGBVP0=;
 b=iPQ8GUoOEmq9Iz44Fvi7hdLlPlis+iQTmhXRr8QcI4OFdEGECXdVoaVcWDxzbEi1PvuQNkmsfvCpg/rV8I0h7HXt0KT+cXdBeMU4pHJ16Vv5VvYoNQ0GEYin3A3+R/8nt3BLR3zjf0BTkKxKFFB7lx5IeW/E7ZLdq++V3JqMZTA=
Received: from MW4PR04CA0153.namprd04.prod.outlook.com (2603:10b6:303:85::8)
 by LV1PR10MB998098.namprd10.prod.outlook.com (2603:10b6:408:3bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 09:20:56 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::3f) by MW4PR04CA0153.outlook.office365.com
 (2603:10b6:303:85::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 09:20:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 09:20:55 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 04:20:37 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 04:20:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 04:20:37 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68U9KQKx2847827;
	Wed, 30 Sep 2026 04:20:33 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: Add TI TDA54 pin controller
Date: Wed, 30 Sep 2026 14:50:18 +0530
Message-ID: <20260930092020.1047221-2-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|LV1PR10MB998098:EE_
X-MS-Office365-Filtering-Correlation-Id: f02d407a-ebb0-4c24-3efb-08df1ed42199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|7416014|6133799003|10067099003|18002099003|22082099003|13003099007|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	hf9+VzL134t2SPhfLyl4xBHTKKth6pBQH5TPN/BhufDITmiVvjm8IEe2vPn6ZuEsm9RnhDofv4Ic5dmluvUxg66kmoJoTIuOqCMjwqjCwVaMAeDO1rZMs4gbTiyijnWNminrpGj5OPiYbvr7SjAzEkMy1fh4S+oRLytIAtdAY1RVFuTWQL6FnkOe7PRjoF3XkdNplxdrNm5DaCnpiG2/O7fsxjLT4Z3bJiJg1uXxD8GQqeSS6VmjB1k92STj8RPaKxTLVVfHhrdOkvoKg1ZkdvoeDy85l98Zjnl7j1cXg8G9Uw8RXxQqNj9jQM1xKHUdb8ile9iZ7J2B0wM3W+thXHmHAjBiHO8XAckuMeNiBZGwhdnK4AXYVwjlo/21KFIONNAXa/D7Hco42KOcjnVQW/erRYc7l82wIAMN2OapJ+4eNMyIdiV1L5IJKedziHMFEy7SoYlP9n9I49wBdX3GEyXiLXQn1J/40U4rnbtvP8lN2m1xYeAEyfCRAT7KxIkSGY/ub+BzMmKBSYxrzNf04eSysbWT6sb3Q3fR5zjyt2oOv/Erj+cYJjABjeLr+PCxrQPZ/CG1YhnPWegOOBQiolVDPgQ5yX88ldq2eUPi+tsccmgZH8U8CGVANPabmrq0Yie/9dsffddOrfW+vuDYjg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(7416014)(6133799003)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wzinLqRTrtuC7SW2nnUBXxmGYGjBhb+WkurXSAwlH2lmZGJchnPG85WPrN7LBg21IeysE5IPwmu4wi0t+4fHtqmqJIHR5t88MtWFuWlD3FkS8s7F+tHpJLiTUp3FiCKJK/57r9JZ0aTZPwdYN2GprsEqQM+qKrTmbK5JKXIMo7p07e+mRVm+VLTUFLZ+E/Q4SEzcLSGOlb1uczkgJupT7HtjK3sHxa5rjH0iU3+BhkNp26b6NHMPx1B23QaXp+0BRNzEh4omdFlSufZp4XJ/0o0xax7Mwq6Pcc9RV7ftQEDAKOb8KTeTwj/7XmW6/yNfZfeoAPn75QpeaoK/OsaNNOrJ+HrxxjcVpcl2L4HShxVZ8HLGvb3+mvIZBM+E44fBzwzVyydHma9lj5ZymYW99vDw3VWhTnzsjjtRDRtBAfuZhTNVfDpZCoCrhYlDvbSv
X-Exchange-RoutingPolicyChecked:
	H/3ojhz59y+ma3G15I7wncW0wDUebyZhr5vaJNVE8KfcRs63KJNwfq9k0FOp8H6ayrf5xIu56wiruQmb7xyNqMXrDZeD9q0TBxwcxSdv7ee0Nslac3b8tBL99dHF4ZC4mR7UXP1SaIFtEKKmBowcepYvkA/ow9BJ5mpbkizNuW2BA7Qt3pjcBZH6hHq0WUHJIT7ZVnZWuMujvlEAQv9dIb7fDdhwr7tz2vx667K/X40+6uJrSvBbay7dUtmNpiCRQ/t1fOitDp9trJAjRizrtmu3Jwk725t0QR1UsKwLW4930Xuwn94z8TugDmABE5UP4xdTu6FiQtFODqlmh1pJXQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:20:55.4166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f02d407a-ebb0-4c24-3efb-08df1ed42199
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR10MB998098
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfXwjeTCjF5AkqA
 Si5uBjEbrfkVPTVgE/3uKZE68KWm9E1Vo06drDb8isQB7S5NTeW4qfHqWLJ3qV4dYo8RlO34rW5
 eJJy/7B04RNPF3GKQm28g0/sWLW3UnU=
X-Proofpoint-GUID: ESe39QJnjEneNOPIkbJliy5P8cYUIyK_
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abcd47c cx=c_pps
 a=1g1g+NiJF5nyOkqFb40SOQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=lo7hCSqnAAAA:8 a=jFr6v9ZVZJZjOAeKIV4A:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=LkNurY91FRSyUmvXzpeF:22
X-Proofpoint-ORIG-GUID: ESe39QJnjEneNOPIkbJliy5P8cYUIyK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX2EVpQ6RjVeGI
 x5wKkbmRYCVweX3HBsIBKD9cmqoHQuhFtCB8q/IYGeJz/9qgitgnfxelS6SAGKhiuzKEksxzemI
 txYYoRzfs9EL1PmTkd4Ro/SdfDseoo6uG3dvfY6YhtLsNcty3lVx7IuZ9W2lMYaF0iBFzreBKei
 jjKRccI+KHXiSfXLXQAxnn1F8ANLL16J32rkxrkaJ4RM/TL+6JZGyUyY+BbuArrW+ZKKWHp76IQ
 mZeD+FBILj49F7RAPNZ8INw/vmBFeqzNywiTBF+jeOswQ1h2acfB/s96pJCdDRkTeMFkXjkh8SM
 gHfPB/YE9p/nA+LLU+0+/Uh5Sk/750+DS1+JWcF5jtqQzW2DTTN3CxHLjUaQcqG1IRnciG4yZ1L
 MVVC6un+Ado6LLUr6EeRfk8vwXvxDKnQs7lCqjrCmXPswenBftjlofDNaUL5lcNt5WoMxJ38VRo
 8uR+c1ihNmbwyd/8A9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300037

Document the device tree bindings for the pin controller found in the
TI TDA54 SoC.

The TDA54 pin controller splits the pad configuration across two registers:
PADCFGA holds the mux mode and the functional pin configuration, PADCFGB
holds the wakeup and retention configuration. The controller also supports
two proxy addressing regions and claiming of registers. A register claimed
through proxy 1 becomes read-only at proxy 0 and can only be written
through proxy 1.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../bindings/pinctrl/ti,tda54-pinctrl.yaml    | 209 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,tda54-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,tda54-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ti,tda54-pinctrl.yaml
new file mode 100644
index 000000000000..4660470b7613
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,tda54-pinctrl.yaml
@@ -0,0 +1,209 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,tda54-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TDA54 SoC pin controller
+
+maintainers:
+  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
+
+description: |
+  Pinmux and pinconf controller in the TI TDA54 SoC. There are two instances,
+  one in the MAIN domain and one in the MCU domain.
+
+  The configuration of each pad is split across two registers:
+
+    PADCFGA  mux mode and functional pin configuration
+    PADCFGB  wakeup and retention configuration
+
+properties:
+  compatible:
+    const: ti,tda54-pinctrl
+
+  reg:
+    maxItems: 1
+    description:
+      The register space is divided into two proxy addressing regions, each
+      covering the same registers. This covers the entire register space,
+      including both proxy addressing regions.
+
+  ti,npins:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    description:
+      Number of pins on this instance.
+
+  ti,proxy-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      Proxy 0 is the default access path and can write any register
+      that proxy 1 has not claimed. A register claimed through proxy 1
+      becomes read-only at proxy 0 and can only be written through proxy 1.
+      This selects the proxy region to use.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+  - ti,npins
+
+patternProperties:
+  '-pins$':
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+
+    additionalProperties: false
+
+    description:
+      Pin configuration node describing one or more pads, their mux mode and
+      the configuration to apply.
+
+    properties:
+      pinmux:
+        description:
+          Values are constructed from pad number and mux mode, pad
+          number is left shifted by 8 bits, then ORed with mux mode
+
+      bias-disable: true
+      bias-pull-up: true
+      bias-pull-down: true
+      input-enable: true
+      input-disable: true
+      output-enable: true
+      output-disable: true
+      input-schmitt-enable: true
+      input-schmitt-disable: true
+
+      slew-rate:
+        description:
+          I/O slew rate. 0 = slew control disabled, 1 = mild, 2 = moderate,
+          3 = high.
+        enum: [0, 1, 2, 3]
+
+      ti,debounce-select:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3, 4, 5, 6]
+        description:
+          Selects which DBOUNCE_CFGn period register in the control module
+          drives the debounce filter for this pad. 0 disables debouncing,
+          1 to 6 select DBOUNCE_CFG1 to DBOUNCE_CFG6.
+
+      ti,virt-gpio-instance:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+        description:
+          Selects which virtual GPIO instance controls this pad, allowing
+          protection between multiple virtual views of the GPIO control
+          registers. Has no effect unless the pad is muxed to GPIO mode
+          (muxmode 7).
+
+      ti,wakeup:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        description: |
+          Wakeup event configuration for this pad.
+          0 - wakeup disabled
+          1 - wakeup triggered by any change of the pin input value
+          2 - wakeup triggered by a low value on the pin
+          3 - wakeup triggered by a high value on the pin
+
+      ti,retention-bias:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description: |
+          Enables the internal I/O pullup/pulldown resistor when pin enters
+          TDA54 I/O retention mode, and configures the I/O pull resistor
+          direction.
+          0 - OFF mode pad pull resistor disable
+          1 - Select OFF mode pulldown resistor
+          2 - Select OFF mode pullup resistor
+
+      ti,retention-offmode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          I/O behaviour when retention mode is active.
+          0 - I/O maintains its previous state
+          1 - I/O state is forced to the OFF mode value
+
+      ti,retention-output:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description: |
+          Output driver behaviour while the pad is in retention mode.
+          0 - output driver disabled
+          1 - output driver enabled, pad driven low
+          2 - output driver enabled, pad driven high
+
+      ti,retention-force:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          I/O retention controls.
+          0 - gated by the Device Manager logic
+          1 - forced active, overriding the Device Manager gating logic
+
+      ti,isolation-bypass:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          I/O isolation for this pad.
+          0 - isolation preserved
+          1 - isolation bypassed
+
+    required:
+      - pinmux
+
+additionalProperties: false
+
+examples:
+  - |
+    #define TDA54_PINMUX(pad, mux) (((pad) << 8) | ((mux) & 0xf))
+    #define TDA54_MUX_MODE0 0
+    #define TDA54_MUX_MODE7 7
+
+    pinctrl@5e200000 {
+        compatible = "ti,tda54-pinctrl";
+        reg = <0x5e200000 0x8000>;
+        ti,npins = <161>;
+        ti,proxy-id = <1>;
+
+        mcu-uart0-rx-pins {
+            pinmux = <TDA54_PINMUX(58, TDA54_MUX_MODE0)>,
+                     <TDA54_PINMUX(60, TDA54_MUX_MODE0)>;
+            input-enable;
+            bias-disable;
+        };
+
+        mcu-uart0-tx-pins {
+            pinmux = <TDA54_PINMUX(59, TDA54_MUX_MODE0)>,
+                     <TDA54_PINMUX(61, TDA54_MUX_MODE0)>;
+            output-enable;
+            bias-disable;
+        };
+
+        mcu-gpio0-button-pins {
+            pinmux = <TDA54_PINMUX(42, TDA54_MUX_MODE7)>;
+            input-enable;
+            bias-pull-up;
+            ti,debounce-select = <2>;
+            ti,virt-gpio-instance = <1>;
+            ti,wakeup = <2>;
+        };
+
+        mcu-i2c0-pins {
+            pinmux = <TDA54_PINMUX(0, TDA54_MUX_MODE0)>,
+                     <TDA54_PINMUX(1, TDA54_MUX_MODE0)>;
+            input-enable;
+            bias-pull-up;
+            ti,retention-bias = <2>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c02b919d6ae..60aa8483301e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27865,6 +27865,12 @@ L:	linux-sound@vger.kernel.org
 S:	Odd Fixes
 F:	sound/soc/codecs/tas571x*
 
+TI TDA54 PIN CONTROLLER
+M:	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/ti,tda54-pinctrl.yaml
+
 TI TMAG5273 MAGNETOMETER DRIVER
 M:	Gerald Loacker <gerald.loacker@wolfvision.net>
 L:	linux-iio@vger.kernel.org
-- 
2.34.1

