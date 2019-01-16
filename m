From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2] gpiolib: fix line event timestamps for nested irqs
Date: Wed, 16 Jan 2019 16:36:50 +0100
Message-ID: <CAMRc=MdNGJhaGMMwwLHPO0hnoM6vZbdAX8xEHC75QSmZwjZt-g@mail.gmail.com>
References: <20190111174347.25040-1-brgl@bgdev.pl> <20190116133544.5288A2082F@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190116133544.5288A2082F@mail.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 16 sty 2019 o 14:35 Sasha Levin <sashal@kernel.org> napisa=C5=82(=
a):
>
> Hi,
>
> [This is an automated email]
>
> This commit has been processed because it contains a "Fixes:" tag,
> fixing commit: d58f2bf261fd gpio: Timestamp events in hardirq handler.
>
> The bot has tested the following trees: v4.20.2, v4.19.15.
>
> v4.20.2: Build OK!
> v4.19.15: Failed to apply! Possible dependencies:
>     Unable to calculate
>
>
> How should we proceed with this patch?
>

I sent a backport of this patch.

Bart

> --
> Thanks,
> Sasha
