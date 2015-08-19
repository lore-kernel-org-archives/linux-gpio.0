From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 0/3] gpiolib: Initializing GPIOs using DT property gpio-initval
Date: Wed, 19 Aug 2015 12:18:29 +0200
Message-ID: <1439979512-3894-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:55137 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525AbbHSKTP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2015 06:19:15 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

Hi,

This series adds a gpio-initval property to the devicetree. It provides a way
to initialize GPIOs to a defined value.

The previous patch was '[PATCH v2] gpio: Allow hogged gpios to be requested'
which would have allowed to request hogged GPIOs. Linus suggested a separate DT
property as hogged gpios should not be requested.

There are 3 patches. The first two simplify the function gpiod_hog. The third
reuses the gpiod_hog()_code for a new gpiod_initialize() and adds the parsing
of the DT.

This series is based on the series
"[PATCH v3 0/9] gpiolib: Add GPIO name support".

Best regards,

Markus


Markus Pargmann (3):
  gpio: Use __gpiod_request directly
  gpiolib: gpiod_hog remove separate name argument
  gpiolib: Add GPIO initialization

 Documentation/devicetree/bindings/gpio/gpio.txt | 29 ++++++----
 drivers/gpio/gpiolib-of.c                       | 11 +++-
 drivers/gpio/gpiolib.c                          | 74 +++++++++++++++++--------
 drivers/gpio/gpiolib.h                          |  6 +-
 4 files changed, 83 insertions(+), 37 deletions(-)

-- 
2.4.6

