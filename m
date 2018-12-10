From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: RE: [PATCH] regmap: regmap-irq/gpio-max77620: add level-irq support
Date: Mon, 10 Dec 2018 14:59:00 +0000
Message-ID: <042F8805D2046347BB8420BEAE397A4066F2EA76@WILL-MAIL001.REu.RohmEu.com>
References: <20181210081437.GA32228@localhost.localdomain>,<201812102217.lQnGrdFE%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201812102217.lQnGrdFE%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "rafael@kernel.org" <rafael@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>
List-Id: linux-gpio@vger.kernel.org


________________________________________
From: kbuild test robot [lkp@intel.com]
Sent: Monday, December 10, 2018 4:19 PM
To: Vaittinen, Matti
Cc: kbuild-all@01.org; Vaittinen, Matti; mazziesaccount@gmail.com; broonie@kernel.org; gregkh@linuxfoundation.org; rafael@kernel.org; linus.walleij@linaro.org; linux-kernel@vger.kernel.org; linux-gpio@vger.kernel.org; Haikola, Heikki; Mutanen, Mikko
Subject: Re: [PATCH] regmap: regmap-irq/gpio-max77620: add level-irq support

> Hi Matti,
>
>Thank you for the patch! Yet something to improve:

>> drivers/gpio/gpio-max77620.c:33:40: error: expected '}' before ';' token
      .types_supported = IRQ_TYPE_EDGE_BOTH;

Sorry folks, something that should not have happened... Please ignore this patch - I'll send new one where I also do ensure the max77620 gets compile tested - tomorrow.

Br.
Matti Vaittinen
