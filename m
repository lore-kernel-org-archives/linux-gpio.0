From: Rob Jones <rob.jones@codethink.co.uk>
Subject: [PATCH 0/3] use managed resources for gpio-regulator probe
Date: Tue, 10 Jun 2014 15:41:45 +0100
Message-ID: <1402411308-14182-1-git-send-email-rob.jones@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, ian.molton@codethink.co.uk, ben.dooks@codethink.co.uk, heiko@sntech.de, rob.jones@codethink.co.uk
List-Id: linux-gpio@vger.kernel.org

Change gpio-reulator-probe() to use managed resources.

Add new managed resource functions as needed to achieve this.

Amend the following functions:

devm_kstrdup()
gpio_regulator_probe()

Add the following functions:

devm_kmemdup()
devm_gpio_request_array()
devm_gpio_free_array()

Remove the following functions:

gpio_regulator_remove()
