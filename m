From: Sam Protsenko <semen.protsenko@globallogic.com>
Subject: Re: [PATCH] gpio: max732x: Add IRQF_SHARED to irq flags
Date: Wed, 6 May 2015 16:27:02 +0300
Message-ID: <CAJOTznXawHyRmWd6e3TajriTOE4+ybvho=OyF46MuLdfRP8x5w@mail.gmail.com>
References: <1429622344-19429-1-git-send-email-semen.protsenko@globallogic.com>
	<CACRpkda5jrEcFuQKb63FbeggNWvJBYo4bbnrGecQnWTipdwxjQ@mail.gmail.com>
Reply-To: semen.protsenko@globallogic.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda5jrEcFuQKb63FbeggNWvJBYo4bbnrGecQnWTipdwxjQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 6, 2015 at 4:07 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> Since you're doing these patches I assume my conversion to
> GPIOLIB_IRQCHIP in the last merge window just worked.

Actually I've only verified those patches on k3.14, and tested that mainline
kernel builds successfully (with patches applied). For the moment I don't have
the board with MAX732X where I can't test the last kernel. But I'm finishing
building my own MAX7325 test board, and once it finished, I can verifyall mine
and yours patches on my BeagleBone Black (connected to my MAX7325 board).

But I'm pretty sure that all mentioned patches are gonna work just fine
(since my changes are really minimal and well-tested on k3.14, and things
affected by my patches weren't really changed since then).
