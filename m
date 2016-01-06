From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/3] gpio: brcmstb: Misc changes
Date: Wed,  6 Jan 2016 10:55:20 -0800
Message-ID: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:34947 "EHLO
	mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196AbcAFS4J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2016 13:56:09 -0500
Received: by mail-pf0-f178.google.com with SMTP id 78so246504846pfw.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2016 10:56:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-mips@linux-mips.org, gregory.0xf0@gmail.com, jaedon.shin@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>

Hi Linus, Alexandre,

This patch series updates the brcmstb GPIO driver to support the following:

- move the initialization to subsys_initcall to allow using this driver with
  GPIO-driven regulators
- properly configure the driver for big-endian MIPS operation
- enable the driver for MIPS-based brcmstb chips

Thank you!

Florian Fainelli (2):
  gpio: brcmstb: Set endian flags for big-endian MIPS
  gpio: brcmstb: Allow building driver for BMIPS_GENERIC

Jim Quinlan (1):
  gpio: brcmstb: have driver register during subsys_initcall()

 drivers/gpio/Kconfig        |  4 ++--
 drivers/gpio/gpio-brcmstb.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.1.0

