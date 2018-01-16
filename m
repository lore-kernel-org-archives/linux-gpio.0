From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Regression caused by a603a2b8d86e "gpio: of: Add special quirk to
 parse regulator flags"
Date: Tue, 16 Jan 2018 21:49:17 +0100
Message-ID: <814e4459-39ef-8397-709b-858bf5564212@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:39495 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751117AbeAPUt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 15:49:26 -0500
Received: by mail-wm0-f45.google.com with SMTP id i11so11244374wmf.4
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2018 12:49:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

With the latest next kernel I get a NPE caused by mentioned commit.
The change doesn't consider that the flags parameter can be NULL,
e.g. of_get_named_gpio() sets it to NULL.
All that of_gpio_flags_quirks() does is adjusting the flags,
so the following simple change fixed the issue for me.

if (flags)
	of_gpio_flags_quirks(np, flags);
