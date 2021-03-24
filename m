Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9ACC433C1
	for <linux-gpio@archiver.kernel.org>; Wed, 24 Mar 2021 06:46:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D17A4619D5
	for <linux-gpio@archiver.kernel.org>; Wed, 24 Mar 2021 06:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhCXGqU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 24 Mar 2021 02:46:20 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:36866 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhCXGqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 02:46:14 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 39A92CC8F1;
        Wed, 24 Mar 2021 14:45:48 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P24306T139685112297216S1616568346904525_;
        Wed, 24 Mar 2021 14:45:48 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7ebdb729a5f20c017d9d086579e21231>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     huangtao@rock-chips.com, kever.yang@rock-chips.com,
        linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH RESEND 0/7] gpio-rockchip driver
Date:   Wed, 24 Mar 2021 14:45:34 +0800
Message-Id: <20210324064541.949630-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Separate gpio driver from pinctrl driver, and support v2 controller.

Jianqun Xu (7):
  pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
  pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
  gpio: separate gpio driver from pinctrl-rockchip driver
  gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
  gpio/rockchip: support next version gpio controller
  gpio/rockchip: always enable clock for gpio controller
  gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type

 drivers/gpio/Kconfig               |   8 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-rockchip.c       | 758 ++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.c | 909 +----------------------------
 drivers/pinctrl/pinctrl-rockchip.h | 286 +++++++++
 5 files changed, 1072 insertions(+), 890 deletions(-)
 create mode 100644 drivers/gpio/gpio-rockchip.c
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h

-- 
2.25.1



