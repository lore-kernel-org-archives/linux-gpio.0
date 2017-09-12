From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sprd: add missing Kconfig dependency
Date: Tue, 12 Sep 2017 09:40:39 +0200
Message-ID: <CACRpkdYr0kdLdo+_B6-oado-3anCAaoxQXAdbzy_zm+n4AGB4A@mail.gmail.com>
References: <20170905075826.893066-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905075826.893066-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2017 at 9:58 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> The chip-specific driver fails to build when the common
> part is not enabled first:
>
> drivers/pinctrl/sprd/pinctrl-sprd-sc9860.o:(.data+0x8): undefined reference to `sprd_pinctrl_remove'
> drivers/pinctrl/sprd/pinctrl-sprd-sc9860.o:(.data+0x10): undefined reference to `sprd_pinctrl_shutdown'
>
> This adds a Kconfig dependency to ensure this is always
> the case.
>
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I got a fix for this and the other problem from Randy Dunlap already.
Thanks anyway!

Yours,
Linus Walleij
