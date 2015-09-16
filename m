From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Request for submaintainer moderation: PFC pinctrl patches
Date: Wed, 16 Sep 2015 09:08:20 +0200
Message-ID: <CACRpkdZ251yKOKXs6pjgU4UdbhNC7LafB+JyW+cqujERu+VnYg@mail.gmail.com>
References: <CACRpkdaMPST2ptDfPNH4e=hQBO1HjmsbcMXQRNRf905Rbi24Lw@mail.gmail.com>
	<CACRpkdZpaTsGQQWWJekLUZgAN6=ruq5-yZAjYe1ePNi4Tq1RRg@mail.gmail.com>
	<1611563.uxQzGnHx64@avalon>
	<CACRpkdY_y19qYLVYhhJeSF8tsBYb93FX2nCA7pf+a_bubf-m5Q@mail.gmail.com>
	<CAMuHMdUP8yu7DK2NhE=AFDX2gWC1DtAKQdoncMTfvK-k2oX0aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33587 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751739AbbIPHIV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2015 03:08:21 -0400
Received: by oixx17 with SMTP id x17so114564130oix.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2015 00:08:20 -0700 (PDT)
In-Reply-To: <CAMuHMdUP8yu7DK2NhE=AFDX2gWC1DtAKQdoncMTfvK-k2oX0aA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Magnus Damm <damm+renesas@opensource.se>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 16, 2015 at 8:44 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> I will queue up all sh-pfc patches in a branch, and plan to send a pull request
> after v4.3-rc3. That will include both support for the new r8a7795 SoC, and
> fixes/updates for the existing code (e.g. the pfc patches from "[PATCH v2 0/6]
> ARM: shmobile: Move gpio ranges from C code to DT",
> http://www.spinics.net/lists/linux-gpio/msg07733.html).
>
> Is that OK for you?

Absolutely, you are a long-time trusted developer. As long as yours,
Kuninori's and
Sergei's patches are accumulated and get tested together I will be very happy
to pull in the result from you.

Yours,
Linus Walleij
