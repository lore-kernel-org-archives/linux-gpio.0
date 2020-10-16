Return-Path: <SRS0=Nl/I=DX=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B3FC433DF
	for <linux-gpio@archiver.kernel.org>; Fri, 16 Oct 2020 21:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E33E2205CB
	for <linux-gpio@archiver.kernel.org>; Fri, 16 Oct 2020 21:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="CSs+7sEc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409796AbgJPVAe (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 16 Oct 2020 17:00:34 -0400
Received: from mxwww.masterlogin.de ([95.129.51.170]:58658 "EHLO
        mxwww.masterlogin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390931AbgJPVAe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 17:00:34 -0400
Received: from mxout1.routing.net (unknown [192.168.10.81])
        by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 2D6BE2C45C;
        Fri, 16 Oct 2020 20:40:47 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
        by mxout1.routing.net (Postfix) with ESMTP id AE2E040200;
        Fri, 16 Oct 2020 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
        s=20200217; t=1602880841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=eByxQJ3Uw+4BTez5687bqBmBgV7qeZW+tNKXlbDd5mo=;
        b=CSs+7sEcIpTLCTKNIQgOYRsKkoXl/FP5ViCDZoRe3iZcWE7urOw/lVdgdiyKD9Ktu7JUr9
        OGoHPObVhvnWBHgp7V/bpeTpB9q1eMRDtanFQQnjQwTPKdBa+Y1N+sro90ZPj/W6a5XqcO
        O1dZYu/hbueXe8xYEi2mZ2+CozqTwXs=
Received: from localhost.localdomain (fttx-pool-80.208.213.194.bambit.de [80.208.213.194])
        by mxbox3.masterlogin.de (Postfix) with ESMTPSA id EA325360549;
        Fri, 16 Oct 2020 20:40:40 +0000 (UTC)
From:   Frank Wunderlich <linux@fw-web.de>
To:     linux-mediatek@lists.infradead.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [RFC 0/3] add available pwm for bananapi-r64
Date:   Fri, 16 Oct 2020 22:40:16 +0200
Message-Id: <20201016204019.2606-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Frank Wunderlich <frank-w@public-files.de>

- mt7622 provides 6 pwm channels and only one is configured in dts
- pinctl-driver contains 7 pwm-channels where one is currently used.
- Mediatek confirmed that pwm7 does not exist and so dts is wrong
  and also the pinctrl definitions.

Frank Wunderlich (3):
  dts64: mt7622: enable all pwm for bananapi r64
  dts64: mt7622: disable spi1 and uart2 because pins are used by pwm
  pinctl: mt7622: drop pwm ch7 as mt7622 only has 6 channels

 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts   | 13 ++++++++-----
 drivers/pinctrl/mediatek/pinctrl-mt7622.c           | 13 +------------
 2 files changed, 9 insertions(+), 17 deletions(-)

-- 
2.25.1

