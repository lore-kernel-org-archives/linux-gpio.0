Return-Path: <SRS0=Utw9=DU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92811C433DF
	for <linux-gpio@archiver.kernel.org>; Tue, 13 Oct 2020 06:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B8CF20797
	for <linux-gpio@archiver.kernel.org>; Tue, 13 Oct 2020 06:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389647AbgJMGoD (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 13 Oct 2020 02:44:03 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:48146 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389493AbgJMGoD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 02:44:03 -0400
X-Greylist: delayed 386 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Oct 2020 02:44:02 EDT
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 03A0BCCF39;
        Tue, 13 Oct 2020 14:37:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P30218T139798958167808S1602571053396950_;
        Tue, 13 Oct 2020 14:37:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <ef609c6f9f658d0ce9f1a82189662bf4>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v3 0/3] rockchip-pinctrl fixes
Date:   Tue, 13 Oct 2020 14:37:28 +0800
Message-Id: <20201013063731.3618-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches are required by GKI.

Jianqun Xu (3):
  pinctrl: rockchip: make driver be tristate module
  pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
  pinctrl: rockchip: create irq mapping in gpio_to_irq

 drivers/pinctrl/Kconfig            |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c | 43 +++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 17 deletions(-)

-- 
2.17.1



