From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/7] pinctrl: amlogic: gxbb: add nand pins
Date: Thu, 08 Sep 2016 11:09:03 -0700
Message-ID: <m28tv2nu0w.fsf@baylibre.com>
References: <1473261223-15412-1-git-send-email-jbrunet@baylibre.com>
        <1473261223-15412-3-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473261223-15412-3-git-send-email-jbrunet@baylibre.com> (Jerome
        Brunet's message of "Wed, 7 Sep 2016 17:13:38 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add EE domains pins for the NAND flash controller.
> Even tough we have no driver for the NAND flash controller yet, we need
> to have these pins in pinctrl as the actual pin are shared with the spifc
> controller. The bootloader on the S905-P200 setup pinmux for the NAND
> controller so we need the kernel to properly deactivate this if necessary.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
