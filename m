Return-Path: <SRS0=HDci=5M=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E0FC2D0E7
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 10:10:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECE7D206F8
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 10:10:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FT8qzeO2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgC0KKq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 27 Mar 2020 06:10:46 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41606 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgC0KKq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:10:46 -0400
Received: by mail-lf1-f65.google.com with SMTP id z23so7373083lfh.8
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Npbjmx2EEwqSvhfm8k1aVlqXx6O4MStkJENyJ0fqd4=;
        b=FT8qzeO2T+rJuaOA0DKTsXprHUdy9BzaA7nB0Fr/QoXarVRQwzxhp7ZWERJ9S6Nk3x
         1MmXn7rBgq6Knbjw+my1fmGfvrKb8HApm0swiL8DmY9PQa9MXJl92nPLb5whysAEig8y
         gGaacje71Fwcn3Fc0uMXJF17TmzJ0JgJa32mkqnDFptAKimXjN0G4BeoTz8e8+5t3fbE
         ugPIv7Y1GBHjDzF0qXIt2VnrwHR1viqbLaLaFePYBTZ1POhrro9XHlPwcNRy+KWIJuyc
         ntLw9mARR8eVUnC2QZM7WILY85/+ZX5oce8D1ZiD6ZNSPWAM3Toiq6KvX7NRnXOIlIu/
         I0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Npbjmx2EEwqSvhfm8k1aVlqXx6O4MStkJENyJ0fqd4=;
        b=rappMxmaSVkFrvOTTK37yxVnxp6K6m9ksnhLqICF7nMgTOpKL34V5K3rQeXWS2hWUN
         pdVVpzOLShI14QAhvs/EgYJ81jqhSowoyXWQjKTxl7HFzibmvL7976ZjQy0UgPSOWBjA
         C8nPsqqkyYdCP3E9aiB2SZFSTpLbk4wi/vmkGifjyU0lcKVExA6vUdnatXNER8QRS3Ev
         IQBqBBay7Ulq0QwWCIyZBDlPJCt4zyPK2jCQkAmjrhZcJX7vLnWHJpG91YpxCTezv+W1
         AgRhPW6WRQr9+qmtRSdXWGRltyHh0TE6HA0laQDePqM/Ix41Qj84P1DeyxtkeHTTyWa3
         Ssuw==
X-Gm-Message-State: ANhLgQ2A3uyPY+LKe9mLN/fBxZ3t6csazsjJSEScqxDu4ZsCjEtPMaAl
        5ThgVycGyx8UD9GJZySrtL1NsPk35t1vfN7AfQ8omw==
X-Google-Smtp-Source: ADFU+vuo7rHjjKyQgOxCXqSH33bSM+Ja4ivZZHhrCjU/q4tcBMMOvFAfACxfFq8agQOOqIlp22v+O/jFyzpwpcjpyIw=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr8192077lfc.4.1585303842443;
 Fri, 27 Mar 2020 03:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200304225433.37336-1-tony@atomide.com> <CACRpkdYL5mZ7i6bEF0b_CUXaG-jHKz4KnSXsBNfs_9M054U3vQ@mail.gmail.com>
 <20200317173422.GN37466@atomide.com>
In-Reply-To: <20200317173422.GN37466@atomide.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:10:31 +0100
Message-ID: <CACRpkdad2Qm76aMhSw9Pdh9=Ed9BXsa6SVsAG2+v=KYRNcwEhg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Block idle in gpio-omap with cpu_pm
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Dave Gerlach <d-gerlach@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 17, 2020 at 6:34 PM Tony Lindgren <tony@atomide.com> wrote:
> * Linus Walleij <linus.walleij@linaro.org> [200309 09:27]:
> > On Wed, Mar 4, 2020 at 11:54 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > > As discussed earlier, here's a series to use cpu_pm to block deeper SoC
> > > idle states if a gpio interrupt is pending.
> >
> > As you requested I queued these on an immutable branch
> > based on v5.6-rc1:
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-omap-block-idle
> >
> > And merged into gpio-devel for v5.7.
>
> Hmm I'm not seeing these in Linux next yet though, care to check?

I was just slow on getting it build tested and pushed out, sorry.

Yours,
Linus Walleij
