Return-Path: <SRS0=VrV0=AV=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4774AC433E4
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jul 2020 23:18:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2035020772
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jul 2020 23:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pz1BOCQB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGJXSf (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 10 Jul 2020 19:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgGJXSf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 19:18:35 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB8EC08C5DC
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 16:18:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u5so3181555pfn.7
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qCGYxi6L0dmDdYzHShkkSHiKc6T34aWWoWuQkkFnaWU=;
        b=Pz1BOCQB0pXjBmo0xAku7n+cwdXdjkY8Qu/3gwY1QOKhNMztkqxXIGamSB0+URD4zJ
         bWGsle4ItBlbOYOFz3XZNcJ+GUr8J7HxfpiuyudOZpOdtLYbAAwglyH0n3zi4kk2nhcS
         mvQ133SopxNOT2bwP33RuYrlCnRwVtE3wmrCetH7/Q9qh0nPSPrysb9a3+/s2XmyxP+Y
         ulNhRUI6X5nAUpZHovYN2PASbHMZkbriStlea5f8FcJEhpZClmWwbmd7xaj0AuMhmyoq
         xQYYHC0uckxurGhu1x+gXqb2mo/0ksmiHT6dXqmO1uiAHdW9omZK3wwUwJpvSjfFFDWf
         mi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qCGYxi6L0dmDdYzHShkkSHiKc6T34aWWoWuQkkFnaWU=;
        b=ABHdBmPFIpe5uXlg9t7mxYchvz+Qio9UKbKQ27/oZQ7ChEVBvdeDRZMe1V3rgUtYje
         sybjjHiGRf11bVxYRDJKVS+R42fD7i8Yzy4dfB9guHZdL0osuDgxP6oV/nUJkA1F1K24
         L2z+1bYE49yIO7TmC82RqHOY4+AL7ThSUpJPggltyTy26KgKP5HsufTLiF74cJxQJgio
         60JLXmTtw9Ze5dW3t/GPtsf68FrzXvcUO8J+WRA46LxWbtouPZXUbw19eefr2xgHWpmN
         A7xnJjXQziV97fxmFiTNX1VEPq1Nlln0vpPh+XTyB1oLSezkAZWcdje3qb51yNqz/NZS
         5wmQ==
X-Gm-Message-State: AOAM533ZpBR+8NXa4xMMsanlji51H/c9Axg5IHNVfcloSTmRW/tINrI5
        0He7CYWYDTmfIWTCftu/NgYY4w==
X-Google-Smtp-Source: ABdhPJxxd7gWIsbfCYIPEz7NG3FjvS01GFW7aSmOlHcok8aGrenQft1MCuaHlreDug7QVzY2Ybcl0w==
X-Received: by 2002:a63:8c5a:: with SMTP id q26mr58143248pgn.312.1594423114697;
        Fri, 10 Jul 2020 16:18:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id c14sm7296382pfj.82.2020.07.10.16.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:18:34 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/3] irq: irqdomain: Export irq_domain_update_bus_token
Date:   Fri, 10 Jul 2020 23:18:22 +0000
Message-Id: <20200710231824.60699-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710231824.60699-1-john.stultz@linaro.org>
References: <20200710231824.60699-1-john.stultz@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add export for irq_domain_update_bus_token() so that
we can allow drivers like the qcom-pdc driver to be
loadable as a module.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 kernel/irq/irqdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index a4c2c915511d..ca974d965fda 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -281,6 +281,7 @@ void irq_domain_update_bus_token(struct irq_domain *domain,
 
 	mutex_unlock(&irq_domain_mutex);
 }
+EXPORT_SYMBOL_GPL(irq_domain_update_bus_token);
 
 /**
  * irq_domain_add_simple() - Register an irq_domain and optionally map a range of irqs
-- 
2.17.1

