Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B33ECAAD1
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Sep 2022 01:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbiIABaT (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 Aug 2022 21:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbiIAB3z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 21:29:55 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF955593
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 18:29:49 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 843FD9004B9;
        Thu,  1 Sep 2022 09:29:46 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 1/2] dt-bindings: gpio: rockchip: add clock-names
Date:   Thu,  1 Sep 2022 09:29:40 +0800
Message-Id: <20220901012944.2634398-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901012944.2634398-1-jay.xu@rock-chips.com>
References: <20220901012944.2634398-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHh5KVkIaSEIaTBpDS00fSVUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCI6PCo6FD0wDU0UCw43Fhg3
        PUlPChhVSlVKTU1KQkJOTENMS0JPVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUlJQ003Bg++
X-HM-Tid: 0a82f6ab21d22eafkusn843fd9004b9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add 'clock-names' to the gpio dt node. so the driver could get clocks by
a const char id, this patch names the clock-names as
  - 'bus': the apb clock for cpu to access the gpio controller
  - 'db': the debounce clock for cpu to set debounce clock rate

Since the old dt nodes may have no clock-names, this patch not make them
as part of 'required properties'.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index affd823c881d..d43d4c71bebf 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -27,6 +27,12 @@ properties:
       - description: APB interface clock source
       - description: GPIO debounce reference clock source
 
+  clock-names:
+    minItems: 1
+    items:
+      - const: bus
+      - const: db
+
   gpio-ranges: true
 
   gpio-controller: true
-- 
2.25.1

