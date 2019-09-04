Return-Path: <SRS0=izCi=W7=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B41C3A5AC
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Sep 2019 12:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9CDA22CED
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Sep 2019 12:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbfIDMRC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 4 Sep 2019 08:17:02 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:42540 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729792AbfIDMRC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 08:17:02 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id xQGz2000P05gfCL01QGzuM; Wed, 04 Sep 2019 14:17:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5UDb-0001ey-Fn; Wed, 04 Sep 2019 14:16:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5UDb-0000gz-Db; Wed, 04 Sep 2019 14:16:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pinctrl: sh-pfc: r8a77990: Assorted fixes
Date:   Wed,  4 Sep 2019 14:16:55 +0200
Message-Id: <20190904121658.2617-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

This patch series contains three fixes for the R-Car E3 pin control
driver:
  - Two pins were renamed (lost their unneeded suffixes); fortunately
    there are no upstream users,
  - Reverts of two earlier changes, due to a misinterpretation of the
    errata.

To be queued in sh-pfc-for-v5.5.

Thanks for your comments!

Geert Uytterhoeven (2):
  Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when using
    SSI_SCK2 and SSI_WS2"
  Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when using
    SIM0_D"

Takeshi Kihara (1):
  pinctrl: sh-pfc: r8a77990: Rename AVB_AVTP_{MATCH,CAPTURE} pin
    functions

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 57 ++++++++++++++-------------
 1 file changed, 30 insertions(+), 27 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
