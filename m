Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66790473C97;
	Tue,  4 Aug 2026 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859476; cv=fail; b=ePr7+zoObbY3nWbrxgesRBe0JFbGXZlVCALXvndTPHYuEYHkY0b4KoyrozWk397jJftnhDRllx7ml4765/ACzh/V4U5SaPQZ3pWQ7jlKrgCy75Gh8BSE/p2fDNld48EhXF23+9IU1vXaWozpj8Y7k4SOvTd+KANnA91n4W5Iyro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859476; c=relaxed/simple;
	bh=jNSpAe/+8MWs8RGd85Dye96LuTBexEwl7fi7X9QoriU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LCUwwCAognJ+eyZydH5PTTkBZeeUJxODHmLxlu3NL/dS2p6fPHem6Y1YzCESUSiWEpmok5UMlNp+atPquOChdvTmP0pfGNS/7BePluzWIwcDANyLyK7A9dP673+nCMbSQtCqD/AWAkPnDouxTeCgZV9oMj6YEGNO2Y/DgnPi79g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=EFYf1ts1; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="EFYf1ts1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXJI06L/qbxQx0w4CyexZK93/Kn0dsVzAtKElNtN9lWhxhZvj0O3we086PfxyrgvGSdGkHc9Zxo15/V8B7a0NREJrOk57rwe3YEy9bG1/9uBz2uC4iZ2DOZGA7mKpzI/9/l6R+rYwOVqXn8kkoQt0Z2fwcjwrqGSO/0UCV2xf6MY/zQLgOgT0crU5Rd+jOW+ROC5V4F2iBFi9A3fheuESvEpFesVs7OitnKQaXxh4KMJTz/8XJ/bjzTPxXOH4rpQY/mgs5lv7Wjh/E/jqvZKj1MloAYTT6YFfq39G/0VDkIsjfUAkDxSCy1PTRnEVCi4pk09zp2TJ/FVd99E01mbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTv1/c/ULkVccQ7rasbwg2F2bj9G7I/irTLLjkewmT0=;
 b=eTqvzQggyekNHVZX7aJRdYS+DVRIDrqM/ILjm5uMHw9xdACvrVsOLMbEyxcEijzhptGk7nOLc7baKQuJ7A1Z2I2uj8I4C1DES/2new6jY/siLHgCBt6YGYN/WkX/YmqTP3+kWOtC5oYzlmb7xVqidZdQ4RZpn9HOFyGUKHFYI+TF4EHh12/tVhSiv8rKeXjyj8mvt6zNw8itR6q0KxT5ALQyMCvwYHyXyFnwvHCUcYrNisThlXAdsfVT2oSv370cL0uKUnisvtIb+i26ytKbSmksWN2dM6aBNtgy7lmSTaYJG0N2tBrPwdQgApZ46Rt8tYfERWzNGWHIqJvLCB671g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTv1/c/ULkVccQ7rasbwg2F2bj9G7I/irTLLjkewmT0=;
 b=EFYf1ts1McM+OwC2EIyBr8ua1FMHj7SjJ5Z3SUl5QRRwMvHkGO1xO2xKtdKs4gm/kfG03yySJY6i5CwMAqW915UWp6XM3XFJxpLPJcM4mtYxG1rPral4UOE6P3e3ttZk4D5b08B2lP9vqWJYP9buPButiX8HHfBZVjnvEcg4RKCRGj1cE+8jzuDW4oIZH0m2u7KSkd+OfT6i8z2WsTohL9/O1OW4WsxuadqI4d0FoIicLp4N9yhU2rO/IWecH0nSRjcUNFmnCgMJhG4gxIJ6+DnQQn1R9bQtYisS/kTNYNyygVOEUzVLWZEXTS/3i8V1WfMlQ0hiiUn4i5pAeXRYVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:30 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:30 +0000
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
Subject: [PATCH v9 01/36] dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function name
Date: Tue,  4 Aug 2026 19:03:44 +0300
Message-ID: <20260804160419.3592327-2-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: ab7442c6-7fa3-4ee4-75bc-08def2421103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	yv5mUag7wG2O/dpePbaAwpoViRndU0bstdSFeG2LofvQAWcwsakN32D+WmOsc7F0Bu7aWSxJKYhVBx69KQvFgW/5DiKzYToFCbU32/HZhV+Xf2UHTX7+iD1jYifUHibvLuhWTHuBWOEP/KYepK4wXAXACjNCY1Ubbvlb/DXRFF/r5ju6jufHTpbNr4T0+mxCSH8DIxRuMjrPIG2C1HjsjausbjZEtl8QzIiwzViAg55CySXEXEIHoy7ZCz8P92vm5rZMoSwuaRjBZ43LKgABVpu6+MHCog1YvVDev45XrlLGTqgniAGNsp0UBBA+Y7RECJU17zYLg1NourGSQEov/L4wOJK1byZu+j7KRds2pVTmLOSaNvErfWx0t4vt7jD9EMOUVE5vWxt4loiugp7oZ5DzioGhZFu56mTD0FyEiQR8qrO4rDbSYpnt68296bdNeBBOKUXMa0JPqrWgKvAcdv3AaKjAhTwNshh7NQp/InktA1duH3U0QOuHmNqbBeO9y0jnQNm4Y3Yyc7P1v8Baee9nkMBrr6eaNZlboriG1l/+4J9tbHZxtXyrsh/3/Qjs3JZw+mt5VZPiPW3exQSEwvJ7aMaMH6PwWbiLkic3zUImxDN4c94lU0GGw2hf1ExXneqinaGpvvMz8p/dv6/486OIIWVidFPZ5vgXx0OacY5HCQXW8pQlFMbJdQgjgaLeVh1jDlhkTLwZgW7YjfpjKLOG7hP4d7ysLtV7SS72jkrxZgFo2bb+swUpnN2ityaD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+mYahE4DVXr7ruAhFFBGuixp3rtWcJCLe2B8c1y6BaOKi91g/RiozK8UlghP?=
 =?us-ascii?Q?nXRkPeOszqrGWmF8TxGbjZlgJVoC5GegqVzzlN9EqFE/HbfXL2Uob8fwsCbl?=
 =?us-ascii?Q?lpftMK6RN9PhMcu7eWdS0ouLZVaUT+u39HAbkqnnfxGQ423Obywdf9iJjBS3?=
 =?us-ascii?Q?jARTit/XnWIINK9AaKJ5J9a8fpLWZr7uCST06h5lR2YnoD7LmLIeH56YBChX?=
 =?us-ascii?Q?bNwNHZNffGf4MLUb2Cg23eugH7N8y+lr4FSLlo7BFr95F4buL/m5o50QWuva?=
 =?us-ascii?Q?TsnGybq9cWeFmD5459Vm5ih6b/6eHbUWUfOVnzotVHH4d7l9uvEfIjb4lmZP?=
 =?us-ascii?Q?SY4u2Dl9BRKAOktgF5iPGzgiwfMNZ7L84/gY3b4yCQThykzXDSdZMJ7YITBN?=
 =?us-ascii?Q?c9bXlitTA2rdrH22MW1jemuNNwlBnIQ3h8qaj3MEFyEyaCOKKNTFeNBD5mnP?=
 =?us-ascii?Q?K3gw1LSfvBfQOcE2tAG8gfGJozf2bECE3R22iGRcS2sWr6sXurT8z607WVvk?=
 =?us-ascii?Q?21N3YR5z7vA8KkFH0DQvHvIjCtBYVcWb5mamElfRLX8oaI0B6s0VhCFxarWC?=
 =?us-ascii?Q?2LOe6ARYchBDEXIdvnTTkW4Vw+/VxR3G6UcaW881IVli9gqzgZSyDCgg0EN0?=
 =?us-ascii?Q?jTOQZjUPySdJMZs7untxnI63/pRt57PCFBVNr1GsYHLBbm+QXMWsITHh433M?=
 =?us-ascii?Q?5gRBlRZAG6kn7854iFVfgpC+zsaVsQxOvIa8pQ1ytK8hh3bPIV0ax+tooozv?=
 =?us-ascii?Q?vj3CNLjCZLZqOOJjlxbml5gSipqpuBRumOwXCWclmdOxA2dCCwT9EDtDpJNJ?=
 =?us-ascii?Q?ZAffAzGAOTR1gNVsgHu3Lh5BfW3Z17uAz0F1T7KDUkToeVybMbJdF72STR1J?=
 =?us-ascii?Q?eHyr6NoSTdxvnuX4J0mojv6vRQqUOGpuKa8FXzr5t/6KNj1fgJABVtjvHDhq?=
 =?us-ascii?Q?CjuuAZkwzWh6L9lzVdf5VcNsOfkVRn0Db+1qYXTram5Ku8zHFcd7t9CsnPjn?=
 =?us-ascii?Q?bAutMVBLJGn7+DWO6NlMu+DGMAO8MDmqrRprwhezcYsTpETUXwf86OyYvkTS?=
 =?us-ascii?Q?QMiqCUUotsvv3fdkiMsU+sQLU00a/ubq/Hu28EFJ5ZqJVhhT6aDB4XB4DnK5?=
 =?us-ascii?Q?yZGVJyr1CJm3JdrUC1x5syRv4oEkkwRPfF39t7z42y8IBWXQmmqxKOPxvLGp?=
 =?us-ascii?Q?f2Icdrdp5+wbR1/IIFKUijyGZ1MrjwDNtqspGi2bNCHTZiYVAYFXUsrvBTM5?=
 =?us-ascii?Q?hiWzAzvzBTusuG5RazzNIzRL36JaswKOSvIzYO51O0MIE27lSZ3L01ZSLj1q?=
 =?us-ascii?Q?sO8zfuLZc3vLoDWpJc2/iqIeNBn5t4q5yWcG+wIC03iJLHsqjpv3RyDkGqXR?=
 =?us-ascii?Q?26la3PtOVLPPgrpzMpyE1IoMObGh42q1XXAEnBNf69RIq6c2C2+iFHir2dIZ?=
 =?us-ascii?Q?tbxjXfdQTGbqmKPWtBExKBkE+VBntYsHcwOUIMmGH/eRMBY7d9hpJFFz9EcQ?=
 =?us-ascii?Q?n1RGiUv8O3q2sW9D6+7UzKMAu3uClnlTiRi/A0Yspblus4Wxn/cQLn51K/Ig?=
 =?us-ascii?Q?LtC2yOiFRDF4VejMsHymxB5jvFLg2d4eWE4B+mej39iC0TJpkaa0sFshPkXy?=
 =?us-ascii?Q?+iWnYG4l5ZfepsyoZ4iS5UjLvzUV8hK5/TsniQgXa7SvRssNCZvpea29qXde?=
 =?us-ascii?Q?nP8RN3xNOiNAMWtXJEWAypz5OxCPvbjlg/7l+zWg8y2sSTf5Yt9r9lHqWj/0?=
 =?us-ascii?Q?t+qqmXvLqt+TCb46yczG3FfftATNknc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7442c6-7fa3-4ee4-75bc-08def2421103
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:30.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD9bNYTQkzDYDALTFQ8dHr7Ut4r37Imqb4iBVrMNc0ElIIiFiEaJ02qVx7PK7cH2XPThCtcrpdYAhlqrFRggApxrb7ew62Z44eHjLyYeR/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

i2s pin-function is missed, instead i2c pin-function defined twice. The
second of them operates with i2s pin-group.

The patch fixes the misprint. It also match actual pinctrl driver.

Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 21fd4f1ba78b0..0c5a7eb6d563e 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -166,7 +166,7 @@ patternProperties:
           - if:
               properties:
                 function:
-                  const: i2c
+                  const: i2s
             then:
               properties:
                 groups:
-- 
2.53.0

