Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3064C3F329C;
	Thu,  6 Aug 2026 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054010; cv=fail; b=R+gLX2XKsnqn9kkg0TvMYNxO+m3s3TutQe9T9GwiGpqcWiab3yEJ72EhtLNlFyxdYqtZcjq/q2s5AFjlGDQfEXyzsR3udJd3AFSJgpMHL+fyrsAmyskZbfsaqD1sAK6rmq0TMxdoVWLjHcj2dc2F4lQzpA41DHCR6ab0rOv/yQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054010; c=relaxed/simple;
	bh=Cti0WCN4RI/njC+1nLIdc9busWMSq6BBk9WuqzNR4pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B+d8TgKh5HgGtAV3hvfXq4QVbAb3ts2xtdQe27Xqwx9HZjgaY3pVEspEyQHo6ExrB3xZYPoy+cK9MMZ/u1+VTdo0BX5fUHXwiRWB0rpYkb3btQrR5kAaYVnWuiHSyIRyaY8QesebyRPBg9Nr3+fQOkJBwCcp5Xr+baJCH+viudE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=M9a95jht; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="M9a95jht"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmlk/MFwDucMT4XQfCP8HavRWs4qjnIdLZgUf/ledLdz72Z6aXqMLfsJtLLq3OzXKKZusuqgj069HDsp3D/UuistslCt51lWbuTVcZr4Z/wHUOLBqiY6c7YGiMe2Xh6BoEB/cg9f01tz9kUu8tBoiyMfKZ9aRiUO0CvMPGWKuEU9FG3T6d1vnJUmevGkS34dYpSFhtfvruRg6oOXpbu1rqdsNPy2cZdTLbgV+n+iwDNj8knZF7usb7022Plz+u5yCEO2a/Qyn2/Ob9ls1DvziSoFJsd4wFQz61fLbtQ1IIar6VrUcr4KckM8xwtmLGHB+wx2VlhJu6QxSAqunJNJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDZ2f8LZ5JLarjwyYD22Tol4ancepWqplUY4Hkg8wXg=;
 b=sPzt6R2Fifay/kbqGrteEncjrwqcdxxYTtHEUGqiSciED0Rb681JTYDkc02DrX0JKqmTnfFy6MCVbzbDllsohO+aPjChSDp1m2d3qt+J5tq2qOQsUT2DTt55Kfh6zfR/p6yHOzg4NaiGOWsdD6+7GCOqV6teB1OIBzYMWfjBBEdl5dJB8Ar8jcNcHq87UKbahsf3ze7wfYuDSK/mjGcCMGiCuz0HguJBwzrTslsRe9kYhmR0L/4K8teLcBBU46ka7r6qbvD+inCjkK0Sv+E0wHWEUT7jIRFPCtEYO5n2RYMfFirJSiww5GhK4u1A9vPQxftZOZtUks8LiGOYsZBVRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDZ2f8LZ5JLarjwyYD22Tol4ancepWqplUY4Hkg8wXg=;
 b=M9a95jhtiWpz77S3gKYQ67qjL7DxO0QVaFOOtwhf7ymV7/crheGeDdZ+RYvqELspiZMGgEi//iESlxXeVn3JX7PtyZlZH1xMpJI6g3r8kYxwfIMcTqMa0tRC29JXT6nTW7P6L2tyxC/wL8I3MRI+4Z59jDq5F2fIYlUDuOT7RuclkIcAWX65Boc+T5hjxH/aNvRdKRaO+cftB/Y+YykfHEdQji1qHMwIl8CC8kDppIQBiBC/h+SX7eVqKxNDxagvfakCjdOiHdQdkcfKErZM7n220LayFqnixbstQ4a6BIhh/0xGxCK/56GWxCxxvshz1sLZLg+S88aDt00r101Dow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:39 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:39 +0000
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
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 08/37] dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio default pins as gpio and pwm
Date: Fri,  7 Aug 2026 01:05:46 +0300
Message-ID: <20260806220615.4078303-9-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a008d4-9594-4e12-1a1d-08def406fd80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	G5sp+QeAt4EU4xRrBONLl4shC8Y9X2RmZ5UxHVVac7BJM3wn+ycbhJtRphx7t4f83pR4Snt4FUMthtvRiGOsozY3nz2MIxR+o1rnC4zDgyT8fKaywW2S6Snd+83zHwqLqV53ittAMeuHHiltyimtomdCONrqX0ovbQqCE89DIUglq0xgHvQX+OaE5w7bdSZxcQbUL+edSXuOTDTtNV7kSKAfKt67gcLqh65o36/MscZHp+ezPFPc2GXUM5G+ix2+IbxLZ4/AkvnxPLidrySMKf7hEa6QaTAL4zan+9yr6hX/zk0+vgugL4nO5iC7YL0bSzzEJjklrg48OnLUQOYZOQHDrFuiyLZwd7gHBmrzYRB6aGqxub7Hxm3g/h9DscJvZGSs7+563zfS7v2k1m+6L5DbpVlsVOTBUlsoHf8a4O7y3NYOa8ahcoDocq0/5RWKBf1caWQDfmHIS8T0l6z81ucWYw4bOiOlnieuhHWi7ApjL9EkjKXoZuZVa0BztZn+EczCK55RAZp5Us1fWNZ8YgW0KUiWOZ506+zY/YQSFI+BhNIbmnAYdVeN3qvLfvC+22gHdelJkbTLi/8CgM19GcngBjbHtFJ2su31g5ehpLuv9bCqvkiQ+bDfcbmMcVtIk314f1FxSSFgbqzCn2t0ctEXI1x7J8EzoP2FMJYhjLzvSrU1J16L8Vzq74V7KWtUSy1aH7xvuabxCmvpzXDXNlLjz+1+s9lNLIO1uZBhvTmWehlhhZi7J8Cemg0SFCeh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GTTbd2SmpoFTJ+E+hH7iK1h26kOqA3g/kL0xVeK/ehIYRZLL4ndSI5b5JmWU?=
 =?us-ascii?Q?M+fSnX3HvDO6Ihk51Smn3+UGOiKJjSgfL4z8J2WAD/1oCgLfqWeK8NIzPPMM?=
 =?us-ascii?Q?xr0a/QhwZzlBiciicRvMbedCMa100M+CM1YGc6zuwSJujyYR0TIGvp7zb408?=
 =?us-ascii?Q?iHi9Fhwt75h9JMp2nHCjgWpem3vrKat8hIHpWf4KUPW/fXPv90JQkoW8J0lk?=
 =?us-ascii?Q?Cfk0rbCj/YSGleAMjbGqY/rkSb81zM8LO/txhHeAJA3Py6tdPwyLHsn5hbz5?=
 =?us-ascii?Q?AO/xYXWladFhVXT+CVnunSP3LAagJeXxaKCxmiinrdjJ3Nvc6qro0iayoYLh?=
 =?us-ascii?Q?GYsSAtU6NWr7PuucKGS+rqNIYEWs2NQ2zbhPpMdYe2fi/rUeZ2HKMUfpe6nm?=
 =?us-ascii?Q?4HLWdxDYEQ0hCh9dx20vw12dsmlU+nSXjTubMaq0JUihlDW9CXH+KGPUVsjx?=
 =?us-ascii?Q?6R7wGTHql+ZYIm1mFRAulelLi4Z/KFPo8356u85IuTolTRJRFLR0QO4XUSpt?=
 =?us-ascii?Q?fMjJgE0sO39pWmV8JEzdS1mpUyDPfGvXFcRQlVsROvw50ki7Ks5tl6E2Hgmk?=
 =?us-ascii?Q?jMK2pdOzlXxsbz/IV2uphDsDn60vJl08t0DPo7q/m9ynOjW5ckLHd51NNI18?=
 =?us-ascii?Q?4a4MppCz43o9mDiuLhgRM9L8nGpohEjG/Ind622XAVWlEqB7hj9a3i+5yizO?=
 =?us-ascii?Q?wXeMAvKdJSrr7WLvErG8H8HGt3ZA+iEzVWeHRwJDLl+mI7MrV53aqnZHKAPS?=
 =?us-ascii?Q?Sm02KXR2vhZRhZWm50w8xDVHMyl4vEU/hPBWsBT99Xlxd98StY7HyqRlMqzd?=
 =?us-ascii?Q?x3IkfFwDXEUwWDM0glCGQ7Gi1gCHq52lmte5+7+FSLQHv++Ly/rBF7iSHt4+?=
 =?us-ascii?Q?H9nGwRZ/617wY0wyNqcgspT+u3DVpNs/BZVmveiv+FT+pC/fVRBsVxtARzoM?=
 =?us-ascii?Q?H+AMKW7oZ8EXCAE+SYiGMqE6YB1G8mzrKW2sIezY90x7qJmwZYsZR2gnOSb+?=
 =?us-ascii?Q?kwyLFg3Zv0vZUfZx/Jlryt6ZqCEpHfP5LVvBrRbWOOKqgwcOeHG4JkLub8/T?=
 =?us-ascii?Q?RPtS62fTH75RHPVrvAMSnxzWnd4Gec4znMk9Hi6WLUtHsisxSipbZ8zbLX8T?=
 =?us-ascii?Q?oM7VPjCZeajlMb873wpPS1ZfK1aZrYtwFZEfnxK6hG8S8B5FoP6XvUampeWk?=
 =?us-ascii?Q?2Wm3/H7JGkxbMTr1v6oOqouEN7sogcoQQmTiWHYXY7eklZj/MitmyCFIf5M6?=
 =?us-ascii?Q?pEq7DY7+WNcp6ADDu6I9EfrAFid/yGXeCz/FI4wvTpBL7ibLFZ+li51UIgII?=
 =?us-ascii?Q?1r7TBG9kVajMZXBTIllM0clGKh27Gv+k+vcn82yOiX50fK/nusjlAqfi4SY7?=
 =?us-ascii?Q?taChbDdhIAQFTePlM8Tose3l7Uy5h0Qk2wJrUazDI57c3Lpw6kUbjan+8aDM?=
 =?us-ascii?Q?uVoWVnuYxtnYwpjJk0P7Pu6axCMn4rfag5CMu7Bh4Bg3KQTVrXQ3lEVnghcR?=
 =?us-ascii?Q?e9fgNK5IRd2ypEVW4VTYl90XKuzEMZWowOdcIw5st6Qr1tjHdI6pogfSY4a1?=
 =?us-ascii?Q?G5RCWrXQJYxWYGWo4qL7RHz1yfQP+iZ0evZSlYlTq80a9jEw62sIoKbcB34t?=
 =?us-ascii?Q?obvK8k3eXnSi6IsO+MIJoOt7XiHLseBRw66NkdKBuAw7/ohBiaoaJm/QJg4F?=
 =?us-ascii?Q?Ah4iolawjNk7SICI16rwH2b2Eq8Wl/yaBlVhQ3H5rGsVgigaB74WNlJL2cIH?=
 =?us-ascii?Q?nldhpr9VVhrIOyO1E+pWQPSLjAo4DL4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a008d4-9594-4e12-1a1d-08def406fd80
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:39.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbbbzGjP+FVuK076CEZ4anwZ/MGPpgRc7DbGqYSxsHDxdsGZw0wHVlV9xRE9AGbeKRTHjCmEi8PhMFFbVqICdk+CTUMyYeCfYPNDx18WJuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

Some AN7583 pins have non-gpio default settings. This patch provides a way
to configure such pins as GPIO or PWM. Also add gpio-range property in the
dts example.

Please note that gpio52 pin can't be configured as PWM pin.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml  | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index f52802a3ad79d..3e680c997fe26 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -177,6 +177,16 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
+                         gpio45, gpio46, gpio47, gpio48, gpio49, gpio50,
+                         gpio51, gpio52]
           - if:
               properties:
                 function:
@@ -199,7 +209,7 @@ patternProperties:
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
                          gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
-                         gpio48]
+                         gpio48, gpio49, gpio50, gpio51]
           - if:
               properties:
                 function:
@@ -337,6 +347,8 @@ examples:
       interrupt-controller;
       #interrupt-cells = <2>;
 
+      gpio-ranges = <&pinctrl 0 2 53>;
+
       pcie1-rst-pins {
         conf {
           pins = "pcie_reset1";
-- 
2.53.0

