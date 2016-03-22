From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 74x164: Implement gpiochip.set_multiple()
Date: Tue, 22 Mar 2016 11:54:01 +0100
Message-ID: <CACRpkdaG6npPrGV4MwA+28CDnCxDxtdvDerupEXnqjcee67Xzw@mail.gmail.com>
References: <1457968758-22670-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457968758-22670-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 14, 2016 at 4:19 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This allows to set multiple outputs using a single SPI transfer.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied for v4.7 with Phil's Review tag.

Yours,
Linus Walleij
