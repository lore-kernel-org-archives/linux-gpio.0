Return-Path: <SRS0=9dBB=UZ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FB7C48BD3
	for <linux-gpio@archiver.kernel.org>; Wed, 26 Jun 2019 09:07:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AE7B20659
	for <linux-gpio@archiver.kernel.org>; Wed, 26 Jun 2019 09:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iGiWLvlF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbfFZJHY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 26 Jun 2019 05:07:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46042 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfFZJGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:06:49 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so1746100wre.12
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eF8xBGeTljvvRz8oIGPjn0ZgbNxxAvWP0tXIK0uht64=;
        b=iGiWLvlF9SZhluA3F+KAM2/tCHwVb25WwE0mD4s7gqR2aS8FzItv4qoTJ8Iao5iq48
         JaGcJ1DCcq6Q5eL1kVo0OYiG0qZGnLj3xOZOmOW6559WsqekGnFnpodwwgfq7cvmeO5G
         ycFBGVOMHZCGZCe7wrm9mJgOtzcTwg7RneAEhQ1Z6oFfDyPL0bNHHTYbYOxgcukStIua
         7DXFslAO7UTuzF7RjMKOalwvB9PjrMAWzM9dCIfNr12ASjR7BRvyQl5nXcdOMoy5i9xH
         /BgNivTRdSxu4JrnIBNLYf/tg5kZF415nAXXk5+id6Km+clLGLeqUId6zbOyhS+En46P
         yvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eF8xBGeTljvvRz8oIGPjn0ZgbNxxAvWP0tXIK0uht64=;
        b=lXMc9rNnvj3ROBofiYq/uDv6sjmPos7VLFITp6zzMJsCyEwEVididFaYHeSymd+Zlx
         BMl23eZ2Q9+7e3AkGrn9W346rjaYjd35vnoO0cNGloXurchCtpTf5WngxLL8njSKY4cE
         FEyI5uHhEEDeQdJwrY0gc1blbFTOSNO36uzRykHbjpEiS8Sl4z/qLKqBZ4K614QLzIY5
         rP4yWjWRx7Wo8WX/Q8fSGKl9bwvtMsGVFD3/E8FHskE9CCsKIiP7hDKIiQDL7VSd24FE
         Y6NyWQPD8RNTFVxlsIn5IaVToPt0pmxkgImHxaUmtEg+CIGEfQDNx69Ihcb4gHDVdjOe
         14qQ==
X-Gm-Message-State: APjAAAUwI86PQw1K2AJ9k/vY2oaTouDso2LdmUBnZ3DqWHliUg4LwsUF
        fZobFJQzuBgMGV44LJ0pnX5rjw==
X-Google-Smtp-Source: APXvYqxGIbGVdH3JbhRFGsnQlF9QaGYIVNAf55TKRRbU5nT1JyjtgKrrXt4UH6i4OZuMmo0ITXSpgw==
X-Received: by 2002:adf:81c9:: with SMTP id 67mr2686925wra.62.1561540007306;
        Wed, 26 Jun 2019 02:06:47 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:46 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 10/14] arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
Date:   Wed, 26 Jun 2019 11:06:28 +0200
Message-Id: <20190626090632.7540-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the ao_pinctrl subnode for the pwm_a function on GPIOE_2.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 2baa04303762..76484801478d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1984,6 +1984,14 @@
 						};
 					};
 
+					pwm_a_e_pins: pwm-a-e {
+						mux {
+							groups = "pwm_a_e";
+							function = "pwm_a_e";
+							bias-disable;
+						};
+					};
+
 					pwm_ao_a_pins: pwm-ao-a {
 						mux {
 							groups = "pwm_ao_a";
-- 
2.21.0

