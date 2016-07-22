From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [RESEND PATCH v5 0/1] USB: serial: GPIO support for cp210x
Date: Fri, 22 Jul 2016 11:33:14 +0100
Message-ID: <cover.1469182892.git.martyn.welch@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59703 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753298AbcGVKdg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2016 06:33:36 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Martyn Welch <martyn.welch@collabora.co.uk>

This patch series includes a resend of v5 of a patch to provide GPIO support
for cp210x.

Martyn Welch (1):
  USB: serial: cp210x: Adding GPIO support for CP2105

 drivers/usb/serial/cp210x.c | 351 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 348 insertions(+), 3 deletions(-)

-- 
1.8.3.1

