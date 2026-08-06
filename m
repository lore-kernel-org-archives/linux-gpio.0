Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023076.outbound.protection.outlook.com [52.101.72.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BC842F70E;
	Thu,  6 Aug 2026 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054054; cv=fail; b=ED0hcujMutrYV6TM0pg8CaPDqzvuHjorAMeB4/i7GwRxpwRgi4d4Ck0O74Tl+rooSTftxP0L5snOpIAVwwBrvdYK/i+fe4WlUpxVShjm7YfcjFkS2mHWOX4nGKubcN2fRisx2+GxwnqevgBfsJMu9qrsFY3VyfP+r5TeoopX0BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054054; c=relaxed/simple;
	bh=U5Yy/kc/6e/RWBryktCQMIUr9vvhw5rJVZlTijo6p7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cOvo2h6UO/C+y2TRvyU1vZJR5SOT36x0tkX5dpV05/rb40cvIfQVf9p8Vr8PLf7fBFsc9zRWibuUpgn7dVLKXNw23U74KDrNy1cR0ENm7s8WmXi/QJapIa+DKO1cd/NJbGxaY0Q2hW9IoAPsOH3gSRC2JpLnOjhZzeqGYGZfaqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Us1tsRir; arc=fail smtp.client-ip=52.101.72.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Us1tsRir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKPBgA+1m6ZdjGFbWxbX9PXg83+45qDkp2y/HQW5qUo5CV+TJMRn+A6WKy7xVT7NdVTdcExAuyKL9B4fcbIJ6yNhvek0CqMwr0Qk11QhAiAVXlpE16x95od8Rwy7cFws7OHNYChW/lowZ6zHhslFtjoaT3zohTmhFskTpqTKudB4GIkn3nKoCcX30WtdvUo39Z1CWIZUZbGJ/H2G3Ndm1v2XqB41RT24OVUKFPb6t5Oiq0BxkK732dXjwilKif0lEg8dkZEULd4rhxCafuXRUPjfC9miLuVPPe6crAtMZQrhke3pUZ5ym4x314Vy6xoe1ol86TJd9EdL8V99CTiR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpVLktKEC57MaY4wxvoNR00mJL7mmXouuUZ+MXzpfYw=;
 b=IvOpX0he0K7pHE5exacdZFf5P5XXZQuGDXCvN0wEs8427XxRu7OwkmrOfXjhwNxTD9Be9XxfbbXWyCyq8ZhmUDOHc0Dqt5apWaIdpHcuD3aD8eo+7xtBE1Tyt4DBr8bvJ1iCgXPcuzlXPKwZFa4Fxun5ITX7WYqLKV6VePy+TVQapJwYlcRyfPhKF1n/Gjiw94RjIQbVYk07KerczUWdiC036PkPSiDiJ1uyVLTtqIHF/rXib4f7v7oP4cLgxAGvUwamiPC4j9dkKdDNb3zOqz5mQEgZ5JApWAY6UDOzbxQzcx97wbqrjIfeiUyOytA2Mdo19uC24PJ0mPZ01Tp/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpVLktKEC57MaY4wxvoNR00mJL7mmXouuUZ+MXzpfYw=;
 b=Us1tsRirgh18aYxyDlKl1HzJelK1l2c9id4wQsiBwoEkOY4JEsHJRZZTMPmGWPJs6rn/mpmkPO7oEdhIMm39nFsbZe9Jftmva7TZt/I0KFMaFNxlnbGAW27gtP3PYwOm/d8Gcvp1pwV35XehOyFl1BQ4AUVAaBCzXudrzR31Y9GJsxkt4xgQhUVKPIjLgGQ+mZe5mRJf3OTtlISxOCzIz9HmvdFAwlb/QTXx4XgCJ3at6qGNUIDTwe7UfimF8vzVdUrvC0bWQZBSRehVigsIM/qdhvphpZSDQ5b/f74Mlp3L6qQOl4Zm+ju0lKH2N6qvjr+FzXlzg0kPT0/GaIk7xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:25 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:25 +0000
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
Subject: [PATCH v11 33/37] dt-bindings: pinctrl: airoha: add support of en7523 pin controller
Date: Fri,  7 Aug 2026 01:06:11 +0300
Message-ID: <20260806220615.4078303-34-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3ea67d-3884-4819-be8a-08def4071929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+dIAwzf9j7zanCkfa+0ePrp0qfQYIHXkpHDSlTCafwpuuGQR4Wvi7tZoOV1iC6gQtAkb0/IWtEELmRiztWeyJyQfZtgRccWVIm9ctBcP7eu3h0QfHFl8bnBOnUtZGUXkFPGC1n1W+196rsMXHR6xlhUPThGjFz7L0jELF4UVJgy5bxLzcTh8rk9T/G77hXxhfwz1o5Zv+4IpgIVGauljRiAOuYQ74AeOrzMqHHnQeGzINFACTM8xHmRxiayCsmiQw0sDGzWXQiJb+jRlACsWezI0BmndHpoM81P5PJ7e4gKduURQ3T5S+vuthMWZbFP/V60v2LkWiglZRniZlwC3knLMDOjaLIzDAwHK+d5EWJ+D5APPPQ7GkqSAIDi4s0j/ofOjRH5whE0HttFW/kfZoRYWth23q1mY9DLGB7nRIYgK6LXKHzqbsAgCqjEHLxl4WrA6qqsuZMSy9l4Y1+b41/Qor6ip2YSo6LJixps7SYWfXIqfnb8p8bB8tnlZIfF5Mh/KdYJlID5ccrepMbpqz1+hBJYGbYroO2Ge7j5y3syAmdCuoQ1+rJlVCFoxe4s3wx8V5hKLiRgQuTy0VtkuEr4x4/Cf7Ehp+V79TGQO1mmUO+vB80h4mkK4SQ3Enq0hOmUGZdSWLCabpHbZ/zTJvHxPawgAZwh1Bzhb4JMijIrwkMtVxgo/rMkdilNo8MziE22wHj8GE1diSN6aJ5SLH5r68zSE8HkjsS774XhHUlAoyivRYWOcJy/t3XwE5pII
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KP2Nx6BI36OmMOz3M2iQxblRYvzoP/i/eakxuQicnYLMmw+n80pGUZKPMfKQ?=
 =?us-ascii?Q?m3rXAj4TUJ6UdXZ0SSqd2896H7GIt/Ltot5umewGHWuEBzDvw54ymWhzH5o7?=
 =?us-ascii?Q?CJhTSkj85nwRDT3CKA7Qpn190gUCCf2SSTdMmltXFE/RvnpsA4GYgQiy6BEI?=
 =?us-ascii?Q?HUhcvybIJH3H5wW0qCd8cgOXTuy9wpgxkR79L5rgfy9XqUXGtlpwGecke9k1?=
 =?us-ascii?Q?x/yL6LHNQSdNCIquZB8QAu8tH01iAHlXO7V8LEJ28siXpHIy4dFsXIJc3IvI?=
 =?us-ascii?Q?iENH6aCtJ9mSiSsPavuSQD5GHf/30AzrJN2xAfsdZL/JuTL+DKvPamp9J3/V?=
 =?us-ascii?Q?E3yd3DDaTvN0ZPeUpTi3NaGlgTVXfTslTfGUVfH1vmf/IGtyPGdzvpxysZvs?=
 =?us-ascii?Q?Oth1Sdu9HB6uQhax+Xbvy0+4fbqqgPeB+I/LLhLJfi22N8o49+9JbOBxdbnX?=
 =?us-ascii?Q?p8njOWo6Uxu09C4u9MuXUqhO39qnQZf5i1iqrlu6kvKNJGmfVAoVY6cXSLJI?=
 =?us-ascii?Q?7X8qD2EyiFSIMqxGknNgoXMbK/hRHKyhsHA9eSfJsmv9P+Z49fVE3zFoOPAs?=
 =?us-ascii?Q?dUrEkZ5WdsPSsKm1wHK+Go3UQ+MYJgj0ZHypRbC7jh0+3+g5WkXykBUaPxNl?=
 =?us-ascii?Q?4Ww9oROWePq0J/i53o8PKc2hBOp9+wCVbyZKxQMRiUnNwy9yuOjfOZp0ktdw?=
 =?us-ascii?Q?SN18CRXNGkUL7nmcSSPDfGNWSuK82Icuh3sX4cdkjyr5lXZdzm5Ajs194GFd?=
 =?us-ascii?Q?WFSQaRrhnqZU83dA0VaxzN4VQKN6S9fPiRiQ3LobcoZItArukfQCSxfk1cng?=
 =?us-ascii?Q?/0B/+zQcDUkYLLgEH1i5iZ4wS8q6oSFaTultxs9VX9vmJbNsbqYJMI0CAt7L?=
 =?us-ascii?Q?Gdot1uLYMXbgnWNa+c0aahdY0E9rmJbmEHMdD/BF98Odqa2my971sHRyU1Oa?=
 =?us-ascii?Q?S//I0sMVY5LUkM0r5ttFWk1WbGjUpWuzMLbGGwJBc5j7E+oop1nj3tJOuqAl?=
 =?us-ascii?Q?7dH6D69O8cNXci6klF8Wb/EuR+gGfIb0Y7IjHeTcsJF6WrnvHPKKy3T+2y28?=
 =?us-ascii?Q?2o90VMjKA7NW/M45gq01eNAWskAKZ2PYoVRDp/g/GluJlA6kFxJBm3XpCYLN?=
 =?us-ascii?Q?25NmIfkQ2gA1XR3wNjLrEN7NXmWTPwvriS0yQU6QvtxQQUuow5vUdDasMJ6v?=
 =?us-ascii?Q?lCBYXgLwMLCltOYqy5ZkqoYE7a+wbSaitLTWLoS0jURb9ipCKF7/iHKw0Lmn?=
 =?us-ascii?Q?75OMymcFsLcIAbS0TeFFRvsD5mte0iV/X2Zj7+h7BJWrtT7SKUvB6qPARMbn?=
 =?us-ascii?Q?U+U/j26o0U+CuKrxC8uuq9VN7YUvLQ1Ek/Z4qvvacBu9/6nv4c+ku0cH7Afb?=
 =?us-ascii?Q?uOWIPENp/DQuRPDaSZaZE1TmgLOS3EVXMsHecEW9iC9a24SV5sdwK2U/WXxd?=
 =?us-ascii?Q?uWMIcHuF3zWi+2t5xp2LEXplYS75CqVfhpqcsRRUuqYtNG+z5hIji+bGw1ne?=
 =?us-ascii?Q?jhLSC7pr+P3FCjrTJn8qmNAWrDAuir29PgG/T0V5X0Vea20U+Y9+g9qKF8dL?=
 =?us-ascii?Q?VfSJj6Neil4fC594u3+08dJ6yzha44Uh0kXWj3XWonwgJmDfcQqb4sZkvBXo?=
 =?us-ascii?Q?6rlpzxGcT/Y7Aos1bAAYWJnZLHkbCdM5MhCTeCVHGCfN9CM0OqA2oipY9bOK?=
 =?us-ascii?Q?SVk43Rn128ZvGlBXYk6/G5ZtCsCrVCM3up7y11OH+asRREosGwJHZpd6oxuu?=
 =?us-ascii?Q?grOv90lywfGVF8CkG+413V3eWaclT7I=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3ea67d-3884-4819-be8a-08def4071929
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:25.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tiTZxR/HFS5XDAvNZejOg5oplVtVwkvpeK6ZOkK6GSrmoXprccEx5ssofYVCgvQdfwQY6FBuEjntm9dt65ZLSPghTX7Pwo1uaS36VzE63U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

Introduce device tree binding schema for Airoha EN7523 SoC pin controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,en7523-pinctrl.yaml        | 378 ++++++++++++++++++
 1 file changed, 378 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
new file mode 100644
index 0000000000000..599f80e94432b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
@@ -0,0 +1,378 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,en7523-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7523 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's EN7523 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: airoha,en7523-pinctrl
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - interrupts
+  - gpio-controller
+  - gpio-ranges
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+                   pcm_spi, i2s, gpio, pcie_reset, pwm, phy1_led0,
+                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
+                   phy3_led1, phy4_led1]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  enum: [pon]
+          - if:
+              properties:
+                function:
+                  const: tod_1pps
+            then:
+              properties:
+                groups:
+                  enum: [pon_tod_1pps, gsw_tod_1pps]
+          - if:
+              properties:
+                function:
+                  const: sipo
+            then:
+              properties:
+                groups:
+                  enum: [sipo, sipo_rclk]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart2, npu_uart]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c1]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag_udi, jtag_dfd]
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [pcm1, pcm2]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi_quad, spi_cs1]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
+                           pcm_spi_cs4]
+                  maxItems: 7
+          - if:
+              properties:
+                function:
+                  const: i2s
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio28, gpio29]
+          - if:
+              properties:
+                function:
+                  const: pcie_reset
+            then:
+              properties:
+                groups:
+                  enum: [pcie_reset0, pcie_reset1]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                         gpio26, gpio27, gpio28, gpio29]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [i2c_sda, i2c_scl, spi_cs0, spi_clk, spi_mosi, spi_miso,
+                     uart1_txd, uart1_rxd, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
+                     gpio27, pcie_reset0, pcie_reset1]
+            minItems: 1
+            maxItems: 38
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl {
+      compatible = "airoha,en7523-pinctrl";
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      gpio-ranges = <&pinctrl 0 12 30>;
+
+      pcie1-rst-pins {
+        conf {
+          pins = "pcie_reset1";
+          drive-open-drain = <1>;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio18";
+        };
+      };
+
+      spi-pins {
+        mux {
+          function = "spi";
+          groups = "spi_quad", "spi_cs1";
+        };
+      };
+
+      uart2-pins {
+        mux {
+          function = "uart";
+          groups = "uart2";
+        };
+      };
+
+      mdio-pins {
+        mux {
+          function = "mdio";
+          groups = "mdio";
+        };
+
+        conf {
+          pins = "gpio2";
+          output-enable;
+        };
+      };
+    };
-- 
2.53.0

