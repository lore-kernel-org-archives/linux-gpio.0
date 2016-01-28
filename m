From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/2] gpio: davinci: driver fixes
Date: Thu, 28 Jan 2016 19:08:49 +0530
Message-ID: <1453988331-17111-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:38510 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934AbcA1Njh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 08:39:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, j-keerthy@ti.com

The series has couple of for the gpio driver.

Keerthy (1):
  gpio: davinci: Add the missing of-node pointer in the
    irq_domain_add_legacy function call

Lokesh Vutla (1):
  gpio: davinci: Fix the number of controllers allocated

 drivers/gpio/gpio-davinci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
1.9.1

