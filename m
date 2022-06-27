Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CA5C433EF
	for <linux-gpio@archiver.kernel.org>; Mon, 27 Jun 2022 17:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbiF0RcT (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 27 Jun 2022 13:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbiF0RcS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 13:32:18 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0686153;
        Mon, 27 Jun 2022 10:32:16 -0700 (PDT)
Received: from notapiano.myfiosgateway.com (unknown [194.36.25.20])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C504660163E;
        Mon, 27 Jun 2022 18:32:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656351135;
        bh=pmO4Ykqu/l20TUXuLhKhk6GbE3MTS3qlWrVbXnn/+6U=;
        h=From:To:Cc:Subject:Date:From;
        b=g/nB/8IAeor6UrcJ/kdz+O718V+XFBHN9Zq3n8MTcJdc8FRc5LcQ6SWSxfipd22Me
         paFkUhw9ToV3wCp9P+PIBY91UjrQCPMr5ksUMPO+ra5sTUdybdVNEV4a3fNQcrpHy1
         dN7I6+iYlLzslQKvfNRclWUjNkIcrJmjXB8nx/77mi3ZbcC88/wHEXv2KKM0cEHJKq
         oBLOIVk6hln1mQOxKF9PGN3+nVzfTm6qNVjNQvNde8S9l+bcOIqw1Zj8xZN6JPyIgD
         kgO7jphOwrI2a5BJMlzFfeNSPAcBNhsRU4OwGmtNv/bz9eXG++K+J0ExqnZ0/k7PsG
         dhwWV56rPC4Og==
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: mt8192: Add RSEL values to bias-pull-{up,down}
Date:   Mon, 27 Jun 2022 13:32:08 -0400
Message-Id: <20220627173209.604400-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit fe44e4984018 ("pinctrl: mediatek: add rsel setting on mt8192")
added RSEL bias type definition for some pins on mt8192. In order to be
able to configure the bias on those pins, add the RSEL values in the
bias-pull-up and bias-pull-down properties in the binding.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../devicetree/bindings/pinctrl/pinctrl-mt8192.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
index e39f5893bf16..e0e943e5b874 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
@@ -90,6 +90,9 @@ patternProperties:
               - enum: [100, 101, 102, 103]
                 description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
                   defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203]
+                description: RSEL pull down type. See MTK_PULL_SET_RSEL_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
 
           bias-pull-up:
             oneOf:
@@ -98,6 +101,9 @@ patternProperties:
               - enum: [100, 101, 102, 103]
                 description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
                   defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203]
+                description: RSEL pull up type. See MTK_PULL_SET_RSEL_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
 
           bias-disable: true
 
-- 
2.36.1

