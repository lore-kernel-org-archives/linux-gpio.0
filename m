Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C217C7EE2F
	for <linux-gpio@archiver.kernel.org>; Mon, 12 Jun 2023 14:45:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjFLOpO (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 12 Jun 2023 10:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234576AbjFLOpN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 10:45:13 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB28A8
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:45:12 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-62de1a3e354so11146316d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686581111; x=1689173111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaEVT2xTZwwMXc9TMB8gFA8SO6Gb2+gvJPMkleEgKIs=;
        b=iYJdhuplhF4r1tU/AdSxuzGXRILrq5eEyvfdEy92C7yqhzuqZmv1Aqe+ttTRRfLqpZ
         hcrN3uLOr9fnOn8XCHOR4TvWrLFeK4Pex2nN8iC8SF0HTJMHhWuyeSrcwoEOC0h1bGqJ
         X2UukasWXpm2Dx8G2FPIC73BdnnhdjTTvUGktW8T9Pm8sMVT+iQpuKsWHxUbxq1i8fuF
         BbuBbpSNUF3CJu3lGfMjQsxW7tkn7TwZNBwlCJbn0HJhMImosZ2NTlNptKaDBraH+Z7+
         rqVBmybYN/9EoE8ExZsi1+p0JLkKMAkbb3Uz7odpunB8HHG55t847zJF3SPeNTqCj8cI
         h81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686581111; x=1689173111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaEVT2xTZwwMXc9TMB8gFA8SO6Gb2+gvJPMkleEgKIs=;
        b=GwrU2lLp/N4/clIQsmheDEfuXxe/IoAraVii3rN7/meOA/yn5yNLm581xkvGEVfBUd
         8XvKCyb0CZmzYgf9iJJsuw6xHqxaaiw3F/wEojSV9oU28JnNOfhYkSTTI1gg/ua8mAmG
         +Kh9EoX+90lnskagw7vyveQl0VSobP4x6Slfv+i2sttgv7jFPGXm7qI9u6FeZe9TmVZG
         M2E/rsm2DvMHYtKExLPGAc2sqYkLr7U+zUehItpEv2o88uh0CIabPCjiYVxjh5gpArd6
         4mYFzUxODMIv5RktEP92y/36ohFUhOxrRmUvFPvZBRVVXfoHk+z3yk8R98sIRrZbpTXD
         D5sA==
X-Gm-Message-State: AC+VfDxTZYU6GEV6noaqZWF2rIY0BpgCfn/HgbMQTFRtHXUmtlWjsAyB
        eUL+TYVXh4PRvTW/oULJDu31QLI0xSnG2+OYyc1r0hsEQdEDuoZY
X-Google-Smtp-Source: ACHHUZ5/PVQqlK/0SzOFKRBXCSMZppSSDHIXyXTBGADa0WR/1XA6k2Y8oYe8Avp7M7/oC/4uI4TXDLvCWMIePopvX3k=
X-Received: by 2002:ad4:4ea9:0:b0:62d:e8e1:db70 with SMTP id
 ed9-20020ad44ea9000000b0062de8e1db70mr4809294qvb.0.1686581111238; Mon, 12 Jun
 2023 07:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230609153607.133379-1-warthog618@gmail.com> <20230609153607.133379-2-warthog618@gmail.com>
 <ZIOJM-CgPrfKtIFC@surfacebook> <CAMRc=MeYRKpoU8TaOGnYCqrBy2BdxfNPKhorUx=5rkRNNC7dkg@mail.gmail.com>
In-Reply-To: <CAMRc=MeYRKpoU8TaOGnYCqrBy2BdxfNPKhorUx=5rkRNNC7dkg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Jun 2023 17:44:35 +0300
Message-ID: <CAHp75VfjsLJ3m1rX4aZvA_-NR75rmdP6PJQeOkYP8=e7HWnT_Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] bindings: python: examples: fix potential
 glitch in gpioset.py
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 5:26=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Fri, Jun 9, 2023 at 10:19=E2=80=AFPM <andy.shevchenko@gmail.com> wrote=
:
> > Fri, Jun 09, 2023 at 11:36:06PM +0800, Kent Gibson kirjoitti:

...

> > > +    config =3D dict([(l, settings(v)) for (l, v) in lvs])
> >
> > Aren't [] not needed?
>
> This is a list comprehension used to create the dictionary. Think:
>
> >>> config =3D dict([(1, 2), (3, 4)])
> >>> config
> {1: 2, 3: 4}

Think about it in dynamic:

In [1]: x=3D [(1,2),(2,4)]
In [2]: dict((a,b)for a,b in x)
Out[2]: {1: 2, 2: 4}

[] are redundant, so I remembered that correctly :-)


--=20
With Best Regards,
Andy Shevchenko
