From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Correct meaning of the GPIO active low flag
Date: Mon, 10 Feb 2014 15:33:11 +0100
Message-ID: <4298328.sSSAEV5F8t@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:39759 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791AbaBJOcJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2014 09:32:09 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>

Hello everybody,

While working on Dt support for a driver that uses GPIO I came to ponder about 
the correct meaning of the GPIO active low flag. I'm bringing the question to 
the mailing list to get feedback.

When a device has an active low input, the fact that the input is active low 
is a property of the device, and thus known to the driver. On the other hand, 
if an inverter is present on the board, that information isn't known to device 
drivers and need to be expressed in DT.

Does the active low flag express the latter only, or both of them ? To ask the 
question differently, should the low flag model the inverter inside the 
device, known to the device driver, effectively moving handling of that 
inverter out of the device driver to the core code, or should it stop at the 
device boundary and only model the board ?

As an example, if my device datasheet states that the reset input is active 
low, an no inverter is present on the GPIO line, should I set the GPIO active 
low flag in DT and set the GPIO value to 1 in software (assuming I use the 
gpiod_* API) to make the reset signal active, or should I set the GPIO active 
high flag in DT and the the GPIO value to 0 in software ?

Let's also keep in mind that devices can have programmable polarities for 
inputs connected to GPIO-driven signals, in which case the internal polarity 
inversion is dynamic and can't be expressed in the GPIO propery in DT.

-- 
Regards,

Laurent Pinchart

