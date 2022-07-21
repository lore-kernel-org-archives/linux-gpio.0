Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A1BCCA488
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Jul 2022 09:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiGUJa7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 21 Jul 2022 05:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiGUJa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 05:30:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DDC7FE49;
        Thu, 21 Jul 2022 02:30:57 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bp17so1861786lfb.3;
        Thu, 21 Jul 2022 02:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pbn4iYbqNCz7GfMmDju4Bq3tvwy5gDLpHOUqwybJ02U=;
        b=ndFuWigCiHE1sU0id4oFFGSUalZDq8lWiv7FygDSM6oIKf35zr0tu1sI30oOXo8WMF
         0QMN8KsDN3Xqo1bvRGmMWBcCDSOR2Q9+fgTLFaKOjQqfBSeTGSryr4A1KaYWgBoYaT10
         nHNLdcnA2gKHb8Uw5YnTC7Jxmi5vxHzSGY2OvNVWjuI4j1GIldaXvrXBMQFurozFa9Mc
         +Diq7+XZk0U9FlmNpzDtt62zALqggBFs2t4DsZdJvnvjp5VAYo7KEtpD8wJiT2fZtmHX
         ehOK44cJiOEFMHMU1F1K1SEZfrnyVExsO0EQRUT0GkZFFCGCobv84cawMn4/5mziqJyE
         3mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pbn4iYbqNCz7GfMmDju4Bq3tvwy5gDLpHOUqwybJ02U=;
        b=BJgR5UK2NZ6fy8o0dlLkj88TkZw3n5nhSwCFzrCMm9PaNllswF5PzjzL4iPnrhGhuf
         028mDa+kIPn8tZFe2MPGTQG2fRqPUnY4I7HOT/vGO8h03CGVBSkZ4bCUT39sJV5TEpoY
         rGZcszILo+j6dwPs1fEPmjxVOYfEKYhwDLQQxerRRYgAKqFH+hYJfbPPT+tO/lkT3c5Y
         nED1QH9WnytD7BPQsK9gyIcl2ldc/vVNmEfKeFH1JrjA5/Jbd0x4GpJ9B1Xx579P/dUo
         w3EsPZ2Tp19NN+liVpmTplv9x3b5tboKhWS/dyFDj5hoS8YWZDA5/lup9iRE8gVc8NI+
         xlrw==
X-Gm-Message-State: AJIora8o4Ir+Cro8COUfkmeAqh/Y5tYFnIWfJbGdARdvz2VTZJqO1TBi
        m8Uo3wVMwFay5wROkTegaxY=
X-Google-Smtp-Source: AGRyM1v5P9aY/99EWp7aNwiPSVRLeD4eH/MK9NGEYXVs8AlQFC+VPMrbm0tSISTvKOpf5ttJmpWm0w==
X-Received: by 2002:ac2:4e07:0:b0:48a:18f3:e5fe with SMTP id e7-20020ac24e07000000b0048a18f3e5femr19875756lfr.357.1658395855369;
        Thu, 21 Jul 2022 02:30:55 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com. [82.209.154.112])
        by smtp.gmail.com with ESMTPSA id y30-20020a19915e000000b0047f6b4f82d1sm323055lfj.250.2022.07.21.02.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 02:30:54 -0700 (PDT)
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 2/2] dt-bindings: gpio: fairchild,74hc595: add strobe-gpios property
Date:   Thu, 21 Jul 2022 11:34:22 +0200
Message-Id: <20220721093422.2173982-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721093422.2173982-1-marcus.folkesson@gmail.com>
References: <20220721093422.2173982-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some shift registers (74hc4094 for example) has a strobe signal to latch
data from the serial input to the parallel output.

Add an optional strobe-gpios property to support those chips.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index a99e7842ca17..9893df9ae22c 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - fairchild,74hc595
       - nxp,74lvc594
+      - ti,cd54hc4094
+      - ti,cd74hc4094
 
   reg:
     maxItems: 1
@@ -33,6 +35,10 @@ properties:
     description: GPIO connected to the OE (Output Enable) pin.
     maxItems: 1
 
+  strobe-gpios:
+    description: GPIO connected to the STROBE pin
+    maxItems: 1
+
   spi-max-frequency: true
 
 patternProperties:
-- 
2.36.1

