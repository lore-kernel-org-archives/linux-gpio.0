From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH 0/7] gpio: brcmstb: improved interrupt and wake support
Date: Fri, 29 Sep 2017 20:40:50 -0700
Message-ID: <20170930034057.15166-1-opendmb@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:37540 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752591AbdI3Dlo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2017 23:41:44 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch set collects a number of improvements to the GPIO driver
used by Broadcom Set-Top-Box devices.

Primarily they are aimed at correcting problems with the interrupt
controller implementation, but they also extend the functionality for
waking on GPIO interrupts.

Doug Berger (7):
  gpio: brcmstb: allow all instances to be wakeup sources
  gpio: brcmstb: release the bgpio lock during irq handlers
  gpio: brcmstb: switch to handle_level_irq flow
  gpio: brcmstb: correct the configuration of level interrupts
  gpio: brcmstb: enable masking of interrupts when changing type
  gpio: brcmstb: consolidate interrupt domains
  gpio: brcmstb: implement suspend/resume/shutdown

 drivers/gpio/Kconfig        |   2 +-
 drivers/gpio/gpio-brcmstb.c | 419 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 321 insertions(+), 100 deletions(-)

-- 
2.14.1

