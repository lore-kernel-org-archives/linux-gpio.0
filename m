From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] MIPS: ath79: Remove the unused GPIO function API
Date: Thu, 16 Jul 2015 14:44:09 +0200
Message-ID: <CACRpkdYgavq09dshgLZdo75KyuFwc4Cg0MosVgQN2KxW6VJt2w@mail.gmail.com>
References: <1435914709-15092-1-git-send-email-albeu@free.fr>
	<1435914709-15092-2-git-send-email-albeu@free.fr>
	<CAHNKnsSgyzQu5uxZHu80X9MRQ5sJ+WEBatv9599QYxBsty66pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHNKnsSgyzQu5uxZHu80X9MRQ5sJ+WEBatv9599QYxBsty66pg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Alban Bedel <albeu@free.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jul 4, 2015 at 6:58 PM, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
> 2015-07-03 12:11 GMT+03:00 Alban Bedel <albeu@free.fr>:
>> To prepare moving the GPIO driver to drivers/gpio remove the
>> platform specific pinmux API. As it is not used by any board,
>> and such functionality should better be implemented using the
>> pinmux subsystem just removing it seems to be the best option.
>>
> For reference: OpenWRT uses this functions to activate UART.

OpenWRT is wholeheartedly and warmly welcome to work upstream,
I will help whenever I can.

I have seen their patch stack and it makes me sad :(

Yours,
Linus Walleij
