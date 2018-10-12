From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fix for v4.19
Date: Fri, 12 Oct 2018 10:30:18 +0200
Message-ID: <CACRpkdYaWwrwYvOK9PoFE7GvyAZxVA5JqPbCRSpLHLVcQubp6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Marco Felsch <m.felsch@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

Hi Greg,

Here is a last minute pin control fix for the v4.19 series.

Please pull it in. It fixes interrupts on the MCP23s08.

Yours,
Linus Walleij


The following changes since commit 0238df646e6224016a45505d2c111a24669ebe21:

  Linux 4.19-rc7 (2018-10-07 17:26:02 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.19-5

for you to fetch changes up to f259f896f2348f0302f6f88d4382378cf9d23a7e:

  pinctrl: mcp23s08: fix irq and irqchip setup order (2018-10-10 14:36:35 +0200)

----------------------------------------------------------------
A single pin control fix for v4.19:
- Interrupt setup in the MCP23S08 driver.

----------------------------------------------------------------
Marco Felsch (1):
      pinctrl: mcp23s08: fix irq and irqchip setup order

 drivers/pinctrl/pinctrl-mcp23s08.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)
