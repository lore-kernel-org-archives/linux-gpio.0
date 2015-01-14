From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: rcar: Fix error path for devm_kzalloc() failure
Date: Wed, 14 Jan 2015 14:13:43 +0100
Message-ID: <CACRpkdbrz_4cCa4S2aaz0LxsoWvZn1_hPDagC_LH0e=wJ2Bzog@mail.gmail.com>
References: <1421057279-16081-1-git-send-email-geert+renesas@glider.be>
	<1421057279-16081-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1421057279-16081-2-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 12, 2015 at 11:07 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> If the call to devm_kzalloc() fails, nothing must be cleant up.
> This was missed before because gpio_rcar_probe() had a "return"
> statement after the first "goto err0".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: df0c6c80232f2ad4 ("gpio: rcar: Add minimal runtime PM support")

Patch applied.

Yours,
Linus Walleij
