From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/2] pinctrl: sx150x: set multiple pins at once
Date: Tue, 22 Nov 2016 17:06:00 +0100
Message-ID: <1479830762-1839-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi!

I have only tested this on an 8-bit sx1502, so I'm uncertain if
the there needs to be locking for this to work as intended for
the bigger chips with an oscio pin? Probably.

So, I didn't add (or rather, removed) these lines at the end of
sx150x_gpio_set_multiple() and made the op optional instead.

	if (*mask & pctl->oscio_mask)
		sx150x_gpio_oscio_set(pctl, *bits & pctl->oscio_mask);

I mean, what happens if there are two users writing multiple pins
where one of the pins is the oscio pin, and this happens concurrently?
I get the feeling that there is nothing stopping interleaving in that
case, and you could end up with the desired values from user 1 for the
normal pins, and the desired value for the oscio pin from user 2.

But for the easy case (no oscio) where the existing regmap locking
holds, this is a nice speedup and desired behaviour without a lot
of individual pin changes.

Cheers,
Peter

Peter Rosin (2):
  pinctrl: sx150x: various spelling fixes and some white-space cleanup
  pinctrl: sx150x: support setting multiple pins at once

 drivers/pinctrl/pinctrl-sx150x.c | 50 ++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 15 deletions(-)

-- 
2.1.4
