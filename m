Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21D3C433EF
	for <linux-gpio@archiver.kernel.org>; Sun, 20 Mar 2022 09:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243160AbiCTJ1N (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 20 Mar 2022 05:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243096AbiCTJ1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Mar 2022 05:27:11 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3934C3F337
        for <linux-gpio@vger.kernel.org>; Sun, 20 Mar 2022 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=DUYiFiBNVrzlJrG624xlJzcZvwd
        1a2JMHswyD5TH+IM=; b=D7xBmdx7MJcY+A4GPdwVR7W9+LoTD4QdMKBwpaLZxWx
        O2FCxbOElzgSVC7PEc7vEDVZk7GjY9CpbBwg0f0H7kzUhIma38TCsCws/xPjI237
        VALQ1+lobi1UBNF9MHPGWj87vnNjN3VXe/0DTWpLxVOC0l1Am0DIVAAdO8OrGHok
        =
Received: (qmail 413072 invoked from network); 20 Mar 2022 10:25:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2022 10:25:46 +0100
X-UD-Smtp-Session: l3s3148p1@5hnx9qLa/rcgAQnoAFbkANnMMFqLOUjD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] pinctrl: renesas: r8a77990: add drive-strength
Date:   Sun, 20 Mar 2022 10:25:40 +0100
Message-Id: <20220320092542.2308-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series upports a BSP patch. Please check the notes on the patches.

Changes since V1:
* support RZ/G2E as well

Wolfram Sang (2):
  pinctrl: renesas: allow up to 10 fields for drive_regs
  pinctrl: renesas: r8a77990: add drive-strength

 drivers/pinctrl/renesas/pfc-r8a77990.c | 39 ++++++++++++++++++++++++--
 drivers/pinctrl/renesas/sh_pfc.h       |  2 +-
 2 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.30.2

