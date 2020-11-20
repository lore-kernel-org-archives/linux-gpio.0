Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29ADC63798
	for <linux-gpio@archiver.kernel.org>; Fri, 20 Nov 2020 09:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7401C223B0
	for <linux-gpio@archiver.kernel.org>; Fri, 20 Nov 2020 09:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSRqU0Hu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgKTJjh (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 20 Nov 2020 04:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgKTJjg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 04:39:36 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769D5C0613CF;
        Fri, 20 Nov 2020 01:39:36 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id s8so7969472yba.13;
        Fri, 20 Nov 2020 01:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fFPfmPF5+IB1CSCpeDv7kPz4TOEhwS34Jbv+FQyjbaE=;
        b=lSRqU0HuqlLznHw5Y4Tzuk7duPPcLptsUvZ++NYrpcw0k378LQNKqI98Ij0q22z04O
         p8aTLxlfd66mCTL1QZ0+Ho/YSnraRtTphPl7jUnIgDZC5hxbcnwmUoKWevFFnTbvmumw
         l7UXAXeobmeEFvG1rMaDnWoukISnpW5W2fSwjIrM8LGY3wZrulTKdRUuA9OKNeqnFtLq
         caVy+w0V57jMil8jZEe+qnfVfQ//i6b8Whptjj1QbWP4GkZZIhSR5MhQppPfEllnoVjS
         pzHtNS8zzct4Kj86sHTGCH9jWcwj+Ta7zAOadgglVKr8i3YVeHjjr3R6xrInvIstbJ4J
         BgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fFPfmPF5+IB1CSCpeDv7kPz4TOEhwS34Jbv+FQyjbaE=;
        b=Ugr+cubYtMHyVKWHmWbxKNmfkFARlf9/Dr+VEZa+XB1k0VONGJCjbrjc+LMV3/X9x5
         wH9rI5Nk9rTJooAbStHGMsmk4rgdGWPqaFQXcMP0FAMTTcO0J7YFbq0QfQgTw543HhaI
         q+gKLQZDJVzXHH+Px7lF76epyuloaoAFHvIffBuwUIqQsfXgzWyKfNbC+Ix5X3N3tZ8W
         DLD/vO862S1Kk8T1Ns11YSdtGI3dFk7Ls/SQJVsZYcz16yvg41Uv+QoHqzeKOkjLX8+6
         5fJJHxTe4ukeQoaS1T9ZU7IMScmSVqc/qxY6TNhwmA+iZTvcMPYXLkZ9+rMWiIhNQmbi
         l0lQ==
X-Gm-Message-State: AOAM531qCFSGg3crxiLNedQN2H6Yu4TCnY5TFVnv7P7WVBqzdVyaG7vh
        wR44O5pyO8d8SoTLYmPuevV7H/rFBWJcgX+8BP4=
X-Google-Smtp-Source: ABdhPJywsq3Uz+rYF+hGDahyM01ugd8IVS1TQjg5eSb36+IlyId+U+B0N8Em2nDVUxaVgzM9mBR9ceUjSeS9ItrKmzs=
X-Received: by 2002:a25:209:: with SMTP id 9mr26638905ybc.127.1605865175851;
 Fri, 20 Nov 2020 01:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201119130926.25692-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUGqkqZVY9YZ1Xo=uq_4kn3ybh50VMSNBCLOSKWyDd3kw@mail.gmail.com>
In-Reply-To: <CAMuHMdUGqkqZVY9YZ1Xo=uq_4kn3ybh50VMSNBCLOSKWyDd3kw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 20 Nov 2020 09:39:09 +0000
Message-ID: <CA+V-a8uNsb3RGnNx8w3amhJCpOKk2df==9CbYPuermmUJM0y_w@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: renesas: r8a77990: Add QSPI[01] pins, groups
 and functions
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the review.

On Fri, Nov 20, 2020 at 9:20 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Thu, Nov 19, 2020 at 2:09 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add pins, groups and functions for QSPIO[01].
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl-for-v5.11...
>
> > --- a/drivers/pinctrl/renesas/pfc-r8a77990.c
> > +++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
> > @@ -2810,6 +2810,57 @@ static const unsigned int pwm6_b_mux[] = {
> >         PWM6_B_MARK,
> >  };
> >
> > +/* - QSPI0 ------------------------------------------------------------------ */
> > +static const unsigned int qspi0_ctrl_pins[] = {
> > +       /* SPCLK, SSL */
>
> ... with the missing QSPI0_ prefix added...
>
Argh missed that.

> > +       RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 5),
> > +};
> > +static const unsigned int qspi0_ctrl_mux[] = {
> > +       QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
> > +};
> > +static const unsigned int qspi0_data2_pins[] = {
> > +       /* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
> > +       RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
> > +};
> > +static const unsigned int qspi0_data2_mux[] = {
> > +       QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
> > +};
> > +static const unsigned int qspi0_data4_pins[] = {
> > +       /* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
> > +       RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
> > +       /*  QSPI0_IO2, QSPI0_IO3 */
>
> ... and the bogus space dropped.
>
Thanks for taking care of it.

Cheers,
Prabhakar

> > +       RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
> > +};
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
