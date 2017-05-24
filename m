From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] pinctrl: sh-pfc: propagate errors on group config
Date: Wed, 24 May 2017 14:27:51 +0200
Message-ID: <CAMuHMdVFiC=n57zZwoL+YFjQD-WffjHsX-VmnMndds9UEhRV9w@mail.gmail.com>
References: <1466404822-2540-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXWwZaCoLz8TTLBVg8qmKpiw0wKGUawd6ti0wg3X5e6xA@mail.gmail.com>
 <CAMuHMdWghZYQ+Mx-AMsu3yERNwChz4xXHKs3D5fshnG5trLMbg@mail.gmail.com> <20170524122139.GB1463@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:37965 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763455AbdEXM1z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2017 08:27:55 -0400
In-Reply-To: <20170524122139.GB1463@katana>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

Hi Wolfram,

On Wed, May 24, 2017 at 2:21 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> This is caused by the "output-high" property for the GPIO hog.
>> Due to both lcd0 pinmux and GPIO hog being part of the same device node,
>> "output-high" is also applied to the lcd0 pins, which fails.
>>
>> RFC fix in "[PATCH/RFC] ARM: dts: armadillo800eva: Split LCD mux and gpio"
>> (https://patchwork.kernel.org/patch/9745831/)/
>
> Cool, thanks! So, if this issue could get resolved, there are chances to
> revive the original patch?

Yep, that's the plan.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
