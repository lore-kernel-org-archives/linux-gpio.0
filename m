From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 74x164: Implement gpiochip.set_multiple()
Date: Tue, 22 Mar 2016 11:56:50 +0100
Message-ID: <CACRpkda38uz2dDwyCPA4YucfMS3Jjjkz00oPOmmkK7rXZatRNg@mail.gmail.com>
References: <1457968758-22670-1-git-send-email-geert+renesas@glider.be>
	<56E789C1.2070907@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56E789C1.2070907@electromag.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>, Axel Lin <axel.lin@ingics.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2016 at 5:04 AM, Phil Reid <preid@electromag.com.au> wrote:

> pca953x does not update the cached data unless the write operation
> was successful. Which I folowed with the implement of set_multiple.
> However a number of other drivers update regardless.
> eg chip->buffer is updated even if the write_config fails.
>
> What is the preferred approach?

Obviously the other drivers are buggy and need to be fixed.
It can't be too many since the number of drivers with failable
write operations aren's so many. (And I guess they seldom fail
so it's not a big real world problem.) But it should be fixed.

Add Axel Lin to the thread, he's awesome at finding semantic
bugs.

Patches accepted :)

Yours,
Linus Walleij
