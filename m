Return-Path: <SRS0=ClVC=YZ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CAACA9ECF
	for <linux-gpio@archiver.kernel.org>; Fri,  1 Nov 2019 15:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 869EC21897
	for <linux-gpio@archiver.kernel.org>; Fri,  1 Nov 2019 15:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfKAP7U (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 1 Nov 2019 11:59:20 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:46320 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKAP7T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 11:59:19 -0400
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id LfzJ2100A5USYZQ06fzJBy; Fri, 01 Nov 2019 16:59:18 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKY-0002s0-3u; Fri, 01 Nov 2019 16:59:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKY-0008Ex-1q; Fri, 01 Nov 2019 16:59:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.5 (take two)
Date:   Fri,  1 Nov 2019 16:59:16 +0100
Message-Id: <20191101155916.31629-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit f846d1e704f2d07a7f359f65eac2c8cac565db35:

  pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux macro for SCL3 (2019-10-14 12:11:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.5-tag2

for you to fetch changes up to 884caadad128efad8e00c1cdc3177bc8912ee8ec:

  pinctrl: sh-pfc: sh7734: Fix duplicate TCLK1_B (2019-11-01 13:42:52 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.5 (take two)

  - Add support for the new R-Car M3-W+ (r8a77961) SoC,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (5):
      pinctrl: sh-pfc: Do not use platform_get_irq() to count interrupts
      dt-bindings: pinctrl: sh-pfc: Document r8a77961 support
      pinctrl: sh-pfc: Rename PINCTRL_PFC_R8A7796 to PINCTRL_PFC_R8A77960
      pinctrl: sh-pfc: r8a7796: Add R8A77961 PFC support
      pinctrl: sh-pfc: sh7734: Fix duplicate TCLK1_B

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |  3 +-
 arch/sh/include/cpu-sh4/cpu/sh7734.h               |  2 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |  8 ++++--
 drivers/pinctrl/sh-pfc/Makefile                    |  3 +-
 drivers/pinctrl/sh-pfc/core.c                      | 26 +++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 33 ++++++++++++++++++++--
 drivers/pinctrl/sh-pfc/pfc-sh7734.c                |  4 +--
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  3 +-
 8 files changed, 59 insertions(+), 23 deletions(-)
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
