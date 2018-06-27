From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/5] pinctrl_gpio_get_direction & ingenic fixes
Date: Wed, 27 Jun 2018 13:48:59 +0200
Message-ID: <20180627114904.10890-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Here's a set of (rather RFC) patches, to implement
pinctrl_gpio_get_direction(). I did that, because my gpio-ingenic driver
calls pinctrl_gpio_set_direction() within its gpio_chip's .set_direction
callback, but there was no corresponding function to implement the
.get_direction callback. If that's not the right way to do it, please
advise.

If not merging the whole series, patch [3/5] is a real fix that should
go through.

Note that it doesn't make checkpatch.pl happy, I wasn't sure whether I
should try to comply to checkpatch.pl or match the coding style in the
pinctrl subsystem, I chose the latter.

Thanks,
-Paul
