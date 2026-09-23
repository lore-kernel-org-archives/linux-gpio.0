Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90DD51C32C;
	Wed, 23 Sep 2026 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168294; cv=fail; b=Fk1CYIyqczc6dnExIiUYKZSO6hU31sZc+CcrxGCCTNRCeCnp3bBydXHhgzNHxY4UdMA7e7wB1booOXa6M27dROXj1Sqw4Nc6vRE6I1ogR+46g+ss70cNFc+oSyyu0b5r4QDUGbUAHGT057BjGxjDkITqBrNfQNlN/idwqLL0dgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168294; c=relaxed/simple;
	bh=Gbfv4GJz0gr7aZI4DWYzpTdK6NxGp6myManSiAgRdV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JZZ+kQ2Vm279umKey6+muuJSBD8VwJSFwD0NCOn8d42J+GdK1Fc6GvAt12PnSWehagZesqDQso26v1S8j287ucvUBNXUSE6LGh1KhFE7IKdZO3fjAQTGRpnKO8NSK0suRengmq1UhQ2rHQbxzJSjnQ2b9RnRVMI1VKdkWB2jdRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UWavq3w7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C8shy1zO; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UWavq3w7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C8shy1zO"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8JJQK461343;
	Wed, 23 Sep 2026 07:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ThxD/arVMdXsuaqRrcsFjUaODBps6zJR6o2SAkla1
	S8=; b=UWavq3w7dTnsBNm2Ed3Uy0+1WQKdmRkRNnmg2LLsObwxEz05IJpDZZrx6
	lVMum11p6VjC+7UIg53pQP4bVBnBOf/UhzklM4gCfEnplgM9cW6c5xl4Y0QXZwMT
	8INlNppzm40Qlztmuhfx07xFWfgPjHZh3JPzL/4QGodMFN/DId3xYj3AH1wqIpWn
	lQCibiCaGlI9Dvsb6AO7CzIiw5jO9ODEMp8d2o0Xb+PQC5S6i7qVP6Aq3J0U7+sI
	C8nHFTFdBfMqMrJZ3g/414NbNrqqnFTHGKqvGRK6unv/HTLihq0fNVmOANlJvSA0
	QM2s1R/pLZ2q9aqNxv3x7E0FVEzQQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gv3tsbx08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 07:58:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNNs+CyWcC0KiyE6MRzcl0Op5v624HZXRzlv44WSPbE33BQY1rMPe7k9tJxjwQtHcpJ4TKDQGjEWMEutJLqHwhZaxbvhO3Pvw3yVwUDFuCSzXL7qe+C99Hvf3DGNySOV5qQBpZ/tU2kDFaNgirzK/Wd6kMuSrZ35meSRobfMX+L2B2WV5QgM9rzE3DLczn2S/mq1oxi3KDVEsf77tRsT19cGRNrXqUvxM8/2+CiMzoVoEG5orQWNGItGeWoK5HbDFPDDyO8mZaJwoaU4MhgkB72GqCnWZvtscT0g7Y9ideBWA9ibOSh9gNVT4dvW+SgBxrkZj8OIC7euK+qmGnYafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThxD/arVMdXsuaqRrcsFjUaODBps6zJR6o2SAkla1S8=;
 b=JsNklDZq2BIUlnf8qDx3bhsmPEfbKXOrQcVDRWmbC0uzUoYrVv9gKLUsQyC0P3/Ttf6zYmNZtPyCUWjHeVEgIW2cECBqjbvDj2lbgYh5NL4z7HlOhzDCh7BWKz+d+2bI0bs7/flvvDAYgX9MOzQzudaZJQ11cbKttr6iAXsLYh/q1gsTg1mkJjHyCHKSoo3tC5EmqbJEFKjfeq+LbVOt87cYnlVAKvjpc4lkvLuX57w44neKHu5vzQX0G0t1kKuG3TFi+jiF6fddamC5LpLPjboPbInOTX5QXzzTWIljnBrcZL01Pn56ElH9fXNKaEEGE5cz90tYqydRDAdX3LycLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThxD/arVMdXsuaqRrcsFjUaODBps6zJR6o2SAkla1S8=;
 b=C8shy1zOsqtE+HgUAry3cjhdJvLg1wl5olV3ummzi1nFiKp5/g7gdRpUwaJJqiTaJPhyYE6vPrjTF+WhBK3jparxfbnU/v9PoiVZlRsAd0C0ftIneFVhQOukoOwfzTvSd0uUHgp2UuAv0YYDdiGJ2/EyoA6Sn7lz+m2Evepx5kE=
Received: from BN9PR03CA0639.namprd03.prod.outlook.com (2603:10b6:408:13b::14)
 by SJ2PR10MB7760.namprd10.prod.outlook.com (2603:10b6:a03:574::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 12:58:02 +0000
Received: from BN5PEPF0004698E.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::21) by BN9PR03CA0639.outlook.office365.com
 (2603:10b6:408:13b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 12:58:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN5PEPF0004698E.mail.protection.outlook.com (10.167.245.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 12:58:00 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 07:57:08 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 07:57:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 07:57:08 -0500
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NCv0Ui2948874;
	Wed, 23 Sep 2026 07:57:05 -0500
From: Aniket Limaye <a-limaye@ti.com>
Date: Wed, 23 Sep 2026 18:26:44 +0530
Subject: [PATCH 1/2] dt-bindings: gpio: gpio-davinci: Add the tda54 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-upstream-tda54-gpio-v1-1-d1a0a199c836@ti.com>
References: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com>
In-Reply-To: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698E:EE_|SJ2PR10MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e5cf8a-7e31-48d8-1b81-08df19724c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yQ9No/Xrm8TEP1OLBnrscEuUbxMN5jpISDuKlPtP9Uo8AeO0U/WbZhNJN/GLRT0i332q4ueWtO/TK4ZTHyX5UaVnez5ClWQE1M51Uy85pWgP/7XkzEuWQNkojiz/hp31uPbkuNncCsvvuiHOK+jL8QATXtqwM34vHoUrd2FoUu3dTSRptm5knKO1ZDJDSRXQWKePCM5Aake3DHu5Brt3wruZflM4muyaOONc0E6r9qaYUDC1cERmhpuhAxmUma50aJKwMRkAtkjev3B68eA0Q6tcM83CPaZlyV8sqJQ3OZwlAce+KLRtmO6MHCaeYep2B7NC8/YbZ7Aa40Fj4p7KqBZNZSRw0fiZYHoP7x6xUscUL6G977xTSzuDZNOSjixwWuWb6KXNfDrehzRInNcQpvgX2kbsYQ83+3zkfv0tguI6ngUBAXad5rG7o49o1gcb/jspm+Yo0Eq21iFg9cKecjuOtXbu8cdi+rPGned/N07O+h7WHA0lW61ZNfLvGy27ppUKBL4v3Df7ilaxQYUvuT+BzoWoCEqUfzJ8bppZUSCsvfTBmp4XSA5pCdlozRXkaWoo2O7+77iWsS/tE3qrtmUbi7ICFFcNV985YVX4txqnKEq1TEH1FcrNC6NCrxWim4IVTPqhsENgQsvAb7MVtXOlOvhjESMZfZZFginIWgHp+RSqgBSGkp0eqgBVuNzXhpkQM8XqVcpTO/DpmP0zYg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rLQxG9+SjStBiERZiJknlcnShiDaotwOOkSAK/D7LdReZMzjoOiA+EpSMmwJCvbzeFHeM2QI0I3gZMjkk1XuL2H6dPJnXSwxEbdYP75ItG4b6wob35qwSKLu8Fes082/sOvDKyV4npRJMnHKLYRaiwY4Qu9dJpnz654a2dGYt61THZPrvt7HaE1YfIp7PMxadAZIz+YcroibgeXVzJfhKFF5KsWAOdUG95s8pvOP3+95Y3x4dUqk4GNyCHQxKyMm8aMj75BLaeX7FockD8Z8bfXfMnCLYNtEHnbVz6yFvPqjLl5OGBS15evIhmtfVl4TwkHAX6meCjA+xpopNI93uJExszAS4wM1al3YD8N9ntl+TeIcNC2QimypFy/HI1gL0zFbva3TVmaGYnInPPbIS2QG605NNQdsf2mz7fx2sqrXNTytUI1j8esc8ZGXLLqc
X-Exchange-RoutingPolicyChecked:
	jzFW7NoNvNsZLB017q/jWiAyTQ8zw26UWlq6db2ihmnp7TlnBMYmNMiJiKv8JBYVg1TT/15TcTe71UPwlxqmCAbeNxjb7eTd+ESvdpvgT2Ej3sq/bjN5a33VaiuLl8bAt/6D5TB9gvhqPzYIpGpVO3JUPSy6KY1oVgt3McBRwufwHeLUF+l2fR6zGlSDVaSPx6Govdmgysz3oYkgkAREx1dzP6/l/N69hBvy6hSUGH9Pg8BNOSa8WSwBMjf015o0ri4vUjJ9wp4JBq3Cxau0nvtXqWsQzso4wZ+gY0THydChsrvD86EfO47L6jWcSbDssOPn8rE9PZqWTVeRkQL56g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 12:58:00.7245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e5cf8a-7e31-48d8-1b81-08df19724c63
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7760
X-Authority-Analysis: v=2.4 cv=INaXmQvG c=1 sm=1 tr=0 ts=6ab3ccdf cx=c_pps
 a=+HTpKnCyMzx6Y2VIV8u7NA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=4bu1DAiW3jRVHQn32SkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ifGIqDGMlPy-VvXwn3QHcogh6Ybi4hMO
X-Proofpoint-GUID: ifGIqDGMlPy-VvXwn3QHcogh6Ybi4hMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXzW/JWGSwmrQO
 PyKjEGEkwOKMnYqM9T7w7PFSzhYGFAOaVS2UY5RZt6YgDFi/L6pNfDxYxuHFM3rxswvYj0WySnd
 sfzxPKFszOe5vQiDxXMWNeU0FN5QyB6c3ENrE3aOtE9fixblk6dILdHzKmqZEj1RIeodZV/yScV
 RClpCLIvqWS7x0uiaxp5DKcS/JctA61AWaQbBh0bzWDNxnFekCqISwM+7wqVmdEriZgURKx/C5s
 +5NSqTCoddfTJWFc13kvpYlF+dNTdB+H+sNUGdYsMJ6+vsgWU6P9yidLWWQgLhtzlipzF14VvsH
 xP46r+OZiJPim9oSrdaAJuee0kpS/ag+2koIiBDTkCG1GDWlOYoNvsnTGfHPTYa4EJJU6HmNG1E
 rqWVxawsCsXKHI4NN5HGx3byRL5geFDCCYNtD/c3fvx+Gt+cz/uG/t/jc2Ugz5a+a67mnDlE49H
 s2OUyOSWql8+36zMZKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXwoBElT+uW2PU
 OeN6MwnxR3Dx5PxWmzhNC5gWtTuVj8/+bJBR4d43HRFjUM9Im55m60mE1Qy6zw/PFyp5uygCKrR
 /i01KMUtTHktoup1f+ShctYBpCeV9WU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

New version of GPIO IP used in TDA54 SoCs adds support for level-triggered
interrupts via extended registers.
Add the device binding for ti,tda54-gpio.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
index 1434d08f8b74..02b6b9a436a6 100644
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

