From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 0/2] FTDI CBUS GPIO support
Date: Sun, 21 Jun 2015 00:12:55 +0200
Message-ID: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:50626 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752234AbbFTWNE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2015 18:13:04 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: johan@kernel.org, linus.walleij@linaro.org, gnurou@gmail.com
Cc: grant.likely@secretlab.ca, gregkh@linuxfoundation.org, x-linux@infra-silbe.de, hachti@hachti.de, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

Yet another FTDI GPIO patchset. Yet somewhat different to previous
implementations...

There are three GPIO modes supported by FTDI devices:
1. Asynchronous Bit Bang Mode (used in Sacha's patch)
2. Synchronous Bit Bang Mode (used in Philipp's patch)
3. CBUS Bit Bang Mode (used in Philipp's patch and this patchset)

Previous implementations:
- Philipp Hachtmann (https://lkml.org/lkml/2014/5/31/181)
- Sascha Silbe (https://lkml.org/lkml/2014/6/9/406)

The first two modes allow to control the serial pins and use the USB
standard data transfer (write/read) to set the GPIO output values. Hence
these modes interference with the standard serial mode of the devices,
but are fast. The third option uses the USB control transfer to set
GPIOs (which makes bit banging slower), and allows to control only 4
pins. The controllable pins are predefined per device type (in FT232R
CBUS0-3, in FT232H ACBUS5-9) and are not required for standard
UART/serial communication. However, the default configuration is set to
auxiliary functions such as TX/RXLED. Hence to make use of them in CBUS
Bit Bang mode, the pins need to be reprogrammed to I/O mode first
(EEPROM). All three modes are supported from userspace by libftdi afaik.

In my use case I would like to use the additional GPIOs to control an
embedded board (power off/reset etc.) and use the serial communication
alongside. Using libftdi to use the CBUS Bit Bang mode is cumbersome,
since libftdi requires to detach the kernel driver to get access to the
device. The user needs then to reconnect the serial terminal every time
a GPIO has been used. Hence, if any of these modes, I see most value in
supporting the CBUS mode through the kernel's gpiolib API. However,
since some functions are shared (e.g. set_bitmode to enable the
different bit modes), this patchset is does some ground work for the
other modes too, in case anybody wants to do further work on them.

This patchset currently supports FT232R type of devices and has been
tested using a FT232RL device. I think the FT232H (and probably later)
types of devices should work too (at least the Table 3.5 in the FT232H
data sheet mentions the ACBUS Signal Option "I/O mode"). However, I
don't have such a device to test at my disposal.

On the implementation side, I created a distinct GPIO driver in
drivers/gpio and create that platform device directly from within the
ftdi_sio driver. I understand that the mfd subsystem would be the way to
go, however it seems to me quite a big change... At least all USB device
IDs would need to be moved to the mfd core device since the mfd device
would be registered as a USB driver. I guess the ftdi_sio driver would
become a platform device and still live under drivers/usb/serial/...?

I just saw that recent discussion by Grant and Linus did not approve
this approach...?

Stefan Agner (2):
  USB: ftdi_sio: add CBUS mode for FT232R devices
  gpio: gpio-ftdi-cbus: add driver for FTDI CBUS GPIOs

 drivers/gpio/Kconfig          |  10 +++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-ftdi-cbus.c | 167 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/serial/ftdi_sio.c |  57 ++++++++++++++
 drivers/usb/serial/ftdi_sio.h |  22 ++++++
 include/linux/usb/ftdi_sio.h  |  32 ++++++++
 include/linux/usb/serial.h    |   2 +
 7 files changed, 291 insertions(+)
 create mode 100644 drivers/gpio/gpio-ftdi-cbus.c
 create mode 100644 include/linux/usb/ftdi_sio.h

-- 
2.4.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
