Return-Path: <SRS0=d2O3=CJ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3F2C433E6
	for <linux-gpio@archiver.kernel.org>; Mon, 31 Aug 2020 08:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AF05206F0
	for <linux-gpio@archiver.kernel.org>; Mon, 31 Aug 2020 08:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgHaILV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 31 Aug 2020 04:11:21 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:45726 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgHaILT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 04:11:19 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07V8Anaa026093; Mon, 31 Aug 2020 17:10:49 +0900
X-Iguazu-Qid: 34tMSeeoT6LWB7dLp2
X-Iguazu-QSIG: v=2; s=0; t=1598861449; q=34tMSeeoT6LWB7dLp2; m=SwnEliT/mGW+5LHUdHQapBDzMG8GTA6CYpQgCtZKTK0=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 07V8AleF023440;
        Mon, 31 Aug 2020 17:10:47 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 07V8Al5f025512;
        Mon, 31 Aug 2020 17:10:47 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 07V8Ak15026353;
        Mon, 31 Aug 2020 17:10:46 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 4/8] dt-bindings: arm: toshiba: Add the TMPV7708 RM main board
Date:   Mon, 31 Aug 2020 17:10:21 +0900
X-TSB-HOP: ON
Message-Id: <20200831081025.2721320-5-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add an entry for the Toshiba Visconti TMPV7708 RM main board
(tmpv7708-rm-mbrc) to the board/SoC bindings.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 Documentation/devicetree/bindings/arm/toshiba.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/toshiba.yaml b/Documentation/devicetree/bindings/arm/toshiba.yaml
index efd3f4859669..0e066290238e 100644
--- a/Documentation/devicetree/bindings/arm/toshiba.yaml
+++ b/Documentation/devicetree/bindings/arm/toshiba.yaml
@@ -16,5 +16,7 @@ properties:
     oneOf:
       - description: Visconti5 TMPV7708
         items:
+          - enum:
+              - toshiba,tmpv7708-rm-mbrc  # TMPV7708 RM main board
           - const: toshiba,tmpv7708
 ...
-- 
2.27.0

