Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCC46D0B4;
	Wed,  5 Aug 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933293; cv=fail; b=i6y1pC+06T8vJvaIdmf4zL6VDx4tgnzAe/Z0U+3p5nNeM4utOHcQHVFErBLmIrp3gFqHNk5hDlMOyBRmr68bo7Be3ei4Ef0GHUJjEWQqEASzFZb6++Wu8CBDEpcg9NabN1ylbDiVkBmgdw4bXHphZIZKiyxB4+N2vaNPSfrKHnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933293; c=relaxed/simple;
	bh=ff1wgyO31Rt/ws0GnXdUiDSHlpH/uw0CB4tw97/2PA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQ2g0vgD0XLkPhoPs20raMlCyV2sFpJBswPosx5D1QwNc3DG/wcFdj0aemeiy12cPWBqUmb/MvYfPKnYtV3sQwhljJH68Mwoqf1gJFQsDzF0fSjhT904WK0PTZo3vuFZNPEyH8lnHEEcJ4CW+GuC5EIbc5j0vJsoN7DZWatrGv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Atat8QBd; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Atat8QBd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRm0ZYbHFCkaSwTKPBdVBjgyOA/nwguD/rxOnxFoXX9bH41oKhMAnwoERa5YJLzD98RtlhmYpEldT5IuKsudn7cMvPr282bCCBHr3czo2j4lW/X82o2daP3vrri2iZZPh0ighV/rf76KoDP793uP0E0yc3hEDKuKaYba6xDG2zN3vKQ/2cTVvIklI/UO/2BHoCUgQHyIpCtMXRIUd/1dLee2DVVLqr6DoEVFpJykEtWMI/NJn31+TrJG+TScdRHO38YmaM+jo8+y1yYhIHzGEXQAvyyI0Lk9nLG/CRtYi/bvIGFjwFHYL6/hygutY5n8VUHLIR9maCzTlG+561KluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58OFInlsuXMddJEzbQ/pESSN3qMBCPwTNYV/5X3RixM=;
 b=xtGmF0BiB/3ry3fg5Y9sG1hsqR06NCw/J5kUuHTVgmZ1mvH28hkx6vLWFIHI5gVL9T4tEa4EgI7fg5E/lly5MemaQRFplZv9/SRmQqjqn6ESsjvXMbdZPGuUkXdTFH8lpSYILJw4MgDYvWbei1zLW4IIGNqBONRXP/f7Qj4jPQEgeHakGnTY4HW/mbeywy8v+hKYAZhSKzbZhoZ32lPglgWjp3/UGLNhKMObITb9zx+dqOdtvZmThfzXPh3MzEehRNsK3q1VfJWNKTgHxIlKq5chInP6aFtZ6pkisdDkaTpUFU2efzs8gINJloXKWrSIiCwmLa7t1tCY2zStj3ThSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58OFInlsuXMddJEzbQ/pESSN3qMBCPwTNYV/5X3RixM=;
 b=Atat8QBdQCAxcW01ARVXIc0b+t/OPeZy9i1HUXdOa+CmkRdaxj/8jAIU9AS86ws9fcVvzK9UyqGUVuJ3Ow1AsobKDoRLsXuVSymSyi1HzsyB1aVJz8BEQfUpFEpEmpKffb26mq3Fx71V4geLUqzZKZ9Rq42EXtTH2fv62Bpx+7TStPdKU2r2pNeQ4iY7Lbs/ObofiDnTTLzZV1LAhkeDXmofjRDqKaLaebEjdprHGzqXJoOpjKiTkgD5dkwrcmvMOxMQBqgYSbxsZcoo/9X7mneTsaP3CuwJVZ6gre5GZo6Gnn0O4C8lCPv+0/gyjzxlfU+FHsYYI9IjukqwnDoBuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:46 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:46 +0000
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
Subject: [PATCH v10 13/36] pinctrl: airoha: an7583: fix spi group pins
Date: Wed,  5 Aug 2026 15:33:45 +0300
Message-ID: <20260805123408.3767648-14-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAVPR08MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ae3454-93d1-4aae-e6f1-08def2edeeaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J0WwVrEDqZ6yYULaAOqDqGe4KSnkL4gs8Zwr54EHnVnaCU328LYozSXHo8LhIqVaU6e7h3bIaLB4+cOVCTPz+RrXm8HhL4oL3UlVGMRumswOYAF+sBH5rhlIT/IQz1+VUm51JQ6IZy1YXaNI1ju2XrlJqTGjBVBpaU0qsF+yoGC722dv/ThaIUDLLiDriz1fQm4cgrlPQZ0JcsgZiNdshb6RdqDnLnEpVtSq52Rrq9o/rIdPrKoVtyx1N/fJyqaDvUcDXyZtCTa8PCXcGwDbrFgEfBjGVRv20U3XdxFO42XR3fLvuoRKMaHPjkmgd7sBuYHoW9/v6XeiFL19B+niCDO8nspn8Kgp4b7Xz0WK7He1YUWdDk83REPUE3GUX3K9QeiiBZBUw2925FSF1/XaxE5bq4dIizgMvYbySZD5Jz1uc88iA7kR/1SIeI4/sJYpv7d5cleaC1Pau4+NOFFc90zJxdxH9rsd2Syh+V4yO1YlXnbpbU1QYGMMIC0G2iKaZJZ03S7usAgtM/sw+mOdlMhIIV1ftk+uOoBQOID2ds0GEcRIDZSOHmeJof5NwPyhwjsiMSlizdRt4xj4rU3/DzICH84kzUW9UN/JEGZ03FdERIvGlTnIHz1voT3rRpv+DLYnn/rEAnXr0xHuXgVVjmCawAjjg1zxS2ZxWas8JhisATmt1hoHbgox89hI6a2DFp0Yac/Ius2olbr9Dkpr6FOLj9ufYqT2Yyqu7NDA0GDa9L5pRaO/91mOhwEM10at
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NpCgiCW2bbQwjr3iZI8raf5codGnuTrq4LefAf7MKZaIpkrnoQCnVaHS131p?=
 =?us-ascii?Q?IITVZvBbyoyOWf7uqRKpKAbsdAmp9SF1RLFpTfqRXDmk9GgW1f/RvIqksByt?=
 =?us-ascii?Q?9qqQKl0X0c41QUEl63g22rmnx0+7enx4khMUf/ULulNMTNQvXM37/wpnkTKS?=
 =?us-ascii?Q?Hljllgr5Yi6dGs2Ns5onxTSrthMZag89W1owoGHFKSXPQKSPoXV41L0ZLsEJ?=
 =?us-ascii?Q?Ebw0fWcVSDRXhKPgU7p7Q7540PflBIrRlE5xhZxxIwcVebp2B0RiDAocfYc9?=
 =?us-ascii?Q?1+oo8vFDVptEelVk7maAEiuNNpF7VZhHj3Im4DaU+oyb2v6+JO1uyNSMzdGG?=
 =?us-ascii?Q?aw9YG6Af65cPYzY+Ao9qNfc6kLAa2nL4qMF0GqDqo+epSOOD/RdUs9/gOcM0?=
 =?us-ascii?Q?2/2JAZBDKaWAfhMsoQCPXs15ZyJ/fMXJ+ZDMeiiMx+bG2vCXU8XDaggOybEw?=
 =?us-ascii?Q?idXV7vyh7ZyUe1RNjvGcIivGHEyPHaInnhKY8d58f6L6A9UyATwSYZM8Y6qU?=
 =?us-ascii?Q?ioJX4PBOA3tXMdm/trJyLtEl5Dze6wj6brifrD+dBa+/P28SG4oETOnK605B?=
 =?us-ascii?Q?M4Hgc8VqGtsVO1I3g+sLtWQ0uU+PGxphctng4lYuFbC2t34gceQ1oB5z59Jg?=
 =?us-ascii?Q?tojNdjsiuoL6tOo1G872vKb0fkTZ092TL3mNOK2MzLzv0E8lRXkz5k/8qL82?=
 =?us-ascii?Q?QHZLmapLlz/U+CL31MDTXRd2zm/Bo6UvajnXTqvQnRkLuppt5x796RBECU9C?=
 =?us-ascii?Q?wIcj/u+qzKd+ri6bvJs1Axw5DVzEG6AEbQsi+Yl9c4c3PaNabJvvNbdNLtTu?=
 =?us-ascii?Q?PrvTpQF0/KZaSvoNAtr6bO0U3KokcAASZFq+mJmtDZoqL16BZyiQkdsieP5H?=
 =?us-ascii?Q?+89VvTqCE+twO0Sh5d5FDBbuHcNGVEZLKDBIFiF8LHu8HJo1gvj6WiHmDY0Z?=
 =?us-ascii?Q?tMv2FHJzsZm5slJbtCfoa2tWziQq78GnO5iSg3TWjm3AyBxaIMoKw0SluXpS?=
 =?us-ascii?Q?qz6CYqV9lV9EbEJI2ssvtk6n8AzgnRL3OqjbAjr+A+iqRTNi5fmu9tTytnsZ?=
 =?us-ascii?Q?jDweN2lUdk5/OxKv5VPNbLoFgzN/H8kDSqzvYaiixMR8dSTnsrobNYGYVM81?=
 =?us-ascii?Q?j5H38O6r/CWWNwQ8ag1oPoZfuk5q4ykjn6xixsUhJep/bti0ARni3s/XVV5l?=
 =?us-ascii?Q?ffVSN4oWZM4TaDfNy1dhI8L1E6OkAdZ7a+q8nEk2WdsU7pidrEPUn3h0vS9I?=
 =?us-ascii?Q?nzpvb7YzLmAxQQj+emFVqG1mYLkWulTZOG7p42Nu10Q1C5Pv54tEJ0hbu/uT?=
 =?us-ascii?Q?l+4ZkRi/FxCmzMy+DbMVlZ6lXuziaGcku/4Mld2ygmKF68AnkShtqA4p9vsq?=
 =?us-ascii?Q?ILyusaebPbEsU8OyWw8LdYjqL8WlRF/LA4J/9bRkuBey3ZowMF16j3ft9Suf?=
 =?us-ascii?Q?yZ/IGEOa+mDgbBxf/Vqk/pzstQqRnwRBFiHQCacM438IG1FxdkQOUT0i+PV1?=
 =?us-ascii?Q?gWKZJn3GkTGjICMbvI/Rl6cSHid+0PkfrFwcUTCYs0yJAGkcgtw6+lHvl1Q/?=
 =?us-ascii?Q?/CA6YRi70NVBEqIove3V6OJJauAk1Jy1xd5qf1Y2BKCMM4SEFZfX5PMP+nzH?=
 =?us-ascii?Q?6SZQs0F6eSty1f3I4mknRSoQ7GHuD19trj7peyvkWx+RQ3D1HTiXJXwIBMCB?=
 =?us-ascii?Q?vzgy/+ZNvxYiG8/grsmzEvol41tvupgBwqd7TaWWnx44P9a3gMikNEvE8V84?=
 =?us-ascii?Q?3LFSANdhPlHmRMQJU5hb8hlGswptHYg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ae3454-93d1-4aae-e6f1-08def2edeeaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:46.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ql0O9Vlq4iPNBM9qM0MYQPZ+wfA+FClsCuiLwbNhSurIs1M0qGB1a5j4YhceienXCgbg9TOqxSetvJUHrZLgg33WVwdt2LEDwkIoXnNYIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

pcm pins were used insted of spi pins. This patch fixes an issue.

Thanks to Daniel Schwierzeck for noticing it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e5ae703c0e0bf..ad6d24e39c868 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -739,7 +739,7 @@ static const int an7583_jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
 static const int an7583_jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
 static const int an7583_pcm1_pins[] = { 10, 11, 12, 13, 14 };
 static const int an7583_pcm2_pins[] = { 28, 29, 30, 31, 24 };
-static const int an7583_spi_pins[] = { 28, 29, 30, 31 };
+static const int an7583_spi_pins[] = { 45, 46, 47, 48 };
 static const int an7583_spi_quad_pins[] = { 25, 26 };
 static const int an7583_spi_cs1_pins[] = { 27 };
 static const int an7583_pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
-- 
2.53.0

