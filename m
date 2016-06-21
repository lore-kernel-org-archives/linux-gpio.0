From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] pinctrl: sh-pfc: propagate errors on group config
Date: Tue, 21 Jun 2016 15:11:46 +0200
Message-ID: <CAMuHMdXWwZaCoLz8TTLBVg8qmKpiw0wKGUawd6ti0wg3X5e6xA@mail.gmail.com>
References: <1466404822-2540-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1466404822-2540-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Wolfram,

On Mon, Jun 20, 2016 at 8:40 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On group configuration, bail out if setting one of the individual pins
> fails. We don't need to roll-back, the pinctrl core will do this for us.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tested on a Lager and Salvator-X without problems. Needs probably more testing
> on various HW to avoid regressions?

Your patch causes the display to fail on r8a7740/armadillo.

Disabling the error propagation and adding more debug prints reveals:

+sh_pfc_pinconf_validate: pin 58: 15 not supported
+sh_pfc_pinconf_set:694: config 0: sh_pfc_pinconf_validate() failed
+sh_pfc_pinconf_group_set:781: sh_pfc_pinconf_set() failed -524 for
pin 0 of group lcd0_data24_0
+sh_pfc_pinconf_validate: pin 57: 15 not supported
+sh_pfc_pinconf_set:694: config 0: sh_pfc_pinconf_validate() failed
+sh_pfc_pinconf_group_set:781: sh_pfc_pinconf_set() failed -524 for
pin 1 of group lcd0_data24_0
+sh_pfc_pinconf_validate: pin 56: 15 not supported
+sh_pfc_pinconf_set:694: config 0: sh_pfc_pinconf_validate() failed
+sh_pfc_pinconf_group_set:781: sh_pfc_pinconf_set() failed -524 for
pin 2 of group lcd0_data24_0
 ...

15 = PIN_CONFIG_OUTPUT

No idea why this is set for all pins of the lcd0_data24_0 group (and not for any
other pin or group on any other SoC).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
