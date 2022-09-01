Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F78ECAAD1
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Sep 2022 01:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiIABaW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 Aug 2022 21:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbiIABaB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 21:30:01 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B65722B26
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 18:29:56 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id E17D79004C5;
        Thu,  1 Sep 2022 09:29:48 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 3/3] dt-bindings: gpio: rockchip,gpio add optional 'gpio-ranges'
Date:   Thu,  1 Sep 2022 09:29:44 +0800
Message-Id: <20220901012944.2634398-6-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901012944.2634398-1-jay.xu@rock-chips.com>
References: <20220901012944.2634398-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxlDVk5KTU9JQxgdTU5DT1UTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSo6Qxw6Vj04N00xSAhIFi4v
        DjoKCQtVSlVKTU1KQkJOTENCTktPVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUlIS0g3Bg++
X-HM-Tid: 0a82f6ab2b1d2eafkusne17d79004c5
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a optional property 'gpio-ranges', such as
    gpio-ranges = <&pinctrl 0 0 32>;

When the gpio nodes are under pinctrl, the property 'gpio-ranges' is
a optional property, but when they are under root node, the property
'gpio-ranges' is a required property.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index d4e42c2b995b..7a075fcea75f 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -49,7 +49,12 @@ required:
   - interrupt-controller
   - "#interrupt-cells"
 
-additionalProperties: false
+additionalProperties: true
+  gpio-ranges:
+    maxItems: 1
+    description: |
+      The property is a optional if gpio node under pinctrl node;
+      but it is a required property if the gpio is under root node.
 
 examples:
   - |
-- 
2.25.1

