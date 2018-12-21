From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 3/3] pinctrl: dt-bindings: Fix the armada-37xx documentation
Date: Fri, 21 Dec 2018 18:32:59 +0100
Message-ID: <20181221173259.8372-4-gregory.clement@bootlin.com>
References: <20181221173259.8372-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221173259.8372-1-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: linux-gpio@vger.kernel.org

While it was possible to configure the PCIe1 Wakeup pin, it was missing
in the bidding, let's document it.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../bindings/pinctrl/marvell,armada-37xx-pinctrl.txt        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
index f69f82741cae..38dc56a57760 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
@@ -127,12 +127,16 @@ group pcie1_clkreq
  - pins 40
  - functions pcie, gpio
 
+group pcie1_wakeup
+ - pins 41
+ - functions pcie, gpio
+
 group smi
  - pins 54-55
  - functions smi, gpio
 
 group ptp
- - pins 56-58
+ - pins 56
  - functions ptp, gpio
 
 group ptp_clk
-- 
2.19.2
