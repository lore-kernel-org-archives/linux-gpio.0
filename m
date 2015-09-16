From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Request for submaintainer moderation: PFC pinctrl patches
Date: Wed, 16 Sep 2015 08:44:33 +0200
Message-ID: <CAMuHMdUP8yu7DK2NhE=AFDX2gWC1DtAKQdoncMTfvK-k2oX0aA@mail.gmail.com>
References: <CACRpkdaMPST2ptDfPNH4e=hQBO1HjmsbcMXQRNRf905Rbi24Lw@mail.gmail.com>
	<CACRpkdZpaTsGQQWWJekLUZgAN6=ruq5-yZAjYe1ePNi4Tq1RRg@mail.gmail.com>
	<1611563.uxQzGnHx64@avalon>
	<CACRpkdY_y19qYLVYhhJeSF8tsBYb93FX2nCA7pf+a_bubf-m5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34328 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752204AbbIPGoe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2015 02:44:34 -0400
In-Reply-To: <CACRpkdY_y19qYLVYhhJeSF8tsBYb93FX2nCA7pf+a_bubf-m5Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Magnus Damm <damm+renesas@opensource.se>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

On Tue, Sep 15, 2015 at 10:48 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Fri, Sep 11, 2015 at 2:49 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>
>> The topic is on our agenda for a meeting on Monday, I believe we'll appoint
>> someone to submaintain the PFC patches and send you pull requests.
>
> How did it go?

I will queue up all sh-pfc patches in a branch, and plan to send a pull request
after v4.3-rc3. That will include both support for the new r8a7795 SoC, and
fixes/updates for the existing code (e.g. the pfc patches from "[PATCH v2 0/6]
ARM: shmobile: Move gpio ranges from C code to DT",
http://www.spinics.net/lists/linux-gpio/msg07733.html).

Is that OK for you?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
