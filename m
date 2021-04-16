Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD81C001E8
	for <linux-gpio@archiver.kernel.org>; Fri, 16 Apr 2021 16:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D08226113D
	for <linux-gpio@archiver.kernel.org>; Fri, 16 Apr 2021 16:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240578AbhDPQOs (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 16 Apr 2021 12:14:48 -0400
Received: from out28-196.mail.aliyun.com ([115.124.28.196]:38334 "EHLO
        out28-196.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240304AbhDPQOq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Apr 2021 12:14:46 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1400075|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0354381-0.00423112-0.960331;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.K.1zIuN_1618589646;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K.1zIuN_1618589646)
          by smtp.aliyun-inc.com(10.147.42.197);
          Sat, 17 Apr 2021 00:14:17 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        siyanteng@loongson.cn
Subject: [PATCH v5 06/11] dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
Date:   Sat, 17 Apr 2021 00:14:00 +0800
Message-Id: <1618589645-96504-7-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618589645-96504-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1618589645-96504-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the pinctrl bindings for the JZ4730 SoC, the JZ4750 SoC,
the JZ4755 SoC, the JZ4775 SoC and the X2000 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    No change.
    
    v3->v4:
    1.Add a description of JZ4725B.
    2.Add Rob Herring's Reviewed-by.
    
    v4->v5:
    No change.

 .../bindings/pinctrl/ingenic,pinctrl.yaml          | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 44c04d1..a4846d78 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -17,10 +17,12 @@ description: >
   naming scheme "PxN" where x is a character identifying the GPIO port with
   which the pin is associated and N is an integer from 0 to 31 identifying the
   pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
-  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and the X1830
-  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The JZ4760, the
-  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total of 192
-  pins.
+  and PB31 is the last pin in GPIO port B. The JZ4730, the JZ4740, the JZ4725B,
+  the X1000 and the X1830 contains 4 GPIO ports, PA to PD, for a total of 128
+  pins. The X2000 contains 5 GPIO ports, PA to PE, for a total of 160 pins.
+  The JZ4750, the JZ4755 the JZ4760, the JZ4770 and the JZ4780 contains 6 GPIO
+  ports, PA to PF, for a total of 192 pins. The JZ4775 contains 7 GPIO ports,
+  PA to PG, for a total of 224 pins.
 
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
@@ -32,20 +34,28 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - ingenic,jz4730-pinctrl
           - ingenic,jz4740-pinctrl
           - ingenic,jz4725b-pinctrl
+          - ingenic,jz4750-pinctrl
+          - ingenic,jz4755-pinctrl
           - ingenic,jz4760-pinctrl
           - ingenic,jz4770-pinctrl
+          - ingenic,jz4775-pinctrl
           - ingenic,jz4780-pinctrl
           - ingenic,x1000-pinctrl
           - ingenic,x1500-pinctrl
           - ingenic,x1830-pinctrl
+          - ingenic,x2000-pinctrl
       - items:
           - const: ingenic,jz4760b-pinctrl
           - const: ingenic,jz4760-pinctrl
       - items:
           - const: ingenic,x1000e-pinctrl
           - const: ingenic,x1000-pinctrl
+      - items:
+          - const: ingenic,x2000e-pinctrl
+          - const: ingenic,x2000-pinctrl
 
   reg:
     maxItems: 1
@@ -62,14 +72,19 @@ patternProperties:
     properties:
       compatible:
         enum:
+          - ingenic,jz4730-gpio
           - ingenic,jz4740-gpio
           - ingenic,jz4725b-gpio
+          - ingenic,jz4750-gpio
+          - ingenic,jz4755-gpio
           - ingenic,jz4760-gpio
           - ingenic,jz4770-gpio
+          - ingenic,jz4775-gpio
           - ingenic,jz4780-gpio
           - ingenic,x1000-gpio
           - ingenic,x1500-gpio
           - ingenic,x1830-gpio
+          - ingenic,x2000-gpio
 
       reg:
         items:
-- 
2.7.4

