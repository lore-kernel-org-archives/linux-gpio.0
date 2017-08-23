From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zevio: make gpio_chip const
Date: Wed, 23 Aug 2017 09:22:21 +0200
Message-ID: <CACRpkdaY-sg585rSnYmmH+NaFozjdQL2S6qWoy=1Egenksm+Ug@mail.gmail.com>
References: <1503253666-29088-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503253666-29088-1-git-send-email-bhumirks@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Aug 20, 2017 at 8:27 PM, Bhumika Goyal <bhumirks@gmail.com> wrote:

> Make this const as it is only used as a copy operation.
> Done using Coccinelle.
>
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>

Patch applied.

Yours,
Linus Walleij
