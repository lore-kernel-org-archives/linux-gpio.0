From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [PATCH v5 0/2] USB: serial: GPIO support and GE Device ID for cp210x
Date: Tue, 29 Mar 2016 17:47:27 +0100
Message-ID: <cover.1459269397.git.martyn.welch@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44203 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752704AbcC2Qrq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2016 12:47:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, Martyn Welch <martyn.welch@collabora.co.uk>

This patch series includes v5 of a patch to provide GPIO support for cp210x. I
have also included a patch to add the vendor/device ID for the GE Healthcare
Remote Alarm Box, which uses this chip.

Martyn Welch (2):
  USB: serial: cp210x: Adding GPIO support for CP2105
  USB: serial: cp210x: Adding GE Healthcare Device ID

 drivers/usb/serial/cp210x.c | 354 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 350 insertions(+), 4 deletions(-)

-- 
1.8.3.1

