From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 04/27] extcon: Allow compile test of GPIO consumers if
 !GPIOLIB
Date: Wed, 06 May 2015 14:38:14 +0900
Message-ID: <5549A8C6.6030208@samsung.com>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430843563-18615-4-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

On 05/06/2015 01:32 AM, Geert Uytterhoeven wrote:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB =
is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consu=
mer
> functionality only, can still be compiled if GPIOLIB is not enabled.
>=20
> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
> appropriate.
>=20
> If GPIOLIB=3Dn and asm-generic/gpio.h is not used:
>=20
>     drivers/extcon/extcon-usb-gpio.c: In function =E2=80=98usb_extcon=
_detect_cable=E2=80=99:
>     drivers/extcon/extcon-usb-gpio.c:63: error: implicit declaration =
of function =E2=80=98gpiod_get_value_cansleep=E2=80=99
>     drivers/extcon/extcon-usb-gpio.c: In function =E2=80=98usb_extcon=
_probe=E2=80=99:
>     drivers/extcon/extcon-usb-gpio.c:116: error: implicit declaration=
 of function =E2=80=98devm_gpiod_get=E2=80=99
>     drivers/extcon/extcon-usb-gpio.c:116: warning: assignment makes p=
ointer from integer without a cast
>     drivers/extcon/extcon-usb-gpio.c:122: error: implicit declaration=
 of function =E2=80=98gpiod_set_debounce=E2=80=99
>     drivers/extcon/extcon-usb-gpio.c:129: error: implicit declaration=
 of function =E2=80=98gpiod_to_irq=E2=80=99
>=20
> Add the missing #include <linux/gpio/consumer.h> to fix this.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/extcon/Kconfig           | 4 ++--
>  drivers/extcon/extcon-usb-gpio.c | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied it on -next branch.

Thanks,
Chanwoo Choi
