Return-Path: <SRS0=OSF3=5E=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E105C4332B
	for <linux-gpio@archiver.kernel.org>; Thu, 19 Mar 2020 12:27:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 390BE2070A
	for <linux-gpio@archiver.kernel.org>; Thu, 19 Mar 2020 12:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUyR01/x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgCSM16 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 19 Mar 2020 08:27:58 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37303 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgCSM16 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:27:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id d1so2023388wmb.2;
        Thu, 19 Mar 2020 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eHkuDXF/NjX1C4n4QJPPPMMS5T3FHm+KSdBxTvMuP9Q=;
        b=eUyR01/xBtEu2wx8cIg5tMFXzfJZbZLjR1YxazpuxOdzjxUhayZwWkTiTRgMwLVHAL
         0EfDaTYqrXoGoLZ1I7O9Tmt6W3yZlCQSBajro5rg+cfZ0BDK7c8B9mRtD7HHoQqFeiG7
         fyd03Vaw3yv3Y896yR7+pr5TA7JUI35PFXf31OoTI1fQ657vDh/ln/cceIEiG1I/pz+x
         uiaLWQ/uKKFN3CXIIvtxP+WrxgPkRIamfeZbYFiXOF5AtofYldaiszamxO8iSjlpDV0F
         HNgCgxFqEew6gIKDqY8LN8vINmSAaKzj6UXs7iHMWRVllmwnV6NR0KxwbuhoubeD/vn8
         1HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eHkuDXF/NjX1C4n4QJPPPMMS5T3FHm+KSdBxTvMuP9Q=;
        b=p3dQARcwvKGNXegfmmVLBCdLilOd6IEguE1h/ETs45ulTy9JkxStqzJ3RTWSYuEApm
         MYMvssOE50/beQJ3pag3T9CXzrNAEQ9xOP/ZI+j3HzE5d8STZ3N7jM4c8vaxBotZjJJR
         crkiEuAZ+ul22L3y6AbZ6FdxLGGj91W8AX6t2/xo76TYl967la6M+BHm/wnxpjN4EH0L
         x7eMhanjNBjoYnr4nm1XlnZiQEvJXGGlq+l+T/CanCunV9HKt+EaurhTF7/y5I+U7DsD
         I5M3iJty3mfj2dRJd2HKmC/iWQGRwNOBttgqJvXaoHcAhiOZhEOtnyjgr+InX74v+shd
         XgWg==
X-Gm-Message-State: ANhLgQ2PImGLv5a27AeX1fmDRJefKqfw8ctHCK/C3V9TIZq0/2uhO/MA
        3+4kc3v2nJdoFR7hjvitUs0=
X-Google-Smtp-Source: ADFU+vsUj1dJ6Rb3dAqT0Xpgil+MaZRO+5f1dYJq+aDiT8BGC+9x4I3kDjrK/ud8wiSPFSxk0YlKuw==
X-Received: by 2002:a1c:2dc7:: with SMTP id t190mr3570270wmt.137.1584620874999;
        Thu, 19 Mar 2020 05:27:54 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id o9sm3361216wrw.20.2020.03.19.05.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:27:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 5/9] pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
Date:   Thu, 19 Mar 2020 13:27:33 +0100
Message-Id: <20200319122737.3063291-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319122737.3063291-1-thierry.reding@gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Properly spell "Schmitt" in the kerneldoc for pin group definitions.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 0fc82eea9cf1..520865979d4a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -107,7 +107,7 @@ struct tegra_function {
  *			drvup, slwr, slwf, and drvtype parameters.
  * @drv_bank:		Drive fields register bank.
  * @hsm_bit:		High Speed Mode register bit.
- * @schmitt_bit:	Scmitt register bit.
+ * @schmitt_bit:	Schmitt register bit.
  * @lpmd_bit:		Low Power Mode register bit.
  * @drvdn_bit:		Drive Down register bit.
  * @drvdn_width:	Drive Down field width.
-- 
2.24.1

