From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/2] gpio: aspeed: Implement banks Y, Z, AA, AB and AC
Date: Tue, 24 Jan 2017 16:46:44 +1030
Message-ID: <20170124061646.9317-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

v2 simply fixes an issue identified by the kbuild test robot. v1 is available
at: https://lkml.org/lkml/2017/1/23/12

This short series resolves a TODO comment in the Aspeed GPIO driver regarding
banks Y, Z, AA, AB and AC by implementing their support. It's a little involved
given some of the characteristics of these banks, but hopefully nothing too
controversial.

Cheers,

Andrew

Andrew Jeffery (1):
  gpio: aspeed: Add banks Y, Z, AA, AB and AC

Joel Stanley (1):
  gpio: aspeed: Make bank names strings

 drivers/gpio/gpio-aspeed.c | 187 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 166 insertions(+), 21 deletions(-)

-- 
2.9.3
