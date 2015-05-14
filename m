From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH 0/2] Fixes for the Cygnus GPIO driver
Date: Wed, 13 May 2015 17:06:21 -0700
Message-ID: <1431561983-8543-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:44208 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932380AbbENAG1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 20:06:27 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Jason Uy <jasonuy@broadcom.com>, Ray Jui <rjui@broadcom.com>

This patch series contains fixes for the Cygnus GPIO driver including 1) a
typo fix and 2) a fix of the GPIO-to-pin mapping

Code based on v4.1-rc3

Ray Jui (2):
  pinctrl: cygnus: fixed typo in the gpio driver
  pinctrl: cygnus: fixed incorrect GPIO-pin mapping

 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
1.7.9.5

