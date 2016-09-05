From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] sh-pfc: return pinconf with arguments in packed format
Date: Mon, 5 Sep 2016 17:54:44 +0200
Message-ID: <CAMuHMdXu2CNyu_92MHOyVpL5wJWLm6zaojFhkk1c1joYLZ4K5A@mail.gmail.com>
References: <20160905141957.25982-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34882 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752686AbcIEPyq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 11:54:46 -0400
In-Reply-To: <20160905141957.25982-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>

Hi Niklas,

On Mon, Sep 5, 2016 at 4:19 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The pinconf-generic code expects configurations with arguments to be
> returned in a packed format in order to be displayed properly by
> pinconf_generic_dump_one().

Some more user-oriented explanation could be helpful, like saying that
/sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins on r8a7795/salvator-x n=
ow
shows

    pin 96 (GP_3_0): input bias disabled, output drive strength (9
mA), pin power source (3300 selector)

instead of

    pin 96 (GP_3_0): input bias disabled, output drive strength (0
mA), pin power source (0 selector)

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

P.S. It seems like we should get rid of the WARN_ON_ONCE() checks in our
     pinctrl code, and return proper errors, as these are triggered by read=
ing
     the sysfs files.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
