Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAC0C6FA83
	for <linux-gpio@archiver.kernel.org>; Tue, 27 Sep 2022 17:38:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbiI0RiL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 27 Sep 2022 13:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbiI0Rhv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 13:37:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FF41D35BB
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:37:47 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id k10so16789426lfm.4
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vNG4GFYOyMZYbc+jKx0tALJsbLNDTZON3pUsUF82eUM=;
        b=wxf0tbLQ6jIwn/jH0ZxPwoIGk8LSN1w/QHYQjJpUfjUX6fx5eWSn9rtCl/Z2O26ayB
         Xh5dENnTec8cxquS0p/u5B9/sQ3/ol+zFt25cWNHY9Gakafzb9iQsxFPAIRoGvgWxm+c
         yY1jxSwarX0xpUKWUlDuhc4pK5wdJPo5zRc6UHNWG8nvnGr/qJnu4AfrV6g//j7v0i1J
         WFVilfE8Nstw4MplqDTiP5uPD5rj1If2nGgJSKMGSU04Xd5GTqCxhMQ/h56jBykur71j
         ju6qQ3Jr42Jesen+0ZzcFNLkpTLC8uTnx9DE7yLqTWGm6wS8txwY/dIc/x0Ds/IlnvK+
         32FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vNG4GFYOyMZYbc+jKx0tALJsbLNDTZON3pUsUF82eUM=;
        b=nQKTiEZbijIzsMkXV41f6xjQL3Yx9evlIXbZTqH12Hj9BVdTFCQlCMEgNktUqUudQE
         R5CPzVrEcwHKTHA19DtCg5tz0UlSt4qqt+Xeq+aPzG7qeDQRTWfvWGF+nheBvREto52y
         pxqijQT0Dk9nwYV24Q+0r9ByijlPXYkd1etxDpicBv3uvX0lVpTkaoxHptXP4YzKCYxm
         UM1WcNw7NpxDz3RE0W/XEZVeFSKLBAWxzScTGz+zWvVKilLbEkDkLtlYjiWmtxzwDqve
         d7iql21P1H7SEU6m6r2p7HsNO7ApP3UV5SLPo0CkzHURS7WzrGFwi4F61F8em4ou/sQh
         yf5w==
X-Gm-Message-State: ACrzQf23KYLGFL/Ex46ccd5yd/2JTSR+z4uI3f5dbJgAA1BdNxe/y5jH
        QD9FOsOZFR1+cPah2Vaitq/xqA==
X-Google-Smtp-Source: AMsMyM7cSK0KTT3e52vosNnCkgmd3vFc1g8GePRWvtQ3WBE+YJxlZ1ES3MFXaGKHNwUQlFS93y2hNA==
X-Received: by 2002:ac2:4c30:0:b0:49f:53dc:324d with SMTP id u16-20020ac24c30000000b0049f53dc324dmr11961235lfq.395.1664300265372;
        Tue, 27 Sep 2022 10:37:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:37:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 07/34] dt-bindings: pinctrl: qcom,tlmm-common: add common check for function
Date:   Tue, 27 Sep 2022 19:36:35 +0200
Message-Id: <20220927173702.5200-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Certain pins, like SDcard related, do not have functions and such should
not be required.  Add a check for this in common Qualcomm TLMM pin
controller schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../bindings/pinctrl/qcom,tlmm-common.yaml    | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index c88c8dcb69d9..e1354f0c64f8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -65,10 +65,6 @@ additionalProperties: true
 
 $defs:
   qcom-tlmm-state:
-    allOf:
-      - $ref: pincfg-node.yaml#
-      - $ref: pinmux-node.yaml#
-
     properties:
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
@@ -82,5 +78,21 @@ $defs:
       output-high: true
       output-low: true
 
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+      - if:
+          properties:
+            pins:
+              items:
+                pattern: "^gpio"
+        then:
+          required:
+            - function
+        else:
+          properties:
+            function: false
+
     additionalProperties: true
 ...
-- 
2.34.1

