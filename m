From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/1] gpio: of: prepare for switching stmmac to GPIO descriptors
Date: Mon, 10 Jun 2019 19:05:22 +0200
Message-ID: <20190610170523.26554-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Cc: andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

This is a preparation patch which is needed before we can switch stmmac
to GPIO descriptors. stmmac has a custom "snps,reset-active-low"
property because it has ignored the GPIO flags including the polarity.

Add the parsing to gpiolib-of so we can port stmmac over to GPIO
descriptors.

This patch is split from my series at [0].

Linus W.: please create an immutable branch as discussed so I can send
the stmmac patches to the net-next tree (which will then have to pull
in your immutable branch).


[0] https://patchwork.kernel.org/cover/10983801/


Martin Blumenstingl (1):
  gpio: of: parse stmmac PHY reset line specific active-low property

 drivers/gpio/gpiolib-of.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.22.0
