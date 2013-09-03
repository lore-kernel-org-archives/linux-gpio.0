From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: Fix crash in gpiod_set_debounce()
Date: Tue, 3 Sep 2013 14:10:51 +0200
Message-ID: <CACRpkdZyQQ0io9dPsmAs1xyoFgo0u262SZd3B=oUgh8gdWiGFQ@mail.gmail.com>
References: <1378204768-18013-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378204768-18013-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 3, 2013 at 12:39 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> Return an error if neither the ->set() nor the ->set_debounce() function
> is implemented by the chip. Furthermore move locking further down so the
> lock doesn't have to be unlocked on error. This is safe to do because at
> this point the lock doesn't protect anything.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Linus,
>
> Feel free to squash this into the commit that introduced these:
>
>         fc9bbfb: gpio: improve error path in gpiolib

Hm I fixed part of this bug yesterday, but screwed up and left the dangling
spinlock in there, what is wrong with me :-(

Anyway, fixed it _finally_ now, thanks to you.

Yours,
Linus Walleij
