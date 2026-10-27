Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090991;
	b=glEyXk08m1GzD2l0yA0KAk6LklPholu/4oJRkl77BrA/g+oPIGFmAJ1DptMLoiUbGSQv
	 CpBHdlU3q/uOqLK+o9TCdVggxl1T9Sw3PC7jB5lN6YcfVGiESNtSUBow8llDTUrRsquW6
	 1K1ZbYSZ4EUYl5hm2e6tUklM+XYOnSa2lxiPuI37K8nwn3WKlWCmiftQxQPzAHmuP/C1r
	 vBTfpbEgbnQd57oUI6On3TROOEwK110m9Ox3+QcgnRUOZTU1PWdMk9NSma5JS7+pki/5Q
	 SlgEIVfiEEJyXrEDOeA6IY5ztZBQHxKfaPAkkoax1KdXPDr3YBrId5BBm9/9G9JEGOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
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
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ai/rPj0k/dcF6qIR2ojbTz+PmJVaAiOnPaNdcLE5drE=;
	b=1ufbd8XGS0OekQ7Ui+jAPhPv8llyDwBN3Ju8JM1bAlLMHJCCP7g/zJVkwaBU5ZjIJoOr
	 auudR/SO3m9s9s4tJbTTcIcZInwmeYr/wVbofC8U8/f4YegXCF9kNEi1ch+QAbPphGCEU
	 mQZzvxC4iycbKyuzzRcAqFxanzwFJQnTqTWXwLHAt/mi2gMBgBIUcsaW+IjnVYyxInxML
	 Xkkk19Ll0Nuf/N3nFPuVKn4s8e1Nt/hSY2BORcvUOMoyH3TkLv6WK5AFv1HikEVOvdIqF
	 byBx3yG+HoB6r3C+ZChiQRq7BHfnQ/azfdbIcZ9PqvcFxjcb0QxTbMQ9+DBCX85nzfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=n6xBxOTy;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=in72CcJb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A33606A31A;
	Tue, 27 Oct 2026 08:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=n6xBxOTy;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=in72CcJb
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Y2ag4055693;
	Tue, 27 Oct 2026 03:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ai/rPj0k/dcF6qIR2ojbTz+PmJVaAiOnPaNdcLE5d
	rE=; b=n6xBxOTysMMZYn/fVWb/cEWvE+GnMUUNhhPqts+HKKUjqDgJ6u+DbbIit
	4SelxHBQ08UoEqy1ne2bMoY6QRBqtkwyMlwTQEqAApiTfcdXK6Ss0ftVL2DfVFq8
	0LJbGBArFgTL44C2lZNplA5e/dA1SOwJ2ysSiaAOapBgkeMTtEB3HsF6pQP9P1rE
	JuTs2W/oC9zkxd3Fn7vjNicB7pBfwcEe4zDg/dnsu5K/v2KggsC2jMOlP8ueIca/
	HxIMK8cOozDmBMoIav62Pf6q//KpacucpNxlYakFmynWjuZxJKiYalGwNW5QDqOe
	jmQcapr10xBgFkRJr+pqazmcLiopA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hj9sgwaxe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 03:49:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTcRWqoNNRjfxnuRh58Jbyeuw2WNVK9DVQ8wk/GLxZH1woCgVy4EMLjzkwbwvCXMDhzXheY2QIpFrz1PBPggX1Patp4DG7YO5AC+ANksavim07EzLqx2v0Yx4y6qkOPM8mrGSFjdUqUAzqJ8fTcHSlOTLyW7W7kczEcJF6WwRLFDjccexMMi5YeG3Hqy0h4bM+8Vlw3tsyqoan43JxISvbAKKbyrVVXFimgVvv8+dPgaNxl1gWymA+MJdHPYwN2kBNmITv3CaUtA8qQ3HbEBSdUoM/WXy4CpcY/XY03Hgqm6GVgzrFjIsqyiP3m1Uk083NVwg1V/B9volnamLur1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai/rPj0k/dcF6qIR2ojbTz+PmJVaAiOnPaNdcLE5drE=;
 b=JOJten7MrDJjzsmhQ75czwy1si9UNDwCrQZH6TH5aEBYTTqKt8vVT3cKXex+8rUFcQHcHeSWLikS8P5npRqeRnqSch5ONxeKlJ5WitVOUQA69TACeM2OGKny3tlDHAuM7YJCWQaeQpI2w/WtOsb/yRGqA2m1RAcgP0DbarKAD/521VMF/JptPdRKUJwf4GjrW52LaAXI6Gu1aMbXMSgr4Mv6CmfmPN7mASZKb/t/xhSPvXQUBFZq87wrNJnYAClckO9uK8jX4wxP+mAVsvvRl754DGABSbf6WRylGozED6bgBSLW/nBws7nNSmfLCLVyPUu+JXUEguzGH8/84g56ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai/rPj0k/dcF6qIR2ojbTz+PmJVaAiOnPaNdcLE5drE=;
 b=in72CcJb9w/ABYsnzlxQ7G1fy1RmNeolqBXYOTNE2IuML1jlt9mDb6nxIy42OQ97D+FOrGvG12O3OGYPI6wfs6QhukSYU2MZSrGUrEFHJLz0SosFJ6Y+1v7E/Z187fBbPugaN1SzNvKc9hD5vdm+UHjIGWd/Xta9Yb/+P5oEQ4Y=
Received: from CH2PR18CA0035.namprd18.prod.outlook.com (2603:10b6:610:55::15)
 by SA2PR10MB4537.namprd10.prod.outlook.com (2603:10b6:806:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:49:41 +0000
Received: from BN1PEPF0001854A.namprd05.prod.outlook.com
 (2603:10b6:610:55:cafe::3d) by CH2PR18CA0035.outlook.office365.com
 (2603:10b6:610:55::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Tue,
 27 Oct 2026 08:49:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0001854A.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:49:41 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:49:29 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:49:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 03:49:28 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R8nN4g2530301;
	Tue, 27 Oct 2026 03:49:25 -0500
Message-ID: <6c2e06e2-95b8-4e19-b344-1010ac948c25@ti.com>
Date: Tue, 27 Oct 2026 14:19:23 +0530
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add TI TDA54 pin controller
To: Linus Walleij <linusw@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <brgl@kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-2-y-abhilashchandra@ti.com>
 <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854A:EE_|SA2PR10MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 78641030-0e1b-48f9-12a4-08df34073d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|4143699003|56012099006|261021135927099003|261021123027099003|261021121427099003|261022115727099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6XoqzhlLENP7Di6FrZ1xVVt+O64AsbJkZ2bsrx9soLB6iU7XAEHgiYX5XMsRCrrUCuyhziFeKZsLKhQlmZtRmq1d/17/kiGJJzARNE/LSwLYSlN3BZ/+Zp2Md8DpX5ERnQ68UbWcT67zp0tKSePqI8gkMgJaXRah2P2YE1cIfsDGNF/xAdfocQhpkcz37B/moigSoiPDGuoXC2ntoAY6vxbZB6IUfSO1/KKKQs2YXfehoF8mC2kDTYZVcLoBSAz9hvTuNFQ56+E2oWUUe+Rd9HXE14JfWcJ3y6PDIesmHwhSS9kNq2Wzs7Smef8GTeSdk+EMNn0P6dW4j0gKzl4sgZU+WStlXJ8Cg21PeZy8m6wpV010btKHbGlt6IvsvalPgbx0me3dScvvchdf+p/rIs33VnspmkYYicZ7HpMLOV8Gw55kECFxTAIx2UMnLUA4xxyrwl/OB8UKICxAu65qz5HSFqdPFBILtFR+t3wq/Bnn+uphxVr7MZCbT4QcBXlPhAVpmyzeHgMqeYIiabwxndRY5bXGUXOGWPXfRVyX8LYiZlF9yfgvfaGaXEha3N7F+hF9NRIz9/aGxRCHBfjKG13kVdEuWHFXVv4Y0dxuHTE7h/WkAaYhgTf7kU5gJfftGwbx+wTNgjasY+3O5uG8Vu7V532Fyab8qtakgcTIPPhcpOcbAbQvsyAQfYuwct9eXW92ypNPoV9ndIwBIYUAKw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(4143699003)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T4qNOb3jQUqBDsumjyjrRim+Dps6iMIHQFEHu/GIZNdGx2yL0/c+dvvgDH9CU2wJXqRBoDC1DggmbFC8Es+eTxJJ5MA9heLtC4glDy026rups0w0CVMIYBox/BFNIWQtf6q1uNRuQKjd34v+4OGJyNgPnr8LXSDCRNBoI94aQJsc53aAKfSJFKIx73laKzw+np5YZpe5mivQyG6iuNlLfRGNS0uLDa/1VQo8SsDHK6K6PwrpyhDgubwfHbPuPViMR2htrung9aOItH9Pj0/1OjYa7miVjxVfUyGzqMfbW7Ed8WTTRUheeL8Xp7KLd4Fd1ge5RTCTONOFFGcQmiOXVjA3gqcfevDXcsoK9e6eLc6JKCg6u4JNRbYLeYtEPTVAk9eKQJOyUAHrGCT2cxmZYmfwndOKDsU5fsQyYoiwD+mLXSvG6w4vn4EiWIF2Apsf
X-Exchange-RoutingPolicyChecked:
	LueA/vm6Hh0HPB7yrkGrHdbv0NaUZ0/7PkhBk3Xj88VHgMNgOVKrBn3qLovG2jPyhnJKlJL0w96kYjCtdc6eOLVIoHZUnrRTwtWlxHSZQ9S+7ksyP+xbhEH2zoAsdoxnA37kh7K6s5hFt7C4Eg4NbH1vpflxeZJTr/rpNya/s2qNhwbntsz3xRpAvXu2Z9hMY/1kX3C029vLSYGyIt/0j809Ol2I8/JkvxXMRE5u8WxwuuRdYQz7XSmbq3936AokGVRH2DfPCS0GAoXc0EY/PQwmHmtQWxiXvlNg4b3cGBFuyYZ6NfoeDXKr9x72Kmi/aBKW7pnVX+BPXPATP5rJfw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:49:41.0834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78641030-0e1b-48f9-12a4-08df34073d8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4537
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX9uZ1+Oxci5CQ
 Y2rhRXEWdppFyNkytPT8M/RbG7wjFAEnaGmgAWTPHtwp590u3QQ3bs+uiqAzHCN0nFTNY9YfDsH
 4eY128+YkCJUOQvGvXP2cj/w2n3Z6GY=
X-Proofpoint-ORIG-GUID: T533jy8RFSPJesNxI9Rd2qKy0_89aSk5
X-Authority-Analysis: v=2.4 cv=O5GsLx9W c=1 sm=1 tr=0 ts=6ae065a8 cx=c_pps
 a=B1kIKGfTVomdQYahC0fm5g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=MwKMck8DkIoZLm6_TacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: T533jy8RFSPJesNxI9Rd2qKy0_89aSk5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX5ANRpKGx7Gdx
 O2QMRHKMcmj6yZCYSiYvUTo5CvUwQVO2fHcXw1cqe8dSiRl3NoMLqCTMosSczsQI5tFemAg6zdi
 +BoXRgeAm3KVSQPjh2y0yIJ0+kLXcfZ00HJhvnxMGXr9mOI5sjQ/mc2v16oUmsNXtNwP5EXk9JJ
 cCVlHwgkHCwsiXXalBCz9tUzFRdjTwe5Zo7cE+xQ2oyvfwP6nuUA2NgShMBb6TQFPupIT7pRaST
 u/O5/zhV+2bsbsOnNKzR8toYFotyu2MLECSyR4+HMxtfoMvfLjsAmHza/JznZzHgo6dnBWJ0C5C
 xUJkz2TE6Mpu9pF1qDJlKDQncFuw6MXCKoYFQFBLlI0HsHW7reK9nzspNhWWKBb3v1tmFyzwGEC
 9f6MPA46UozBrSN1K2wUpiktfdRCgzsvS0LiZ4KVpspbrgWrj+VL3LSblmDI1mpe6433ygJkU0R
 kaHaw5rPt6jNU/loyGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270034

Hi Linus,

On 02/10/26 02:40, Linus Walleij wrote:
> Hi Yemike,
> 
> thanks for your patch!
> 

Thank you for the review and apologies for the delay.

> On Wed, Sep 30, 2026 at 11:21 AM Yemike Abhilash Chandra
> <y-abhilashchandra@ti.com> wrote:
> 
>> +      ti,debounce-select:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1, 2, 3, 4, 5, 6]
>> +        description:
>> +          Selects which DBOUNCE_CFGn period register in the control module
>> +          drives the debounce filter for this pad. 0 disables debouncing,
>> +          1 to 6 select DBOUNCE_CFG1 to DBOUNCE_CFG6.
> 
> What's wrong with the existing input-debounce property?
> 
>    input-debounce:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: Takes the debounce time in usec as argument or 0 to disable
>        debouncing
> 
> Just translate usec:s into your custom format in the code, problem solved.
> 

The pad register doesn't really store a debounce time. It just has a 0-6
selector that points to one of six DBOUNCE_CFGn registers, and the actual
periods are set in those registers, which sit in a separate control module,
not in the pin controller.

I did think about using input-debounce, but putting 1 to 6 in there to
mean "use DBOUNCE_CFG1..6" felt like misusing a property that's meant
to be in usec. That's why I went with a custom property.

Happy to go either way though, let me know what you'd prefer.

>> +      ti,virt-gpio-instance:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
>> +        description:
>> +          Selects which virtual GPIO instance controls this pad, allowing
>> +          protection between multiple virtual views of the GPIO control
>> +          registers. Has no effect unless the pad is muxed to GPIO mode
>> +          (muxmode 7).
> 
> Wow crazy stuff. OK keep it :D
> 
>> +      ti,wakeup:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1, 2, 3]
>> +        description: |
>> +          Wakeup event configuration for this pad.
>> +          0 - wakeup disabled
>> +          1 - wakeup triggered by any change of the pin input value
>> +          2 - wakeup triggered by a low value on the pin
>> +          3 - wakeup triggered by a high value on the pin
> 
> I just have the feeling this should be a generic property. It seems so useful.
> 
> Can you just add this as wakeup-mode = <custom value> in
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> 

Understood. As suggested, I'm adding a few of these as generic properties
to the common bindings and the driver for v2.

>> +      ti,retention-bias:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1, 2]
>> +        description: |
>> +          Enables the internal I/O pullup/pulldown resistor when pin enters
>> +          TDA54 I/O retention mode, and configures the I/O pull resistor
>> +          direction.
>> +          0 - OFF mode pad pull resistor disable
>> +          1 - Select OFF mode pulldown resistor
>> +          2 - Select OFF mode pullup resistor
> 
> Use names inspired by the generic config types and flags instead
> of enums.
> 
> ti,retention-bias-disable;
> ti,retention-bias-pull-down;
> ti,retention-bias-pull-up;
> 

I will do this change in v2 as generic retention bias settings.

>> +      ti,retention-offmode:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1]
>> +        description: |
>> +          I/O behaviour when retention mode is active.
>> +          0 - I/O maintains its previous state
>> +          1 - I/O state is forced to the OFF mode value
> 
> Behaviour of *what*?
> 
> The driver stage?
> 

Not just the driver stage, it's the whole pad. I checked this with our
HW team. When this bit is set and I/O retention kicks in, the pad
switches over to its retention settings (output driver, pull and the
pad level). I will add this detail in the description in v2.

> I suspect you should make two bool flags
> ti,retention-output-hold;
> ti,retention-output-disable;
> 

Since it isn't output specific, and retention-output-disable
would clash with the retention output flags below, how about:

   retention-hold-state;
   retention-offmode-enable;

>> +      ti,retention-output:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1, 2]
>> +        description: |
>> +          Output driver behaviour while the pad is in retention mode.
>> +          0 - output driver disabled
>> +          1 - output driver enabled, pad driven low
>> +          2 - output driver enabled, pad driven high
> 
> Make three flags:
> ti,retention-output-disable;
> ti,retention-output-low;
> ti,retention-output-high;
> 

Will do in v2.

>> +      ti,retention-force:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1]
>> +        description: |
>> +          I/O retention controls.
>> +          0 - gated by the Device Manager logic
>> +          1 - forced active, overriding the Device Manager gating logic
> 
> This is clearly a bool flag. It should contain device-manager as that
> magic entity is involved.
> 
> ti,retention-device-manager-enable;
> ti,retention-device-manager-forced-active;
> 
> Both seems to be related to the device manager whatever that is.
> 

I will switch to boolean properties in v2.


>> +      ti,isolation-bypass:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1]
>> +        description: |
>> +          I/O isolation for this pad.
>> +          0 - isolation preserved
>> +          1 - isolation bypassed
> 
> What does this even mean electronically speaking? Explain in a description:
> statement.
>

When the SoC goes into low power, each pad is isolated, it latches its
current settings and is cut off from the core, so it holds its state
while the core supply is off. With bypass set, the pad skips this and
keeps working normally, which needs the core to stay powered. I'll add
this to the description in v2.

> ti,isolation-preserve;
> ti.isolation-bypass-enable;
> 
> perhaps?
> 

I will switch to boolean properties in v2.

> Some of the retention settings seem *very* generic, c.f. this
> from include/dt-bindings/pinctrl/nomadik.h that has been
> around forever:
> 
> #define SLPM_DISABLED           0
> #define SLPM_ENABLED            1
> #define SLPM_INPUT_NOPULL       0
> #define SLPM_INPUT_PULLUP       1
> #define SLPM_INPUT_PULLDOWN     2
> #define SLPM_DIR_INPUT          3
> #define SLPM_OUTPUT_LOW         0
> #define SLPM_OUTPUT_HIGH        1
> #define SLPM_DIR_OUTPUT         2
> #define SLPM_WAKEUP_DISABLE     0
> #define SLPM_WAKEUP_ENABLE      1
> 
> SLPM means "sleep mode", yeah pretty much retention...
> 
> I think the corresponding retention settings for things that are really
> quite generic should just be added to the generic pin config bindings.
> 

Agreed. For v2 I plan to make wakeup-mode, retention-bias-*, 
retention-output-*
and the retention offmode generic, and keep isolation bypass and the 
device manager
force as ti, properties since those are TI specific. Let me know if you 
have any
other preferences.

Thanks and Regards,
Yemike Abhilash Chandra


> Yours,
> Linus Walleij

