From: Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH] drivers/pinctrl: Add pinctrl-ast2400
Date: Fri,  6 May 2016 15:50:07 +0930
Message-ID: <1462515608-20566-1-git-send-email-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>
List-Id: linux-gpio@vger.kernel.org

Hi all,

This is a patch partially implementing a pinctrl/pinmux driver for the Aspeed
AST2400 ARM SoC, complementing Joel Stanley's recent series[1] adding the core
support for the chip. With additional integration patches there's enough pinmux
to boot the SoC and configure a number of i2c busses, but not much more.

I'm posting it as an RFC for several reasons:

* This is my first attempt at a pinmux driver (and first significant kernel
  patch) and so I've probably made mistakes and overlooked useful interfaces or
  patterns

* The hardware seems funky and makes things tedious. Configuring a
  mux function often requires writing multiple bits to multiple registers,
  sometimes for each pin in a bus

* I've added a fair bit of commentary to the implementation to explain the
  approach. Likely some of it is considered common knowledge and can be
  stripped out, so thoughts there would be appreciated. Maybe it's too verbose
  and is more confusing than helpful. The datasheet isn't publicly available so
  I went with more-is-better.

* It makes heavy use of macros to "simplify" the pin/function declarations.
  Maybe it's too much of a macro hell. Maybe there's an alternative
  representation that's less dependent on interlinked structures. Maybe more
  should be pushed into devicetree? In any case, I've kernel-doc'ed the
  high-level macros to describe their use.

As mentioned the driver not complete and the patch doesn't integrate it in any
way, the implementation only describes a subset of the functions and pins
available and pinconf isn't yet handled. To be useful in the system I'm testing
against (an OpenPOWER Palmetto BMC) we need more pins configured as GPIO, but I
held off on implementing functionality for all required pins in order to first
get some feedback on the approach.

Cheers,

Andrew

[1] http://www.spinics.net/lists/arm-kernel/msg498895.html

Andrew Jeffery (1):
  drivers/pinctrl: Add pinctrl-ast2400

 drivers/pinctrl/pinctrl-ast2400.c | 1488 +++++++++++++++++++++++++++++++++++++
 1 file changed, 1488 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-ast2400.c

-- 
2.7.4
