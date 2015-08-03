From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] arm/dts/ls1021a: Add GPIO controller nodes
Date: Mon, 3 Aug 2015 10:10:56 +0200
Message-ID: <CACRpkdaSTOisTP-EdBe8qAFetOx1uehVP6qD9V-pXXmbCmKDLA@mail.gmail.com>
References: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
	<1438241239-15178-3-git-send-email-shaveta@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438241239-15178-3-git-send-email-shaveta@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shaveta Leekha <shaveta@freescale.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, r64188@freescale.com, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2015 at 9:27 AM, Shaveta Leekha <shaveta@freescale.com> wrote:

> Signed-off-by: Shaveta Leekha <shaveta@freescale.com>
> ---
> Tested on Freescale SDK 1.8, as LS1021aQDS support is not yet complete in upstream
(...)
> +               gpio1: gpio@2300000 {
> +                       compatible = "fsl,ls1021a-gpio";

Please patch
Documentation/devicetree/bindings/gpio/8xxx_gpio.txt

In patch 2/3 to provide this compatible string binding.

Yours,
Linus Walleij
