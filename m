From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] gpio: generic: patch series with improvements for
 bgpio_map
Date: Wed, 30 Sep 2015 23:48:47 +0200
Message-ID: <560C58BF.7080707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:33922 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932904AbbI3VxI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2015 17:53:08 -0400
Received: by wicfx3 with SMTP id fx3so6489675wic.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2015 14:53:07 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

This patch series includes improvements for bgpio_map.

Heiner Kallweit (3):
  gpio: generic: improve error handling in bgpio_map
  gpio: generic: replace devm_request_mem_region / devm_ioremap with devm_ioremap_resource
  gpio: generic: replace error variable with errptr functionality in bgpio_map

 drivers/gpio/gpio-generic.c | 60 +++++++++++++++------------------------------
 1 file changed, 20 insertions(+), 40 deletions(-)

-- 
2.6.0

