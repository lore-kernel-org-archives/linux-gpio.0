Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022121.outbound.protection.outlook.com [52.101.66.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA3C46EC7D;
	Wed,  5 Aug 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933298; cv=fail; b=Hy+qp/eG1xQBb4s+RmbjIZpsFU3scqd+yRHgxxt8gWOQf6zKtPbT7LeD3p6IC9sTvixnMl0AVmzHCYEgM/RFTTzisWz7Uq/4eq4rm9nmkKiH665ToXhlWCPKA/ISYWTL6oQV7V1QqVo5wgFvI0kx8/8bQqb6TN7/BKV7MkX+uW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933298; c=relaxed/simple;
	bh=w+eYWOaPUc2ta8HlvfAB+7JCJdNEwzVXatZL5G1N0Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F8zzCbgWTs92pgaiFTc/HUpYxfGoL5C+AAb1Y2LoHnrqYV96PZ+GiAsFnPxR0a6WgHVdhU1SUiWdt1BAYPZY7RYgKgLIWVs/Uc5ERFjWxe5oWBQIEUNCfYWlt0vZYxtCO+8BsGnU3+jpsvThUZ70kkDyr4t9H4n8aWZMAOW8X7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=fpAl9D75; arc=fail smtp.client-ip=52.101.66.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="fpAl9D75"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6xElKPy0qpxowfxc6xBkzXKVctF3OovN6yhUzCQ92V54E6xSQgWKnfTb4Z++L8PBTrP0KuDdVYf5e5QjDrN9xcnIpMosa1rE8BXAsxny8GIh9OB48rJS1c4RAsJhNK7r8bitt5hJzP7IL5Hdq5Jce4yFb29p9ZF413JrxrYrXKPrXM81nOOAsi8x+ef0UNO/AoPfsMGQEnN5ofMk1SZlyd0GqJ+B6Cu20tsEiShqxVTHaN06Gs19bVEU8FF5bX2vbI9JD6TGW2CVtHjCQpPKK8r9V88Tt+B40Ygs/yZ9HlMEZSYbBDCe8+OzqCoEwUhmMmPqxV2BEm+6mxRxBZJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUUtL1D30/arAiUeNNdivJiAS5w98hDY3XRx9eiZsMo=;
 b=tzYNvl3yiUcvBtVOE3YVKTjJoecnVgd0HsSJVlVMqV1X5kp79v8j+7AAId8m9MG19oNNgN0uvMiJ267t0tYdL7D8LUHQiNGWdfeu3CM/jMD/q15tiSQqq93+4G3S/lLyVSzIBkBcL8S+r47x9chBx0QfYRqYUs+uIzY59SmM57D+khhKikgy4Endgso14Gg5Whphw56lkEibaDnFOAVyKFKMOX4iomxhGQH0bdCisxL9cMBkT8gT2I02xTY8kibFoQ83NWQP9gnNtBGYSYHSzJf0KD3svZUMkjD1QWM3a6snLEL5okAvcS3LGNBuMsHoD1mYJRhDiVhgFkgiQvCi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUUtL1D30/arAiUeNNdivJiAS5w98hDY3XRx9eiZsMo=;
 b=fpAl9D75FuAUxIrlbOBhs1OIgKMcbGAMsbKGTM5LjXyGYl8H0dq+Puo8VAZUvbD7p+UE+xaKcJZGxxSTPS5ceEF31clsY21GHMSJYTku/m8DK4ajSoqjPb0pb4gHMQ5I/M87aUZ6r0f5I9HH1zmC1yG8OI0ebQoGpSucoKPPN/QBSOy/5GXaYDu90ZtWxikc8s0b5n6oTtlwNWlLPgmAHNZdP5eIPBLwnzrhSRV/hScaKE53A8ffkl41mKDNKCbVOmyzNioFP8y5ETal1qJiYXmelowfJbyfxnlA4ht2/GCTPgtCsc/Jw2cktnMf2z7LwJk/hTEoSVKc9ogJaYv7gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:40 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:40 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v10 10/36] pinctrl: airoha: fix I2C1 pin mux config for AN7581
Date: Wed,  5 Aug 2026 15:33:42 +0300
Message-ID: <20260805123408.3767648-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e751cc-1be9-4300-018f-08def2edeb6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|18092099006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	MkBHC7z1i9y4gkwDS1I2f0qpz1LqifSREuz8nVyCKSDJEdChqUxZK+wSMIqTbvK/lfiejnmXAxcZSdVZJvIKMDlON/AGnF0HscQ5QJGXndyKo4fiRSZ2QvezbAJ/ubW4M8RyswePZaDy2EexaekJEyMotcoVzliFWiZ4uHcFXzt0CVwvzWe87nUi07l2+vzlPGvjx5XctLIaoiImy/WxMXkBz/NJaeGUyTcYif9nvpMMphCZRoSyfMoIPMs+kpsVqxhWlS25OA8VkzoqriQgDu4wOyX+5l1HSVx0hFl8ZBRY7xjPnymxEjtA/QWQSiOx4QD0KgBSGAlGtB4zCYNMroDrKttg3xAYZRrBdbbXbhL4toUJNurXMspi9FKQeakSViN5fdaOOwWCLzH8wYYcie408MCDouvAxfz+QmAEzN4CFa0wiezbpjOjXp02gdDGn+2a0BU15KplgL20Hd6564wBamCObPd6AzO2xfuenIICXOvTIdTewoGpI87TyXllxKbF0/0QLvYV/tijphyFqObBZR2P8HASIXgYhI5zTbQpoGFpyE7xamhpzEdxNXM9M26tdsGdrxgglU57MuJBDGNA/ziMPByopJCJZ65SqOnI3p0MyCP8BumbZMqpkgBGE+Nvj+byfhtaIkUo/ibdcQ5KkVmaKo0DOi/MM/T+KY0wyJfKuvHOUJyZ1aETtzmDsTRUIPI+6FPVDLG5JUKKowLlSfzIDj1vM9qcA/jeBmLzxz73rmLXm0FdDtyNJFuU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18092099006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nfg4IarGBQ3tJ+8VmR7c2/5+in/hmdQNck+SASrfYnf5aFcpaW9bBh5eC5dq?=
 =?us-ascii?Q?cjk4AJDL9MRaqNB/aitWrTEMh9k09BSihWXX3qEBwO+SJPM76CI1zEV+10Ir?=
 =?us-ascii?Q?7bD4BGTs/H8ry2RVhk1g5bJlFa5X6F2+UsxxjcSRiV49oqvue2G97Z+3Gw2h?=
 =?us-ascii?Q?x+CL2FBrrEdsxkr0J6S9GxnH1QP8taGqvfEx4R4kBdVxrlBa8zZwSM5nOTOZ?=
 =?us-ascii?Q?6NgdTgvN+bWcSev+j8HXSf4xGrjOfKD2wk0eR8m/+cz9yZ/C/wfYa99bptkt?=
 =?us-ascii?Q?WMgm0c9txBguvzkAbp2/KOi4KPrhJU/gC9aKhGG9m08oYm9ttZO7TEvi1eHV?=
 =?us-ascii?Q?VLasPzNF78Tj/e5WW+4jFIzrpJmbb0qXQe+v0cZURjcTt/mCE+mPYi0ypVtS?=
 =?us-ascii?Q?dslPx81cc6Qth58kXat8tcgqUTq/WNGfkuxK5LHqNoZMEIHu5hRyfqs8k8SA?=
 =?us-ascii?Q?Jed+1u83cmUts/Ofw7OoX93YivDSqSKSp4mgeP/pTV2TjtShxpQnnkdl+zCF?=
 =?us-ascii?Q?vBf5IntwWJIqGKuzR0/ijyi7Dq9xW1g7Gmv5L6+Dn8QUklcyEtASOk1auASR?=
 =?us-ascii?Q?8tCOYA+iFMVIGr74sW+fLnczysMFeWcwLYyNdm7AiJfBU4aVSHNnK0QDeawL?=
 =?us-ascii?Q?jXNzPf/czfumw5lV/Ha0+NndcLoGQBZM55CD8cqKLepQKYTPId/3lcoNBh1O?=
 =?us-ascii?Q?KNx3W7kHNALP0luHa105dmH4cnYa1noIhbd/KqapwAyukGNvhpy1I8IQRp0N?=
 =?us-ascii?Q?ThrdQ9MlQRZU7KyqGR4vXx3fE9XfsQQAFwyBzjjbKqu6O19NMKDrznzmPWI/?=
 =?us-ascii?Q?m9D3pOf+h5Fe1BKWfRJtGihd2Iz4auTYmVlKewVD41Yd+dc7qV/D1ZeXH/dD?=
 =?us-ascii?Q?K52WNu1PO/nZA32ockx+kRVTdvhL8IaeFGDZ+EiZLSTwSAJjCw4eTrvdukbP?=
 =?us-ascii?Q?FRPH+a1/ccIStKPCFrOMYZ9N2Q7blYgeOYP2Trrh47VzYz22Ar4CfCiHV4z6?=
 =?us-ascii?Q?57B77wueG8OyOz1y+tmO8jYsQPwD0r+73AX0vg4StA5diX2m6R88yAVvkGws?=
 =?us-ascii?Q?zFyjDk1caHptnnzQLlIhY1OWHFGDFkfib9cWxcEjg9S+QPhBlPTJHlWIKWJl?=
 =?us-ascii?Q?0MUz/DMgrhi1hTaesL5dhYC/LLtf5oqdz7soy0Ul9phICSI005W6fO929aw9?=
 =?us-ascii?Q?2euvknlgeyClAIF2R1W+daIFGZzrc6pGJMReLI/ZcTQGfHrVcGymRSi5SpiV?=
 =?us-ascii?Q?rSg/B8xgowWz5odcOa5lWS2E6uUppxroY4rbBX3im3/D38AqGDBJULPIbQFg?=
 =?us-ascii?Q?suHiJ5RsRjvGqLhs7WkjlUch6qiK5Xh6HJnFl/06nsoFvk3vsintYQLb6k1b?=
 =?us-ascii?Q?MVftQrd+GnMV8RNurBbTUoJKbQfmxi+lUIKNZ8T9dGKHpKAw1hFrAFGgRp4h?=
 =?us-ascii?Q?6k2kkSEquT4Ta/f8RLR0Aefpo+litd2umWrerTiv+dLAsfbdoR9yXiwl7B2K?=
 =?us-ascii?Q?8OzCENU7JL59rPA7+uxk36U0H5mH3rQ8ZHgA8fV7LtY69g8kvOIm6vSrKv/V?=
 =?us-ascii?Q?U748MA92Y3k4XHXovxiucPOJocpzzUzIdL4Pf0R/niAmVGm0oOd95otwSS8X?=
 =?us-ascii?Q?9I2YVs9ZXYx3t9SFYUVMccDHmOfqUhOjdyyN3JWO6kPnVJPXO42KErl98iWd?=
 =?us-ascii?Q?ouMvUa5SWM0B8v/p3kZRecGHrrhu2XzSqsmLjeLGSpXwGSs8CYk2Re1UPVbK?=
 =?us-ascii?Q?/PMwsz6cKu1OQdtyquRbJnaqP1X3b+s=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e751cc-1be9-4300-018f-08def2edeb6b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:40.5553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hrxKslpvV8mO8LSSIAG8qj41j/kj0FzFY54a3ldrBMtuCCrze7Cm1gpJVdbVRkKQtt6MZmamkZwxlQuqMiNGHgxPD6+wWQFcqEK3AKy8iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

The pin mux on GPIOs 1 and 2 on AN7581 supports I2C in master and
slave mode. When selecting I2C the according bits (bit 13 for master,
bit 11 for slave) must be set in REG_GPIO_2ND_I2C_MODE.

Fix the i2c1 pin group to set bits 0 and 13 to set I2C1 master mode by
default.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 89979a2c0e357..db6644bcd3aba 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1158,8 +1158,8 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_2ND_I2C_MODE_MASK,
-			GPIO_2ND_I2C_MODE_MASK
+			GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,
+			GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,
 		},
 		.regmap_size = 1,
 	},
-- 
2.53.0

