From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/4] pinctrl: meson-gxbb: add a bunch more pins
Date: Thu, 26 May 2016 14:24:21 -0700
Message-ID: <1464297865-8965-1-git-send-email-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:35394 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755127AbcEZVY1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2016 17:24:27 -0400
Received: by mail-pa0-f51.google.com with SMTP id fy7so16635373pac.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2016 14:24:27 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>

Add support for several more devices, both in the EE domain and in the
AO domain.  Also, add the pins to the corresponding DTS files.

Tested on odroid-c2 and Amlogic P200 boards, and verified with working
ethernet.

Changes since v1:
- dropped the rename of uart_ao -> uart_ao_a (will be done as follow-up)
- rebased on linus/master
- dropped DT from series (will be merged through arm-soc)

Kevin

Kevin Hilman (4):
  pinctrl: amlogic: gxbb: add UART_AO_B, I2C
  pinctrl: amlogic: gxbb: add EMMC and SD pins
  pinctrl: amlogic: gxbb: add more UART pins
  pinctrl: amlogic: gxbb: add ethernet pins

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 163 ++++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 1 deletion(-)

-- 
2.7.4

