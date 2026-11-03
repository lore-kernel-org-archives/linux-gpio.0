Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701382;
	b=5ifG4Q7YBD8qGXptrwfuS9FFtwB5EFScCMATgUNQFVB/yFXyq1D/kNvghGnv9Sx7FYI8
	 CDc+LqGRm4goLcHO/EnIvnlz+9Dws8hdpZ5TLtP+M5MAvKDtrC8qb+EoM5+/iJmM/+zES
	 yMJOtCb7EJt2va3HmEH1gMlf8YxmozdOYhyYAvFo0zwmb/9O4ZevFoNx9kGJCCuiEgWzb
	 F0ok7dhzwV0ys+qXlCAQYhsNp54q2/eii28g/mWboOke3Gs1XKLHYYGFFRBJsJqTK8jB8
	 nxgqBWc3/Wem1v3I761HlauBu8uszL0jLnwpJtRAJtJrhu6c0Ehx4nfwDsBVnq4Nt3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701382;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EGYfhZTVisJG2SuZmE7r2e4TPPbB+XXKVbR7UpW4x7w=;
	b=zquVZD0lg3XLzr9T00GQDZlXgUumxQeo+EC/wKdpjG1NU9O2obMXmMnNhYjnj7NtWyun
	 krVoJfniHtWXFeaYWMXPJJSeCHEiuPhDi/9FPErwbXatbBO8F3aXVtU8V+Mtp/Mffg25n
	 eIPImZlz5+bh/ZpfgWeI+2yTpGkjnxRxHh1zLKgk6DillCkuaxIKzjFYFzBBASCYWtg+K
	 0QkE8OQSdT44uMylp7RedsI+Di2ecFcjRPmpHLvB5n6chEkGQkWTFVJLwZN+hWy0bjwSd
	 ExWTB9H1FD716y0E1qw3JiYLyUrPvYpvEFm3g7TSiF3/YIz3SVlVcN820nyFwMVCuTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393A6606BF81;
	Tue,  3 Nov 2026 10:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393A6606BF81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7HKoJk7+6ioDi7a27UQ82P0aGf4R4rwUVAzwrLgcnxDYrNCMvj2WL4sJvtn2R8L17Ybs4N49uTUL4XMSoqjWvkxuo3EneJ/CRny8o2cxfXEgYRPw00ggHckg6eZl70Dfdni7YNSj4piEC3q5YOparTH9hDdjpBdIdXW4alqt7yF9Mt0YOVdtQOUudjypWJRkMoVTIrQ3fe+nMvz+swNQ6NbJv3xVBQ4nrhfnymehnG5itsRmjAQ/8lzusKQ1TdEX1Z1SF3eUv3zWmVZCsr+Cgz2Htbv5AK2e2GANZ/YB1AXMzKu4/cWu/DniW54YtlHrmrOPsSwk5EWtw/e1TOOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGYfhZTVisJG2SuZmE7r2e4TPPbB+XXKVbR7UpW4x7w=;
 b=Vd4dBQGOUrCB8DLqzF+oKBM9rWNdteaPEuh2WcsDIH4EgPWN4Qrgy2p4HtvCuOPNCGOLqOX4QOpZxzWa8mqc6NBVo95YOHKfWZL2GgUbI1F0pkOB0wu17kpFo9aRxVtGebB4er97ZOaMvPFOaAj+M+2zu7Fw7hjHaAo1vH42Mz9E243LedlwNP7F4a/R0CWYfljPio9DDK2UGk0sJ2qd1l7H8Sc1x1nYzQq+JH9RZG0ZYUo4G05OsiXM8ZB3FWCinCBbWyzptqGVqKvI73bw2GztgO9XR63tQj7Qn6ULkQ+ZmnZ+RNN0pevkzX71ntrRKd+OOMeyFMyDoNvL3JFAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:50 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 RESEND 5/8] dt-bindings: pinctrl: Add starfive,jhb100-emmc-pinctrl
Date: Tue,  3 Nov 2026 02:22:33 -0800
Message-Id: <20261103102236.96872-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
References: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0066.CHNPR01.prod.partner.outlook.cn (10.43.33.33)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd20d6f-93f0-4ced-165c-08df3994698c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38350700014|56012099006|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	tOd8Uh79P8iA97ebFZpMePH9yMsQd7OHWs3ArclqWN1O1ToKBMYVu59WTN+YSgPtgLGgHqrIp0m/FlDt9Rh24gZmckLf6+/A6a86g6NOj0OW5s0lKW8und4H2CEC14HJjVPsEuRNHd61E+2BOfdls2SE+fh3E2GigLXbSxJ2ml/s9IqiyKrxWIxPHRn0U2AlSCnd9/a1pslUT+T4LAek+85XzoxxHi9hcEiu07zDw4v+xwVskv1eFJdPyVoG/h3lfEp1Wh+UOOmubtqHple7FImpMh2ENDzkq8fts9SCD/EAv9MNSn4H2Qo0f5mRVpIdoAvVc2m8lHLFo2Mx26tqN8dRBkYcSGgzEiLPIznCFAs6R8SjI+maSZHX3QgJ5/edoDHh3X76y/sHONpAGKs9eqHcE4gsqYfo8Zcaya2lDKOH5jYq4OtRHK/tZ2w1S+NuxKhb73jT+Zn+nhpQnPQvGn3vOXjIBC9DQGqS2JBuxo+pfzDBcaRzDoQWjvuh8OgaGOQk7wEm8qA8VY0Ag85EDo+ZIPcEl9u+Zs0jxSGm1RjcNQlRlaiMaExbMfxPa+mX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38350700014)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RPLQMLyQ7hsmG2ivgUhdAwJaiIyUFD9XdOhy0aSxOesh3vp1f8WCF+ZtnSre?=
 =?us-ascii?Q?XFIay8WrdDuUCJSBTkspLtG/s/tCA1c9E+w0owgeDe+wXGo4kcHZ03dkZu46?=
 =?us-ascii?Q?KXR1CzlTHR8oZYR4CGicWhagHNNfd/NfSV0LDe5u8mjbY0VvYZDWglyNhlyb?=
 =?us-ascii?Q?9I0o5l/4Xjxf5aofluNWvjC1z0LOqtm/0LrDXz0xoMItxso6Kb+1ERwTwqZZ?=
 =?us-ascii?Q?jC9706YRSTq0uKVTM2w4v+JEKtEW5NK327J+r0nNKSvSWgBOFGyb2YcvGT8T?=
 =?us-ascii?Q?zE/gIRDKftkOKwsMuBOpPKBAI+t9Pi+d+141HpHp6M5+Cr1Tf9Fx1SnVs2n0?=
 =?us-ascii?Q?1uTyHFqvhyE8tM6qAdWB7GioS1ysgVpuWpCozkyYvkY9pysge3WJc6bdo7ml?=
 =?us-ascii?Q?qycmOl7I0s0bz2U/lgnd7PbHCLHmhJaCc8957Lu0nYcjZC2iWCQlQif570wi?=
 =?us-ascii?Q?jQcs/VVE6e/GecoZE4Wq+w/qn185lK0KiBCpsRouJOx10bRCLfqzR4LQ1a5S?=
 =?us-ascii?Q?l/oSYvJcYUjJ/iP+apeQf4PBLbkGHrzYOJRQyEiai2nkh2P7Ekc3JjD8HMjr?=
 =?us-ascii?Q?+eOWbRwe5e5KWwLNEESpGxWWQve5AeeB/QMJwBL2AMCcmDKhDD3hGDIChF75?=
 =?us-ascii?Q?tKDT0gE0D+bg/p34i0wr+rSQjF0h9l4SNbgGVoV3CaUbUf58BcZjm+zOW8i9?=
 =?us-ascii?Q?Q0PqHhbvrkElm+e9+J6JbcsbSr5V+qAEEJK3GT0u78a6TYx5nP2XvJHsJbup?=
 =?us-ascii?Q?gkDvFiSIXJMY7bSkRRTrcciRIwu+pxaO+Pa0y4SFUDymD5CHLJGAyDjClYmD?=
 =?us-ascii?Q?zAT5Ub3iHKR3nCc+CzCxHTkuKcky5I2DCpJ3KYZAfTRNuz9lbLfG8kehcuXJ?=
 =?us-ascii?Q?mRQf/mMVRJpHH84evBQdVjahdr+h8IdBGoUmIG0xY1ARJsYNRwTkOh+TVPKd?=
 =?us-ascii?Q?5ni6d4YZUAM3rYy4Xk+YJLQC0AVyQLWgPMHQVbVect4jzXyoa46zR0ayYhU7?=
 =?us-ascii?Q?dSkd5Vah9oYufC2RCO3A35PNimtAwUUEt3sCnSRZ1/0/iyF7Bg30OU8Nn+Ul?=
 =?us-ascii?Q?boBtc8e5IJDaZbEBdKpZFWeFamF9HM2kQfBS0WyyuN62leDIPZUbALxMNg6J?=
 =?us-ascii?Q?nPu4HxgUnhhznooNFKbhnBuSbbz1bo9+bUC9BIDiNGvJNJTZQs21gBNU/Qoo?=
 =?us-ascii?Q?BHPbxS6ZBOFdV3/aGDv2l1PVSlNhB7tHH8Vamowh7mZ0HCQ41mSth+hYyTyC?=
 =?us-ascii?Q?ixukmTK/HEV1C0jWNNelD0pbdavh+UrQz3/mdAZikHlDLEAyKtPoKKRZvL5z?=
 =?us-ascii?Q?Dces3xwLLg9vWZjoSjJJ0pab+EGzJ24ENWoTcfGmAd85egYyYMunfoL90d8K?=
 =?us-ascii?Q?vLOFTgeGyOmPy1uh22Shou/EbOKNnHwAxWhRHOrLmthgRUVg3QxVMkV6lHNj?=
 =?us-ascii?Q?WHANtF/nDsqQ1UnHe7EQpyBWfB06eczpAzVcRh5LYca4f9ADLN8SI8GOrXrO?=
 =?us-ascii?Q?aTKS8OOPw0hcYUOfITou0wS54KivDIrSIs3pIdI5B/KSpKcpW0hqAaC9/spS?=
 =?us-ascii?Q?KlHgPTq2cqIIdnsOkL+Up8sSHsfzzJ9af9nV+txWg6qBHuhrSD5WEs8BRGXn?=
 =?us-ascii?Q?ZyMfOTdIw8ea9iynZXZbHRaHxxUZfG4qoKnTEnEuDrHbTjovN2UuBPEl5o4v?=
 =?us-ascii?Q?JjqTplyRM3pvthso2yZZ7tcn2gHE0Hm/GLbltmsV5a2pPpalC9AuxcQwaLs3?=
 =?us-ascii?Q?EppyFUM+DZfU53yWkarOckdj8qdKMCVbmZICq64uHXh0RtL8m1Jn?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd20d6f-93f0-4ced-165c-08df3994698c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:49.9970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fnr8Qm99sT0zD4+ucZTyUaLBEgYIVUimp8R+uiJFKMmhexMbKEg0wuolQHAM7iaUDFIgAIz8eY5bh1P/cMy6Sof8c4bGzgfZZMJesOIqErAyjnpTVppY3DPqdDRr6v7w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl bindings for StarFive JHB100 SoC eMMC(emmc) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../pinctrl/starfive,jhb100-emmc-pinctrl.yaml | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml
new file mode 100644
index 000000000000..4533209d9965
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-emmc-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 eMMC Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "emmc" pinctrl domain.
+
+  The "emmc" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the eMMC Pin Controller, there are 12 multi-function GPIO_PADs. Each of
+  them can be multiplexed to several peripherals through function selection.
+  Each iopad has a maximum of up to 2 functions - 0 and 1. Function 0
+  is the default function which is generally the GPIO function. Function 1
+  is the alternate functions or peripheral signals that can be routed to an
+  iopad. The function selection can be carried out by writing the function
+  number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input debounce
+  nanoseconds.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-emmc-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-line-names: true
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available in the domain. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          function selection and input debounce.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        additionalProperties: false
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins.
+            enum: [ emmc, gpio ]
+
+          input-debounce-ns:
+            minimum: 0
+            maximum: 10485680
+            description:
+              Debounce time in nanoseconds. The hardware counts in 80 ns
+              stages with a 17-bit counter, so the maximum is 10485680 ns.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl_emmc: pinctrl@11b42800 {
+            compatible = "starfive,jhb100-emmc-pinctrl";
+            reg = <0x0 0x11b42800 0x0 0x800>;
+            interrupts = <119>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_emmc 0 0 12>;
+        };
+    };
-- 
2.25.1

