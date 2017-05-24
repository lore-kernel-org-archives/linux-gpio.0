From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] pinctrl: sh-pfc: propagate errors on group config
Date: Wed, 24 May 2017 13:47:55 +0200
Message-ID: <CAMuHMdWghZYQ+Mx-AMsu3yERNwChz4xXHKs3D5fshnG5trLMbg@mail.gmail.com>
References: <1466404822-2540-1-git-send-email-wsa@the-dreams.de> <CAMuHMdXWwZaCoLz8TTLBVg8qmKpiw0wKGUawd6ti0wg3X5e6xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:32936 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965899AbdEXLr5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2017 07:47:57 -0400
In-Reply-To: <CAMuHMdXWwZaCoLz8TTLBVg8qmKpiw0wKGUawd6ti0wg3X5e6xA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

Hi Wolfram,

On Tue, Jun 21, 2016 at 3:11 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Jun 20, 2016 at 8:40 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> On group configuration, bail out if setting one of the individual pins
>> fails. We don't need to roll-back, the pinctrl core will do this for us.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> Tested on a Lager and Salvator-X without problems. Needs probably more testing
>> on various HW to avoid regressions?
>
> Your patch causes the display to fail on r8a7740/armadillo.
>
> Disabling the error propagation and adding more debug prints reveals:
>
> +sh_pfc_pinconf_validate: pin 58: 15 not supported
> +sh_pfc_pinconf_set:694: config 0: sh_pfc_pinconf_validate() failed
> +sh_pfc_pinconf_group_set:781: sh_pfc_pinconf_set() failed -524 for
> pin 0 of group lcd0_data24_0
> +sh_pfc_pinconf_validate: pin 57: 15 not supported
> +sh_pfc_pinconf_set:694: config 0: sh_pfc_pinconf_validate() failed
> +sh_pfc_pinconf_group_set:781: sh_pfc_pinconf_set() failed -524 for
> pin 1 of group lcd0_data24_0
> +sh_pfc_pinconf_validate: pin 56: 15 not supported
> +sh_pfc_pinconf_set:694: config 0: sh_pfc_pinconf_validate() failed
> +sh_pfc_pinconf_group_set:781: sh_pfc_pinconf_set() failed -524 for
> pin 2 of group lcd0_data24_0
>  ...
>
> 15 = PIN_CONFIG_OUTPUT
>
> No idea why this is set for all pins of the lcd0_data24_0 group (and not for any
> other pin or group on any other SoC).

This is caused by the "output-high" property for the GPIO hog.
Due to both lcd0 pinmux and GPIO hog being part of the same device node,
"output-high" is also applied to the lcd0 pins, which fails.

RFC fix in "[PATCH/RFC] ARM: dts: armadillo800eva: Split LCD mux and gpio"
(https://patchwork.kernel.org/patch/9745831/)/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
