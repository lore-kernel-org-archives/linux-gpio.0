From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 0/2] mcp23s08 pinconf support
Date: Fri, 27 Jan 2017 15:47:36 +0100
Message-ID: <20170127144738.21107-1-sre@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

Here are two patches for the mcp23s08 driver adding proper support for the
pull-up resistors. The regmap conversion was mainly done to improve the
debugging capabilities, but is also a nice cleanup. Further cleanups could
be done by using regmap's caching instead of the open-coded one.

The patches were tested with a couple of mcp23017 connected to the I²C bus of
an RPi (and modified DT).

-- Sebastian

Sebastian Reichel (2):
  gpio: mcp23s08: use regmap
  gpio: mcp23s08: add pinconf support

 drivers/gpio/gpio-mcp23s08.c | 430 ++++++++++++++++++++++++++-----------------
 1 file changed, 261 insertions(+), 169 deletions(-)

-- 
2.11.0
