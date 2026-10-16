Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31272D7398;
	Fri, 16 Oct 2026 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125161; cv=fail; b=jfwAFmdpSJe7z/awaT9opD+blpEtNOz255gRT97+/jH6My+Y/VoPjbaZuupMZWR87BdSvUYWCcKUyAwTKDML/xSZTKAea8OSoD4paDpDkb1WSDMsoyFQ9PROXvHMULkd7n3MkUVdClVG2svzrREDE7nMxetCurmH2puosyus4CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125161; c=relaxed/simple;
	bh=VgWEC32n6fsf/e1RN64y318nR1WnkQovFWae8jkYARM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=N63LFm0Dg6MBh539KVfiqssJh1bYWESKrmfChvvufpAh7Mz5kijFV8+6P4Y67SNLCywDIHaPFjXH5/g5uWw4CONYEfyCyfP7xT40RPWc+ZBpduLcB20Bp1VFzLepzD+XzKcsPERelupLSsoLyMG7LQqEjo+B/9zR4T5NG3jCF30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TnDY4IuE; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=dNFY+VdO; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TnDY4IuE";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="dNFY+VdO"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2oJ3q2484862;
	Thu, 15 Oct 2026 23:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Kj51Q+C5lrpKq/NDyaKWLJSsIHS+kJdn5uUBAlV9v
	4U=; b=TnDY4IuEESYJeozGmERkIxj9+Kb7rO9bLg5ywmXfHQFsrOr15Mw1xRdbA
	YqMb0plKNTFNDIzaBMX8wPBJn4rDKE5F4dTD/kyRT2vQnMIMcKy0wLLJYrKc+3vk
	vJsJB6FUNkwpid7ohkjlF4X4kIaRPMbtRv5KYxEnjbkpTjc0/2qr89f5DPUrXsBP
	F32pOcMU9GaC1BA8lFb2XujZQ10xPIvtwuVrTk46gROQjbEjmneiA/5rDWE8juzK
	x8I05bPa77TG0rwK9JCN7luzLpJ1XiB5iPaY7ZFDq5vPkf6EVezryYi8d7H9yWjY
	30IH/VnliDiClnfuy83HB00Zsh8zQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013000.outbound.protection.outlook.com [40.93.196.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hb4nyth5f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 23:32:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXp0Ie5dQ9PmTQIz5YCPiBhr3TvN1LztvMZE3crxluOn+G9NX5xfErZg8je2bIzXX6sQJgSR5gxoVU4HWPeRy9RA+T1VJPI1VtZZDeyHaEZHK/6DJCLtTCHIHD9vqNoKDaGDgRFZTjBF6gIbDEyHx9Hui242e3NcIVkAQUF9G4TCPsoSLgvZZas9812epV8okkWm7VVMRBR4xg8Ix4SxwgWZx7aNVz35fDpWCh1mEwxMGiRK9618q59VttViK8yLUaVJ5F8JDcimJ59csAj2f747pOFD7zuBHEzgrVSayzxSQObhsbctlcDa+0lcrzT0B924KhUgRG/Fx1IMQHshSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kj51Q+C5lrpKq/NDyaKWLJSsIHS+kJdn5uUBAlV9v4U=;
 b=qFPDuMCh/z6ykylcRvpVkfa5S8EPWDBVawfLCUE0sr6mrd+UwoEp1Fx/67qiWp0XnhU4SB5WPOUqArmNq/+MHuRzEtRS6MXgXWF6OGTXMxy69FmTg4pzOYH4lbxKWus9W3tcoEZZrK2wfI+c5bLud1w1g6GM3pW5XsiWu8LGwWIA4tn/HxD+CFAsVbSd1fVEUbZqBGFMC2uogZ+15Yng0i6qOmGv8zzKUdUSTmkUnnyje36pixGtFjqWYsUw4x797SwsHZ5SxRzKhQeSKKjuzhkCUzSJ1JylbTeak4RyACM/nlZHAGnUFD21s9gf0NWT6yF87n+4HIOXxyctQTaPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj51Q+C5lrpKq/NDyaKWLJSsIHS+kJdn5uUBAlV9v4U=;
 b=dNFY+VdOUsycTFMdZt5Q/3c5F2YhsOnIlNXSCqxHfXxMJey95yNRK72Wu90pLdqQg+a1uKDKJdZ+RRmC2iL8k9yHYwlaa24oZc9SVJo/ZiE6AFliTrwNWQncaDJaSbuOLy79vTW3LErPit23gfcgEx6IAjnQ8jnXKLSyXWC7uZU=
Received: from BN9PR03CA0368.namprd03.prod.outlook.com (2603:10b6:408:f7::13)
 by IA6PR10MB997632.namprd10.prod.outlook.com (2603:10b6:208:5e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.10; Fri, 16 Oct
 2026 04:32:28 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::24) by BN9PR03CA0368.outlook.office365.com
 (2603:10b6:408:f7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri,
 16 Oct 2026 04:32:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 04:32:26 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:39 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 23:31:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 23:31:38 -0500
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69G4VUkY593387;
	Thu, 15 Oct 2026 23:31:35 -0500
From: Aniket Limaye <a-limaye@ti.com>
Date: Fri, 16 Oct 2026 10:00:36 +0530
Subject: [PATCH v2 1/4] dt-bindings: gpio: gpio-davinci: Add the tda54
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261016-upstream-tda54-gpio-v2-1-5c4f8b10cdbc@ti.com>
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
        <linux-kernel@vger.kernel.org>, Aniket Limaye <a-limaye@ti.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|IA6PR10MB997632:EE_
X-MS-Office365-Filtering-Correlation-Id: 392e21ba-b696-4ca4-d5c1-08df2b3e7b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|6133799003|18002099003|22082099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WRGzwJnaZd3uWYoLL9eSnxf+jzfsFXkIbsB4XE+R8g+G6aTtzQ/arWrDaDFyajpcNYXR/z2W1Pztbndp3alWPoC+XiklgcPcS7mRrcLolXfW9le8Xx/UY3efwrCuN7J4rQHnzE+X+Wbb4Epvykek+Uav+/GQiezThobEfykkJ4Jn3xr6noQGRXXQaOPFElQrWlRL2kG9eXVm+FNX7yHXO3WnMO3g72WbFxS1GT6H1/AOwCPWX2B5E9HrtrJ3nOrAeMa0uKwiwtq5nrmJu5FqMDsV0IDlhEW93dphcm7miIPSCqPdVoMgv51FU1JqOuJjvQBk/wEQYU3iP2DkAXOI7sSCM8af5F6u0Zf5cxO1dXFwIaG5+o5TL7Pkih1bJaAb2ryNBwHHHeVbGbxULqMQa+K1ibsAI9102CEvD+nKjrKmGVL9gJ9ijr/JWxXMcQphqd3+14Gs0ocZREuoIn+GOt4fdJBgboMMM/oLzbZlOuXAM+XphRsDemMXYlkE69t7fhVJ2XGeOVlABlvZB+p67sTUuRlBnzBhH15RO7SvBHgbQ6G6GD4idnh6IQlC1II5ecnlHUT1qhBCjC5bbbqGX9t/9z/YkZkFZuvCtI1nzV12JGl5952+y53Fb7FudZpvqorUKknmPGmZiQnq9fcKJah3mED64IF6xohwGqNP80Bk23o/twkZt47sXa4WzZrTrRfFMdaeejRqgT8Glu9kdw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wsUnM4e2k9HhDXlonZ9dwGEHgk5PFDvssNJa8b+MJqZeGzsJIpusHl+VwC3Nc/9233ljpzoruoREpiwDx+2mQvzItBnHqawmEGSeyQ/Im8Pjie9pIV+mupL1NeDibiEUd/RfiEZ9KInJXbabXK5xiL2vOl0cdB1r+roR+jhA2xZOKftzEBRqiYpgXNHFNlaSi8YhuHWUK//dZM5K8noD3LvIk51sLLeHHcyi1krJ+1/bCmSQSOXmRTkp6LIcf1L4aZeIMWHibackfNWh0NKi64wHtQ4WiodaxwhfliUpjLAC3O2RQWHtR0fuyrz/o4RRvoDsIgfX40t6LiUsCEQtkySCk/gLLtESdo7zayuyI2nztP0o2SZRKyFlSYxst+RXir9QB7Ayq5cYfGNIkXAUAW6ipp2pWPBp2hOvrBL9UtfKqrUFILtb/Hx1V01gIjN2
X-Exchange-RoutingPolicyChecked:
	H+RF/EabbVRPTYA/Py/u3c8JWsURIhDhkq09AepGdxcS2SahthX57gKeS+ACUv1TDsXKhKxG0WF430wGCCdIm6Vk2R7uGyhAskFTMxj/hn3Cfnb1mLtLIRgmVoR9LDCOlxp1Bs/Ge6m4LGWvC+z5Ix3vpuLrHRqYz/El0qAzvMkUoR48Xdo3eLdPJHb3GTFCECEXU9Lx62iSFbbpjbY7cFYQm5RIXUtP8zfuX4sAZ/7Du5I8ZHdN8l7KfOQ19HLB5CVVkyG2/ZRUnCtlihUfJA7v8Blazj3QGFyo/o5xApgSSur3jrNZx9hzkyVIJV8Lqo7Y8gS4f0Yrj79fFBVi2A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 04:32:26.7004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 392e21ba-b696-4ca4-d5c1-08df2b3e7b65
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997632
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfX94dDcOjtKP+F
 vFMo3KqKjecghndw6PkItfUgDoR+dlZFfWSdna7vFdS5c7zTqlsYfJsgza+oWPMD8w5Q6pbu4b3
 d5Eb2k7TDVZj4B1ez30ORoq1rxtqfKw=
X-Proofpoint-ORIG-GUID: 0Be_Q8aDCcz6Ora2kgfzTWsHn8dgHMJW
X-Proofpoint-GUID: 0Be_Q8aDCcz6Ora2kgfzTWsHn8dgHMJW
X-Authority-Analysis: v=2.4 cv=FMWOVOos c=1 sm=1 tr=0 ts=6ad1a8de cx=c_pps
 a=9AjoWhdl+q7f6/Aw5qa/DQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=9-nirPf_ihnyaPG9uIYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxNyBTYWx0ZWRfX1eku3zPIefIV
 Py8FCjaaqT2PeCfxr4tdKilk2UaBwJkd3JYS9c9qEvLkH5qkQx+Nraf6S6N2C2ZoMNfQpgKRXkr
 zNiFifW7dihvywo4VWwTmNa0NUIh6I2UoPC4lCLVypZHRU83lRTP+tSrEfahuS1Y99FMQzPOx9R
 2diJThr5tsZ3AOeZ0O0GO40LCxJNhNFtdGDcgtN2Xwj+wM/6xPbTUNmVYNTdcXXc8AZHJKEKa9G
 J9815r2NAI7/bmFvyf52J/cvORaGolqUpEfPwPz9fHtv28hYKJHEgFFEiY0cx36BZ8pSw+MSIBr
 +ygZFT2/ugV56hLKINEwEZLUmO7kiV2vaMGzVQTS1e5J1rs/w0ZnJ49bHZmIDozDfDeFQo1Cc58
 zDECe0VdrHdsZJgzjwLLFB99J1Udz93y/lUwhosMW6Ha55avwAkLKXopSlkghPb+yBBaaivEA2K
 eNsfD04ctM1hnlEFtFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160017

New version of GPIO IP used in TDA54 SoCs adds support for level-triggered
interrupts via extended registers.
Add the device binding for ti,tda54-gpio.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
index 1434d08f8b741..02b6b9a436a68 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
@@ -18,6 +18,7 @@ properties:
               - ti,am654-gpio
               - ti,j721e-gpio
               - ti,am64-gpio
+              - ti,tda54-gpio
           - const: ti,keystone-gpio
 
       - items:

-- 
2.53.0

