From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 0/6] gpio: mvebu: prepatatory cleanup for pwm-fan support
Date: Thu, 16 Mar 2017 07:33:55 +0100
Message-ID: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36072 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750866AbdCPGeM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2017 02:34:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>

Hi everyone

I did pick up a patch series by Andrew Lunn adding PWM upport to mvebu's
gpio controller. Checkpach complained quite a bit and there are extra
inconsitencies which make it worth to clean drivers/gpio/gpio-mvebu.c a bit
before adding the desired pwm fan support for armada 370 / xp.

This series is split out to save the pwm folks from having to review this
part as well.

Thanks
Ralph


Ralph Sennhauser (6):
  gpio: mvebu: checkpatch: block comment fixes
  gpio: mvebu: start multiline block comments with blank line
  gpio: mvebu: checkpatch: unsigned int fixes
  gpio: mvebu: checkpatch: whitespace fixes
  gpio: mvebu: extra whitespace fixes
  gpio: mvebu: let the compiler inline

 drivers/gpio/gpio-mvebu.c | 75 ++++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 34 deletions(-)

-- 
2.10.2

