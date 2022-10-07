Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06117C433F5
	for <linux-gpio@archiver.kernel.org>; Fri,  7 Oct 2022 11:47:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiJGLrC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 7 Oct 2022 07:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiJGLrB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 07:47:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F999E0E7
        for <linux-gpio@vger.kernel.org>; Fri,  7 Oct 2022 04:46:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oglof-0001AR-7S; Fri, 07 Oct 2022 13:46:57 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oglod-0005lN-SR; Fri, 07 Oct 2022 13:46:55 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oglod-00BXD3-7d; Fri, 07 Oct 2022 13:46:55 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de,
        Serge Semin <fancer.lancer@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v5 0/2] gpio: Add gpio-latch driver
Date:   Fri,  7 Oct 2022 13:46:45 +0200
Message-Id: <20221007114647.2723457-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes the changes requested by Serge Semin for v4.

Sascha

Sascha Hauer (2):
  gpio: Add gpio latch driver
  dt-bindings: gpio: Add gpio-latch binding document

 .../devicetree/bindings/gpio/gpio-latch.yaml  |  94 ++++++++
 drivers/gpio/Kconfig                          |   6 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-latch.c                     | 220 ++++++++++++++++++
 4 files changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-latch.yaml
 create mode 100644 drivers/gpio/gpio-latch.c

-- 
2.30.2

