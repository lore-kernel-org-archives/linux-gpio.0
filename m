From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/3] pinctrl: sx150x: fixes for the probe
Date: Wed, 17 Jan 2018 14:34:20 +0100
Message-ID: <20180117133423.4482-1-peda@axentia.se>
References: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr30129.outbound.protection.outlook.com ([40.107.3.129]:45475
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753105AbeAQNeg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jan 2018 08:34:36 -0500
In-Reply-To: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-gpio@vger.kernel.org

Hi!

This series mainly fixes the gpio interaction, as discussed
in [1]. However, patch 1/3 addresses a problem that was not
mentioned there. It should probably be sent to stable...

Cheers,
Peter

[1] https://lkml.org/lkml/2018/1/16/952

Peter Rosin (3):
  pinctrl: sx150x: unregister the pinctrl on release
  pinctrl: sx150x: register pinctrl before adding the gpiochip
  pinctrl: sx150x: add a static gpio/pinctrl pin range mapping

 drivers/pinctrl/pinctrl-sx150x.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

-- 
2.11.0

