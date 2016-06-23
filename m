From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: sch: Fix Oops on module load on Asus Eee PC 1201
Date: Thu, 23 Jun 2016 10:02:27 +0200
Message-ID: <CACRpkdZVFO5hZNz8UgC2K3cH0P5qOO1eJyhTbW6eb=GdxaRnxQ@mail.gmail.com>
References: <20160618180458.GA1425@pitrat4.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160618180458.GA1425@pitrat4.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Pitrat <colin.pitrat@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jun 18, 2016 at 8:05 PM, Colin Pitrat <colin.pitrat@gmail.com> wrote:

> This fixes the issue descirbe in bug 117531
> (https://bugzilla.kernel.org/show_bug.cgi?id=117531).
> It's a regression introduced in linux 4.5 that causes a Oops at load of
> gpio_sch and prevents powering off the computer.
>
> The issue is that sch_gpio_reg_set is called in sch_gpio_probe before
> gpio_chip data is initialized with the pointer to the sch_gpio struct. As
> sch_gpio_reg_set calls gpiochip_get_data, it returns NULL which causes
> the Oops.
>
> The patch follows Mika's advice (https://lkml.org/lkml/2016/5/9/61) and
> consists in modifying sch_gpio_reg_get and sch_gpio_reg_set to take a
> sch_gpio struct directly instead of a gpio_chip, which avoids the call to
> gpiochip_get_data.
>
> Thanks Mika for your patience with me :-)
>
> Signed-off-by: Colin Pitrat <colin.pitrat@gmail.com>

Patch applied for fixes with Alex' and Mika's ACK.

I will add some stable tags as well.

Yours,
Linus Walleij
