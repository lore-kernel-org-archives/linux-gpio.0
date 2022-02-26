Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4336AC433F5
	for <linux-gpio@archiver.kernel.org>; Sat, 26 Feb 2022 20:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiBZUp5 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 26 Feb 2022 15:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiBZUp4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Feb 2022 15:45:56 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2ED1B4035;
        Sat, 26 Feb 2022 12:45:20 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id B06D32223E;
        Sat, 26 Feb 2022 21:45:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1645908318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zfmHvO4bszehQ082Y/9bfCsKjhj2g/yezRDipNTYzxM=;
        b=oPFkyD/cXbecBViD08SNc2TScbiUMLeJJq7NBT9IWis/4jib06hEhSh9mjASAWVyuKmDBl
        u4lsngYZzGg2G9hkZGCaFwx0ATXM5xWJzLkYDOxvJagp4ZGUUtBgkvjNSu21BU/OKct4Yf
        oop6LQ57nKlu+7zaoR/fDT9KAMB/dE4=
From:   Michael Walle <michael@walle.cc>
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Colin Foster <colin.foster@in-advantage.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v2 0/5] pinctrl: microchip-sgpio: locking and synchronous output
Date:   Sat, 26 Feb 2022 21:45:02 +0100
Message-Id: <20220226204507.2511633-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are boards which use the output of the SGPIO to drive I2C muxers.
SGPIO right now is broken in a way that when the software sets this bit
there is a rather large delay until that value ends up on the hardware
pin.

While digging into this, I've noticed that there is no locking at all
in this driver. Add locking for all RWM accesses.

Please note, that parts of the modification of the first patch are
removed again in a later patch. This is because the first patch is
intended to be backported to the stable trees.

This was also just tested on a LAN9668 SoC. If you have additional
hardware, please test.

Changes since v1:
 - add Ocelot support

Michael Walle (5):
  pinctrl: microchip-sgpio: lock RMW access
  pinctrl: microchip-sgpio: don't do RMW for interrupt ack register
  pinctrl: microchip-sgpio: use regmap_update_bits()
  pinctrl: microchip-sgpio: return error in spgio_output_set()
  pinctrl: microchip-sgpio: wait until output is actually set

 drivers/pinctrl/pinctrl-microchip-sgpio.c | 112 +++++++++++++++++++---
 1 file changed, 97 insertions(+), 15 deletions(-)

-- 
2.30.2

