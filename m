From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 0/4] gpio: pca953x updates for DT
Date: Tue, 29 Jul 2014 09:24:42 +0200
Message-ID: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33085 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752223AbaG2HZx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jul 2014 03:25:53 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

Hi,

here are some updates for the pca953x driver for handling DT. The series
includes some cleanup of deprecated DT properties, adds documentation and
handling of reset gpio for the chip.

Best regards,

Markus


Markus Pargmann (4):
  gpio: pca953x: Drop deprecated DT bindings
  gpio: pca953x: Add DT binding documentation
  gpio: pca953x: Add pca9506 as DT compatible
  gpio: pca953x: Add DT binding for reset gpio

 .../devicetree/bindings/gpio/gpio-pca953x.txt      | 45 +++++++++++++
 drivers/gpio/gpio-pca953x.c                        | 73 +++++++---------------
 2 files changed, 67 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt

-- 
2.0.1

