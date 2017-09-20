From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 0/2] Handle return value of devm_kasprintf
Date: Wed, 20 Sep 2017 12:43:07 +0530
Message-ID: <1505891589-6632-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35922 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751000AbdITHOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2017 03:14:07 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gregory.0xf0@gmail.com, linus.walleij@linaro.org, computersforpeace@gmail.com, f.fainelli@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

devm_kasprintf() can fail here and we must check its return value.

Arvind Yadav (2):
  [PATCH 1/2] gpio: brcmstb: Handle return value of devm_kasprintf
  [PATCH 2/2] gpio: tb10x: Handle return value of devm_kasprintf

 drivers/gpio/gpio-brcmstb.c | 3 +++
 drivers/gpio/gpio-tb10x.c   | 3 +++
 2 files changed, 6 insertions(+)

-- 
1.9.1

