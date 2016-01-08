From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: CP2105 GPIO Pins
Date: Fri, 08 Jan 2016 11:14:31 +0000
Message-ID: <568F9A17.809@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59528 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932213AbcAHLOf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2016 06:14:35 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Hi Linus,

I'm working on adding support to the cp210x driver for the optional GPIO 
pins available on Silicon Labs CP2105 USB to serial bridge.

Some hardware implementation details have got me wondering how best to 
provide support through the GPIO framework.

The device has 5 pins that can be GPIO. The pins that provide these GPIO 
are muxed with serial control signals of the 2 serial ports the device 
provides, though the GPIO is enabled by default.

The GPIO pins can be configured as either push-pull or open-drain, with 
a internal weak pullup. The pins are open-drain by default. There is no 
explicit "input" mode, though it is possible to sense the state of the 
pin independent of the state being driven.

Configuration of the muxing and GPIO mode is stored in one-time 
programmable PROM built into the chip and can't be changed at runtime.

The muxing is done for all pins associated with a port in one go. I 
think I can determine at runtime when pins are used as serial control 
signals, so currently have the pins split into 2 banks (each bank 
providing the GPIO from pins associated with a port).

I believe I can also determine when pins are configured as push-pull or 
open-drain. Pins configured as push-pull clearly can't be used as 
inputs. Pins in open-drain mode, if not internally pulled to ground, 
could be used as an input.

I can allow open-drain pins to be configured as input (and arrange for 
the pin to not be pulled low when it is), but the GPIO documentation 
suggests that the output state of GPIO should be able to be set prior to 
switching between input and output mode. This could be achieved by 
storing a bit masks of values and directions, however this would require 
locking to avoid race conditions and the documentation also suggests 
that locking should be avoided in the get, set and direction functions, 
so that the drivers can be used by and -RT kernel (I appreciate this a 
USB device, so less likely to be used in a real time context).

If such a scheme really isn't suitable, alternatively the pins could be 
output only, with the user still being able to sense the pin state as 
long as the pin is not set to pull the pin low. The disadvantage of not 
allowing the pins to be configured as input is that users will 
(ironically) not be able to use one of the pins with the 
"GPIOF_OPEN_DRAIN" flag set as this attempts to set the pin as input 
instead of a high state. "GPIOF_OPEN_SOURCE" is broken on this hardware 
either way.

How do you think it would be best to proceed?

Martyn
