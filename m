Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792942;
	b=Kk1T6td3LM/87Lyebfjl5lLup1Kt8i+vtAgkSqGnHjS8dponysRbtaMWnY2rEu1pckC2
	 PhyBH5PK0QWAH2dPKEdqUyf7RNLdYJovsCC69WyC3dG4P95LBqIQZL2GBuQMLe0VCgLYG
	 SglKHvHPnFH6KWXkRn83jDP3Bg+pbQq3lB668E6Mm34oY1tQaNeJPBPlWdSJpJyRLykqA
	 ei6kXp2hK9Jz22PTxaocv6kUqAf3sBcvDLASEnzJV3rHxDwoiCAbwqgD/J9TDU78EWe1v
	 YOIqO9oB7SFoc474d1quF8zuIS59ClpWnzvkyoDG+UIV1Sg2QMzNe0ZUjl6Sf2kTJhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=s+ipAFSeLD/B03FikKho9U0tktFHRe9fufYviHZ9D3A=;
	b=KLRVcywCbpLRuVMOswtAxeWK8zC0aCrdj1gMkUG32fMDmP1CgkvhCde2t83N/Cskd0Jq
	 D0INFbF3M64vD1lGcsvsOTZjtF+YAx9b2eFFGO4vy3+l1bikysDhIn9bWPaYWl3IlYRYP
	 D8YRxAFsHqz3NNgDUFLT3GYFAJaK1Gnql/iJe71ipgjhFKF0qu53mCP6G4TqxT8UZqwVp
	 j6Q/y/Uo5PgenqDjoAl7hRQ/CH3AMd8FnppIpCHT/xM1K98FN1LXUdKzw4G4ZSmWJhGFz
	 mec+Tszc7Bcwo5mmEGIoeWLvAKFTUSYQRFbttutMeBRuwLyzN+LvJRFl60Fmz1qdS6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=G6Wmi5Ea;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=tELJqSxM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B72606D803;
	Wed,  4 Nov 2026 11:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B72606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=G6Wmi5Ea;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=tELJqSxM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A49woqv3106919;
	Wed, 4 Nov 2026 05:48:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=s+ipAFSeLD/B03FikK
	ho9U0tktFHRe9fufYviHZ9D3A=; b=G6Wmi5EaoyE9HS/4VpE8SROYr44xpqex8Z
	qkvq3yrCYyaunUoephTwhwxUM8YAAfS2idEtITAvo+MLdng1TRKDqQDoTYaWDsUF
	VSw8WFoqFQh0/6VQ3eamEM+g5LpofOhEkKO3J87Us8a8bwbV/GKwGOP0IfbpfSm2
	R4CVJ1LPMUFDCSMh+8qwb/+1rv92IPSz15g0XIKm4yI9yzr+fZ2F4/+Ohd5hgMBZ
	K/pHACzfcpnKFA1G3pvalIpgq32cFVsuTqDvQhsQWn6claEqTj7LReY3wqs11Guy
	N6N6GolK8D+eNp7rWI7N7a/Hz74uJyU1DSBTzirpjSnwncG/v7Xw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022127.outbound.protection.outlook.com [40.107.209.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfd3xg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 05:48:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TROYzzHabLI2az3vXZwBnqdaEhV8vwp1nXfRPSrAM+4AhTvlhrXcAxK1Dh1p20FYMML189V5/LaoD/tfZgmfxCjG8QR9bBkm9mztqwAyr12pfw2LUCjnAp0gnInepQ3yCQSa5N6pSoamVk7sPHYCbK+CUM05thyDc4qQOHELyhuzyakOdBiFDXOyqeR5KNpE/TOvoX5jLnBPLDiiVevVKHdjYToU05kuCu11gL0OhHWhlMlWcR4d3ND5l5QFKbPIMmeOQK5BldOe5+MNSQlyX5NYvt5AaT0P3HnWtjL/fDxIC5Dnz6GIBKCM83czuLD3xV/qqYmgO8qSWCme3Q0qKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+ipAFSeLD/B03FikKho9U0tktFHRe9fufYviHZ9D3A=;
 b=vjD8j+YdRUFHQy/cRs5Pc7vJqQCLpG/b6H47i8kxraWbGdO4PyAREKvA82/JrXrC/pK/ZH9/s2YuhFqip9WPly5imjE0ZRebbNIzRH8lq+um4r1deBYzUPhU+RGHaWFf/AoQtv21SpAt6LGxokXe1qS9IjoMLHHmE9pRwKefFxPqmMjFW3mWFAvlNGLiA7IOxaOWrFXdKSiqcK8kZ4woQvhuH4mrmjLLZ4ROvAY3JZu+XPXw3d7+jJkl3d+MKy5unpVg8qSTmSOZx4UXnsP+uFdyrYi/coUl9dQXzyHmAm0Vrv5Va/uPwAvm3LJyDpRS+9KQFovtyTSfxWxaqCkgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=altera.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+ipAFSeLD/B03FikKho9U0tktFHRe9fufYviHZ9D3A=;
 b=tELJqSxMiTsVtaCWMEtJMEFT+TTtuOTthhPf9IGzMEEsi8CzP30bM/Hj2A+MK3DdfVHAar0JFbd+vMnvnKoOJ3Zc0/bhozCh+Kwwn069ilYKpKjJSr65fDsEM/QAGDGUIswT91A0H8w9SIBelRiA06W4Zr9gErDoTNVISlBawMQ=
Received: from BN0PR04CA0012.namprd04.prod.outlook.com (2603:10b6:408:ee::17)
 by BLAPR19MB4258.namprd19.prod.outlook.com (2603:10b6:208:27d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:48:35 +0000
Received: from BN1PEPF00018545.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::53) by BN0PR04CA0012.outlook.office365.com
 (2603:10b6:408:ee::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:48:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018545.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 11:48:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D1185406544;
	Wed,  4 Nov 2026 11:48:33 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B83E9820273;
	Wed,  4 Nov 2026 11:48:33 +0000 (UTC)
Date: Wed, 4 Nov 2026 11:48:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] gpio: Convert to subsys_platform_driver()
Message-ID: <ausbkKByIo7UO96S@opensource.cirrus.com>
References: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018545:EE_|BLAPR19MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df7a363-6a54-4b8b-7e48-08df3a698ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|36860700016|61400799027|261009223027099003|261022075727099003|56012099006|11063799006|10067099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OAMYHb7hYklBVN9T7n72QBglG+Xu8HxxfhyTYRE7RdY4UStVIEETHELce1JDUhrEJR5ZbX3dbZu2+fF0c5ZJ+5th4Uky1Svg6Iw3tZ8suCAwkWxyVg9mpeStuBM0ADFwVnUtrfmgbYyIiUCJO6wB+inSWatrMEfQ57xwdYu1rPMXbeMF7JbA0sg1y0qT5J0OcqIb5r5e392MnBrxpSaI8C+opLMW/VI/YL1qK9BMV8LgPfz48Q6dVx8OCpJ/mRtqeIbHmBLTH/2vg7wn27pvONAu2FT0m2V2RaLx4+10eNu059G1fE218pyeTuj/50vw3Z4BhgsJREDfh66DRDXhhJ08Xnj2jDNi8LEFzHK6ENTgFvMPo4U6rd2kWkj+wVXiQPMaOxwmCK0S8rQmo1HwpbKWaPzF8ub4wYy8XTx3o5IbVvqi72AimucefKvZh63J5OHVKdxEloa7YweqrcKhOGSbq6Fz+qaXIAXPoN3lYrCDTj4yOvMkYj69BiTfoxgedxFpIwBhMoJxqIcG7xCb8yC2pk27fJ6enhjt82nKG5dm/RhIhprTx+kWL3XMINiL5YiML/CKLR3qU3OeYn9ZS6C926J9LtfPIjbsx8lbO2CBf63XgZK28WwvR5/VZPvplG6Z5FqzmCGUCP+/eLLR/fMrZWgLKD8ncxCHuUj9yYsRYEON3lC+zO5JBXgOkNAU5Ku4qxU2OJ+HypTHU8UT9Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(36860700016)(61400799027)(261009223027099003)(261022075727099003)(56012099006)(11063799006)(10067099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oSwQtDoWW5+fB4qx+6b3u1EMV06coj9MywqJJn23YN//JO5OdJtuQY2IYXUOXl7KI1nZqy47zxf28sSNGMXcORg5DWyLif7weXevHoiNy0hsZw/VhbDq1GFYf82fvO/M/nwWqZbUyw2dNOnQWoyQMO5Xz945W1SlneZM08f7zro+l0y8vsxqw8ijLsVFbPs5wbOo6DL9aS+VBfdPu2pFEUG4juJneSkKsS13oSwyAki8OyoWjz4hqIv8OsW0nRbTpClfta5IY74vsoeTrtVmKX+I9En0+kGhWV3ZJm3hVV18cVQXbDxJu5t457Ii9k0JiGCrzG4khMQG1aEwF/qAdPn7qFpeCvwmopVyL1hr5fkt77UcRvdTJKlnafzEM1pxkldw/PmMcYW1jbfFDUz3jFnhR8vsfmAGZrysNFnqyezEnfClnQ9H9P0Fjl4REFo+
X-Exchange-RoutingPolicyChecked:
	zConIWnx1tiOQMFIvZAvcY8yqGP0Kqys6IaOUC1f93rs3eoXNkBxrZ6s4p7SxCe33jAl0RcVZLdGKuMiqmqSZBn6zRBEOyJgA+vrC9Zn7deGxbJVqnROPHhv8ksH++xDVry2mQ+FxaJzFL9mo1ZpmSK4cIfZ1ZRWPqMse1lV1rT7Bc3Xt0DJp6G0kTVuHcua11pt1FUpuY8HGy4TA2ei9hJZU1VYbxLPHaao62OBs2L05dtgmHOQzxjQ9x9O2UDH8YxXJhN4P5FW6tkFqda/COhslnhDchfNyndWJT3gQkjTwgnzlIllt29dhNxAKDD8jEbpQ2kf9YurbD+Y376y3g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:48:35.1865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df7a363-6a54-4b8b-7e48-08df3a698ef0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018545.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4258
X-Proofpoint-GUID: rfYrj0mPT6DBM7CQE4f9hh0LaeFYQbLP
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6aeb1b97 cx=c_pps
 a=2p4Im4Y1RcQvwJl7Z3FgyA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: rfYrj0mPT6DBM7CQE4f9hh0LaeFYQbLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NiBTYWx0ZWRfXyFmm5SJRmJuD
 7dE49vmkApf+xEsL8/X08F3JbgLsOdnhWm3SNFypYAvJe6SxWYXtXr/h5Wb7OKqhHMEzv7v8pLZ
 0iMSg7XojaNC6YUjohpp/r6M93k4htYdAFWQPIlzKCx/770lK8cmDZDJ7v3KY25Jjejf0mxWB6n
 S2u71FS5XN670p9Pc6WAdLA/zQr8rmfRXxalHDcssZKT/XNp36MVWIVwZYPwMt9y5FcyxWQ6TWB
 gHx0jox2gcFxcP9R/pOfvBbL6d/ZAyDgyjpcHzXp85UkrI+2L7nTbJMyAnO5yMmGG4aDHe2g01D
 JDCNPqr6Gp6GLTmloaTRBo8fni9ooQMKxQW8HzJatFrdyV3FOI0D98mtGVwOno/ki6PA0JC5iNt
 dyy3GZkKrlqJAnqps+xgS1zVSjOBsWbRJ5d79aOunZJ7E24IyWnzLCveTQJ5+XAUTbbru3H1a3Q
 ndjviivjoPXedD8J9Cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NiBTYWx0ZWRfX7NMIxiagSEDf
 AqICdlHjmWzCgt6wIDt5LhJ55btMEKj6ms5l/ezBx286gqSoF52upoJwD/T0LFJGQvxjf4Oe2EF
 fYZ1d7hw1DN3eIKu5Ohi5K4mBeKuofc=
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 04, 2026 at 07:33:09PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-wm831x.c    | 13 +------------
>  drivers/gpio/gpio-wm8350.c    | 13 +------------
>  drivers/gpio/gpio-wm8994.c    | 13 +------------

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
