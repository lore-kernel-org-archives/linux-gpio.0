From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/2] pinctrl: convert palmas and as3722 to tristate
Date: Mon, 13 Jun 2016 17:10:20 -0400
Message-ID: <20160613211022.32033-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

As part of a previous review[1], these two drivers (currently bool) were
nominated by their author to be converted to tristate (vs. removing the
existing modular references.)

Upon detecting a non-modular driver making modular references, I don't
immediately convert them to tristate, since it increases functionality
that I can't readily test, and it may not have a sensible use case (e.g.
in the case of core arch support relating to timer ticks or similar.)
So instead the modular references are removed w/o changing the existing
functionality by default.

However there is no reason the original author or an interested user
with the capability to test can't nominate the driver to be tristate
either as the original intent, or as a functional and tested use case.

Here we convert two drivers to tristate and ensure that they can compile
and pass modpost without suffering unresolved symbols:

paul@builder:~/git/linux-head$ ls -l ../arm-build/drivers/pinctrl/*ko
[...]
-rw-rw-r-- 1 paul paul 15585 Jun 13 15:49 ../arm-build/drivers/pinctrl/pinctrl-as3722.ko
-rw-rw-r-- 1 paul paul 25497 Jun 13 15:49 ../arm-build/drivers/pinctrl/pinctrl-palmas.ko
paul@builder:~/git/linux-head$

To be clear, I don't have the hardware required for runtime testing of
the modular instances, and hence that remains to be done by someone
with the hardware and the desire to have the driver(s) modular.

That said, this change won't regress any existing users who are relying
on the current built-in behaviour, so merging doesn't need to be
conditional on obtaining run time testing of the modular instances.

Paul.

[1] https://lkml.kernel.org/r/1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com
---

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org


Paul Gortmaker (2):
  pinctrl: palmas: convert PINCTRL_PALMAS from bool to tristate
  pinctrl: as3722: convert PINCTRL_AS3722 from bool to tristate

 drivers/pinctrl/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.8.4
