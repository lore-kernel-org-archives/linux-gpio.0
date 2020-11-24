Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525FAC64E75
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED1032085B
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YYv6VgaQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgKXEhp (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 23 Nov 2020 23:37:45 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:49765 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbgKXEho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192664; x=1637728664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
  b=YYv6VgaQF4hxxYwClQL2ps9EtsPoh/wU2dF+QkDh14goB1wC5X9fn+bo
   FiF+CCiBLcacfCxYweRMuCqpZdQWEJLXb7bAbtXkkD3C9Sd/agF8sTJA9
   v2pn/t6khnFPdZ6D8ZsKTlAfA1JyX0MEO+moc3E0l1geZe6tKtV1Tysae
   zuj8zYIbSg0U/4dPxoR6Jfh7VdhbyR6yLYmSfS4JxvRXq+tEKCJnvw6r8
   ZaTLQu2f3EuOkUtoOYDFH0kCKlJHX0w1jgyC0xygIpWsDRndgg3qq2wew
   z4sdw49hQGvD2S/Mq9FV6MRHYwBowLT49yy1k4uX6ppI5bFNigiBCL1/b
   w==;
IronPort-SDR: VTDmr12U3F3zO5yLVJMOTcD191/Sq7cgbjKJlsWpqaGsDzFBrBlhkUlHfxuG/yTB5MfWNCmh9O
 P36nXANYnCkGVqjBk8W8ogACxUv5OqGHxEl9ka2Msf4ZNZu5BQ3Y5bHcYk1YY3QGimVXwb3JIQ
 65JseprVoARiChap03BT13fHrx3sm5ElZxKiaum6dLPwptXsyMfkgFOFB0mDk4/Bk2GivyypwH
 usA9znnVLLbsgiSWTsBsv87uaQnhxpBZJ6S8egXayMeA5irPLJPV+xVFp9unETMa819vDoIgJF
 nX0=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498167"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:44 +0800
IronPort-SDR: OAblXXqFvz/N3o06DTp7sOF83kQl4AVpJFMXc3zKbXp7CZHmCiVB48ScPyC+CAOHp+UXH8XT9n
 KmwFbQlvMLQC2hnX5jPq+6cZMXCizBJyI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:28 -0800
IronPort-SDR: KlHslSkjo5In5EB5KF4Ih7Hi5+5wfJxE9x6XT1ldqRLSLbSAG25QV9rP3cWZXwOfGMFfpwrae3
 vNGmyqdBsuEg==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:42 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 06/21] dt-bindings: Add Canaan vendor prefix
Date:   Tue, 24 Nov 2020 13:37:13 +0900
Message-Id: <20201124043728.199852-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a07231aaf3e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -179,6 +179,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^canaan,.*":
+    description: Canaan, Inc.
   "^caninos,.*":
     description: Caninos Loucos Program
   "^capella,.*":
-- 
2.28.0

