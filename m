From: Andreas Bofjall <andreas@gazonk.org>
Subject: [PATCH RESEND 0/3] Add Fintek F71869 and F71869A gpio support
Date: Mon,  9 Mar 2015 21:55:11 +0100
Message-ID: <1425934514-1023-1-git-send-email-andreas@gazonk.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxf3.bahnhof.se ([213.80.101.27]:57098 "EHLO mxf3.bahnhof.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752628AbbCIVbQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 17:31:16 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Les Schaffer <schaffer@optonline.net>, Andreas Bofjall <andreas@gazonk.org>

Hi,

this series adds support for the gpio pins on the Fintek F71869 and F71869A
SuperI/O chips to the gpio-f7188x driver. The chips are used on for example
Jetway motherboards.

The driver has been tested on two different boards: a JNF99-525 with F71869A,
and by Les Schaffer on a Jetway NF96u-525 with F71869.

Andreas Bofjall (3):
  gpio: f7188x: correct spelling of "Fintek"
  gpio: f7188x: add GPIO support for F71869
  gpio: f7188x: add GPIO support for F71869A

 drivers/gpio/Kconfig       |  4 ++--
 drivers/gpio/gpio-f7188x.c | 47 ++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 45 insertions(+), 6 deletions(-)

-- 
2.1.4

