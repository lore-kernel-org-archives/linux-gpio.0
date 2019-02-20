From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] drivers: new helper for ioremapping memory resources
Date: Wed, 20 Feb 2019 12:12:38 +0100
Message-ID: <20190220111240.10041-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are currently 1200+ instances of using platform_get_resource()
and devm_ioremap_resource() together in the kernel tree. It's a minor
redundancy, but consolidation is always good.

The first patch in this series adds a wrapper for these two calls and
the second uses it in a driver I could test.

If accepted I'll prepare a coccinelle script that'll make it easier
to convert all users.

v1 -> v2:
- EXPORT_SYMBOL() -> EXPORT_SYMBOL_GPL()

Bartosz Golaszewski (2):
  drivers: provide devm_platform_ioremap_resource()
  gpio: davinci: use devm_platform_ioremap_resource()

 drivers/base/platform.c         | 18 ++++++++++++++++++
 drivers/gpio/gpio-davinci.c     |  4 +---
 include/linux/platform_device.h |  3 +++
 3 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.20.1
