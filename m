From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: mockup: use simple_read_from_buffer() in debugfs
 read callback
Date: Thu, 28 Mar 2019 14:42:25 +0100
Message-ID: <CAMRc=Md8EOBf-TjxELGx5PGnuvGF9kR8oe_qHxxQgaN_vKv+Vg@mail.gmail.com>
References: <20190328110043.13391-1-brgl@bgdev.pl> <c3ecb2d9-55eb-fc74-a08a-bbd5c5018cb8@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c3ecb2d9-55eb-fc74-a08a-bbd5c5018cb8@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

czw., 28 mar 2019 o 14:11 Mukesh Ojha <mojha@codeaurora.org> napisa=C5=82(a=
):
>
>
> On 3/28/2019 4:30 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Calling read() for a single byte read will return 2 currently. Use
> > simple_read_from_buffer() which correctly handles all sizes.
> >
> > Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >   drivers/gpio/gpio-mockup.c | 7 +------
> >   1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > index 74ba8b1d71d8..859585dce5c9 100644
> > --- a/drivers/gpio/gpio-mockup.c
> > +++ b/drivers/gpio/gpio-mockup.c
> > @@ -219,12 +219,7 @@ static ssize_t gpio_mockup_debugfs_read(struct fil=
e *file,
> >       val =3D gpio_mockup_get(gc, priv->offset);
> >       cnt =3D snprintf(buf, sizeof(buf), "%d\n", val);
>
>
> why \n is inserted in the buf..
>

Because this is how all the attributes work - you read the value + '\n'.

> rv variable is unused now.
>
> >
> > -     rv =3D copy_to_user(usr_buf, buf, cnt);
> > -     if (rv)
> > -             return rv;
> > -
> > -     *ppos +=3D cnt;
> > -     return cnt;
> > +     return simple_read_from_buffer(usr_buf, size, ppos, buf, cnt);
>
>
>
> Looks good to me.
> Remove the unused variable.
>

Thanks, removed that and a stray newline.

Bart

> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
>
> -Mukesh
>
> >   }
> >
> >   static ssize_t gpio_mockup_debugfs_write(struct file *file,
