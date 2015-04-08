From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mvebu: Fix mask/unmask managment per irq chip type
Date: Wed, 8 Apr 2015 16:35:48 +0200
Message-ID: <CACRpkdYRnjE_26=yiA-dS9DYXgiLeA7zD8i7uxoZqotDcC+yMA@mail.gmail.com>
References: <1427987471-20419-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1427987471-20419-1-git-send-email-gregory.clement@free-electrons.com>
Sender: stable-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 2, 2015 at 5:11 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> Level IRQ handlers and edge IRQ handler are managed by tow different
> sets of registers. But currently the driver uses the same mask for the
> both registers. It lead to issues with the following scenario:
>
> First, an IRQ is requested on a GPIO to be triggered on front. After,
> this an other IRQ is requested for a GPIO of the same bank but
> triggered on level. Then the first one will be also setup to be
> triggered on level. It leads to an interrupt storm.
>
> The different kind of handler are already associated with two
> different irq chip type. With this patch the driver uses a private
> mask for each one which solves this issue.
>
> It has been tested on an Armada XP based board and on an Armada 375
> board. For the both boards, with this patch is applied, there is no
> such interrupt storm when running the previous scenario.
>
> This bug was already fixed but in a different way in the legacy
> version of this driver by Evgeniy Dushistov:
> 9ece8839b1277fb9128ff6833411614ab6c88d68 "ARM: orion: Fix for certain
> sequence of request_irq can cause irq storm". The fact the new version
> of the gpio drive could be affected had been discussed there:
> http://thread.gmane.org/gmane.linux.ports.arm.kernel/344670/focus=364012
>
> Reported-by: Evgeniy A. Dushistov <dushistov@mail.ru>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: <stable@vger.kernel.org> # v3.7 +

Patch applied.

Yours,
Linus Walleij
