From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Subject: Re: [PATCH 1/2] MIPS: ath79: Remove the unused GPIO function API
Date: Sat, 4 Jul 2015 19:58:32 +0300
Message-ID: <CAHNKnsSgyzQu5uxZHu80X9MRQ5sJ+WEBatv9599QYxBsty66pg@mail.gmail.com>
References: <1435914709-15092-1-git-send-email-albeu@free.fr> <1435914709-15092-2-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1435914709-15092-2-git-send-email-albeu@free.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2015-07-03 12:11 GMT+03:00 Alban Bedel <albeu@free.fr>:
> To prepare moving the GPIO driver to drivers/gpio remove the
> platform specific pinmux API. As it is not used by any board,
> and such functionality should better be implemented using the
> pinmux subsystem just removing it seems to be the best option.
>
For reference: OpenWRT uses this functions to activate UART.

-- 
Sergey
