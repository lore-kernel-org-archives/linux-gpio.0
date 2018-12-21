From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/3] Few fix for pins configuration on Armada 37xx
Date: Fri, 21 Dec 2018 18:32:56 +0100
Message-ID: <20181221173259.8372-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: linux-gpio@vger.kernel.org

Hello,

this small series fixes wrong pins configuration we currently have on
Armada 37xx.

For now it is especially annoying it we want to enable suspend to
RAM for PCie.

Gregory

Gregory CLEMENT (2):
  pinctrl: armada-37xx: add missing pin: PCIe1 Wakeup
  pinctrl: dt-bindings: Fix the armada-37xx documentation

Marek Behún (1):
  pinctrl: armada-37xx: Correct mpp definitions

 .../pinctrl/marvell,armada-37xx-pinctrl.txt   | 24 ++++++++++++++-----
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c   | 11 +++++----
 2 files changed, 25 insertions(+), 10 deletions(-)

-- 
2.19.2
