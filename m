From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [RESEND 0/6] Intel Atom C2000 series GPIO support
Date: Fri, 14 Feb 2014 15:01:52 +0100
Message-ID: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:55320 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752529AbaBNOCB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2014 09:02:01 -0500
Received: by mail-we0-f179.google.com with SMTP id q58so8889442wes.10
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2014 06:02:00 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sameo@linux.intel.com, asierra@xes-inc.com, lee.jones@linaro.org, Vincent Donnefort <vdonnefort@gmail.com>

This patch set is a resend which adds Lee Jones, MFD maintainer into the
thread and Aaron Sierra lpc_ich author, forgotten during the first send.

The purpose of this patch-set is to add support for GPIOs found on the Intel
Atom C2000 series (Avoton/Rangeley)

Vincent Donnefort (6):
  mfd: lpc_ich: Convert ICH GPIOs IDs to enum
  mfd: lpc_ich: Add support for Intel Avoton GPIOs
  gpio: ich: Add blink capability option
  gpio: ich: Add support for multiple register addresses
  gpio: ich: Add output levels cache support
  gpio: ich: Add support for Intel Avoton

 drivers/gpio/gpio-ich.c     | 96 ++++++++++++++++++++++++++++++++++++++-------
 drivers/mfd/lpc_ich.c       |  1 +
 include/linux/mfd/lpc_ich.h | 17 ++++----
 3 files changed, 93 insertions(+), 21 deletions(-)

-- 
1.8.3.2

