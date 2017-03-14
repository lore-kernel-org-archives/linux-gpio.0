From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when GPIOLIB
 is disabled
Date: Tue, 14 Mar 2017 14:31:08 +0100
Message-ID: <CACRpkdaLgJCr+U1Rc2fv89VK7wdH=ZXi8B=QURQ2=ncRasJ-Ww@mail.gmail.com>
References: <20170213011355.GA13075@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170213011355.GA13075@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 13, 2017 at 2:13 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Given the intent behind gpiod_get_optional() and friends it does not make
> sense to return -ENOSYS when GPIOLIB is disabled: the driver is expected =
to
> work just fine without gpio so let's behave as if gpio was not found.
> Otherwise we have to special-case -ENOSYS in drivers.
>
> Note that there was objection that someone might forget to enable GPIOLIB
> when dealing with a platform that has device that actually specifies
> optional gpio and we'll break it. I find this unconvincing as that would
> have to be the *only GPIO* in the system, which is extremely unlikely.
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> This is a resend of a similar patch from a couple years ago.
>
> V2:

After a lot of decision angst I applied this patch, dropping Uwe's
Suggested-by since he doesn't seem to like it.

I think we should eventually return proper error codes,
but as you say: the API should be consistent first, we need
to change both the lib and the stubs to return error codes
for that, this is about something else, just keeping it consistent.

Yours,
Linus Walleij
