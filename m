From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH V2 0/6] gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip
Date: Fri, 13 Jan 2017 09:50:09 +0530
Message-ID: <1484281215-24576-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:45100 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751203AbdAMEVX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 23:21:23 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com

The Davinci GPIO driver is implemented to work with one monolithic
Davinci GPIO platform device which may have up to Y(144) gpios.
The Davinci GPIO driver instantiates number of GPIO chips with
max 32 gpio pins per each during initialization and one IRQ domain.
So, the current GPIO's  opjects structure is:

<platform device> Davinci GPIO controller
 |- <gpio0_chip0> ------|
 ...                    |--- irq_domain (hwirq [0..143])
 |- <gpio0_chipN> ------|

Current driver creates one chip for every 32 GPIOs in a controller.
This was a limitation earlier now there is no need for that. Hence
redesigning the driver to create one gpio chip for all the ngpio
in the controller.

|- <gpio0_chip0> ------|--- irq_domain (hwirq [0..143]).

The previous discussion on this can be found here:
https://www.spinics.net/lists/linux-omap/msg132869.html

The series is posted on top of: 

https://lkml.org/lkml/2017/1/4/94

Changes in v2:

  * Optimized the re-design patch.
  * Added couple of code clean ups after the re-design.
  * Included v2 of https://patchwork.ozlabs.org/patch/710855/ 

Keerthy (6):
  gpio: davinci: Remove gpio2regs function to accommodate multi
    instances
  gpio: davinci: Remove unwanted blank line
  gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip
  gpio: davinci: Add support for multiple GPIO controllers
  gpio: davinci: Remove custom .xlate
  gpio: davinci: Remove redundant macros

 drivers/gpio/gpio-davinci.c                | 174 +++++++++++++----------------
 include/linux/platform_data/gpio-davinci.h |  20 ++--
 2 files changed, 90 insertions(+), 104 deletions(-)

-- 
1.9.1

