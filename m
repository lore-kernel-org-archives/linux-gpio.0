From: Nandor Han <nandor.han@ge.com>
Subject: [PATCH 0/3] XRA1403,gpio - add XRA1403 gpio expander driver
Date: Mon, 27 Mar 2017 09:22:59 +0300
Message-ID: <cover.1490595641.git.nandor.han@ge.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00176a03.pphosted.com ([67.231.149.52]:52801 "EHLO
        mx0a-00176a03.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751465AbdC0Hki (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Mar 2017 03:40:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nandor Han <nandor.han@ge.com>

The patchset will add a driver to support basic functionality for
XRA1403 device. Features supported:
	- configure gpin as input/out
	- get/set gpio status

Documentation: A gpio-xra1403.txt file was added to document the DTS
	bindings related to driver.

Testing:

1. XRA1403 connected to iMX53 MCU
2. Export gpio from userspace
3. Verify that corresponding gpio directories are created
   in `/sys/class/gpio/gpioXX`
4. Export gpios from first and second bank as output
5. Set the output gpio pin to high/low and verify with the 
   oscilloscope that gpio status is according with the configured
   value.

Nandor Han (3):
  gpio - Add EXAR XRA1403 SPI GPIO expander driver
  doc,dts - add XRA1403 DTS binding documentation
  Add XRA1403 support to MAINTAINERS file

 .../devicetree/bindings/gpio/gpio-xra1403.txt      |  37 +++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   8 +
 drivers/gpio/Kconfig                               |   5 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-xra1403.c                        | 252 +++++++++++++++++++++
 6 files changed, 304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
 create mode 100644 drivers/gpio/gpio-xra1403.c

-- 
2.10.1

