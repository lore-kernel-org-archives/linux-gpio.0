From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] ARM: ks8695: move gpio code back into platform
Date: Tue, 23 Apr 2019 12:44:55 +0200
Message-ID: <CACRpkdbU3=Jpt=41rfTV4OF6DU8kDLzjTJXqHcifA3A4B7XyKw@mail.gmail.com>
References: <20190415202501.941196-1-arnd@arndb.de> <20190415202501.941196-4-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415202501.941196-4-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Ungerer <gerg@uclinux.org>, arm-soc <arm@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 15, 2019 at 10:27 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Properly splitting this out into a portable driver is
> hard, as the gpio code tightly interacts with the irqchip
> code. Give up and move it back to its original location,
> but make the headers private in the process.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I bet a million to one it "just" needs to be reworked into a hierarchical
interrupt controller with the GPIO at the level below the irqchip adding
level semantics.

I did provide an example of how to do this in the ixp4xx patchset, but
if you don't have the hardware at hand I would not recommend trying
it.

With the goal of getting a better build for ARM32 maintenance I
think this is a lesser evil, so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
