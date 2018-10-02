From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH v3 1/2] selftests: gpio: restructure Makefile
Date: Tue, 2 Oct 2018 15:48:06 -0500
Message-ID: <CAEUSe79yNJ_2FsLsxKW6J0dfrJ2HoVvk+_NZGWHCsy_Kc0+pQw@mail.gmail.com>
References: <1536330895-8391-1-git-send-email-daniel.diaz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536330895-8391-1-git-send-email-daniel.diaz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>, linux-kselftest@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Fathi Boudra <fathi.boudra@linaro.org>, Bamvor Jian Zhang <bamv2005@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Shuah Khan <shuah@kernel.org>, "open list:GPIO MOCKUP DRIVER" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hello!

On Fri, 7 Sep 2018 at 09:35, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wrot=
e:
> From: Fathi Boudra <fathi.boudra@linaro.org>
>
> This patch cleans up the Makefile by restructuring a couple of
> things, namely:
> 1) change explicit paths in targets for variables
> 2) substitute a variable (BINARIES) for another, part of the
>    selftests build system (TEST_PROGS_EXTENDED)
> 3) proper cleaning up of the EXTRA objects
>
> The resulting Makefile is much more readable and manageable.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
>  tools/testing/selftests/gpio/Makefile | 32 +++++++++++++++--------------=
---
>  1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selfte=
sts/gpio/Makefile
> index 4665cdb..a4a01ec8 100644
> --- a/tools/testing/selftests/gpio/Makefile
> +++ b/tools/testing/selftests/gpio/Makefile
> @@ -1,28 +1,26 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> +CFLAGS +=3D -O2 -g -std=3Dgnu99 -Wall -I../../../../usr/include/
> +LDLIBS +=3D -lmount -I/usr/include/libmount
> +
>  TEST_PROGS :=3D gpio-mockup.sh
> -TEST_FILES :=3D gpio-mockup-sysfs.sh $(BINARIES)
> -BINARIES :=3D gpio-mockup-chardev
> -EXTRA_PROGS :=3D ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
> -EXTRA_DIRS :=3D ../gpioinclude/
> -EXTRA_OBJS :=3D ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
> -EXTRA_OBJS +=3D ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpi=
o-in.o
> -EXTRA_OBJS +=3D ../gpiolsgpio.o
> +TEST_FILES :=3D gpio-mockup-sysfs.sh
> +TEST_PROGS_EXTENDED :=3D gpio-mockup-chardev
> +
> +GPIODIR :=3D ../../../gpio
> +GPIOOBJ :=3D gpio-utils.o
>
>  include ../lib.mk
>
> -all: $(BINARIES)
> +all: $(TEST_PROGS_EXTENDED)
>
>  override define CLEAN
> -       $(RM) $(BINARIES) $(EXTRA_PROGS) $(EXTRA_OBJS)
> -       $(RM) -r $(EXTRA_DIRS)
> +       $(RM) $(TEST_PROGS_EXTENDED)
> +       $(MAKE) -C $(GPIODIR) clean
>  endef
>
> -CFLAGS +=3D -O2 -g -std=3Dgnu99 -Wall -I../../../../usr/include/
> -LDLIBS +=3D -lmount -I/usr/include/libmount
> -
> -$(BINARIES):| khdr
> -$(BINARIES): ../../../gpio/gpio-utils.o
> +$(TEST_PROGS_EXTENDED):| khdr
> +$(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
>
> -../../../gpio/gpio-utils.o:
> -       make ARCH=3D$(ARCH) CROSS_COMPILE=3D$(CROSS_COMPILE) -C ../../../=
gpio
> +$(GPIODIR)/$(GPIOOBJ):
> +       $(MAKE) -C $(GPIODIR)
> --
> 2.7.4

Ping on this series.

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
