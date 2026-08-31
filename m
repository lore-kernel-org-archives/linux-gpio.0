Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2102.outbound.protection.partner.outlook.cn [139.219.17.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796FF3B14B8;
	Mon, 31 Aug 2026 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176142; cv=fail; b=cJJOilOxuGFvf2bBxFv2EVeFbMvBLZRn0WuxYviH+1AUQ/lt3PXdSAxwdLr5gVZ+nch3zuMMAbwtDIYXQ5QrBAe/+iO6+UB3BASCS/Lwh4ze6CIlIiOf1+DK2Ztucfj2l8pwco0E7YRWcz/STOamJJuL8ddZ4rgI1vhP89Akblo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176142; c=relaxed/simple;
	bh=t28L1oUTsZ9XD6sIT2YdGl+zE3QrFsAYrzOna7rTNqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eOD4ZVg4IOx4zZeBledm+1rN1dk8z/rhesVucBQHC4n17L8T7Hj+1bbzBF7JPR1BhcDfk2uJQgN2nYd4fuXwik8dhafDNVQtCMGzTNcQO96oRZCnFnHabzDQEWC1uswCjOyoqquQ8BjnbY/Rs4TNmwisK/niwcQCMmBGyVBabi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwkYdD1NczABdMI2Enugqw25m6jJqbSH1RYD0lyE354vYVd/q8iXbuHrEdzNHYJ78K/2TW9VBpF5VSAvFO0VKqjY1td1bPnmXxDXSo0UOmo+RQ+EXpgTFY7GGG06dVatsUy64CCYxGbMuL1mzRL0TwQdz+u+7IV1/LVcjL1pQcWxqhUiWJqGtqMsrZOQGjFZ4pc9O+GMEVBKnNtVVBkLUvjxGMtRHjScsvpG4w41KudlvUVZUA3zt+l4n9fkLD3hx/LQtfyQQ8/S3zn9e+dOhFFtpSJdQCFJMrSKUaa8vPHRBfklQm++xux4s8435xembvZtXs1JTXdt3okE/GDISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtsTRBD5By9lnAKnAtnF+WiK4mH+R20oalbMwPvliys=;
 b=b77n8/77Qm8VkBKR6BThoz9hHH5COSKtvH34vN0Kza/MuIzW3nMVl/CxCgnTkzaj7aoKIyDl/FMS+siuED/96ls9TZMSbMj5aZFvne0hcMib/y7OqmWsR2SEVXR9Jwlc4HhHqj4iiB3LkCXpthYBadIguC9FMCUURO42U5aEDKlPlNhfD61stxTKeXg9rgJcBMevDLahTBKGrzjYxfSrodkjIfdqOgvn+8GZZvszttJuGRnwjZAsTTzneAp5e5O8MVahLEd9SB5nxCjzJSrMIM+FtKbKevl46s0mDeQA9KfjPGIkaN1pUw2Wf/kGt/EtI9H1sjtM6EF7qVgw48JJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Mon, 31 Aug
 2026 11:35:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:26 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v7 01/21] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
Date: Mon, 31 Aug 2026 04:34:54 -0700
Message-Id: <20260831113514.66382-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: 59cf89c9-023d-4f00-d037-08df0753f36b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|52116014|376014|38350700014|921020|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	UxXYAA9DH3GEaruFAlaU3ptg+UV71Om7BjM4OycY+Hf5RN2rZjjxMUlaooJhhceIxjztitKOszWFMLFHPFb1itDFpu4hK2aEyNTaAoSlFVFwVJofmjO0Aj9tMcKrS1crbtTFurLGJqv1xP/M3AgfgiKYH2qcym7XieulGmq/5my54KEW6GLEtZtDAjj5FrrE+UAMJLFtKTLaUUYp3dCWESd2rzG0S+KeJedB5IYpoTSJA/7fRDmPP/kiN4p6bk7D5nhphZPN84QVuiIi2jHxBfHXG7Zfslq1UhjkhN/bM9FUK32rSWVCHUZy9D9+1BmUbuBnzzXWN6pBzyc2rw6OgaZBEAxyPkfYDWemI4b2luoTSBzYeHVa49MUrvaEwMBJZ85U65AGO17sA0EyB54vOr2PN7FYgSYi27e2NYkbh6nL+xY7w/umxnN5wtVpPMb3geuDVwYcTZWdC2q5Gr9681PexkAHUxhnvB8vWNB1WNJ49QYkI75NhHhJ/dZdPxo8ISUzqWjMGSh5bSVSuJDeOyYpI163WUq1VjwvnemEdjHtCP3RvP544oSE1aHn+KJ2RKpNAkNPXliOqScXCyFc8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lGQq+KxeqL1Btongt5kqvlW3KsG0Mq/7wFUG8mLKipKSPrc+PIVD5YEOs3BI?=
 =?us-ascii?Q?h2qKEUw7VS/9JMGWCIVeOLWIqcWYqu+ptUZauaj+3adeiyq7eqzXCQRPDY8A?=
 =?us-ascii?Q?nqXiTaDodSFpZcuB+cu+DOJK3RslGg7xUJelUy3Ge+kKanXekFcLFZ8XqvAn?=
 =?us-ascii?Q?BTS8N66htXY83aiEROhFsZJntjHcRk5qM3TlPgd9Fri7wVKqQWumdChdWf+a?=
 =?us-ascii?Q?CiavNGstH17g1NeulyPk7zdy1megghKmClXDtnWn4yr1IXhlaG1GV2jKQMnm?=
 =?us-ascii?Q?xCZbzct4Hnn4IRkeYoExXUJZ1ypkAA369fW9PyNoVGldFM5toXMvgFLvw1EZ?=
 =?us-ascii?Q?LL882dyS386rZzHuYosGmmplLUkqegMJwdFjRkkO1siDdUmGlAjjjK+M6Chy?=
 =?us-ascii?Q?cQ+vza2eoGHf6VIFyRICDY0Wi2wcl4RfIKd+hF2CmM0WEUco0I0FNjxVvMy9?=
 =?us-ascii?Q?lOL63d1uVItlMQNBXaVWP7vM9FBDLxWJqPxOkkLykXI3qF2YuepzdoG87d/f?=
 =?us-ascii?Q?wBjlAQEC/peIHIXNKSrmzRynvRJ+ZSCfF5evNY0UafnQIC4iVVVMr18l10Ug?=
 =?us-ascii?Q?PSFKCW+xc97B8sjFjzPdu0t6OQP4uLJzGNJFebxO555j8xL4eqrr1CBLj/2i?=
 =?us-ascii?Q?IHJFuiics1P3blGrwFBmMQ82ppkbIURE5Vqy4IPsUaFUVBuaIcfR0/yodFLE?=
 =?us-ascii?Q?TVTHffoQDmVm7cXSvrrfsOR22W7gEej4R2wDaAOCS7Nyl2TDZZjHiayeqHxg?=
 =?us-ascii?Q?tl6PWmfPQlmoj5ccKnBBKiDuUtlETf0/PAM+4rEySdQviRdEhieW51p/Bn6F?=
 =?us-ascii?Q?65m8j8hSHS0/0glV3SBzdsOcY4txVjFVDNp6K6z0QQoJ1FuGEXTKHWjypj5t?=
 =?us-ascii?Q?NHayftA64IIfDh04BOY1HAoOH118wqdmpTiQyjPTCn0v/7LIE6uxaXGNcgmz?=
 =?us-ascii?Q?xjl9loy/L1xVe9/oSGol9NB2Zivc/qCW8pQFYfhwwzMrmIeR/VVhU9E1g8rI?=
 =?us-ascii?Q?PZcEilnNlTyjKtvVoONibGbd60nk1tboqnNhGFHvbqbDQtsSGL0Lc9mFwWyR?=
 =?us-ascii?Q?Eg+tsCfzuHQKfaL1ZWzsW6rER3CT9fvjo1SnDCE8XakbSwymSlOWBSuxfLSX?=
 =?us-ascii?Q?72JCdyeZS2SDXvG4esgODTQ+opmRPl2e/y+tjGVu3eZILk7qTgHmE4grHd7A?=
 =?us-ascii?Q?IZiYt5Q+Igr1hUfEbb2xDxnuphHNvLUmlakcNByFNmgxPUgX716GhlP9svHy?=
 =?us-ascii?Q?2h+Q9wfjZayv/RnhHP5H1t7N7wQ+SuyXQPctlmkYk7Gpk2aRi5ei2PdOtNgv?=
 =?us-ascii?Q?LRbHunZLHKXqnQWqUNk+0YPy+bBwKfoJu1FTzSMAXZRSxvmVe+zkstBI1+Ws?=
 =?us-ascii?Q?7BJLq2TCaNn9IkDFPktdu7Lq77yWqDpXXwrR+nMLIkDSUFxVYsLfVacYJMsk?=
 =?us-ascii?Q?f461diLHG+Q9USNjNRmeR801z4TTeR/B7RJab4iotcG2N+eKDjtYREVShcCa?=
 =?us-ascii?Q?wuYdNB+tVq96Fl1+vbCM2E4EUMqIk98te9WTcMc5GSBhZSRzq7fd6tj7sZrW?=
 =?us-ascii?Q?/Ulhlht9iYEFuxo/Lhe1NHK5nNWl4oD//CpPvtVRQmDCj9+cMP11ZWcqdLlb?=
 =?us-ascii?Q?fVfUprP9kj+hzgmWAsEoNhqLMGtFdT2Xb4zfa5nHPqyUKLJJndM+Z+UlJzi+?=
 =?us-ascii?Q?OpBOldq2A3SwztbdeHyPNfKdTwwY04CCSlqrfNiNp7lHi/1HQTk1me5ov7X0?=
 =?us-ascii?Q?KfIggzkzs5jXDT2eUj4sr24PXJCwIQM9OzJi7scaFfKFA3F4VZwQ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cf89c9-023d-4f00-d037-08df0753f36b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:25.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r224jSva9MfH7gN6Y4KH+2dw3CMirKSjsfTLBR6n8oo785kKObWcv18S0ByUEBVDXpQAClT7wqVCq31vvtUZN24YpZkuE6+sgt6KMYEaSy5ndbKeo8Cb0ti2g2MwfG1R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

The StarFive JHB100 SoC hardware supports debounce time configuration
with nanosecond granularity. The existing 'input-debounce' property
uses microseconds, which is insufficient to accurately represent the
hardware's finer timing steps.

Add the property 'input-debounce-ns' to specify debounce time in
nanoseconds as an alternative to the existing 'input-debounce' which
uses microseconds. Make the new property unavailable when the existing
property 'input-debounce' is selected to prevent conflicting definitions.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/pinctrl/pincfg-node.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index 97dbce8a261f..17a6270dce31 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -104,6 +104,10 @@ properties:
     description: Takes the debounce time in usec as argument or 0 to disable
       debouncing
 
+  input-debounce-ns:
+    description: Takes the debounce time in nsec as argument or 0 to disable
+      debouncing
+
   power-source:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: select between different power supplies
@@ -214,6 +218,13 @@ allOf:
         input-schmitt-enable: false
         input-schmitt-microvolt: false
 
+  - if:
+      required:
+        - input-debounce
+    then:
+      properties:
+        input-debounce-ns: false
+
   - if:
       required:
         - drive-strength
-- 
2.25.1

