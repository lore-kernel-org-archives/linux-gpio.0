From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 0/2] Pinctrl fixes for rockchip
Date: Tue, 18 Nov 2014 15:49:54 -0800
Message-ID: <1416354596-15013-1-git-send-email-dianders@chromium.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:61329 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932936AbaKRXuK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Nov 2014 18:50:10 -0500
Received: by mail-ie0-f179.google.com with SMTP id rp18so5173525iec.10
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2014 15:50:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Sonny Rao <sonnyrao@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Doug Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

These two patches fix some pinctrl issues on rockchip.  The first
fixes a real issue where interrupts were being left on in
suspend/resume and waking the system up when they shouldn't.  The
second fixes purely theoretical problems and could be considered more
of an RFC patch.

I've tested these patches more extensively on a non-mainline tree but
have done basic compile and boot testing on mainline.  I don't have
suspend/resume working so well on mainline yet, so I haven't tested
fully there.


Doug Anderson (2):
  pinctrl: rockchip: Handle wakeup pins
  pinctrl: rockchip: Fix enable/disable/mask/unmask

 drivers/pinctrl/pinctrl-rockchip.c | 51 +++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

-- 
2.1.0.rc2.206.gedb03e5

