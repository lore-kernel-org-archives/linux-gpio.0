From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-bt8xx: fix compilation warning
Date: Fri, 16 May 2014 17:51:07 +0200
Message-ID: <CACRpkdYD9_PqXMVHdG+QfO3-50+LBLdb7GbLObh7wFrfqN4XaQ@mail.gmail.com>
References: <1400103816-26086-1-git-send-email-berthe.ab@gmail.com>
	<20140514235232.57bbc9df@wiggum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140514235232.57bbc9df@wiggum>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>
Cc: abdoulaye berthe <berthe.ab@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 14, 2014 at 11:52 PM, Michael B=C3=BCsch <m@bues.ch> wrote:
> On Wed, 14 May 2014 23:43:36 +0200
> abdoulaye berthe <berthe.ab@gmail.com> wrote:
>
>> this fixes a compilation warning by checking
>> the retun value of gpiochip_remove()
>
>
> Really, I would rather change the gpiochip_remove return type to void=
=2E

Good point.

Dropping this patch in favor of real solution.

Yours,
Linus Walleij
