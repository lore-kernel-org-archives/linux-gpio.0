Return-Path: <SRS0=uBUl=2I=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1156C3F68F
	for <linux-gpio@archiver.kernel.org>; Wed, 18 Dec 2019 19:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4BF721582
	for <linux-gpio@archiver.kernel.org>; Wed, 18 Dec 2019 19:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfLRTsS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 18 Dec 2019 14:48:18 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:43464 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbfLRTsS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 14:48:18 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id fXoF2100A5USYZQ06XoFVp; Wed, 18 Dec 2019 20:48:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0007xk-EK; Wed, 18 Dec 2019 20:48:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0003KK-CC; Wed, 18 Dec 2019 20:48:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] pinctrl: sh-pfc: More miscellenaous fixes
Date:   Wed, 18 Dec 2019 20:48:06 +0100
Message-Id: <20191218194812.12741-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

Recently, I have been adding more runtime validation checks to the
sh-pfc driver, to catch already reported and new unknown bugs in the
various SoC-specific pin control drivers.  While the new checks need
more polishing before publication, I'm already posting 6 fixes
discovered by these checks.

I intend to queue these up in sh-pfc-for v5-6.

Thanks for your comments!

Geert Uytterhoeven (6):
  pinctrl: sh-pfc: r8a7778: Fix duplicate SDSELF_B and SD1_CLK_B
  pinctrl: sh-pfc: sh7264: Fix Port K I/O Register 0 definition
  pinctrl: sh-pfc: sh7264: Fix CAN function GPIOs
  pinctrl: sh-pfc: sh7269: Fix CAN function GPIOs
  sh: sh7264: Remove bogus SSU GPIO function definitions
  sh: sh7269: Remove bogus SSU GPIO function definitions

 arch/sh/include/cpu-sh2a/cpu/sh7264.h |  6 -----
 arch/sh/include/cpu-sh2a/cpu/sh7269.h | 17 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c  |  4 +--
 drivers/pinctrl/sh-pfc/pfc-sh7264.c   | 33 +++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-sh7269.c   | 39 ++++++++++++++++++---------
 5 files changed, 54 insertions(+), 45 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
