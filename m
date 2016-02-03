From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 0/7] Use devm_request_region
Date: Wed,  3 Feb 2016 15:15:20 -0500
Message-ID: <cover.1454530144.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f196.google.com ([209.85.160.196]:33689 "EHLO
	mail-yk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753915AbcBCUPh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 15:15:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

By the time request_region is called in several GPIO drivers, a
corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Changes in v2:
  - Remove unused extent member from 104-dio-48e, 104-idi-48,
    104-idio-16, and ws16c48 respective private data structures
  - Remove unused pdata pointer from sch311x_gpio_remove function

William Breathitt Gray (7):
  gpio: 104-dio-48e: Use devm_request_region
  gpio: 104-idi-48: Use devm_request_region
  gpio: 104-idio-16: Use devm_request_region
  gpio: amd8111: Use devm_request_region
  gpio: ich: Use devm_request_region
  gpio: sch311x: Use devm_request_region
  gpio: ws16c48: Use devm_request_region

 drivers/gpio/gpio-104-dio-48e.c | 25 +++++++-------------
 drivers/gpio/gpio-104-idi-48.c  | 25 +++++++-------------
 drivers/gpio/gpio-104-idio-16.c | 25 +++++++-------------
 drivers/gpio/gpio-amd8111.c     |  7 +++---
 drivers/gpio/gpio-ich.c         | 51 ++++++++---------------------------------
 drivers/gpio/gpio-sch311x.c     |  8 +++----
 drivers/gpio/gpio-ws16c48.c     | 25 +++++++-------------
 7 files changed, 47 insertions(+), 119 deletions(-)

-- 
2.4.10

