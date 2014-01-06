From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] gpio: lp3943: Remove redundant of_match_ptr helper
Date: Mon, 6 Jan 2014 11:07:50 +0000
Message-ID: <20140106110750.GO23772@lee--X1>
References: <1387621661-22128-1-git-send-email-sachin.kamat@linaro.org>
 <CACRpkdb+NQOZXD2iHco+5UoFAt0abc8teFvZV0TayxXMRUZRNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb+NQOZXD2iHco+5UoFAt0abc8teFvZV0TayxXMRUZRNw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, 02 Jan 2014, Linus Walleij wrote:

> On Sat, Dec 21, 2013 at 11:27 AM, Sachin Kamat <sachin.kamat@linaro.o=
rg> wrote:
>=20
> > 'lp3943_gpio_of_match' is always compiled in. Hence the
> > helper macro is not needed.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > ---
> >  drivers/gpio/gpio-lp3943.c |    2 +-
>=20
> This driver is merged into the MFD tree, you need Lee or
> Sam to apply it.
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
