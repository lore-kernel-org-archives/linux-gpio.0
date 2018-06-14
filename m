From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: actions: Fix uninitialized error in owl_pin_config_set()
Date: Thu, 14 Jun 2018 10:35:30 +0200
Message-ID: <CACRpkdbMogW3oVv0NEX1b622H8g4k-3MtzLONhog5TKsPn5qCA@mail.gmail.com>
References: <1528452347-23986-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528452347-23986-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 8, 2018 at 12:05 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> With gcc 4.1.2:
>
>     drivers/pinctrl/actions/pinctrl-owl.c: In function =E2=80=98owl_pin_c=
onfig_set=E2=80=99:
>     drivers/pinctrl/actions/pinctrl-owl.c:336: warning: =E2=80=98ret=E2=
=80=99 may be used uninitialized in this function
>
> Indeed, if num_configs is zero, the uninitialized value will be returned
> as an error code.
>
> Fix this by preinitializing it to zero.
>
> Fixes: 2242ddfbf4d699b5 ("pinctrl: actions: Add Actions S900 pinctrl driv=
er")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Patch applied with Manivannan's ACK.

Yours,
Linus Walleij
