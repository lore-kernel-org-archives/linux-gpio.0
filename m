Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C6BC4338F
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Jul 2021 01:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7C3060F38
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Jul 2021 01:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhGZAxX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 25 Jul 2021 20:53:23 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:53554 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhGZAxW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Jul 2021 20:53:22 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 15574FAFA2;
        Mon, 26 Jul 2021 09:33:49 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P25117T140689763460864S1627263227474860_;
        Mon, 26 Jul 2021 09:33:48 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <209d11b1e1cccf566a31837503ee6a56>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-RCPT-COUNT: 9
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v7 0/9] gpio-rockchip driver
Date:   Mon, 26 Jul 2021 09:33:36 +0800
Message-Id: <20210726013345.1634442-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Separate gpio driver from pinctrl driver, and support gpio v2 controller.

Jianqun Xu (8):
  pinctrl/rockchip: always enable clock for gpio controller
  pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
  pinctrl/rockchip: add pinctrl device to gpio bank struct
  gpio/rockchip: add driver for rockchip gpio
  gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
  gpio/rockchip: support next version gpio controller
  gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
  pinctrl/rockchip: drop the gpio related codes

Liang Chen (1):
  dt-bindings: gpio: change items restriction of clock for
    rockchip,gpio-bank

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   5 +-
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rockchip.c                  | 771 +++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.c            | 909 +-----------------
 drivers/pinctrl/pinctrl-rockchip.h            | 287 ++++++
 6 files changed, 1089 insertions(+), 892 deletions(-)
 create mode 100644 drivers/gpio/gpio-rockchip.c
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h

--
v7:
 - include <linux/gpio/driver.h> instead of <linux/gpio.h>
 - use gpio align id instead of gpio-name

v6:
 - new gpio-driver first and then drop gpio from pinctrl
 - reorder patches
 - cherry-pick gpio dt-binding from chenliang

v5:
 - change to devel branch

2.25.1



