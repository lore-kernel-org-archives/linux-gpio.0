Return-Path: <SRS0=J+Mb=A4=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DBAC433E3
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Jul 2020 10:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15D8E20717
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Jul 2020 10:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgGQK6p (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 17 Jul 2020 06:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbgGQK6p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 06:58:45 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1ACC08C5DB
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 03:58:44 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id 4Ayg2300F4C55Sk01AygN1; Fri, 17 Jul 2020 12:58:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwO4e-0001Kd-IL; Fri, 17 Jul 2020 12:58:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwNJJ-0004AJ-Mf; Fri, 17 Jul 2020 12:09:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.9 (take two)
Date:   Fri, 17 Jul 2020 12:09:44 +0200
Message-Id: <20200717100944.15966-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit b2fc9b4eb1d79c03fd78e50b810c2ea27178e1e3:

  pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions (2020-06-22 16:58:23 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.9-tag2

for you to fetch changes up to 4d0e62679f17b8bde01aa9995233b5b9ca05ab7f:

  dt-bindings: pinctrl: renesas,rza2-pinctrl: Convert to json-schema (2020-07-16 09:57:50 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.9 (take two)

  - Add support for the new RZ/G2H (R8A774E1) SoC,
  - One more conversion of DT bindings to json-schema,
  - Fix RZ/A1 kerneldoc.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: pinctrl: renesas,rza2-pinctrl: Convert to json-schema

Lad Prabhakar (1):
      pinctrl: sh-pfc: pfc-r8a77951: Add R8A774E1 PFC support

Lee Jones (1):
      pinctrl: rza1: Demote some kerneldoc headers and fix others

Marian-Cristian Rotariu (1):
      dt-bindings: pinctrl: sh-pfc: Document r8a774e1 PFC support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 .../bindings/pinctrl/renesas,rza2-pinctrl.txt      |  87 --
 .../bindings/pinctrl/renesas,rza2-pinctrl.yaml     | 100 +++
 drivers/pinctrl/pinctrl-rza1.c                     |  24 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |   4 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77951.c              | 877 +++++++++++----------
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   1 +
 9 files changed, 587 insertions(+), 514 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
