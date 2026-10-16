Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305334D385;
	Fri, 16 Oct 2026 04:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125114; cv=fail; b=Mig3qt1zMUzgYzCVaLtVYcgWuwnL93O+O9l0OTaekyJPCOy8iwj9NCoRttESlMmVL5VkSKJQ/+Ph78Qwkm3YaYelbx4E4r/f4WRyDy5IOwb+9qqcgUK/IxB3tG79nm0++N7X7bIUa/BTScD5Ewd/IjWBDnt4jUjFHYN+pFMDNJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125114; c=relaxed/simple;
	bh=vrmqk4zSp3+Eb7GwbN2OF5vuZtP/6CNE85j05lypTU4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QPAeQlVpuxq0aqpYyy7hOJM+8a0ja0ypGKQLIp1lyD59tpqW63T4Sdg6ihyDeTYPB8inmqu3YAw6xDJViEZ+ErkrDrWmvM9nqmUcIZqibozaNLlJ+tTDP2ezMp5N+nt0h6qM9Qi9dUoOSqPQrpVtUn0jFuVR4moYEtRDrVsdUR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=a44igduA; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=VEH+vyhk; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="a44igduA";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="VEH+vyhk"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69G2RQle3636554;
	Thu, 15 Oct 2026 23:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=bgi1d67HxeoT+
	PQYeT/6xVu+8JfvBnnE7qnpRAdcnr8=; b=a44igduAYfIYjnDDCn0Izh4QhwZZH
	ZSx7PGj5SsrGnCEuwYhYwavTWGRbkNLTb1LgKRtoS+X7nbvwbHjOkXT0fSdzfIyE
	sp2FMX61VjfcPYTfBrdI5EBlx12kHY52Ik8Q8HJ0AfGZDogogtdJRlQAsqww1id7
	MYNMzvK7fD6V8RnPSRDyHoVbHOvLrWtimbHkq2rUcMGagIcvz+7NivSeMQ778lXe
	lPSQ59r7Jd5lTg+y6W8s7DsOOi+bPMoAHNeKIFNs7M5zmBXWWZZ8Hg8N513xWqAE
	sL2LCSM9niOJDl/aITgcLhRwGTtd3moIek3B2Pw4aoExO0pzXyBGJBJMQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013064.outbound.protection.outlook.com [40.93.196.64])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hbb558gd1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 23:31:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iu6Df/yJiJlzDmoWhz39WRqZUcVduWYql4yw9eSG5HsIQk+shuD6Z+WMV+lK17AwHLsF8Z8+khbcDpYiw0JfA/p7CfLA25dWgRGkPsO3lk7586IwZWI+/oxTvbw2nFa78sHzpb1DyiQOJoP+j4hGhni69F1lMc+uiSTFtaTDdDkJSl3XH4Cdb6SK0mNnCpt9Irselb/XQjgMSjxdAD+KiD7cJ8pk24P4DgZoCpy9xJoMA3wdMPkBrcKV3rlJsCcVW5rZUghBxv6X0SARYBfrzKCxrgQjDjRgin1GIQHeNU0MtP35yB87KmgD69x+IT6bCxhTpuO4pGDPyuvOXjmNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgi1d67HxeoT+PQYeT/6xVu+8JfvBnnE7qnpRAdcnr8=;
 b=vtqI3PIXHz0LNynS+dj48UBxvnUEpqC5lyTBT05gIpAgMschgzXvQ1w/Ov+obdGy6OnjoQglAXXdKE6f7YPGng8SBDrILA5xBV+P1U8x1UlQ9LBnF3a/KXtJvUYhm3Hfznkj1yoNA69p5hh4HG8m15LwFs4OkL/Ep+ocbXjFgntWGyN+v2cNCg3T/voijNOMiWLDfUkKa8wg75pJ/b4Mz7NfYp9W7oEQgrRQPJBsIyzUWrfoWMxujNPO3tYrtemWBBRyrtpJwOaiyG6sjlG+teEymvXpbvPhgTgDU2OSCWX4xrvsrp5LOiZdWlNUFQwErxLWcTOhXWChcGX2YNn+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgi1d67HxeoT+PQYeT/6xVu+8JfvBnnE7qnpRAdcnr8=;
 b=VEH+vyhkSIK0T7fBC5RfQh74iSKRcamE77KFimcLmR7apIrp0u/HcwDVDQ3Ai29bP+QeXdGpXB4rOVTt91JynJ1+QOgpu5H6kkz3+rx4wgE79ub1hUWOOJg3FBdlePzf1iFk4R29fiHVkAqnKvH9WhuyfepAvIiLlrjOuM8QSwc=
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by CY8PR10MB7265.namprd10.prod.outlook.com (2603:10b6:930:79::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Fri, 16 Oct
 2026 04:31:40 +0000
Received: from DS4PEPF000001C0.namprd21.prod.outlook.com
 (2603:10b6:610:57:cafe::6e) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 04:31:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS4PEPF000001C0.mail.protection.outlook.com (10.167.23.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.0 via Frontend Transport; Fri, 16 Oct 2026 04:31:39 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:35 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 23:31:35 -0500
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69G4VUkX593387;
	Thu, 15 Oct 2026 23:31:31 -0500
From: Aniket Limaye <a-limaye@ti.com>
Subject: [PATCH v2 0/4] gpio: davinci: Add support for level-triggered
 interrupts
Date: Fri, 16 Oct 2026 10:00:35 +0530
Message-ID: <20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGuo0WoC/32NTQ6CMBBGr0Jm7Zj+IIgr72FYjLTALKBNWxsN4
 e5WDuDyveR73wbRBrYRbtUGwWaO7NYC6lTBMNM6WWRTGJRQjeiUxpePKVhaMBm61Dh5dmioaev
 WjEbXTyhLH+zI76P66AvPHJMLn+Mky5/938sSBRpJgmTXDVfd3BOfB7dAv+/7FyPDD/SzAAAA
X-Change-ID: 20260923-upstream-tda54-gpio-da6747dfd34b
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        "Bartosz
 Golaszewski" <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Aniket Limaye <a-limaye@ti.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PEPF000001C0:EE_|CY8PR10MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0af52b-5ea9-4deb-3321-08df2b3e5f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|18002099003|10067099003|260925021311599003|13003099007|260925021911599003|260925022911599003|261009221727099003|261009220027099003|261009221227099003|261009223027099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Qq90ZlDVcB72k0pLVoLF8tNaQc8Jn1QAURc3ADHe2dWpVIm3gULuqXoGVmMaY98aqEMMcjenoIjo3SsDjhAuArGtCX8DsZs2notfAZOLZH5TVKfqjJEFmyTius/Omz1CLI1pBvgHpq3UXId6wG577sTSHk9FLop6jlbirQRkbFNWx2/f6OFVoYHGDQiliKMwT4NwzsFjhWXwGdFBK3AImNyUYrAhH3heI46h04H+QIIUQxMFQpHSrAgh6KNnrY3B0BRkACxvjocD96WViIrAEJmZWkyzV1uG9sWqOHTLliVraFKYISqeg4ZEn7D8jdorM+i6IWSGHOgzXCnsLv7RlKvmCIqA4Dt56Z3vtrrBH0DkW4WNBAv4AM5Kr5lanwx3dcUqRbubFrotHM809ztmbWSuF/3yUHAxkcxPnlB2eHO3YKebeLX/NZKvo9oZv73XGxnAt3G8DeAgagX9rS8FYebB5Xh6Vq1C7MbEn+fV8CpHl32/vN6WCSn9Ek/FnJRLnRMER34md5DFiGTuKZbuO/oI+4DkiiArSpBjmKRbM3XcPSd6nl8+pLS7pue9UMEuMdArLdh4bWhJgh4XnMJm8rIV8QsDqnSYiKczUUpfBn1OCTP+3MiXE1fk2wvma1ySHoWum/qNWQKL+NeIJk7M3w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(260925021311599003)(13003099007)(260925021911599003)(260925022911599003)(261009221727099003)(261009220027099003)(261009221227099003)(261009223027099003)(261009223327099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ry6BqN61gYTZkxHL86IUfTZBNQHRDmbIVpilXoY+4Mh3U+9Tq3zwVfP+ajGvSrtvdoKPFQBQ9PmhYKOv5nrLXDFN6WQfpSuY/gbquJ2U+hlqp1nfCuO2vgp1U6lYvfMvSpw0zzfloZoB8Jd4QYF7FHCTClUlfulARZmqtFhgIZSKoLl9+gbl51ISQNfjuSu2s0y4a79IIQTpyqq4lNfshzVROEBc57pVfqIQ9vu8mqBM2xRvdQ0XTdAPA7pozhWAsBbp1QSoTpxSfskFYKaBc43yA+fYjJgkKD0AnU3rHjE6h7oyEMjRapfOwiY2SDvMjRd6wSDiqtmZqoYX8MjI7gNSL9XhNs21NSGs87X39ujpUJggR3m3bze+RXG+mW9PFbn0aAE2f6FtY1YEGPjrJxpBsKStYuhC0KO/2a6JwVZQBq/0x7OuLteEkGsFFCQX
X-Exchange-RoutingPolicyChecked:
	O+g1hk9e48KOWF2bA+l3q9zdpMIHa73b4ZBcyd/aIqttiIUQdA/5pmwB95cNl9Sb1R900/YXsWh0mNKO2B/fPlGjUK4Ol/T5LO0MmPkyjX28uHegs0TJ9XD2H6anWSSojnPtOpqHbdH/NQjYC2MKOdcPrUW+CSp/jPB8+dRFtbn2yCXv4jh4sPu/ZKr/NJZxYhyy7gd3L8JuGzxlWsZ1H4QTFuykmmX1UFLEhvPNihnk3h7g2CJrBXuBqpWrTTe75T+XuEAFBL3RuBSMyOvDqClpt3XJ+xGaTyJ1kjE1GKomcbiHNDKBLdvm6cMruy10wz700X9VQ9IZzd19axKtRw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 04:31:39.6156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0af52b-5ea9-4deb-3321-08df2b3e5f52
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS4PEPF000001C0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7265
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfX046xQ0y87d/Q
 CIE7ekOLuYnu64HeDOuXMRZaq/ZDvAYNxsdXD36vTKgOfuPuDt7l0hyfn7B04SMZ76m/tanke8V
 q/zBpU4YMEHzBSgfw4fXHR2cTUjBJuo=
X-Authority-Analysis: v=2.4 cv=fK6sTpae c=1 sm=1 tr=0 ts=6ad1a8af cx=c_pps
 a=Kac4Oh/pgoirBk7HbaAweA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=picg_7cB0vi0-ZblO64A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfX2Ek6US2T/iMu
 I0JYLm4Ptp9h+hAf2TpNFG+THli8Il0Ob4pU9RuO6I7Y/6SiR66ikuSVWIHEYwMKyVI2fbursu0
 wGkOlwy4a6owqNApriUWJ18RLgPDM9+j7ZEMcXklczEnsEoWtwF6RMSub+MCfJCjKomJ9uh6nLE
 NCxgPKFm+YMelzUX52LI5weThUfoBGuFhIdoX91eXk25A/VtbImXKurLLijZIXJdMpXCWHJTyjt
 NwdnN2Bzk0EbvMey0DtIpFZH9gc+Ux3btn5eMWfc6WJqYYw28yo2nFsnJ89fl73/wMtdadckHct
 NrZddCB4P+06clkjaAJfKqdMZtET3Gvx0E40mHBRPzSHwSF1AvJiiHrpYCny09gFA5DCjh5w4YS
 oqYJps0k4A/U/8BSq9NT4GeKMAv2QPOQmvuQptfzlHpKKvui3u4l+mW+cnf9qlu4lICzWtT+8HZ
 u2t8IeHPQ9CLHjESkoQ==
X-Proofpoint-GUID: 9XIN8pDODxNoaeZ0pN4d143al_qAUbDe
X-Proofpoint-ORIG-GUID: 9XIN8pDODxNoaeZ0pN4d143al_qAUbDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160017

Add support for level-triggered interrupts (IRQ_TYPE_LEVEL_HIGH and
IRQ_TYPE_LEVEL_LOW) for TDA54 GPIO controller via extended register sets.
Update the dt-bindings to add support for ti,tda54-gpio.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Changes in v2:
- picked up Acked-by for dt-bindings
- Split the driver changes into 3 patches: Add proper match_data struct
  in driver, Add ext_reg match_data field and level-triggered interrupt
  support, Add new compatible with level-triggered support
- davinci_gpio_irq_setup() now only sets IRQ_TYPE_EDGE_BOTH by default
- For level-triggered interrupts use handle_level_irq()
- Link to v1: https://lore.kernel.org/r/20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com

---
Aniket Limaye (4):
      dt-bindings: gpio: gpio-davinci: Add the tda54 support
      gpio: davinci: Add match data struct for get_irq_chip callback
      gpio: davinci: Add support for level-triggered interrupts
      gpio: davinci: Add ti,tda54-gpio compatible

 .../devicetree/bindings/gpio/gpio-davinci.yaml     |   1 +
 drivers/gpio/gpio-davinci.c                        | 146 +++++++++++++++++++--
 2 files changed, 137 insertions(+), 10 deletions(-)
---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20260923-upstream-tda54-gpio-da6747dfd34b

Best regards,
-- 
Aniket Limaye <a-limaye@ti.com>

