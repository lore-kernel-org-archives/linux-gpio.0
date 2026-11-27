Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785995;
	b=4v3SiuhZaLG7/H7Q9neOR4nS8Fm+2ac0xXMkjfVNPPHi6FFxsrj+qSdWCBe0SFDTDyYz
	 T6X3QKIMW8C8zm5Cb2Js6Elh9cPrXTKPvfEQKgsswWei/RyhIKZuisFgIU2pfn7YN/QS1
	 0rBplVqfxbQwax87mkv5Tvft+wiJOYGZBdWdoGLWberx/tVDJJoOIly8DZGD5ZviJp9Rj
	 jANnmPUr7qfE81aKoA4PTvj4DmNZPN3oRVGkpKFy02t5GK7PWMBA0qyin26rPUeQh4ehx
	 7cSZczmsaslEVYVeWZNP1Zvh1naAnDzIZZtmbsNqN8I1vxjSlgqX2M8UZjQLauwK/fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=CPX0KePJcUm70YPeHuWBHFiCXEYGxu3hv4/l6EBhkWk=;
	b=qeL70FdTaTboBDjt929xDcl6fCW5+GSBGHKi6QRuIe9ub/zR2zJAFqyoWyF6CwHyuKsN
	 IHx75kMRXIBPE47QSr8o471DF7VxntksQKghvezvj/tFE4JA7nZTAXTNcx7jV7WHB+jYb
	 mLmjKZLxqe2UeUHe/lQ+tbywrRA0MMnfoMen0ZFjT8F467kdmxn9rQzyEp3n9awBxqkAo
	 YuAkCZMXqwul161SwDNUIvWf3aFTJOdnWjq1pZ68VrFe1D4TeQru8mkhZQO1QWKdLQFP1
	 7gHcZ8BaK5lSXXYfBCanI3AG0TiM5QoR8KQrtgqTcR1O2UVOYor1lifm997/x/gwjbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="jUw/k1Ad";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=S7ypUTu+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5A606A31F;
	Fri, 27 Nov 2026 13:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE5A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=jUw/k1Ad;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=S7ypUTu+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARBcrxk2227275;
	Fri, 27 Nov 2026 07:26:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=CPX0KePJcUm70YPe
	HuWBHFiCXEYGxu3hv4/l6EBhkWk=; b=jUw/k1AdJWsA08Ty5PfYE3ij1H8xxHfo
	ImPIj8cke8WHnqWL6+UBcf9/acy6JYj1B0Pj57+DR5IiDCvPlGG+ujqW1lkw44rx
	Bkqhu8nKywuKHT0AWOhxTKHwZIh55dKzfxUTHUK+B2mfQSLd5HX+MhDkEUMBVeYk
	FbALgv6zgTAJp7gEZp+XJZoAXsKAWDi+JFn4z9TNgcO+gDCjWxbjZEujqZ9cVFPB
	snqLtbhZQNHg64he/GDen41N4Nst3zh23RsBftlXCsnVQDwu5W5yQUPBfmMXFoZ3
	iAcpraBKuPusslRPODdNoJJlwKgHnOSPFmLXLw/qqSUP2HATgxXamg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020117.outbound.protection.outlook.com [52.101.85.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51885epw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 07:26:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pu3gaR7hxf9g2VPGqujf6T9zJuprY4mM/qpWIK88ElZO2feCaZ0qrKcjmU2IsWHecpEgSvAh1puNgfRu3uvak9/tyQ8rJxyoSWxDvnXDqjIStPUCzcHVj8jJnPFezhSdND7QAh31ZEaypNq9L3B0TlbKgjFLFtC4JQiG+xJ/yrh8mVCXupn5jzNGTEZQXwNe6PTSzFEsCpgCeYwNbkXSce8TAqWS7StrOZnuiRmgfL8NWBAbizMvbzSqYUebhEX/HkFJRcFwGMa+RPSUmTnt3VrOYK0LfHuLDA5AzbRueO9EquY1zkgAnNeVM+4Nvdgg25Amb/h2dKJTaEqxz+jetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPX0KePJcUm70YPeHuWBHFiCXEYGxu3hv4/l6EBhkWk=;
 b=pP5oGLiR2vCCGP92JB5WymvosVkH3sN2K+GxBo4IFt75nSbKe1y92PAq/hbkly5v6+xp8GBGGWQmE2c3mX3ls4skk9cqWJ2bMvg4/eC5tv8iAFqXrr+j/0O5/L3CThSeKkA3akRUWNtcCzVonU329xqtUYsRlJaafmWtpw2qQ6fs8s7tKdt9BMncmS25XFSXDlKuxVNXqRs6zz2aXQb9YVtTWUA8aaCOqO+cWuI8qE9TW+ijqJnLY8ppswm0OOZqzHo500pR3PgZb6ajvkcSoNfVVDWmaN/KiPE1Gz8/S34okBN32iQz0DlmAb2p8VMx59pwHAIr0aBnnuwENws/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPX0KePJcUm70YPeHuWBHFiCXEYGxu3hv4/l6EBhkWk=;
 b=S7ypUTu+xCm5+ds5L2ZlqLFv27FQl5pB7Z0aYvIvDdV1jOrQoBa7+U5Unoowmp6e2E93G+IvIBG8TOcxaJ7ZgLweTtQMQAp/FJonDA38FHiljValm+ZITyFWcBpXr2Y1ie+3Mj80sbgzd5ObZ79GfBoxMRvhHmI7gDwD9fhNNdE=
Received: from BYAPR21CA0024.namprd21.prod.outlook.com (2603:10b6:a03:114::34)
 by SJ4PPFEA7F011BB.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a5d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 13:26:13 +0000
Received: from BY1PEPF000264B1.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::a6) by BYAPR21CA0024.outlook.office365.com
 (2603:10b6:a03:114::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.6 via Frontend Transport; Fri, 27
 Nov 2026 13:26:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264B1.mail.protection.outlook.com (10.167.242.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Fri, 27 Nov 2026 13:26:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9F091406552;
	Fri, 27 Nov 2026 13:26:10 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.17])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 99E2182024C;
	Fri, 27 Nov 2026 13:26:10 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
Date: Fri, 27 Nov 2026 13:25:50 +0000
Message-ID: <20261127132550.1677771-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B1:EE_|SJ4PPFEA7F011BB:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fdb94a4a-84a2-4ff7-9437-08df4c8a01b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|23010399003|82310400026|10067099003|56012099006|11063799006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|18002099003|16102099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jFuDIVZosKLxMJ9o0tOpuhLArT3ZXf0JRGbSA/EcTvULVvKpqESclNuAYiCymxONVv8fV53e7dHoMEiRXRlWIS3Ymqxrd7BHocbK5m8saA4OcSUSMwbEDGykBwpnX+4MLM+OoVvHOkHYRVaODH05CbIZTk9eLXHUQjb4FbM/e4MFvcGHeiwQ/JTnG7Z1dbsCgK1WurNzgUIdsw19s79nLqdbCeZ5Dj6McF3M9ZVKSLPRof6ScneZrHcQkSs+AMa9ucbww+KQRUOX7uMNjePxuZoCcgcLB2biQDRkKB8HOu4216JDH1y05jaxheCBfV1dZMe1WclsdMYKR2cs/6Y0gofrbwz0cZQrnojxH9pcJsgK5Nxe40Xutbi0uzG2FTXgXSoa5LYlHwb8r1mDazfGy4H5B+edcZCiWPjodND7n1LQvctxJ+mDbsClfR2lxWw16rMosHABanQH7j2t1UNTjQYumJ6HduBK5XknkP60pc5Htn5B62lElWAB0tHH6jmNwltDT8IdAmO7+2lV1NMByk6d7by3HxfddyVFbCw9iEOL5rBdxC+hXjrCc+b6jvs2AbaCrZUlE3DXuLUEGhaPARW//qo43mbE/cyuugADnZhVi69nLHtVDT9HfmtpswYj0WGsIpcIW7VVvZRJrZYUvjohELqQC9H5zSa4KpmP+WQakTGAB5AXtfsXblRKa/65NgpV+MV4yWf2IyKqVJw8FA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(16102099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Z04wwemuHK/D4WvFSLiG7/Q0Q9nOY1eXtp4EqLKbinHK3gquAXBlHjMpwS41Nv60MveYQC0VzDwXv2bYb6RJjszhHqXzr9x1jVO/kxmGEGUBwEtW8Rke17Cwja36b5lnGcUR5AqXQv0yj6oSWMhWzXjdegWXd4NtkNlC9J4p23h41oomDLMobmlKWSbQYrhVG+yN8+bMhOBHt2a3iSHsgHutPk3ZpyDAaR6go8yuuqFGSbfdygkvuGe9Q2qEdfZARAfk5C5JHPM7DZ79WTFA/mGIy+S+LNL4smCOi3mQL0N/TbsB0GGewdkEQ8nRGl4WAj1jT57KqLBb+ikRij1gvc0KjySc8tqnKP2jFvxFofjfnQ3zWWbLAS3nmEBq2vRhHKjfdfD/JLZ+oGs1LGYm27PsK7aSCb4kTMh6wyN40/4vZDNTEjB+kDl2CePlKBn
X-Exchange-RoutingPolicyChecked:
	c2mSibtUAo7Fifl9Q+KumCwNR7nhtRjCEDSWf9ow72eqq1SfJlYhTjKoESnKdNUXFAiTzJ41YGaBK5BIuyVKFBBvtAlJZutdqkjIrJQmz0IRBNxjL5DvtAlgvO7mJtM8j89I7GTEj3WwCNvsHKOQrDl0WhiKZ8G4dM7tiB+gCxo9Ff04EWQOGrx8WzgWdpzUl3ZhTrI+IULaWW6cPl4ASO19QTQkAISuw1jQ7u9gmUDIpXUWkuAeTC9b5Et8lMgIwzrOVm6S8FSbnPtA1cyKTMMDTXpC8eu1F4TAdx8FcIhREhCO+rFjFoUIodf5WgM0ZU8CL7l+m0R0K1DRDAC9tA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:26:12.4393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb94a4a-84a2-4ff7-9437-08df4c8a01b4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264B1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFEA7F011BB
X-Proofpoint-ORIG-GUID: 1QgVV2Wsj3T0kXB19YBWWrA99MA40Uqi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX9hzEZLAFXgxn
 bV/H5PeMKF4m/wMun147+OQs4JAtb7ptnjwFxUnueSQehX7MJcfqBh4mubFZba3yRtUUhjqOP/5
 dK/R0reuICfzCGTdzYdZq1T6KsQHn6XG0elkGactYXDW3L8bNVoz3EJWL4YR6sdiuozUoKh+bYB
 gMNW4FeJ0Ncliu9JgbVpLZ6krSRGvzu+COifaDxcpbyTm8pb32ew7S35qGagSfw6nH/6/jvTB1n
 ZaHAITwd8PxFSZ69C8lw52NCSg7F/IpOWZnLZXmWaoujDFyFAYuOTFYKHTl5ggCsxadQzH+6Q02
 yAmmNvYmSzyJoBLmyZ1GbNRrk+212/9QLoWI62DZc8PUSGu3vKz1dne+h9tOQ2fsikE9h7w9ALH
 k6hp2DsA1WVVeuWES2rTz4D1qKZzBXtbzpb06DLHx9ASTxo3T7Vi7H6nKOlnwOk8LF3LbqFogPE
 tosSoyejkYKg9m4yskQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX7eEiIiEQCHsR
 9IDRg4QLMpvBYeI1iNlLBiIFQB4nr4gNadyEmDcTCX1wsuCX5KjrRZpYHdJX6D+MWmnpAfR+np3
 dZ88ZUZNsDVA5M+4tXFeo0h8AWDhGak=
X-Proofpoint-GUID: 1QgVV2Wsj3T0kXB19YBWWrA99MA40Uqi
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b0984fa cx=c_pps
 a=bH+lGM7ukYmG6LzVfPy9ng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=KGhacU64teJuVj_KiiwA:9
X-Proofpoint-Spam-Reason: safe

Add ability to use cs42l43's GPIOs to drive speaker and microphone mute
LEDs. The LEDs must be described using
01fa-global-mute-led-(spk|mic)-mute-gpio ACPI property, which tells
which of the 3 available cs42l43's GPIOs to use for the respective
function.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
v2: add stub for cs42l43_mute_leds_register when CONFIG_LEDS_CLASS
	is not reachable and drop the #if in probe
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 160 +++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index a1c839b355578..daef1759da3c7 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -5,11 +5,15 @@
 // Copyright (c) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/leds.h>
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
 #include <linux/module.h>
@@ -29,9 +33,18 @@
 
 #define CS42L43_NUM_GPIOS 3
 
+struct cs42l43_mute_led {
+	struct led_classdev cdev;
+	struct gpio_desc *gpio;
+	u32 gpio_num;
+};
+
 struct cs42l43_pin {
 	struct gpio_chip gpio_chip;
 
+	struct cs42l43_mute_led spk_mute_led;
+	struct cs42l43_mute_led mic_mute_led;
+
 	struct device *dev;
 	struct regmap *regmap;
 	bool shutters_locked;
@@ -535,6 +548,149 @@ static void cs42l43_fwnode_put(void *data)
 	fwnode_handle_put(data);
 }
 
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+static int cs42l43_find_mute_gpios(struct cs42l43_pin *priv, struct fwnode_handle *fwnode)
+{
+	struct cs42l43_mute_led *mic = &priv->mic_mute_led;
+	struct cs42l43_mute_led *spk = &priv->spk_mute_led;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, child_fwnode) {
+		struct fwnode_handle *ext_fwnode __free(fwnode_handle) =
+			fwnode_get_named_child_node(child_fwnode,
+						    "mipi-sdca-function-expansion-subproperties");
+		bool mic_present, spk_present;
+
+		if (!ext_fwnode)
+			continue;
+
+		mic_present = fwnode_property_present(ext_fwnode,
+						      "01fa-global-mute-led-mic-mute-gpio");
+		spk_present = fwnode_property_present(ext_fwnode,
+						      "01fa-global-mute-led-spk-mute-gpio");
+		if (!mic_present && !spk_present)
+			continue;
+
+		if (mic_present) {
+			ret = fwnode_property_read_u32(ext_fwnode,
+						       "01fa-global-mute-led-mic-mute-gpio",
+						       &mic->gpio_num);
+			if (ret)
+				return dev_err_probe(priv->dev, ret,
+						     "Invalid mic-mute LED GPIO property\n");
+		}
+
+		if (spk_present) {
+			ret = fwnode_property_read_u32(ext_fwnode,
+						       "01fa-global-mute-led-spk-mute-gpio",
+						       &spk->gpio_num);
+			if (ret)
+				return dev_err_probe(priv->dev, ret,
+						     "Invalid spk-mute LED GPIO property\n");
+		}
+
+		return 0;
+	}
+
+	return 0;
+}
+
+static int cs42l43_mute_led_set(struct led_classdev *cdev, enum led_brightness value)
+{
+	struct cs42l43_mute_led *led = container_of(cdev, struct cs42l43_mute_led, cdev);
+
+	return gpiod_set_value_cansleep(led->gpio, value != LED_OFF);
+}
+
+static void cs42l43_mute_led_gpio_free(void *data)
+{
+	struct cs42l43_mute_led *led = data;
+
+	gpiochip_free_own_desc(led->gpio);
+}
+
+static int cs42l43_mute_led_register(struct cs42l43_pin *priv,
+				     struct cs42l43_mute_led *led,
+				     const char *function, const char *trigger)
+{
+	int ret;
+
+	led->gpio = gpiochip_request_own_desc(&priv->gpio_chip, led->gpio_num - 1,
+					      trigger, GPIO_ACTIVE_HIGH,
+					      GPIOD_OUT_LOW);
+	if (IS_ERR(led->gpio))
+		return dev_err_probe(priv->dev, PTR_ERR(led->gpio),
+				     "Failed to request GPIO%u for %s LED\n",
+				     led->gpio_num, trigger);
+
+	ret = devm_add_action_or_reset(priv->dev, cs42l43_mute_led_gpio_free, led);
+	if (ret)
+		return ret;
+
+	led->cdev.name = devm_kasprintf(priv->dev, GFP_KERNEL, "%s::%s",
+					dev_name(priv->dev), function);
+	if (!led->cdev.name)
+		return -ENOMEM;
+
+	led->cdev.default_trigger = trigger;
+	led->cdev.brightness_set_blocking = cs42l43_mute_led_set;
+	led->cdev.max_brightness = 1;
+
+	ret = devm_led_classdev_register(priv->dev, &led->cdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "Failed to register %s LED\n",
+				     trigger);
+
+	dev_dbg(priv->dev, "%s LED uses codec GPIO%u\n", trigger, led->gpio_num);
+
+	return 0;
+}
+
+static int cs42l43_mute_leds_register(struct cs42l43_pin *priv,
+				      struct fwnode_handle *fwnode)
+{
+	struct cs42l43_mute_led *mic = &priv->mic_mute_led;
+	struct cs42l43_mute_led *spk = &priv->spk_mute_led;
+	int ret;
+
+	if (!is_acpi_node(fwnode))
+		return 0;
+
+	ret = cs42l43_find_mute_gpios(priv, fwnode);
+	if (ret)
+		return ret;
+
+	if (mic->gpio_num > CS42L43_NUM_GPIOS ||
+	    spk->gpio_num > CS42L43_NUM_GPIOS ||
+	    (mic->gpio_num && mic->gpio_num == spk->gpio_num))
+		return dev_err_probe(priv->dev, -EINVAL,
+				     "Invalid or shared mute LED GPIOs: mic=%u, spk=%u\n",
+				     mic->gpio_num, spk->gpio_num);
+
+	if (mic->gpio_num) {
+		ret = cs42l43_mute_led_register(priv, mic, LED_FUNCTION_MICMUTE,
+						"audio-micmute");
+		if (ret)
+			return ret;
+	}
+
+	if (spk->gpio_num) {
+		ret = cs42l43_mute_led_register(priv, spk, LED_FUNCTION_MUTE,
+						"audio-mute");
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+#else
+static inline int cs42l43_mute_leds_register(struct cs42l43_pin *priv,
+					     struct fwnode_handle *fwnode)
+{
+	return 0;
+}
+#endif
+
 static int cs42l43_pin_probe(struct platform_device *pdev)
 {
 	struct cs42l43 *cs42l43 = dev_get_drvdata(pdev->dev.parent);
@@ -598,6 +754,10 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to register gpiochip\n");
 
+	ret = cs42l43_mute_leds_register(priv, dev_fwnode(cs42l43->dev));
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.47.3

