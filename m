Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FE5C4743F
	for <linux-gpio@archiver.kernel.org>; Mon,  7 Jun 2021 12:34:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A494A611C0
	for <linux-gpio@archiver.kernel.org>; Mon,  7 Jun 2021 12:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhFGMgg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 7 Jun 2021 08:36:36 -0400
Received: from mail-ej1-f42.google.com ([209.85.218.42]:44553 "EHLO
        mail-ej1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbhFGMgf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 08:36:35 -0400
Received: by mail-ej1-f42.google.com with SMTP id c10so26331112eja.11
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qNm0L7495enYGVyN6i9GOiHWW+ICwARAIgvoyqcqdYI=;
        b=OQYSaQqXwFwjBs/3D1EGSetIjOBwMOch38hL0WOEMJ6jZG//28XSRM07Fb6G0Q86Rx
         zS5Qt7BACU+QNav2yGnX0Pn03X3vKT16PhJRxjNdWRMUBoaE1l2XFBlnAhjg/jA5Ue7D
         ciS8urjfpFjumqHFQeRpNqeXKKhJr9QaAvSjXIncczqcTjvDeub3ronZMiT/drto0r4K
         sfT9kho4nQ/bItMXrVWxzjvUl6qn/GBR/moOItP0k+dyPXnSy93LxDkKFZW2/m18OYNU
         G3AtoFRKyImxi/pwgDCy88vm3lWsRiIGn/1qAkquKDrDCG/v9GvjePKPvPmjxCoNQTIc
         kibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qNm0L7495enYGVyN6i9GOiHWW+ICwARAIgvoyqcqdYI=;
        b=sAqcIuCh0EUwZn7soWbc+fTskUHnQLzF6Qks9CdUe0qFT1EgYZ8eMEoCozm5nYCGp5
         +k0zSWTBQ2+dKZedK8cwQEtoV6pIC8D19yNN18hKHl6uF3wK/AvhPiCKNrXgTy/qCWfI
         h/EaDvBHiwerKx6toL6uTkV3n46M1M2jjRvi2fqKE9oRBLxeVFiITPjV74ZLWmq3cqX8
         DlSku3WR7qha9T+EaX+sFQeW1vcGkBb3IueTKSpABT8XhOWwIkSXjjg+wAwO4uggK644
         kykzEliA6vNGTUW3FQjPjfPrNlJWcnabu8z01NzivcgH75Qs/fvILXqZw26TiBjXPRsx
         vArw==
X-Gm-Message-State: AOAM533r0txOinXGCsh3rmyudkOiUj7EkyaTs3BKbhdHsFkawDJewAzb
        AYXnSieqzC6BNjnW0PgkDsADeg==
X-Google-Smtp-Source: ABdhPJylM2rQyHmH0zgPyfXgBHvJ17EGUPAYdH2/t597V80COMGmmaizPlRbMRvvZR0iwp+ru0Qv+w==
X-Received: by 2002:a17:906:4ad2:: with SMTP id u18mr2946329ejt.197.1623069210322;
        Mon, 07 Jun 2021 05:33:30 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id f18sm6471000ejz.119.2021.06.07.05.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 05:33:28 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v6 3/6] dt-bindings: reset: Add Delta TN48M
Date:   Mon,  7 Jun 2021 14:33:14 +0200
Message-Id: <20210607123317.3242031-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607123317.3242031-1-robert.marko@sartura.hr>
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add header for the Delta TN48M CPLD provided
resets.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 include/dt-bindings/reset/delta,tn48m-reset.h | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/reset/delta,tn48m-reset.h

diff --git a/include/dt-bindings/reset/delta,tn48m-reset.h b/include/dt-bindings/reset/delta,tn48m-reset.h
new file mode 100644
index 000000000000..d4e9ed12de3e
--- /dev/null
+++ b/include/dt-bindings/reset/delta,tn48m-reset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Delta TN48M CPLD GPIO driver
+ *
+ * Copyright (C) 2021 Sartura Ltd.
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ */
+
+#ifndef _DT_BINDINGS_RESET_TN48M_H
+#define _DT_BINDINGS_RESET_TN48M_H
+
+#define CPU_88F7040_RESET	0
+#define CPU_88F6820_RESET	1
+#define MAC_98DX3265_RESET	2
+#define PHY_88E1680_RESET	3
+#define PHY_88E1512_RESET	4
+#define POE_RESET		5
+
+#endif /* _DT_BINDINGS_RESET_TN48M_H */
-- 
2.31.1

