From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Subject: [PATCH 0/2] gpio-mxc: Fix issue with gpios used as wake source on iMX27
Date: Wed, 12 Jul 2017 10:36:38 +0200
Message-ID: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42312 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933664AbdGLIhM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 04:37:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Philipp Rosenberger <p.rosenberger@linutronix.de>

The gpio-mxc driver is able to use two interrupts per gpio bank. One for
the lower 16 and the other for the higher 16 gpios. The iMX27 has only one
interrupt per bank. An error in the driver leads to the problem that the
driver uses an invalid interrupt for the higher 16 gpios. Which in turn
prevents the upper 16 gpios per bank to be used as wake source.

The first patch fixes the assignment for the irq_high. The second patch
adds proper return values. Which should make finding any problems in the
future much easier.

Philipp Rosenberger (2):
  gpio: gpio-mxc: Fix: higher 16 GPIOs usable as wake source
  gpio: gpio-mxc: gpio_set_wake_irq() use proper return values

 drivers/gpio/gpio-mxc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.1.4

