Return-Path: <SRS0=1K/e=WT=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4EFC3A5A4
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Aug 2019 12:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 411B323400
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Aug 2019 12:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394900AbfHWM7u (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 23 Aug 2019 08:59:50 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:50402 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731861AbfHWM7u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 08:59:50 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id sczp2000J05gfCL01czpWC; Fri, 23 Aug 2019 14:59:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i19AT-0006e0-DB; Fri, 23 Aug 2019 14:59:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i19AT-0005eU-C4; Fri, 23 Aug 2019 14:59:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v5.4 (take two)
Date:   Fri, 23 Aug 2019 14:59:48 +0200
Message-Id: <20190823125948.21685-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 625efea83a7c37d281c6a90526813a1366929d24:

  pinctrl: rza1: Use devm_platform_ioremap_resource() helper (2019-08-09 09:34:45 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.4-tag2

for you to fetch changes up to 0a6864274e4166cde21f26193350c7fcd9716ef5:

  pinctrl: rza2: Include the appropriate headers (2019-08-23 09:08:10 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.4 (take two)

  - Support switching between function and gpio at runtime,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Linus Walleij (3):
      pinctrl: sh-pfc: Include the right header
      pinctrl: rza2: Drop driver use of consumer flags
      pinctrl: rza2: Include the appropriate headers

Nishka Dasgupta (1):
      pinctrl: rza1: Add of_node_put() before return

Yoshihiro Shimoda (3):
      pinctrl: sh-pfc: Add new flags into struct sh_pfc_pin_config
      pinctrl: sh-pfc: Remove incomplete flag "cfg->type"
      pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed

 drivers/pinctrl/pinctrl-rza1.c   | 12 ++++++++---
 drivers/pinctrl/pinctrl-rza2.c   | 17 ++++++++-------
 drivers/pinctrl/sh-pfc/gpio.c    |  2 +-
 drivers/pinctrl/sh-pfc/pinctrl.c | 45 ++++++++++++++++++++--------------------
 4 files changed, 42 insertions(+), 34 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
