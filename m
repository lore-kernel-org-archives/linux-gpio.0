Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793092232;
	b=GYoRcWYaaGR3F6etPXgoR+nExM6W6Rfqg7/YhD+QE3H4AoUJ1cmoSTBCzuuAE816Qgwo
	 BYxEfv86buLELS26oUKleED1sZbLsx52fqaDk/lRNHx2mT4VNWelW/j3UWWsGm1CO5YwP
	 WvwNXylxUHjLRY8ta4KkGDeL4LBv1jjMh/fpkAz537+F9XBsG3E7M+T7obV1wajWPLOFR
	 ChY0bRi/lY1jpyjJlL/Gps15/NYoIz3DgPLUu7hTIehF29UHiIjTYnyRTUoNt37N1L6ul
	 XfXsraCCzw43qFtScpSmPoOBD7fS439/Ku8Mx6fY8Lq6vLa6zj3wMuRhz6/phsXGA9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092232;
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
	bh=FQ0g8map93RSIFeiogiCUo9+RMAmYjKQ5ZA33gRKt1c=;
	b=dnHNdKLhJegBjn1xHiHa7CSGR5BRcrOv1PWVtx5SwXKD+4hxUGA1zYs4tlVFklA08N0b
	 c6w5rolps31jPG19clRNiLR9qyPu7heLEJbnsayxL6LJbY4KFcMUTaAsAElI29AVughm+
	 YWNvc+mQSGAZ9WNaQc37FaxS+I7+glljNcE8A1dkSAm+C5K8SAzMrBNtpuVe8ZtqIqXQ2
	 ccgFvJ3Qc5u+1mujP6hIgeGhZgPpys8j0V2Po9I4BeX+44nzCqrSLjgeNFiNJr1DsLtH6
	 ssPOxdjGDnf1Cx/0JfGTWHhXJfQEFp9klD3ifQVapDmx9/PBy6cmIz9xUZXu8sYRzSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=DLU1KhC0;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pPbM4a6s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6561F606A31A;
	Tue, 27 Oct 2026 09:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6561F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=DLU1KhC0;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pPbM4a6s
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R90N7o4055809;
	Tue, 27 Oct 2026 04:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FQ0g8map93RSIFeiogiCUo9+RMAmYjKQ5ZA33gRKt
	1c=; b=DLU1KhC0VuJGOCTgiLJV12wLAbmSY7N5wNOKFGC8ugHs5NAbmBTTlfe+s
	t5+1x0lVginzSWsOe6EteYRHsF/EXk1zDm6xUSMAmLBSRTQyBKLmn3y23NyL2yxy
	QkOD8aB1cRvPJkRo1yiKBcILrjxD9HveTm7XlvO2lYjFHtDcOfNQs0lLNWwqL6dC
	bsAxongs1v0o71T6rhmrrnFgAouXea/uVZjfM7uckTj6wAbUlYEwxPGlBLvTlsgi
	o0LpIaiNbU5yqKLpN+UuRpmncMdz3ehP8rvlUD0jgn+1+jjOg1xGDKtsLl9jZhNa
	Z9WL8CFbICVbQ+5GEgukjzTSg3k7A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hj9sgwfuq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 04:10:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgDxDaO/wQlgrSsFz29eZoc1v8+H9JlWG3V44x1hZd7w28hJ8SxzOqO35DATcFFu5C5oOFRSimhgJe5Nq95EcMP7E1O0gOZMB3f5xwI03G6sRg8u/iQL/hVPsa3Y7Wy/7VZ53TgRPD1uc0qz7onf48SXZYFal6EnBOjn8je7oHJBzZjBILMjc4an2IG0l3tiefdeXiX1IAtNY+WFE4pZ45rBTijXGBzNlyauRGsfcQBqd69As5CWWYsyh+EbxICcMaE8XFXA4s/J4xPa0xJzsRbLSjkQFhS9UcdbcfPR4AQfV9R7aAWm7XFwVd2ZspgRDVLyFNHtOslWKTdfclwO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQ0g8map93RSIFeiogiCUo9+RMAmYjKQ5ZA33gRKt1c=;
 b=SXstJ/VJPXHnJz7qBbST+NgjLrXZDFsyooeTlTRXNKfu3PRLD8oXrO6SoVnvDqHrCZfUPC+GfzI3vUoPCOgOrYpIpJUWmRTI3ZmIXEdT9kB28HayRLmlVnDRscLWxfMWwSSRpfl3xOMxbHabtT/qCQCOQQyVS3qE7iaGDQPo3Sb6Uw5wYBe67xVn8EZQ8jYywDL/BdW+tSSE6e1zzmTF+QvBL1PVw+RCGnTDvvquxmZNg+/oWECuGmEYCkNqxa0FgGTULvFWYXT+05REU1fSrbFm/J9oBihGY/YLxbHkNapTmJXza4T9k4geDjpCehrnMDL6bHZ5t5o18EBfKmVvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQ0g8map93RSIFeiogiCUo9+RMAmYjKQ5ZA33gRKt1c=;
 b=pPbM4a6sJaZlzv1FIqA3hrbxbowDTLn/Q7RXFEwFPR8SgmmMItsbBqn7QncOoDIt8Wj1yHjE5sG0AkvDEQiRSHsbtQvjARjGYmxafJ9m/THXhwKyD7T+fh3zTd0sW3KXvTsq328WlSRY6LVRAmUY5mBISlXxbFXPkAZyr9Momvk=
Received: from CH2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:610:60::28)
 by MW6PR10MB7639.namprd10.prod.outlook.com (2603:10b6:303:244::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:10:15 +0000
Received: from LV8PEPF0000005C.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::3e) by CH2PR14CA0018.outlook.office365.com
 (2603:10b6:610:60::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 09:10:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 LV8PEPF0000005C.mail.protection.outlook.com (10.167.245.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 09:10:13 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 04:09:37 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 04:09:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 04:09:37 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R99XnV1610982;
	Tue, 27 Oct 2026 04:09:33 -0500
Message-ID: <9d505e63-9d99-42fd-9638-05043ad36e90@ti.com>
Date: Tue, 27 Oct 2026 14:39:32 +0530
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
To: Conor Dooley <conor@kernel.org>, Linus Walleij <linusw@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <brgl@kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-2-y-abhilashchandra@ti.com>
 <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
 <20261001-repost-reselect-2b597c627c11@spud>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20261001-repost-reselect-2b597c627c11@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005C:EE_|MW6PR10MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: af0f179b-1c28-4c99-fb51-08df340a1c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|10067099003|261026121527099003|261009223327099003|3023799007|261021123027099003|261022105027099003|261009221227099003|261021121427099003|261021135927099003|261009220027099003|261009221727099003|261009223027099003|261022115727099003|261022075727099003|56012099006|4143699003|6133799003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	p4GLCZRLrlVpsUtBvjwXXRPbw2SRAXpPVuAznvwWKRlLuAlV/hn1GnevHEqrZi9wAuaUQDq+Ff2Hc9F0itbnM2IonY4PBhHm/UKG27s5uCSiqGiyZDeMSVZvfyoalWqI4VQyQuONsgyk7j4D2EhVe4XsGAJJwgQ52f94Z/gRiUs9dvM/9LXrR5suBo0h/POI09d9LiGcSgExYBfVYQBugWXeOBjDdIKXqOzx0d/5ZgaEsyDq/F98bHIYrisoTmMyjcHfPomHNxLWRQpO1sW2NPYPaGmWdtHoXie6IsYaDDLdwPaSCn8PzNFiCJ+ptnztyqvQNVZWkKcmzB4XP/J+iZjsN7ApQ8QrJ2p0jwatcO6GftTTgMHoM58CIOW9GtNl5E6dUC/6+muH+BfafOKc+LNTZWWdIS/2iXKDS7TCC+U2T2SxlP5q9yueuK8GbfCBhDWwF2Ep/dWtnmOAV8qhxzBXAzmyj5ZD5y4CQEzZbuSe502tfzHtqDfewkuy/J4mZhClO+xjK3W1vt1bVIK4KXc/cJ4ui7Ob2t44oyAzayQGUjj50E2l+HCaxm4f4Dv1s/r0d9aQItkMfqGa51tPpKBK4fGqUD6tKPBPDKIKXfSrYoxyFh1bvK6pgozhZQiAP8zJJ196bpDWVyEIB7URju8hf43jG9rEySLN4kI1woA=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(261026121527099003)(261009223327099003)(3023799007)(261021123027099003)(261022105027099003)(261009221227099003)(261021121427099003)(261021135927099003)(261009220027099003)(261009221727099003)(261009223027099003)(261022115727099003)(261022075727099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iHNikiO7yszel2Qg7GAerVLe6RecDOsx3LIcS565EVZtuImcTCGGoBgKxQvGtnUsZUGjpFYMGxFoBWWBnJpqRkfRUXcxiNqpQzUhENrQYnRIeQdS1euCyW3s1a01woy035Y9J1+Ujs45tcc0jn1VDDSisxV97x+CqI2o6iAYBO8p7BeSjhN1hEhQL3x3cTcP6JTXWGWT/bBhvV8dt6Q9lx++0/yVXSvDhQx7aZn+cL1mvvv7M3lS8xQQmypIW8HYZjDS80BZjKUYXpgDrkuDdFVHTAckJzCjtO8c7hYTgQHirhfKgyOH8oC+samSD971g/ErfRfVn/sxLa5y/9yRgo9dZx2/sA+crS/Y/BwK3dRwcgGAkxtYn+oLNRz87WwweaNaL7t0vVnd4Q6+82FYAas1m+mhOj3xttaDiwQC0bNeFng4+JQ6H36p8j5AOLZS
X-Exchange-RoutingPolicyChecked:
	xDsjfTQvwB8kL+jp1LOGXRhtLf3twE52zGoM9hJ9JCpvVD0WSHZchHXIK5vh09ITfUx4n3cgo77K+WN7fkUu8XiwQK8kfOYawglJxFPmacAo6XPxJntLPUGIL4uDhNFZQtOUTpEws6B2fvrVgz0vZbWvClafkagyMZVPd+kbrGkRXn7tOI97FKQCh1Tjehqqt1OVFDOXhA52a0MlwRCMynVCuLNJXE6x3atSr232a8GEzWvDg6dqSzJ7JM3OCWA8P6suJbo0XmEKmHyil+bYT/fFKbE0i7gxf2B3QFuKNGqxTCh8VyrHLBAdVJuYjbmQ6s3QW/7UnHooPxp/LzJDGA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:10:13.6785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af0f179b-1c28-4c99-fb51-08df340a1c3c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7639
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX84v6jtdtq83R
 2JIsp9cgI+5dCplTXLPBXVuWuSSAJmDj3gJduOic9QHyOlUN0dwqMMFlT4suH9MLAbEJRdsjvbR
 Q0Wao00a6PwAS8uTBgsQ/6i+xQUU/wA=
X-Proofpoint-ORIG-GUID: 4-VJ0NbyI94wVxLxF59q2byIAzYK2ZbE
X-Authority-Analysis: v=2.4 cv=O5GsLx9W c=1 sm=1 tr=0 ts=6ae06a80 cx=c_pps
 a=f5Tl6ILaYY6UHEJdjUIuFA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=Ja6DrOVAxxP7iCVqLZQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4-VJ0NbyI94wVxLxF59q2byIAzYK2ZbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX9lC3bbRnduG7
 x6XOePTz8tfY5z2US0dmFUASi/Ud2Inrs4m5ehOwBo18VneIlcuk3yKsA+NYmKBZjU6wr7/y45h
 43h7WqOzByPi/BjtSpbhn4tEVd7aILMPbeABbG8u5oScyIWPpdt/QTnQQvbpPfFwfOEOX89ZyWL
 R+rH9aV6DApLclzkLdtgxQW5qyOIj3wHUUAMssWNrfC8x9PATXOEZrYnPYgzgHFcY35TUpL3SER
 jYn4B5W7sQKUcP76PzyZXcDz2IJXt1HeqB/qfPJDa8f5QZ4rzuJefXwTSIP6zJ9TzXzzlwMevn5
 Gj7WG///kVC7ziX7dY1OJUunKqyvMy+FNQGfPMxshCiXM4r2vOhGZgCaY/TgdyKEBYWfscCtU63
 DrN2+nMr/CrcKz73TnKktKj/cki+XN/gSesZyvlRiN8Vw1AeM9Stb+X4sLNkY//LENX2vP4WUEz
 pRR+PZgMLeTl6Sm18qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270036

Hi Conor,
Thanks for the review.

On 02/10/26 02:56, Conor Dooley wrote:
> On Thu, Oct 01, 2026 at 11:10:34PM +0200, Linus Walleij wrote:
>> Hi Yemike,
>>
>> thanks for your patch!
>>
>> On Wed, Sep 30, 2026 at 11:21 AM Yemike Abhilash Chandra
>> <y-abhilashchandra@ti.com> wrote:
>>
>>> +      ti,debounce-select:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1, 2, 3, 4, 5, 6]
>>> +        description:
>>> +          Selects which DBOUNCE_CFGn period register in the control module
>>> +          drives the debounce filter for this pad. 0 disables debouncing,
>>> +          1 to 6 select DBOUNCE_CFG1 to DBOUNCE_CFG6.
>>
>> What's wrong with the existing input-debounce property?
>>
>>    input-debounce:
>>      $ref: /schemas/types.yaml#/definitions/uint32-array
>>      description: Takes the debounce time in usec as argument or 0 to disable
>>        debouncing
>>
>> Just translate usec:s into your custom format in the code, problem solved.
>>
>>> +      ti,virt-gpio-instance:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
>>> +        description:
>>> +          Selects which virtual GPIO instance controls this pad, allowing
>>> +          protection between multiple virtual views of the GPIO control
>>> +          registers. Has no effect unless the pad is muxed to GPIO mode
>>> +          (muxmode 7).
>>
>> Wow crazy stuff. OK keep it :D
>>
>>> +      ti,wakeup:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1, 2, 3]
>>> +        description: |
>>> +          Wakeup event configuration for this pad.
>>> +          0 - wakeup disabled
>>> +          1 - wakeup triggered by any change of the pin input value
>>> +          2 - wakeup triggered by a low value on the pin
>>> +          3 - wakeup triggered by a high value on the pin
>>
>> I just have the feeling this should be a generic property. It seems so useful.
>>
>> Can you just add this as wakeup-mode = <custom value> in
>> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> 
> And I think it should probably be strings, so that there's some hope of
> commonality, since obviously any user is going to invent different
> mappings.
>

Makes sense, I'll make generic wakeup-mode a string property in v2.

>>
>>> +      ti,retention-bias:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1, 2]
>>> +        description: |
>>> +          Enables the internal I/O pullup/pulldown resistor when pin enters
>>> +          TDA54 I/O retention mode, and configures the I/O pull resistor
>>> +          direction.
>>> +          0 - OFF mode pad pull resistor disable
>>> +          1 - Select OFF mode pulldown resistor
>>> +          2 - Select OFF mode pullup resistor
>>
>> Use names inspired by the generic config types and flags instead
>> of enums.
>>
>> ti,retention-bias-disable;
>> ti,retention-bias-pull-down;
>> ti,retention-bias-pull-up;
>>
>>> +      ti,retention-offmode:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1]
>>> +        description: |
>>> +          I/O behaviour when retention mode is active.
>>> +          0 - I/O maintains its previous state
>>> +          1 - I/O state is forced to the OFF mode value
>>
>> Behaviour of *what*?
>>
>> The driver stage?
>>
>> I suspect you should make two bool flags
>> ti,retention-output-hold;
>> ti,retention-output-disable;
>>
>>> +      ti,retention-output:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1, 2]
>>> +        description: |
>>> +          Output driver behaviour while the pad is in retention mode.
>>> +          0 - output driver disabled
>>> +          1 - output driver enabled, pad driven low
>>> +          2 - output driver enabled, pad driven high
>>
>> Make three flags:
>> ti,retention-output-disable;
>> ti,retention-output-low;
>> ti,retention-output-high;
>>
>>> +      ti,retention-force:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1]
>>> +        description: |
>>> +          I/O retention controls.
>>> +          0 - gated by the Device Manager logic
>>> +          1 - forced active, overriding the Device Manager gating logic
>>
>> This is clearly a bool flag. It should contain device-manager as that
>> magic entity is involved.
>>
>> ti,retention-device-manager-enable;
>> ti,retention-device-manager-forced-active;
>>
>> Both seems to be related to the device manager whatever that is.
>>
>>> +      ti,isolation-bypass:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1]
>>> +        description: |
>>> +          I/O isolation for this pad.
>>> +          0 - isolation preserved
>>> +          1 - isolation bypassed
>>
>> What does this even mean electronically speaking? Explain in a description:
>> statement.
>>
>> ti,isolation-preserve;
>> ti.isolation-bypass-enable;
> 
> Is this not just an either or, so there should only be one property
> here.
> 

It is an either/or, but with a single bool, leaving it out wouldn't
clear a bypass set by an earlier boot stage. So I'd prefer the two
bool properties Linus suggested, does that work for you?

>>
>> perhaps?
>>
>> Some of the retention settings seem *very* generic, c.f. this
>> from include/dt-bindings/pinctrl/nomadik.h that has been
>> around forever:
>>
>> #define SLPM_DISABLED           0
>> #define SLPM_ENABLED            1
>> #define SLPM_INPUT_NOPULL       0
>> #define SLPM_INPUT_PULLUP       1
>> #define SLPM_INPUT_PULLDOWN     2
>> #define SLPM_DIR_INPUT          3
>> #define SLPM_OUTPUT_LOW         0
>> #define SLPM_OUTPUT_HIGH        1
>> #define SLPM_DIR_OUTPUT         2
>> #define SLPM_WAKEUP_DISABLE     0
>> #define SLPM_WAKEUP_ENABLE      1
>>
>> SLPM means "sleep mode", yeah pretty much retention...
>>
>> I think the corresponding retention settings for things that are really
>> quite generic should just be added to the generic pin config bindings.
> 
> Additionally, if any of the custom properties are gonna be kept as
> numerical values, they're all missing defaults. In the case where you're
> advocating for multiple boolean properties, one of them is gonna have to
> be required as otherwise we're looking at indeterminate states based on
> reset values or what a prior stage may or may not have done? The reset
> values should probably be considered default, but the cleanest way to
> make this work with separate booleans is have a
> oneOf:
>   - required:
>      - a
>   - required:
>      - b
>   - required:
>      - c
>
> and you've also got to deal with people potentially making mistakes and
> adding multiple properties for the same feature or trying to overwrite a
> $som.dtsi/$soc-common.dtsi config and not realising that they've got to
> do a /delete-property/ on the other property for the feature.

In v2, I will switch most of them to boolean properties, with every
state available as its own flag, so a DT can always set a known value
and override whatever an earlier stage left. For each group I'd follow
the same pattern as the generic bias-* properties: at most one flag from
a group, which also catches the dtsi override case in dtbs_check. If
none is given, the driver leaves those bits untouched, same as for
bias-*.

Would that work for you, or would you still prefer one of them to be
required?

For the numerical properties that remain, I'll add a default.

Thanks and Regards,
Yemike Abhilash Chandra
