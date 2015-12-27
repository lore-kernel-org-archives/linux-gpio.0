From: Peter Robinson <pbrobinson@gmail.com>
Subject: pinctrl: adjust dependencies closer to arch/SoC
Date: Sun, 27 Dec 2015 12:22:50 +0000
Message-ID: <1451218972-22156-1-git-send-email-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:36407 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbbL0MXP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 07:23:15 -0500
Received: by mail-pa0-f46.google.com with SMTP id yy13so4950543pab.3
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2015 04:23:14 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

Hi All,

In enabling just ARCH_ROCKCHIP, or a number of other combos, you get numerous other
non related pinctrl options that appear just by selecting PINCTRL. These two patches
add appropriate dependencies and COMPILE_TEST to allow finer grained control.

Peter

