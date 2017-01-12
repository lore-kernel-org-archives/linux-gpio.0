From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd: avoid maybe-uninitalized warning
Date: Thu, 12 Jan 2017 08:49:52 +0100
Message-ID: <CACRpkdZrhrMi4SGa8RCwTzcLQDumEQjpw+LftLNEaxxRAZu8Vw@mail.gmail.com>
References: <20170111143712.510147-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170111143712.510147-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>, Pankaj Sen <Pankaj.Sen@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>, Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 11, 2017 at 3:36 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> Since gpio_dev->hwbank_num is now a variable, the compiler cannot
> figure out if pin_num is initialized at all:
>
> drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_dbg_show':
> drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    for (; i < pin_num; i++) {
>    ^~~
> drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
>
> This adds a 'default' statement to make that case well-defined.
>
> Fixes: 3bfd44306c65 ("pinctrl: amd: Add support for additional GPIO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
