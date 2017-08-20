From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] gpio: use devres for irq generic chip
Date: Sun, 20 Aug 2017 23:56:51 +0200
Message-ID: <CACRpkdZ+gKigSJa2GC7Q4LhCXrvmYzchE1SpoU8xbFzXHd+a9w@mail.gmail.com>
References: <20170802075126.17637-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170802075126.17637-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2017 at 9:51 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> We now provide resource managed versions of irq_alloc_generic_chip()
> and irq_setup_generic_chip(). Use them in all relevant gpio drivers.
>
> Bartosz Golaszewski (6):
>   gpio: sta2x11: use devres for irq generic chip
>   gpio: ml-ioh: use devres for irq generic chip
>   gpio: pch: use devres for irq generic chip
>   gpio: mxc: use devres for irq generic chip
>   gpio: mxs: use devres for irq generic chip
>   gpio: sodaville: use devres for irq generic chip

I applied all of these. Sorry for being flimsy
about them.

Yours,
Linus Walleij
