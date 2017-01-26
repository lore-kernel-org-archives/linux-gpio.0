From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mvebu: remove unused variable
Date: Thu, 26 Jan 2017 15:18:02 +0100
Message-ID: <CACRpkdb3ULOZL=6FquLtJgARjPEg8o2PdxJPK-o=JOAqnyETXQ@mail.gmail.com>
References: <20170123121751.3218467-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123121751.3218467-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2017 at 1:17 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> A cleanup caused a harmless warning:
>
> drivers/pinctrl/mvebu/pinctrl-kirkwood.c: In function 'kirkwood_pinctrl_probe':
> drivers/pinctrl/mvebu/pinctrl-kirkwood.c:460:19: error: unused variable 'res' [-Werror=unused-variable]
>
> The obvious fix is to remove the declaration of the now unused
> variable.
>
> Fixes: ad9ec4ecee68 ("pinctrl: mvebu: switch drivers to generic simple mmio")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
