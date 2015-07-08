From: Alban <albeu@free.fr>
Subject: Re: [PATCH 1/2] MIPS: ath79: Remove the unused GPIO function API
Date: Wed, 8 Jul 2015 10:55:14 +0200
Message-ID: <20150708105514.1156aba3@tock>
References: <1435914709-15092-1-git-send-email-albeu@free.fr>
	<1435914709-15092-2-git-send-email-albeu@free.fr>
	<CAHNKnsSgyzQu5uxZHu80X9MRQ5sJ+WEBatv9599QYxBsty66pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHNKnsSgyzQu5uxZHu80X9MRQ5sJ+WEBatv9599QYxBsty66pg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Aban Bedel <albeu@free.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, 4 Jul 2015 19:58:32 +0300
Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:

> 2015-07-03 12:11 GMT+03:00 Alban Bedel <albeu@free.fr>:
> > To prepare moving the GPIO driver to drivers/gpio remove the
> > platform specific pinmux API. As it is not used by any board,
> > and such functionality should better be implemented using the
> > pinmux subsystem just removing it seems to be the best option.
> >
> For reference: OpenWRT uses this functions to activate UART.

The pinctrl-single driver should be usable for all SoC where this code
was used. I haven't tried it yet, but it should only be a matter of
writing the DTS down.

Alban
