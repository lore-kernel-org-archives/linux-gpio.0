Return-Path: <SRS0=YsKQ=C2=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947ACC43461
	for <linux-gpio@archiver.kernel.org>; Thu, 17 Sep 2020 13:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2825E21582
	for <linux-gpio@archiver.kernel.org>; Thu, 17 Sep 2020 13:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="r9JnsUof"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgIQNp4 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:45:56 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:5807 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgIQNdX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 09:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1600349603; x=1631885603;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HxSFzUCGBsF4A2KDb1d4ifpGOAT4f+Fk37BYb+VSpBs=;
  b=r9JnsUofXbtN3EcGuW9SG5HFu02id+CUilSG/dzyN213fF9vYo0Jiouf
   H22n93pokFCgTBW2DwObI4HPOcutQ8ilzfmaePCd43Wd1o23r+2bupQrI
   +w4Sx6HmyhFh0jObRaovjY5upVb+fity7ndSih0+QP0d009QNd5nGV6T1
   uT0x09EpAsMlie+t/+WElUPAOvNjUWOA5I8ABvQ15hrjGxr5TeIuXtUpr
   NSwkfS5QTZIdor/7bRZvfyR7Au6EbUCuvyXm/r0Uw039hfO/5hb4p2MBz
   LXgeDj8bU8RN4+nTZRv52F8BXh/qzgYgFg7d6SpsmjiwM4AAFwP/PWToc
   g==;
IronPort-SDR: sX4aKHkWXR+Z5cgGEmC5YiauNPL8CljU8QeVSWPxPnuHJlQUOkvXA5QfSE1cxt4W+N2W9MOgRc
 YRET/6skfcHiNViLSI79owNwygRq5JbgU3+/Z5w1MDjQRsDc7zxeCrrYQAQNzgpz24yWaVRsGJ
 J1HdypynBo4VdcQgBnzYHiWO2yhviLKCVw76qBbldEVvVkNpMjRiXQT9bZD6uejO2Hr43I1zYD
 luWAK1daoWueJ1B8s57SWx5o2o3c8dS1HUlMXNF7KaDMjFc2559v08H/uv+qBTHOrRtHiyl19n
 1TA=
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="92175715"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Sep 2020 06:13:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 06:12:53 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 17 Sep 2020 06:13:11 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: at91-pio4: add microchip,sama7g5
Date:   Thu, 17 Sep 2020 16:12:56 +0300
Message-ID: <20200917131257.273882-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for microchip sama7g5 SoC.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
index 04d16fb69eb7..265015bc0603 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
@@ -4,7 +4,9 @@ The Atmel PIO4 controller is used to select the function of a pin and to
 configure it.
 
 Required properties:
-- compatible: "atmel,sama5d2-pinctrl".
+- compatible:
+	"atmel,sama5d2-pinctrl"
+	"microchip,sama7g5-pinctrl"
 - reg: base address and length of the PIO controller.
 - interrupts: interrupt outputs from the controller, one for each bank.
 - interrupt-controller: mark the device node as an interrupt controller.
-- 
2.25.1

