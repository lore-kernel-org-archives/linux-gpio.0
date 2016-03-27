From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RESEND] [RFC] gpio: gpio-it87: Add support for IT8620 and IT8628
Date: Sun, 27 Mar 2016 17:43:01 +0200
Message-ID: <1459093382-23119-1-git-send-email-martin.blumenstingl@googlemail.com>
References: <1459076863-26014-1-git-send-email-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33292 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752291AbcC0Pn1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2016 11:43:27 -0400
Received: by mail-wm0-f67.google.com with SMTP id 77so4175460wmi.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2016 08:43:26 -0700 (PDT)
In-Reply-To: <1459076863-26014-1-git-send-email-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: jdelvare@suse.com, linus.walleij@linaro.org, gnurou@gmail.com, denis@compulab.co.il, flameeyes@flameeyes.eu, cvubrugier@fastmail.fm

This patch adds support for the GPIOs on the IT8620 and IT8628.
According to [0] this seems to be a custom chip design (found on some
Gigabyte motherboards).
This patch allows controlling the GPIOs on those chips because some
models have controllable LEDs connected.

Unfortunately I do not have access to the datasheets. Thus I can only
test the code I have written with the hardware that I have (which
means: one LED connected to group 8 pin 0 and another one which is
controlled by group 8 pins 2 and 3).

PS: apologies for having to re-send this, I had a typo in the
(recipients of the) original email which seems to have made some
mail-servers drop the mail.


[0] http://www.spinics.net/lists/lm-sensors/msg44245.html

