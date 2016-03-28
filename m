From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [RFC PATCH] drivers: pinctrl: add driver for Allwinner A64 SoC
Date: Mon, 28 Mar 2016 21:45:46 +0530
Message-ID: <CABHD4K-nD9EvbgOPA2WH0q66csqVv18tmeTOBe87ACr4nuQM0A@mail.gmail.com>
References: <1451582246-32373-1-git-send-email-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33441 "EHLO
	mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754086AbcC1QPr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2016 12:15:47 -0400
In-Reply-To: <1451582246-32373-1-git-send-email-andre.przywara@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Hans de Goede <hdegoede@redhat.com>, linux-sunxi@googlegroups.com, linux@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello ,

> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "mic"),           /* DATA */
> +                 SUNXI_FUNCTION_IRQ(0x6, 11)),         /* EINT11 */
> +};
> +

Sorry to intervene here but is there any specific reason for not
covering Bank from PL0 - PL12(as it is mentioned in Datasheet) ?

Thanks,
Amit
