Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED4474263;
	Tue,  4 Aug 2026 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859482; cv=fail; b=loVUkEkggX41npCrN/6EGkP8hHsnXYgUXZ9fr89JMhwNoVbZOOC/FzaVBx5D3thgXds67MqlH9Cs5jn8K9i6pOPvshO+ZGs6BthCTaiaSsk32fPyGH1D9cJihZUnd3uzAEa3HmR1Te8IDQ6iXMOcVxLaOK2fmc0/R5f8EupQROw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859482; c=relaxed/simple;
	bh=+Un6wmkesaLrBNw1dxcs333w5WTejT5lb19+KaeL8CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XKZtJS/ZxS17qrkCjpb2mtlKT9vvmarAPZF7/IVub8TC7HUOfggelGahzVMmLI4Zc/jNQ/booIJmtSLTGUFFiC6D/Pkh1xBbNHuYvsLge8JOXpfcibZg1FR1tMVp10KB3GYeQ2hFe3ChbCe4NKU+hHEHB2iNiMJXNoCQ+tW0gZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Oo2FW0OY; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Oo2FW0OY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrJwYgudhnLCnqnyBgoqa/Y2M9Adw/OgP+ns+woOfR48k2Hgm7hkHUOKQ9OrUKwj5wIAvtxbnR2eg+6WzI71S4pFSW1vDjeYkon3cBMf8+xfF7DspZBxSRcJPJoJdzUluJ6X0RUnwtTvi3QHKvmozUINym4Cmve5MzvVgeEXrdYvEBkdVtjDh80HioDzsadoPxkBdXcKJHqIjjtyJmYfYhen88e8fXjDNiM0AWOd/C6BUnJKkOuxYQhhQvSMZR0dO8rwhBb5/hRPOav5p8JCorMKRvXtdsCVh6StMheSYKtm4hh8CjvcjlFN5/lHJFkAcCaHKuNxfBSAulnBHuz33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=Ha4iQ1vs6ZZ388uCNTYxKBm2wV66euGW7+mJwCoXlxgNvo/sJKCIneVfq/5O+Dy5XbVbSVd7rKyW9BUD4EfRFNEjcbfXdEgeG1aPMF9v9NItObNtqTCcZcGE0jkkUqEENi8JoLwzUF5GIYTyaZljZT+k5g9MigGYICNb0HTiz3XHuGDSTt+Be8bV8gqlM4hSUYU3+gWcdENANweHpbYrKQvXuotNokPp0jvpUQCSX6XpsIKOrxIGwYLCqzsWQUoNEtGZ9t3Bh/Wnjp2lRqIDGfxmHnUSVlgBUa94tcxEQMPOXWnsGeGHXAzDoq/RlCFmesIsh8WLOH5cRlcTxBE0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=Oo2FW0OYIogoemXzU1GFP8kSFuVtvjJmcrEh/JCyxocGnXDFxwRC8OJfbdSH/6bzq6cGjPDmJGTZq9cYcbQjwpaES+CNunS9+kJNpwqZWxZuQuISktpqUOl0BzTcg/0ZY/UVs7YH5Wuo2a4vCxIWU91iFNAC8ej9QzmbKIqv39UhWM6AXRfnBaveD7tk50DdUStCa9h4R2CM6JoOt9SzF2IjEzQ/bi2bzpijTK3FZSPe6nfwK04WJiHan4N79SA2cMcfjC+J2hIj1+F3abtr0ocAxckz2OSwberHdZQAdThQEUCLIJWJPStYm5dmI66uw7mFMrjpokkcD4TDKbLK7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:36 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:35 +0000
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
Subject: [PATCH v9 04/36] pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
Date: Tue,  4 Aug 2026 19:03:47 +0300
Message-ID: <20260804160419.3592327-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 27136b22-4d0b-477a-9553-08def2421466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	idbg/jN4CB0l5yH3oCBUYik8IdRhkVli84CXlYhhoXxeR2egx9z5PKIKyBHwf7fnP5rWJBphLoT6e0ysrtuzf4b3n3+MSVGxWFZtnStETvsjQmMjDhsYSuXYx5cq7HSXqTExoNNiUoS+d5cukek3kngE1BJYRkwQ7XVaw/1uTeC/662EH5qjNKxeJ/q8ApzeTnRHPhJDgO5Bdv8tqaYZRMwJAww2YeP4ZvGrufHiqgf99glOiPtjPVjc4j1cQaJOQYf9R59A3gOOSqHbBBQjhQE480qSPz3MedahEZMZVU+wwg32a0rzdMpHlTIBw4464kDA8VWQJesQlNnIbC5PJC0GK6fd++FQhQ5rAh5y+KiMGicZIUjSxKlc8163Rdvn2EUZI6Z8IAUJCTQrV1XfviV6YJi+5m4MRqJkS3MlsO7hcwhncpABPuCjtb16imuMxAKnT3xgKGWRktMbV84wx3U60IRo6whAeUpJOtTdhGdoHjgD6kKpswlip3HqFd2D2v5C+WWKBY/5gXtxkj8IU4CtU8q7Fgxthx22LGImN/uz3JukhLTHWsOQN68FDGy3LrM9tWgiPYyse5ZIccqNpw2UhdfZg+L05cl4DJCskSHiEamhUPruoE6IE4lHU0vW3CVmclHiZ0jfaP8/+ub9WLw4uVrSYbGrY1SARNdSysA0s+MZxglZ7fH1nNVtCgcN6Pbhjw6YobFawaeyPodElwbd9l6MmPIiTyJbK2C7CXJaGz/x4A5q/sDO1NjKdaOZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w9Ddj+oriTKjwBcoaOy8r7QjUjXRpJkTiNHB/ZQv6XubYGNbcf4MxkMNKN6k?=
 =?us-ascii?Q?oOAD6EGAu3b+SvqOOhZWUhX6J3a4ix4mENldOiilmWDoB3E7NUV4eQS6NGzR?=
 =?us-ascii?Q?Y4V/0O61b0R2FgJwQGkwsjkyrRIOYauvUzUsQ9MLJbE4C+P9B02PQ1X1fE4e?=
 =?us-ascii?Q?o63eyqVDabeHcm1VALNFrAtgP139JPRSxJ3XZQy2DiljEl94xgBa4d3GVjUk?=
 =?us-ascii?Q?xL9gzAeLHFXwTMspiaJtN761iLVbrDzhVEo5XBwoAjnOc8SPgYABCRNiaOKd?=
 =?us-ascii?Q?WFIaTL4giWO4YudjjIQWhWkAorohzOWLi4p+nHUlT5dLUVED0RWVDgHvrtUt?=
 =?us-ascii?Q?WeTJ67dEptYvxyQBes6Oq7NORM1/Fe92AjomAmZJRm3QVt8w1lU3dWqesL1m?=
 =?us-ascii?Q?VZZasFBSKZ6j344hbW7PXKwNrOWhRlHb9Vxq7E9k+9sJ2UPtOoSlYdkf5obO?=
 =?us-ascii?Q?Akgu85Ww9emwG3mtX1RtXimAPRvvdJXYSurZyCBvSzBShizGedvtH+Bw+nip?=
 =?us-ascii?Q?0SVFm8Fj32EekYr1v6yKxT8SG9ITImo6L4y3YvMWgJmkzYlxwUZqtF4mpSMm?=
 =?us-ascii?Q?2CkzK8fqZqbqfatP5LMQ15IaHcS7lUjJW7j/+41+QTbEaaGM1y2VUt+H6+lC?=
 =?us-ascii?Q?vlyZbOWy5FCDugVJaJObQ5OLWEkRB6CJMZ+uVqkCbIPHoUJfm+nYvIvC0gP8?=
 =?us-ascii?Q?lQZwqNyQrfHxcqSl0zpUMfZXcBzYfZalI57JiUUCZs10y57rVKjqIwpDzifN?=
 =?us-ascii?Q?BFkzIYwcxhKPpN7cdsukBWTYUr6VqTG8+7nD2WHSpyDiHT/yEUPbZnztU+6V?=
 =?us-ascii?Q?xZQav6yGkwCXr9LDVFMjXp3ZXxVbbQGlx9lekVutLx8GutgVBbRh6H7ZGnwe?=
 =?us-ascii?Q?7Yin/7SLQYrzLuvhzaTSqOzrk+Cj9c+TRi+x9tUi77ns+CjaCwXSeDVBweLK?=
 =?us-ascii?Q?8Eo/Wk25rvVrsUat4MkKgYjKgCIy5NNHUlzhNxhyn/RmER4Om4so19LkQ/R3?=
 =?us-ascii?Q?i2v79UOO/350tcMMT+Q4+2bVKMfn9aRvD4c0hTT5K2DugrLvzFYIhfbHdzvY?=
 =?us-ascii?Q?G5FLqbdVKjYOVV7RgXW0l7lSHz3iYm/d9C9blWOgs5yGe1WwASLcBS0sK1GX?=
 =?us-ascii?Q?UFdY2scwF0SNz1G0XS3AIMBo7ZVKlHTzj3vL/B/s+2XU/C2MSJd7wyjInaHf?=
 =?us-ascii?Q?GiWj8A7uNTqL9GeDaVVK0QqJCqH6yU5B80GEahQkGrB/d4ekeSwbMRPiE526?=
 =?us-ascii?Q?OY3pBBS2Y6Wf5t0lLt2zus6ogeGDXGEFmLujRTPBT1avrHHC13+372jse3fj?=
 =?us-ascii?Q?PHV4DKySc8f2NHMI9IwZgdNsi4KCuGsi3g7JKlx0VLElV4sxj5N+xtQ6PVwA?=
 =?us-ascii?Q?XzzvoG2KTC69g18JLP6wKOLreB8exOYyFWcfKcGoRPG7gSO9FAH1Au8ZZZJk?=
 =?us-ascii?Q?Pt2GkHUNuZn+MGuzGq1Sm2JDvQQx5GIxKlu5+Q9T02sFu260kRKcM92ai1PJ?=
 =?us-ascii?Q?8H55aBmyRUqniblAspJMhohbLTFhTeTxZyyHbdQF0w1XcjhAYdxSAJOBwFzo?=
 =?us-ascii?Q?tL2fRevg08T3E5Cdn/RofGbcWd2n0R+SnVAvPl9gD3G4k1cFv6MTB8/mQ0wM?=
 =?us-ascii?Q?Q1k+++FT/4v8pNcGl/F501P7pGvk66s9xITbhD6Nl3T96Z6rCaOHi7OK7s0o?=
 =?us-ascii?Q?HJvUXPUhEYpzYPhb7qmXSvR9ytHr84ZnBNrPfOT3ZYwNLy+64Q0UNquYFQFM?=
 =?us-ascii?Q?M2rEdHKFYBuzL2PsaqJRE9d1yOnAuaY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 27136b22-4d0b-477a-9553-08def2421466
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:35.8902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Djtho91LrYsx3KDwurgmBL7pPg8P2M+C/Ts9uSRPvK9/mdy+FD2jDGbwxqTZ7G/HMyrnTb5O+B7E51oUUTBOEMlCeqc6TmZ+Hi0SKrCfpYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

Pinconfs of i2c_sda/i2c_scl pins are swapped, this needs to be fixed.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e8c018620f1e9..36d14103798b1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1844,8 +1844,8 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
@@ -1961,8 +1961,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
@@ -2078,8 +2078,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
@@ -2195,8 +2195,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
-- 
2.53.0

