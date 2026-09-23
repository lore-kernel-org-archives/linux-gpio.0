Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFDF51E429;
	Wed, 23 Sep 2026 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168297; cv=fail; b=IZq8Qesj5EJi30s2Z52h/AqjwvdtRPBFA+MsVN0Fsqi8nCUnTf2ezJdA8PcLW/cQ5D+Z4VpDIT6WwxKbwo/5ijwQO/ocFz/6f6/wLPTDOEP7SeEjZ4OP7js28Ud9gUhJiD/V05KCCaTwyS+ImDDG4kK5eh2WDzqnT8k+FX6RgQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168297; c=relaxed/simple;
	bh=Ksm7OpyIRm49fJgEQneYXJUitm8QSj48k3cb2mdBXbo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jyIjJYV/iUpC4TTz8gPZztJTs9YIQZDh3HpLYhL8018+TQ85C6G2UMr6sL1Y3pblTprBz/wpk4FrYUX8745oyMt9EastBHw88iFLZYHeK5LoowA0BjJgXa/8ICSmc559s0onFWXZT0X5VpqapObhv6/lRJRmkOw9jHn2WojOI5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=m93Bi4Rz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vqnY0NQa; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="m93Bi4Rz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vqnY0NQa"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JF4m775670;
	Wed, 23 Sep 2026 07:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=kMynjuVjms9JT
	O/UUuKHTf17XVsrOrn1CnuwhxHJ1tM=; b=m93Bi4Rz5EJjuAuAQmEBLtnhIFkMi
	9e2Zqkkj5DaeVInL50mpLY+pbUFrP0JOn6ho3bqJTPzSS7q8bE0//1zXHfjwBBp5
	o4OjUyFa+OXyUoHH/JCJRpbYwWmDp4p68frxfCSz/SOzkiCTVNhCpsm3zJHN6ciO
	5WIYBTHgpGV3AvfojMyHFcg0YCqDe/Pu3Oo0ggSjVmKq9px8P+tWdvToeBXsRHSM
	hfSgWCIS5L0+aUQjkzof5FGEqP/GZdNkFMOe+Esbcvn51XgxwMjye9UcGPqzZvQw
	+/7kOVroLCb5xDjvrWxCTCwuDWqm0Ji4laQa3HYXUHdunXUVpjYhsFVRg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycv3gy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 07:58:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLzk7C449nipPqJLvLljP3Xiil0bY7jYP5Prr4/lKvyWUmXZj+DH6abVcjBft9ehiF0r6f1dNtsluCojGhiXoUhPU6oMc1EiLKeLRz1zFyOmMCkjsRcM9SGZETZFqVeG+WldDG1225GO5q32wlwBrdIE8s25dxWH/04xdoBM7SqQLr2gAff1oAnhLUe7sLiZwH9/Non3Tj8GpRABlPLkUKOIA+Op3diDv8L0TE6uNovOr0h3n0GmVo+qa+TWzCgnfX5ZvzBhzIPILHV8CTmvVP1u4MEq8LnbAAd3wa0xsYZE2TcA+Xif98pd0tPB3YokFtICxwhYpWWwDoqyh+BnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMynjuVjms9JTO/UUuKHTf17XVsrOrn1CnuwhxHJ1tM=;
 b=gBxMdH9VEfmdInxXbSsS/jiFBtd3aJvAbYZfDrhY4BH6UcIh4lx010ptuWODQTll0GLH1Mq4el3F/U5BHmHzbFKP92d63scNDQUgX7cbZTzGBhDz7qfuDu7h0kGewwNmXqOS5DRCZc6PS1l4nT4TBUcFJpNvqx7gg1V34EY5zLhyyjjbdz6LaHLE/fnr5dic5C7Dg7XyVQdNbvVHYWZGkk0NfG7sB43ZmuAhccq8IsuNZ3EiB3Sqg1TaJcO/Ij0f5qVVbqGCYWIvOelyqTOAY00PxQJ6J+8hy4+UEfDXcOdVkuX+VGGzRxbPdaD+ufRgmB+R6TKu26nUkWEbKHTzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMynjuVjms9JTO/UUuKHTf17XVsrOrn1CnuwhxHJ1tM=;
 b=vqnY0NQajiWIZQr2To8sTMLp7s5810ezjCLjkxhQfDeE9PF2ozBw6I02hhourQmc+4E8Iga1xnxB7+jzHwsy7wkjkZK5a1VYlGLt7YuruTY45CT5eGWdthgVVHDLYCJ69WU0VHTggU686+G3cqCOUFZa7O0NKsDPx5/ceOo13jw=
Received: from BLAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:208:36e::8)
 by LV8PR10MB7727.namprd10.prod.outlook.com (2603:10b6:408:1ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 12:57:59 +0000
Received: from BN5PEPF0004698C.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::11) by BLAPR05CA0004.outlook.office365.com
 (2603:10b6:208:36e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 12:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN5PEPF0004698C.mail.protection.outlook.com (10.167.245.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 12:57:57 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 07:57:05 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 07:57:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 07:57:04 -0500
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.51.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NCv0Uh2948874;
	Wed, 23 Sep 2026 07:57:01 -0500
From: Aniket Limaye <a-limaye@ti.com>
Subject: [PATCH 0/2] gpio: davinci: Add support for level-triggered
 interrupts
Date: Wed, 23 Sep 2026 18:26:43 +0530
Message-ID: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvMs2oC/x3MQQ5AMBBA0avIrE1CFeEqYlFmWrNA0yIScXeN5
 Vv8/0DkIByhzx4IfEmUfUso8wzmxWyOUSgZVKGaolMVnj4egc2KB5lao/OyI5mm1S1ZqvQEqfS
 Brdz/dRjf9wOacmOFZQAAAA==
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
        <linux-kernel@vger.kernel.org>, Aniket Limaye <a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698C:EE_|LV8PR10MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 7611b898-f3e6-4af3-e9b2-08df19724a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bN4ij/srPg+ByalDBEcRMe+A5mumSe59p9fhjTLHiHURuxZkHoPyDeZc9XSODl7a4mBtM6fOuQpNLpG/EFQfBgWhoW4ekCS5yG2/dl8Gx4T1ENZWwc+WxZgDIgXFrwKVYJTAhA5WMCFHyxkTRp47ugcVXs8LZFAtfrnPXyWrYvWDUtwv9eMAjZzhFZml/+2fPr06VFjusZZNOd88tgkoCLLsX6xUYB38lYnpBZMRwGaSdroKXUFhTqFymPDtWAyZiPDuMpRiuUUEceL4i2yUpRwt+YHUXKE5gIOZY9rmRbwXqOIy5ovbM9HzaxpiaBO9tzivTj4fR2kgHFMYWX6NkXoYZ0AP1PwknqR/fhZxJH+Z50w09ve6/GY7lCcx9OHCudBopCLKzHdF/ILqQAl66pp0I7oz6gSSFP5EBb2zKXMD0jdksx4hpEP+q9CpzbM7QK/dr5+lyT+Pxl73MjM7SWXhVyxeusEgRczpLM2ZKWX0mNlaG3TjPmaSTgFh+Nfw3rDqc873ir3DSJvtlSyqdZkbMLJqm4GqyPa2cq0p1VolC9g2ACzhHjC+SQIt2JU2+nFVEH7pbcDSyDpOQe3Z57fGWr4KWebbjpWnc6YLXn5qqqlW7TJEteapn4T0qxRvQTGwx9XHTp57ZUD31sEaP8pEi+vhOqxvwvQ33utMl0EDg+waAINRUJ+IGKHSUsetZREcbYmD1mqo6tbDCp5ktA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6M90fluJmTTe7fbwz8A6AUFGgswJ7N/8z0AIPIW05GxAGgMfw7UytVRotuerFGDis7Fb+KgNGuM9HHsfvZHqxu1xU7dnllbwRyzvt1tsZlc9pQJsKn/xaUo21opfa9inm6BNFqHuZ1wHL+y6s4r2x5nnAVasC8T/axCzK0ZmMpMzR+OWgCJ4aEJSmxAZtJABGu5+SkOb9OBkCKjgtdq355Y1IsZrJVuIsBAMMSDQZ+Yrb7cLF/m5JWi0x+mg4w3uNz77jtpxlemVHfAJMrz0+0RvvF4TVhyE7dFmAH8hv/Ma4RsZSXt5/9PPIEnU895ZDdsH91VJP/qG1OQGSoU6nzdC/mZFha09TAVcNYrPJ4ChZeBQElqaXPSFOn/jR6er1mv2gomwyFyiBNGwX0eHFyXSBmEYKOnvOWUOATxOX/VxwdzDWOoF/JiGfw25C0b2
X-Exchange-RoutingPolicyChecked:
	uP5a6ZrcBjgH36z8hH2s54zzGeJk11K9kiQWm46MBrrk/Ub4Lv88mwXs518vVMulpSSfCjA+giGw57/rp0EJsGu++Qhw0+RcB0M/BNcYYFXjo2iJ8zxqKhnd1e/BzZm1ZTSrWDaJzcShA1lzhoYQw37IzcWclgN8414IV3z6/2LHeHYHHtD4VLnxwypGx8dgrY2hmPXft4515volCpGOlhYlCoe1FQl1fvdzUef6Ejass/A1cL1ELfYlXHHNjQKqfh3lMr/bgAA3ZM4i4xODBgsaVK/jBIjIJeOugcIayROd2vlAZEZtPPHxZjcpfnZ9XvJ+mlXLec0hZN7NZyOs6A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 12:57:57.3692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7611b898-f3e6-4af3-e9b2-08df19724a62
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7727
X-Proofpoint-GUID: 8GHcu6qYHb38jtWJ9JJREE4PNIaTqNso
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab3ccdb cx=c_pps
 a=oQiTq6cBShE1BE+bdGc2Dw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=KlQRGLoorVuN_-gxg4gA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXz3xitS2701cH
 DBntP0g/BT7t+kkIz4XYuZIK6x/TF1Jy1hTwukkhxI2FM6nHK9FtSXbtE0CcxOp8ZXH8Eg/RsHn
 5SVtijiYefJOwPs+4wBXnklhPUNjvR895K3DL0zOd2nx46LpKc6VzOJEwubBYgdsZrwEj6NlfJc
 DlW4UgxIrARijHb1NSQ4i/Qo215baejFTYfMxoZJKbGNRBEk/e4DaCWTvt23NsEjNnHnTPRFurO
 x9e7uy4PUXhLkgd28/PG6flJxKnlIW/LyeEC5xobm5ivvOm5/pZjc+6C0Vk6ihXsEF9NrwQ6R8Y
 BJ+j2WGi0Qc6As8wVmSN/pfyie8jiE+fyc4xsBTHqnr5bOTb2ZbeSSC3qU6vOig9gm13gB5c1xt
 vnKBWvFhyQCTTNJCXgghOYLt7ajHsRZDZFtCy/fiS5Pt/mc67pIamjGtlr9iP14PbwxJhf9ty44
 YSUEXvParWQDMza5heg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX3b1mB+ZrbbZz
 M2lsfPnI2oPhiKhCm0I3bDD4qyhgzTNtZ3mF1T8WTB94NFMyFgOKZAmPlCEkUc/+b5iw57UtTQc
 Kt8aAIrEePA8vH11nUEoaWPlQi0Ybic=
X-Proofpoint-ORIG-GUID: 8GHcu6qYHb38jtWJ9JJREE4PNIaTqNso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230051

Add support for level-triggered interrupts (IRQ_TYPE_LEVEL_HIGH and
IRQ_TYPE_LEVEL_LOW) for TDA54 GPIO controller via extended register sets.
Update the dt-bindings to add support for ti,tda54-gpio.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Aniket Limaye (2):
      dt-bindings: gpio: gpio-davinci: Add the tda54 support
      gpio: davinci: Add level support via extended registers

 .../devicetree/bindings/gpio/gpio-davinci.yaml     |   1 +
 drivers/gpio/gpio-davinci.c                        | 103 +++++++++++++++++++--
 2 files changed, 98 insertions(+), 6 deletions(-)
---
base-commit: 4220e7e54566d6d35ca26dbd166aaa5c7de44acc
change-id: 20260923-upstream-tda54-gpio-da6747dfd34b

Best regards,
-- 
Aniket Limaye <a-limaye@ti.com>

