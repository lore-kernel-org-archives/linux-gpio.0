From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/7] gpio: omap: fix omap2_set_gpio_debounce
Date: Wed, 26 Aug 2015 09:49:34 +0200
Message-ID: <CACRpkdb=pvDEA88bNPhEMp2RUgKX=i_N-gwWA7gRwSG13L7=Fw@mail.gmail.com>
References: <1439896258-26449-1-git-send-email-grygorii.strashko@ti.com>
	<1439896258-26449-4-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33616 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755606AbbHZHtf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 03:49:35 -0400
Received: by obbhe7 with SMTP id he7so164529671obb.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 00:49:34 -0700 (PDT)
In-Reply-To: <1439896258-26449-4-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, Javier Martinez Canillas <javier@dowhile0.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 18, 2015 at 1:10 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> According to TRMs:
>
> Required input line stable =3D
>   (the value of the GPIO_DEBOUNCINGTIME[7:0].DEBOUNCETIME + 1) =C3=97=
 31,
> where the value of the GPIO_DEBOUNCINGTIME[7:0].DEBOUNCETIME bit fiel=
d
> is from 0 to 255.
>
> But now omap2_set_gpio_debounce() will calculate debounce time and
> behave incorrectly in the following cases:
> 1) requested debounce time is !0 and <32
>    calculated DEBOUNCETIME =3D 0x1 =3D=3D 62 us;
>    expected value of DEBOUNCETIME =3D 0x0 =3D=3D 31us
> 2) requested debounce time is 0
>    calculated DEBOUNCETIME =3D 0x1 =3D=3D 62 us;
>    expected: disable debounce and DEBOUNCETIME =3D 0x0
> 3) requested debounce time is >32 and <63
>    calculated DEBOUNCETIME =3D 0x0 and debounce will be disabled;
>    expected: enable debounce and DEBOUNCETIME =3D 0x1 =3D=3D 62 us
>
> Hence, rework omap2_set_gpio_debounce() to fix above cases:
> 1) introduce local variable "enable" and use it to identify
> when debounce need to be enabled or disabled. Disable debounce
> if requested debounce time is 0.
> 2) use below formula for debounce time calculation:
>    debounce =3D (DIV_ROUND_UP(debounce, 31) - 1) & 0xFF;
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Very hightech. Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
