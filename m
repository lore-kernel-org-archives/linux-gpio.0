Return-Path: <SRS0=Gzc7=5Z=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86040C2BB55
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Apr 2020 19:59:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66FF2208E4
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Apr 2020 19:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgDIT7b (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 9 Apr 2020 15:59:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbgDIT7b (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:31 -0400
IronPort-SDR: gnnFFZJquEtQHae3vkpxxboQlCtSYwtq5QdhsSDsCdpov5pNez193mxLXB4QX/ctyXK1srj2AI
 F5ki5/bHdi1A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:31 -0700
IronPort-SDR: G2/Ajg69GcgfbXqhZHW6iacCWEtQftjM4PBIf8MySIWVELQOsp14yx595KU0tR47zClAZh4eKG
 dUqCnwa2wunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745426"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:29 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 16/16] ASoC: dt-bindings: add document for Hifiberry DAC+ PRO clock
Date:   Thu,  9 Apr 2020 14:58:41 -0500
Message-Id: <20200409195841.18901-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Hifiberry DAC+ PRO relies on two local audio oscillators exposed
with the clock framework.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../bindings/sound/hifiberry-dacpro.yaml      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/hifiberry-dacpro.yaml

diff --git a/Documentation/devicetree/bindings/sound/hifiberry-dacpro.yaml b/Documentation/devicetree/bindings/sound/hifiberry-dacpro.yaml
new file mode 100644
index 000000000000..9305a1a0ccd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/hifiberry-dacpro.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/hifiberry-dacpro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hifiberry DAC+ Pro clock driver
+
+maintainers:
+  - Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+
+description: |
+  The Hifiberry DAC+ PRO provides two oscillators for enhanced audio
+  quality. The clk driver allow for select and configuration of the
+  clock source.
+
+properties:
+  "#clock-cells":
+    const: 0
+
+  compatible:
+    items:
+      - const: hifiberry,dacpro-clk
+  reg:
+    maxItems: 1
+
+required:
+  - "#clock-cells"
+  - compatible
+
+examples:
+  - |
+    dacpro_osc: dacpro_osc {
+        compatible = "hifiberry,dacpro-clk";
+        #clock-cells = <0>;
+    };
+
+...
-- 
2.20.1

