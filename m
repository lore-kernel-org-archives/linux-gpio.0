Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06252C6FA99
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Mar 2023 13:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjCGNcC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 7 Mar 2023 08:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjCGNbt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 08:31:49 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0247BA3A
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 05:31:23 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-53852143afcso244945147b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678195881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qZDlZ4nvcYqnA7rrOlrlk7Ib6bN2Rj+gic41qjc6Sk=;
        b=csz6D+7qw4ihr/1Q1hYTSkqILMOaSoUsowp1U7h/ni56nX/+aBQoIiHoWIlKyKl8X4
         zq+xVwxcBDGzSLtahMpQOBACWxrveOj/+ArcjOvPNLoL0suTP+ukwNGwF136A4Dayybp
         GWm/DvqIfyJp/htKSqEncFX+eZbRZ7sSzAtOJDXWcHuMpJniKM4HOecz5cJlcIlcoeZT
         NwRGshB2J6j7TBILMDdY18XXPwOTMabvfG94WLpgb8pygXE7oNNk/bXcz1yPfurDwS5F
         iqZzm32yEqVrCiIJ73X4pZARre+jNFfGwBUYO1Yj7dANhtHMb8RORDzGtnlY+SUL820M
         2BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qZDlZ4nvcYqnA7rrOlrlk7Ib6bN2Rj+gic41qjc6Sk=;
        b=Rek7hl2kIofix186jx8xK9Vpgg8r3gL7whMtL80uRdiwpaPpMoSigEU3GnHLUceHCG
         FwLUJR1t8wz9jmoUrQFfcjuPNx5hIAFYHa77Upjm+mekSbkEi7Urph/KYFQQkXd0OZxw
         RyM4+XZ+uZq3veLnIVB9FUbSvoIhCZBjzOcEq+J7lJ7PVs5jg4PTJNJKWhdgQdRi3eoN
         MRXC/ZCdbZ2BAZyz4v2DC2O5g73bWWFkka1VRATC2tRt9OzugLNiFDEMUtYwxAjYJxp5
         FKvH3cz9+sRaD/ANkKGWmzWz6DfSzdKVmhTSDT5rsRUsg5AytRuqApe1Y5yE6SbpQAGx
         h+zA==
X-Gm-Message-State: AO0yUKVzVUnHmz3L7chYl3M7yVhAOSmvCzwC4sGew7/u0VjWC7xoZB08
        o4At8iuUuB4GiIyKKbn93ANaStjQjGdDxhpKZZrkig==
X-Google-Smtp-Source: AK7set9E8w0pJh0BVoOHhtl6CYrFbDwMltsJpSZJqp2AS97HPe+ed7p/77Kqwpjgt1kY1eeDT2PPd1l/BExC7pyIBuc=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr8676951ywh.10.1678195881039; Tue, 07
 Mar 2023 05:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20230302125215.214014-1-keguang.zhang@gmail.com>
 <20230302125215.214014-2-keguang.zhang@gmail.com> <CAMRc=Me=Yrr5BuRaMd4r91URzmdYHWUvVGvLL9YFuZPaV0WYFA@mail.gmail.com>
 <CAJhJPsVf8EvFc9N8eMtc8Qu2BhODv7PzZm9C5ePR+GdTFiAY1w@mail.gmail.com>
In-Reply-To: <CAJhJPsVf8EvFc9N8eMtc8Qu2BhODv7PzZm9C5ePR+GdTFiAY1w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:31:09 +0100
Message-ID: <CACRpkda_y1Hz69XyDjcDPd=gEi_n2PChJOgKsonXcvYyxQzg4w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: loongson1: Convert to SPDX identifier
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 3:25 AM Keguang Zhang <keguang.zhang@gmail.com> wrot=
e:
> On Mon, Mar 6, 2023 at 5:29=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > On Thu, Mar 2, 2023 at 1:52=E2=80=AFPM Keguang Zhang <keguang.zhang@gma=
il.com> wrote:
> > >
> > > Use SPDX-License-Identifier instead of the license text and
> > > update the author information.
> > >
> > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>

> > Why are you removing credits of the old author?

> Kelvin Cheung and Keguang Zhang are the same person.
> This change is to keep pace with the related entry of MAINTAINERS.

That's a pretty interesting change!

Is Kelvin Cheung the "westernized" name and Keguang Zhang the
closer to the real name, such as pinyin form? That would make
a lot of sense.

I think some authors even use the native characters these days,
as git and all tools and terminals should support Unicode now.
It might make it hard for us to answer mails (not knowing which
characters to refer to as given name) but I kind of like it when I
see it.

Yours,
Linus Walleij
