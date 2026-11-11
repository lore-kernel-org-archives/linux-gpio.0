Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794394886;
	b=1L+D+iPxsB/M+RqjVs5WE4p2S12HeICLyzKTJQ6zqXWv+ZzcSf61Rbny1EieV9DPF9SZ
	 AEar81OGIXN3AFaX39rdXomeoFRvKgg2jy/oUy/2Oq5zJQlNmnBjZwnO8kofwVbtZ5HWo
	 KZzUdRU8jCOoZMo/k3wLnEVqR+kxOWkmC2r5YKGcaqUQRCAek0eSjS2pxuY0l6Va94gxh
	 gzkTmMbyIHXo6YHLIWUPbPQ2Jr5QaQmOMIkt8bvQnQrcDYfWxw/4LzvxKJarCX+vL6QEM
	 ZyJDkuZ3gyrWDq3shn76oR2dmpTvxlR2YqnU6WCs1IRPNJkhU5s4i1OmfRhKTjPaiAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394886;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=b2ujhpezfv713AkHipE7RprQnY9NnqzjNzgnd102prQ=;
	b=5AJcUMjHY++I34ZFxuOcLiH7eao4hT4IUJxo5zbjPWYIfBFopU0UkrFzhxjuvYF05F1o
	 BRXc4iT3LFyUj2u+r6WWnQz2ZfGW/JQtkdO571/h0nIH2JNqmyyxaEftHTOUYCzSadoi3
	 kjSwYrvS+9aZJc4BCxqWUIG36wFA5tbQhkDv9EW3B63crVSJqlg1urqWB/Jbn805udA4D
	 +KttcZ9VMmEmSoWNFBESg5dTVBj8/n44xuwbJf/i3lKvuG2Bxel4XnG7FNjp+SMdUcQ3u
	 ZpcvL4VvuqTGmGhDEDE8M/PBZ8CbesBiM6h/z44lSezuenqW4z8GeQcz/0NGLPBVG8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=k0ywQICF;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=gmgYNYjj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42102606A321;
	Wed, 11 Nov 2026 11:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42102606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=k0ywQICF;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=gmgYNYjj
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAxxdB3568065;
	Wed, 11 Nov 2026 05:01:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=b2ujhpezfv713AkHip
	E7RprQnY9NnqzjNzgnd102prQ=; b=k0ywQICFNjwKlBPevjZKUBmQm/mGWXOOTs
	++TgjYBjKcCBuiXkGqc7cO4Lrg4yqZPxn0r/4+regw26lkzDhgUMSHdbMGgqz+Ak
	QBclGdVb75BL6jWE1VaOeP141m7mX3jeBbGgKUB4CyNIez4IXorWyTo4H9tA7QXX
	DI0wt9j7SOCg2aU6sIoBrd+dDfn1Hlu7qCBEykReMupiahiYWTy4/f6GKjnHRhDC
	MAC/T/gGaG55ANZqYlpz/DUG9+sWbkyyk/8N6My8xs/fmn0xwnBtS9g1wNyaxrfz
	qxm3leejweXDZ/4BxvzDbP9DoC3t7WflNgpL5pmVGgEEQzoPOfYg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021142.outbound.protection.outlook.com [40.107.208.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7ursb0v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 05:01:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anZU04E15swk+IeO3Vx8jLHMPjNRQfFBdKBpayZGfZW30hRdHE6JfweR+gNwJSDrMMErHrswqWKd2eBYRvRC4ntDjUkpCUjZFhLTwsI6d4PioIaAeC2itKKmzQD1hRs1iJyGHCpmd0VYWbTTqUkpSUTpvbGYgum01mEi0cq4wYpVA+dOahyi35THAwNBnLG32k2BUSpK5ZkiR4vCtSYzP9OcjBKup4eXKFwn5PEa08ROqLMTvmvT/NckGiJSlnp1z3GoG8hC/+SQklvC6PcECzM2Zr7beXnPRSZHyaVudFIyLDxSoZFrDQ2H9P/XwVUHnXzio9qaVP0NhaNZlQc3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2ujhpezfv713AkHipE7RprQnY9NnqzjNzgnd102prQ=;
 b=ax4R+sOHjuBTP+d9rvpUc6X6fH2/wjJMQbkjwBr1WBpolJnfsMaiZ3g9do0dqVDy/buqrYRc4mJnBOCnJ/BNRhXbMVUFejfeVZ6IhxjwvaNfjL9zGSrRmCbDi78yFs0qNYkvBfferIU9J/V6cKgjePCzwrrk/SLuxfZSnz18U6gRwpxO2uMFpYdsLXcxchNqmjSGOk4CJp5kB7t+2ZrCK8Jqw4Bfacq2t453qJ6YQghmRIlWvrynncH31Zw5kaXDpNFuLmxhbFF3Zthi6tKN3IlbZIQooeYVCZMerFo0JYjeReTEwyHLHIvRczo79YnednmRfOZthSynu8lpkS+iRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2ujhpezfv713AkHipE7RprQnY9NnqzjNzgnd102prQ=;
 b=gmgYNYjj2EPabLuEyxV+9vgsQCW8LS4jId6lWhqDSsJVVwOJ/m3Ri98jIn8MUrAgmwWzkwH9lyhu+k6WAlbHd2pIjiDMKfleXcEz+ImpXZ93EMjbwFogDZkBtskpdxJEWQxTotgrKXq0vrc9AMbgOb8mE8hACDdcOAyFVrbBPDk=
Received: from PH8P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::22)
 by IA1PR19MB7277.namprd19.prod.outlook.com (2603:10b6:208:42a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 11:01:17 +0000
Received: from PH1PEPF00062F24.namprd02.prod.outlook.com
 (2603:10b6:510:346:cafe::ab) by PH8P221CA0044.outlook.office365.com
 (2603:10b6:510:346::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 11:01:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH1PEPF00062F24.mail.protection.outlook.com (10.167.243.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 11:01:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4910D406566;
	Wed, 11 Nov 2026 11:01:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2763E820273;
	Wed, 11 Nov 2026 11:01:14 +0000 (UTC)
Date: Wed, 11 Nov 2026 11:01:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linusw@kernel.org, brgl@kernel.org, patches@opensource.cirrus.com,
        linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
Message-ID: <avRK+M3AO5dXL1Dv@opensource.cirrus.com>
References: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
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
In-Reply-To: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F24:EE_|IA1PR19MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e59ae5-1484-4ac3-149d-08df3fe31b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261022105027099003|261026140227099003|261028144727099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sz6m/HAme63XJPWQgjxEIWINn1snkRjdrf0n+90O2eJLX743wxHfJrdnIUUCtmxLcuLTTfeNQKreSF5YSKWH0lqGjCJ75RWX4QAEC+vh+8e1qeLDV6jBf316KsvREHUHO7SSMpsWCumKc+7Rgt3MK3nX0dfXgBZdJOL7tDWpjLQG2g9HwoKjTAOI52JuwW7WJcAqKOhKYUSEigkRLiKVNvXeKPUaL8sV1pzr0jI+7vOlQ3M+Sx1E40RCYp6DsDp2UJ/3oBUNLiUvn6vZlWTGvIoiVp2bcUbQnBE5hZ/CUWcksv+AZraO/sfVu0QDGvWUrLKi0tCwbCp4X7ZW+1ofnKr9w26hbKy8kCnY4nTXUNGY/1cpNUYa1JC4W+nkEjJhkfJrHXx+/KpRLJQR344YXSO68PsANNFf3WyflnJob7agwA2dZ8APF+VQd1gFnnGyuQt79BxZQ9eBEMCXFpsED8yOfAS3n1MfpQlsohV68OqAwCQR2/C6Y1QPRjRFYnrqo8kHfn8Z6H+m5LKBKJZbMrF5i6a7BqYU4tSak0tWJfsXYIOogybyGfv4rMtNJzZsZVroS8qpoxeG+jWhiCMblFV36Qe+iu7Peq8RgDC99pKMozS1R/jmy2BLMDuHwBkq4Crp1II9KMUwLr5oNTBMZRJ4T/K9WxetnUI6zwt9oqNHNDfx6BaoHJORS/+H4jWNuAb7Cu1fXThdwOHmAEvUiw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UPaW3dtjZSumMmdUD0YYTB/312OfPTtidZ04bdzj1ED1oZR4b+bFok2x6MMcQ4ylDD5DBx3DeT7Gh54c6+9g/+lmwQ45F4fSyecJdk2FbBDOBUvgTE+ZR85J/QWVKJXLJOryW793nGeAH5ScX4yxaajjfAgFCcGfzgtbwVR1khYq9ekE3epUxD2Y/EBTl2/qPeco8VCB4OUFU9rISOzwxzEPh0v13PFg6GAJ9jDqb3N1bIRKvbcir36TVulM9wL3tdzvo60nCfvtLpoakaHyDlzbS0NfEfFAvCJgZZgh09Q7uiKtoiREJ9o2e3QfAlGdTnVSE8uBIS/GMHfI4+534ObHRQP4OdUZvDgLuFZp5dEoPknWUmxk+aNp5BdLb14XPvdLIDkc95hDWpXTf4k9T+rgAzw7x/AWXeaqgZJ1E7dXaZx9cQpC9iKkUBpvBJ3D
X-Exchange-RoutingPolicyChecked:
	COkz+9TX7s2YRL6OABbA7KaY4zz2U0RJyik6bxsIb2TOSMDAtyobiKtmDAVgQyX1HpGHgE5xrzeXRjGg7OBR1yCfOpYU2HnYi2y473qffL6AIKohgxzrMdbkOKVlbZlZlOAYfgII9sq9om5oR/kftF11h700GKpXXlLtT/1LKhEMJVLPeSEH7L7NJHQRs7FxZUW2oooXHru8jZ5pnmJJ9NQ5kyS4uPH7FMt029+LRLGkN3n40+VciHwoeUajFIKE1f8iw959m/OLrnwmERCoyES9FjAnaczFwmuK9LzMPA3QGCtx3l8RHvURmBdz6BHZKqATUoj09ehHGf3w0okQeQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:01:15.6577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e59ae5-1484-4ac3-149d-08df3fe31b65
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH1PEPF00062F24.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7277
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX7uxpQQwOoTrI
 l6UJiB8lAgepcoACfI/psCGb49rNbio8pXOZi0tqlZMbnvx1tzYq7URhMXiWk5ie+zKk84jXkjH
 jnjYHK9nnEbXRkfMP6AMN6CDmTH5m1zWX+FzyImg5Dc3CCCaIRjJzXWvHa8vEz8IZiae5NWD4kD
 IwMA0doph/OTqfHivITY4R8WtvvFufYk/XKUYDG9rzSlW+TINRSXx7/+Giue6WPxvBzGNfRPz6Z
 xxq6iPDJCl13LABJ/+fHkJsTA/BqPJJgcO5BwlNJpWoWZWFNpeSwVcebsIzXjA4p78dsZb+8Y6W
 mljpYawyspl6hQLveHQcttvq/bTC20030s6QnfCuO8QLyeZz8ltHjLN5SSTx3NorecEUsvbm95t
 I7fL4Z6ul07heYbP9n/Ccn3JwsZd8YiE4KeuWwXw5pv/YFxoKurqc4OR1oKluO8UHfvyDWuQwqZ
 Lum/V9Eyl8kWzOR2ZBA==
X-Proofpoint-ORIG-GUID: LlflBkNdSRneJgsTzB49pQXyTip2J3pp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX1OlASTu43KaQ
 rxKSiWzmaPLi67MRgzB7GeOIeoswdmPkwMsX59W2/PaRzTPcTuSpj4FfK7ZJTkKMTWH5ManrNnh
 8kTyjysPaRkmnfsCIfq259XFj2fDeC4=
X-Proofpoint-GUID: LlflBkNdSRneJgsTzB49pQXyTip2J3pp
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af44b01 cx=c_pps
 a=s+5vLJ1poW1T9bNDw6yRNw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=2L2IZ_fT2_NVQbZiCfsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 10, 2026 at 02:20:58PM +0000, Maciej Strozek wrote:
> Add ability to use cs42l43's GPIOs to drive speaker and microphone mute
> LEDs. The LEDs must be described using
> 01fa-global-mute-led-(spk|mic)-mute-gpio ACPI property, which tells
> which of the 3 available cs42l43's GPIOs to use for the respective
> function.
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
