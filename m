Return-Path: <SRS0=VlQh=4G=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B10C34037
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Feb 2020 11:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19ED121D56
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Feb 2020 11:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgBRL0D (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 18 Feb 2020 06:26:03 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:58616 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgBRL0D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 06:26:03 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 4BS22200J5USYZQ01BS282; Tue, 18 Feb 2020 12:26:02 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j410r-00043f-It; Tue, 18 Feb 2020 12:26:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j410r-0001YW-GX; Tue, 18 Feb 2020 12:26:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Remove use of ARCH_R8A7796
Date:   Tue, 18 Feb 2020 12:25:57 +0100
Message-Id: <20200218112557.5924-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CONFIG_ARCH_R8A7795 was split in CONFIG_ARCH_R8A77950 and
CONFIG_ARCH_R8A77951 in commit b925adfceb529389 ("soc: renesas: Add
ARCH_R8A7795[01] for existing R-Car H3"), so its users can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc for v5.7.
---
 drivers/pinctrl/sh-pfc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index cf0e0dc42b84c06f..9552851b96f12e08 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -26,8 +26,8 @@ config PINCTRL_SH_PFC
 	select PINCTRL_PFC_R8A7792 if ARCH_R8A7792
 	select PINCTRL_PFC_R8A7793 if ARCH_R8A7793
 	select PINCTRL_PFC_R8A7794 if ARCH_R8A7794
-	select PINCTRL_PFC_R8A77950 if ARCH_R8A77950 || ARCH_R8A7795
-	select PINCTRL_PFC_R8A77951 if ARCH_R8A77951 || ARCH_R8A7795
+	select PINCTRL_PFC_R8A77950 if ARCH_R8A77950
+	select PINCTRL_PFC_R8A77951 if ARCH_R8A77951
 	select PINCTRL_PFC_R8A77960 if ARCH_R8A77960
 	select PINCTRL_PFC_R8A77961 if ARCH_R8A77961
 	select PINCTRL_PFC_R8A77965 if ARCH_R8A77965
-- 
2.17.1

