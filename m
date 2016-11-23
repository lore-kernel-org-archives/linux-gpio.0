From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v2 0/2] pinctrl: sx150x: set multiple pins at once
Date: Wed, 23 Nov 2016 11:18:49 +0100
Message-ID: <1479896331-16915-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db5eur01on0139.outbound.protection.outlook.com ([104.47.2.139]:49153
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933056AbcKWKxT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Nov 2016 05:53:19 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org

Hi!

v1 -> v2 changes

- removed remains of (broken) support for sx150[789], as it was
  overengineered.
- add comment as to why sx150[789] is not supported.
- add ack from Neil for patch 1/2

I have only tested this on an 8-bit sx1502. I'm also fairly certain
that there needs to be locking for this to work as intended for the
bigger chips with an oscio pin, so those are not supported by this
patch.

Cheers,
Peter

Peter Rosin (2):
  pinctrl: sx150x: various spelling fixes and some white-space cleanup
  pinctrl: sx150x: support setting multiple pins at once

 drivers/pinctrl/pinctrl-sx150x.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

-- 
2.1.4

