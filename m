Return-Path: <SRS0=Fr9z=DK=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2230C4363D
	for <linux-gpio@archiver.kernel.org>; Sat,  3 Oct 2020 10:33:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81E44206F8
	for <linux-gpio@archiver.kernel.org>; Sat,  3 Oct 2020 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601721226;
	bh=rB8xq/M+Sn+CR3KktzhPZaVmPVTAjNlwif1rBofVHoo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=NHbINIYZ5FkEhzd9Cl392KwT1svVE1Qk320lKzkKweLKFqX2+TOuP8GD+n1wystuJ
	 idSIxvRQ0C2AHOD1Qgg3gY7RoK/TP5/xE7o+YsQoBfEv0cFa+MP1pT5SE7TiKOlcam
	 +NzsNbi9uYgcHznw0Zlo9IvI1eO601trlxL9D1PM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgJCKdp (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 3 Oct 2020 06:33:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:34396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgJCKdp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 3 Oct 2020 06:33:45 -0400
Received: from localhost.localdomain (unknown [194.230.155.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB7A9206CA;
        Sat,  3 Oct 2020 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601721225;
        bh=rB8xq/M+Sn+CR3KktzhPZaVmPVTAjNlwif1rBofVHoo=;
        h=From:To:Cc:Subject:Date:From;
        b=bde6OJ8BraCW7MCYqx4P/fk5IIvKpzKYGCRfivd+5znh17C0indUxv3NDsohmJl6h
         V0IP1Ktnm5r9ol/lxxiI5ngpnKS54M5j3E0LRdBYijD0W6cQ0ERZ00XLX64Ks1rwFS
         G5eAuXckSOJwO8t74cJ/L1WcLE261O2553CX/Q4s=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] dt-bindings: vendor-prefixes: favor "gateworks" over "gw"
Date:   Sat,  3 Oct 2020 12:33:35 +0200
Message-Id: <20201003103335.23404-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are two vendor prefixes for Gateworks: "gw" and "gateworks".
Favor the longer one (more descriptive) and mark "gw" as deprecated so
it will not be used in new bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

"gw" is still used in multiple DTS and bindings. I could fix them up as
well, although maybe this is unnecessary churn and compatibility
breakage.
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e7f0f7dec193..cd940d0680d4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -431,6 +431,8 @@ patternProperties:
     description: Gumstix, Inc.
   "^gw,.*":
     description: Gateworks Corporation
+                 use "gateworks" vendor prefix
+    deprecated: true
   "^hannstar,.*":
     description: HannStar Display Corporation
   "^haoyu,.*":
-- 
2.17.1

