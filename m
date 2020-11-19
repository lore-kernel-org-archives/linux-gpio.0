Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9909C6379D
	for <linux-gpio@archiver.kernel.org>; Thu, 19 Nov 2020 13:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 806EA2222A
	for <linux-gpio@archiver.kernel.org>; Thu, 19 Nov 2020 13:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgKSNJk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 19 Nov 2020 08:09:40 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:39606 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727429AbgKSNJj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 08:09:39 -0500
X-IronPort-AV: E=Sophos;i="5.77,490,1596466800"; 
   d="scan'208";a="63036279"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Nov 2020 22:09:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C6C954005E1A;
        Thu, 19 Nov 2020 22:09:35 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Renesas add QSPI{0,1} pins to r8a77{96,951,965,990} SoC
Date:   Thu, 19 Nov 2020 13:09:22 +0000
Message-Id: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This patch series adds QSPI{0,1} pins to r8a77{96,951,965,990} SoC.

Patches are based on top of [1].

[1]  https://git.kernel.org/pub/scm/linux/kernel/git/geert/
     renesas-drivers.git/log/?h=renesas-pinctrl-for-v5.11
Cheers,
Prabhakar

Lad Prabhakar (4):
  pinctrl: renesas: r8a77990: Add QSPI[01] pins, groups and functions
  pinctrl: renesas: r8a77951: Add QSPI[01] pins, groups and functions
  pinctrl: renesas: r8a7796: Add QSPI[01] pins, groups and functions
  pinctrl: renesas: r8a77965: Add QSPI[01] pins, groups and functions

 drivers/pinctrl/renesas/pfc-r8a77951.c | 75 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 75 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 75 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c | 75 +++++++++++++++++++++++++-
 4 files changed, 292 insertions(+), 8 deletions(-)

-- 
2.17.1

