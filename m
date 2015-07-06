From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] MIPS: ath79: Move the GPIO driver to drivers/gpio
Date: Mon, 6 Jul 2015 12:36:37 +0200
Message-ID: <CACRpkdbS8mTLN0de6neJNk=+0VBNZOwhzT-18CSS8n=uwLGa1A@mail.gmail.com>
References: <1435914709-15092-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435914709-15092-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jul 3, 2015 at 11:11 AM, Alban Bedel <albeu@free.fr> wrote:

> as requested when I posted the ATH79 OF support serie, here is the move of
> the GPIO driver to the GPIO drivers directory. While at it I also removed
> the custom pinmux API as it not used by any board.

First:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please apply to the MIPS tree, because it is better to have all
GPIO mess collected in one place than spread out over the kernel.

Admittedly not having it in "my" folder makes me sloppy and not try to
push for modernizing the GPIO driver(s)...

This driver could use some modernization and platform cleanup though.
I'll comment on the move patch for reference, don't see it as any blocker,
more as a TODO list.

Yours,
Linus Walleij
