Return-Path: <SRS0=N38l=EM=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5BEC55178
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Nov 2020 09:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1F3F221FA
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Nov 2020 09:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgKFJrm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 6 Nov 2020 04:47:42 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:46914 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgKFJrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 04:47:41 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 3B50B3AAA96
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 09:31:52 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 05EF6FF805;
        Fri,  6 Nov 2020 09:31:26 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 2/4] dt-bindings: pinctrl: ocelot: Add Serval SoC support
Date:   Fri,  6 Nov 2020 10:31:16 +0100
Message-Id: <20201106093118.965152-3-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106093118.965152-1-gregory.clement@bootlin.com>
References: <20201106093118.965152-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the documentation for the Microsemi Serval pinmuxing and gpio
controller.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
index 58ea2ae57713..db99bd95d423 100644
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
@@ -3,8 +3,8 @@ Microsemi Ocelot pin controller Device Tree Bindings
 
 Required properties:
  - compatible		: Should be "mscc,ocelot-pinctrl",
-			  "mscc,jaguar2-pinctrl", "microchip,sparx5-pinctrl"
-			  or "mscc,luton-pinctrl"
+			  "mscc,jaguar2-pinctrl", "microchip,sparx5-pinctrl",
+			  "mscc,luton-pinctrl" or "mscc,serval-pinctrl"
  - reg			: Address and length of the register set for the device
  - gpio-controller	: Indicates this device is a GPIO controller
  - #gpio-cells		: Must be 2.
-- 
2.28.0

