From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/5] gpio: remove broken irq_to_gpio() interface
Date: Fri, 19 Feb 2016 00:19:46 +0100
Message-ID: <CACRpkdaNA0p95f8i4o0+Abqc-YshvaBhOBAWbi=s1AfFmeHY_A@mail.gmail.com>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
	<1455637261-2920972-1-git-send-email-arnd@arndb.de>
	<1455637261-2920972-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455637261-2920972-2-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 16, 2016 at 4:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> gpiolib has removed the irq_to_gpio() API several years ago,
> but the global header still provided a non-working stub.
>
> To prevent new users of this broken function from showing
> up, let's remove the stubs as well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
