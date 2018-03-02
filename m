From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: raspberrypi-exp: explain Kconfig dependency
Date: Fri, 2 Mar 2018 13:00:59 +0100
Message-ID: <CACRpkdaS2cYCZiT4VJ4Nji3=j_MTtxCNuDWUi8T8Nvm4dJgrcQ@mail.gmail.com>
References: <3c3b8755d186b1f762081ee18efb718886814e51.1519984021.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3c3b8755d186b1f762081ee18efb718886814e51.1519984021.git.baruch@tkos.co.il>
Sender: linux-kernel-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dave Stevenson <dave.stevenson@raspberrypi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 2, 2018 at 10:47 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Commit 7ed915059c3001 (gpio: raspberrypi-ext: fix firmware dependency)
> fixed the Kconfig dependency to ensure that gpio-raspberrypi-exp is not
> built-in when the firmware is a module. But the Kconfig syntax for doing
> so is cryptic. Add a comment to make it a little easier.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Patch applied.

Yours,
Linus Walleij
