From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/27] drm/bridge: ptn3460: #include <linux/gpio/consumer.h>,
 depend on GPIOLIB
Date: Fri, 5 Jun 2015 13:42:13 +0200
Message-ID: <CAMuHMdXEMB-_naTr5FRJq6SCT3VhnaNQt-K3LG5cySLKORoPiA@mail.gmail.com>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
	<1430843563-18615-1-git-send-email-geert@linux-m68k.org>
	<20150605112050.GA17776@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36682 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752018AbbFELmN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2015 07:42:13 -0400
In-Reply-To: <20150605112050.GA17776@ulmo.nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>

Hi Thierry,

On Fri, Jun 5, 2015 at 1:20 PM, Thierry Reding <thierry.reding@gmail.co=
m> wrote:
> On Tue, May 05, 2015 at 06:32:17PM +0200, Geert Uytterhoeven wrote:
>> If GPIOLIB=3Dn and asm-generic/gpio.h is not used:
>>
>>     drivers/gpu/drm/bridge/ptn3460.c: In function =E2=80=98ptn3460_p=
re_enable=E2=80=99:
>>     drivers/gpu/drm/bridge/ptn3460.c:135: error: implicit declaratio=
n of function =E2=80=98gpiod_set_value=E2=80=99
>>     drivers/gpu/drm/bridge/ptn3460.c: In function =E2=80=98ptn3460_p=
robe=E2=80=99:
>>     drivers/gpu/drm/bridge/ptn3460.c:333: error: implicit declaratio=
n of function =E2=80=98devm_gpiod_get=E2=80=99
>>     drivers/gpu/drm/bridge/ptn3460.c:333: warning: assignment makes =
pointer from integer without a cast
>>     drivers/gpu/drm/bridge/ptn3460.c:340: error: implicit declaratio=
n of function =E2=80=98gpiod_direction_output=E2=80=99
>>     drivers/gpu/drm/bridge/ptn3460.c:346: warning: assignment makes =
pointer from integer without a cast
>>
>> Add the missing #include <linux/gpio/consumer.h> to fix this.
>>
>> As the resulting driver won't work with GPIOLIB=3Dn anyway, make
>> DRM_PTN3460 depend on GPIOLIB || COMPILE_TEST.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>  drivers/gpu/drm/bridge/Kconfig   | 4 ++--
>>  drivers/gpu/drm/bridge/ptn3460.c | 1 +
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> Applied, thanks. Note that I dropped the part about adding the GPIOLI=
B
> dependency because that had been attempted previously to fix this, bu=
t
> it causes recursive dependencies on PowerPC (ppc64_defconfig). I don'=
t
> know of a way to untangle those (I tried and failed miserably), so I
> think adding the include is really as good as it'll get.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
