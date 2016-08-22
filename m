From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/4] gpio: delete MODULE_ tags in non-modular drivers
Date: Mon, 22 Aug 2016 12:48:29 -0400
Message-ID: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@caiaq.de>, Juergen Beisert <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

A nice simple series, with zero runtime changes.  We delete tags like
MODULE_LICENSE, MODULE_AUTHOR (while ensuring the documentation at the
top of file reflects author and license) etc from bool drivers where
the tags are no-ops.

Then we are free to delete the module.h include, which we now know adds
about 750kB of output to an otherwise headerless empty file processed
by cpp.  In addition, it will be clear that the driver is non-modular
now, when inspecting the source code.

---

Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Daniel Mack <daniel@caiaq.de>
Cc: Juergen Beisert <kernel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: linux-gpio@vger.kernel.org

Paul Gortmaker (4):
  gpio: msic: drop unused MODULE_ tags from non-modular code
  gpio: mxc: drop unused MODULE_ tags from non-modular code
  gpio: spear-spics: drop unused MODULE_ tags from non-modular code
  gpio: vf610: drop unused MODULE_ tags from non-modular code

 drivers/gpio/gpio-msic.c        |  6 ------
 drivers/gpio/gpio-mxc.c         | 10 ++--------
 drivers/gpio/gpio-spear-spics.c |  7 +------
 drivers/gpio/gpio-vf610.c       |  7 +------
 4 files changed, 4 insertions(+), 26 deletions(-)

-- 
2.8.4
