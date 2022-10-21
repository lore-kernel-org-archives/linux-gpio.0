Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078A2C433FE
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Oct 2022 17:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJURVA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 Oct 2022 13:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiJURUl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 13:20:41 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F211C1B2B8D;
        Fri, 21 Oct 2022 10:20:20 -0700 (PDT)
Received: from jupiter.universe (dyndsl-037-138-189-087.ewe-ip-backbone.de [37.138.189.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C04B566023A4;
        Fri, 21 Oct 2022 18:20:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666372816;
        bh=zSCt5midhUrfQM0L1c3hkIuUzz9cCV51sQyBcAqxLh8=;
        h=From:To:Cc:Subject:Date:From;
        b=oVSzQdXbdufPEEI6RPZbcHuF0Yc+mTw/9YLTbmcEXZMMXe7S/vi1vqNXQqpxGg2mJ
         a0w/1IilxWQG4V26xB9KC8uazzH75uL+VjmgZMdefu/TTeNOzaPfrSqBPeQ3hsQd1f
         UGmKs+iaQUXqQhA1W96k1/lOmYYhMk58e8M7g34uU5KWAh6MdDkOhbM8mPiffBDF2e
         eyOkscKNxUg4Qg9XAXY34gEDl2YI96ikTOwmbJAqSCdRhlYY4XwUYlOtlmbvxZFmcH
         5e6MNB9n8vMBxqD3CO/yYwNEwEtdlvin0D9c4Wup65LR7TfhYxViCJoRb9/lZ0bFOO
         9dMwj/8nHuwJw==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 16A6A48082E; Fri, 21 Oct 2022 19:20:14 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCH 1/1] dt-bindings: pinctrl: rockchip: further increase max amount of device functions
Date:   Fri, 21 Oct 2022 19:20:12 +0200
Message-Id: <20221021172012.87954-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Apparently RK3588 pinctrl has 13 different device functions, but dt-validate
only checks for pin configuration being referenced so I did not notice.

Fixes: ed1f77b78322 ("dt-bindings: pinctrl: rockchip: increase max amount of device functions")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index b486f41df65f..d6539723f354 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -132,7 +132,7 @@ additionalProperties:
               description:
                 Pin bank index.
             - minimum: 0
-              maximum: 10
+              maximum: 13
               description:
                 Mux 0 means GPIO and mux 1 to N means
                 the specific device function.
-- 
2.35.1

