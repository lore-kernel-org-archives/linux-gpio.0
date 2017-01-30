From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 0/5] gpio: Add support for GPIO names for several ISA_BUS_API drivers
Date: Mon, 30 Jan 2017 12:04:56 -0500
Message-ID: <cover.1485795642.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

This patchset sets the gpio_chip names option of several ISA_BUS_API
GPIO drivers with an array of GPIO line names that match their
respective manual documentation. This should make it easier for users to
identify which GPIO line corresponds to a respective GPIO pin on their
device.

William Breathitt Gray (5):
  gpio: 104-dio-48e: Add support for GPIO names
  gpio: 104-idi-48: Add support for GPIO names
  gpio: 104-idio-16: Add support for GPIO names
  gpio: gpio-mm: Add support for GPIO names
  gpio: ws16c48: Add support for GPIO names

 drivers/gpio/gpio-104-dio-48e.c | 23 ++++++++++++++++++++++-
 drivers/gpio/gpio-104-idi-48.c  | 15 ++++++++++++++-
 drivers/gpio/gpio-104-idio-16.c | 11 ++++++++++-
 drivers/gpio/gpio-gpio-mm.c     | 15 ++++++++++++++-
 drivers/gpio/gpio-ws16c48.c     | 19 ++++++++++++++++++-
 5 files changed, 78 insertions(+), 5 deletions(-)

-- 
2.11.0
