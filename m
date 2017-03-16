From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
Date: Thu, 16 Mar 2017 13:49:00 +0100
Message-ID: <CAMuHMdWNYqNxcBHTNiTyDe3ZED0L07z4AhRiOcfNBj4QiMJ9Ag@mail.gmail.com>
References: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
 <1489423302-21296-2-git-send-email-geert+renesas@glider.be> <e5214bac-7bf9-1897-cf9f-f4735e6985e9@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33651 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751384AbdCPMtC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2017 08:49:02 -0400
In-Reply-To: <e5214bac-7bf9-1897-cf9f-f4735e6985e9@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hei Sergey,

On Mon, Mar 13, 2017 at 5:57 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 03/13/2017 07:41 PM, Geert Uytterhoeven wrote:
>
>> Fix typos in hscif2_clk_[bc]_mux[] and hscif4_ctrl_mux[].
>
>    Only seeing hscif2_clk_b_mux[] fix...

Thanks for noticing, I had copied this line from another patch for r8a7796,
but forgot to update it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
