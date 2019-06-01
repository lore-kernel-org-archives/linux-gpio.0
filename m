From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: max732x: use i2c_new_dummy_device()
Date: Sat, 1 Jun 2019 19:44:28 +0200
Message-ID: <CACRpkdYaeD4=T=uux_tKwJpgKzyRcZnKFW2EwhNPzpkHNe3-QQ@mail.gmail.com>
References: <20190521090306.28113-1-brgl@bgdev.pl> <CAMRc=MdJoO602kLfP_Hw9-0pB25CeUMxfqBUYhC7CB3Aw+5O4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=MdJoO602kLfP_Hw9-0pB25CeUMxfqBUYhC7CB3Aw+5O4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 5:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> wt., 21 maj 2019 o 11:03 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82=
(a):
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We now have a resource managed version of i2c_new_dummy_device() that
> > also returns an actual error code instead of a NULL-pointer. Use it
> > in the max732x GPIO driver and simplify code in the process.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
>
> If there are no objections I'll apply it by the end of this week.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Just include it in some pull request to me!

Yours,
Linus Walleij
