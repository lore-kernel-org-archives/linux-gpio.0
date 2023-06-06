Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F578C77B73
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Jun 2023 10:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbjFFKCH (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Jun 2023 06:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjFFKCG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 06:02:06 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8284121
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 03:02:04 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-43b4056391dso850821137.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 03:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686045724; x=1688637724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzJNkn8MMIl6p+NtwjcktnBBMjRCL8LQ2CZu0WCe8WU=;
        b=b85sowyfu9GgoGWXPnrK/lcStHgLLagfrqalY0vUzKMtrYo9gyfPBM1UjxVni55T2y
         B+RsC04DSvoJbuwSLigKct5ootPwjTwK7C1WC/tE+1Bq/vjWTCdvlfEY0DKfuttps9MS
         y1FZ0csfV4itg9QKmRfRt1WY/mjDL7+mw/5jQ780Jo2bOGr7v76Hf6lDCQmVRqC7ghbK
         knW5L1r0WozAZnjg3sVFNEdvlhFCh3ieIyjXX7P7CgxVmgYc0HhX1F28/iIp51qH/cPi
         OHqPwPaZbWmQtfSi0eZXHUL8ZMh/Ys8JjzJDw2WhZvGq7deGYKBGbJj/RYPXZZe0qCDT
         tILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686045724; x=1688637724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzJNkn8MMIl6p+NtwjcktnBBMjRCL8LQ2CZu0WCe8WU=;
        b=dCkXKfozefhU6SnjKwxlQajJzpUthpUErMqZWdBk2oM8BvQjS1tSVSPcPV0Vmjjmcs
         OUeZkSPDdGiiaYqVuriwBxf0s82oH4NBHvwQ1GPl2M4U9J9SvpLyx80EiFlNZVYbzl50
         3PGjk6DkwJ47S8a4Aks4yA9VaRy4hzAqj114x9nvKMHEtXMOa1LjFeM2voBlxHKOMzWC
         LcOSkN6ktZtkx3A+XcJx4mRYMPj2EBBB/nm6znsIQlPHoiSD4HuSkJbPlG3wZN319OLU
         nCoReEvJtz6+1O9grcHBeabgB7g4zy0Rdt+mrkUGrlhKW0HSC2tc5Ua2M6qT1Tmimz+B
         BhwQ==
X-Gm-Message-State: AC+VfDwvOZbzqnrz0bcyicQFfyFphUhDb1er08czwSknk1ixrn+dQJ1h
        EJ/8+zhWjZCIOP+qB8MQy5qG3qC7qGKyxhOt98xk4g==
X-Google-Smtp-Source: ACHHUZ59ux3Tv3PzL783aI5oC4KCKnUVsXc7kqBQ+9xVId0Qy7fLzd7keSb9xbnNWaejDUqqYnZWjUtZMZ+LzIfWAso=
X-Received: by 2002:a05:6102:3a67:b0:43c:5432:1fae with SMTP id
 bf7-20020a0561023a6700b0043c54321faemr359451vsb.27.1686045724034; Tue, 06 Jun
 2023 03:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230606051323.17698-1-warthog618@gmail.com>
In-Reply-To: <20230606051323.17698-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Jun 2023 12:01:53 +0200
Message-ID: <CAMRc=MfdusMAqfjnQTi_-DdjeLHQzywpk=zpKaQjahy6_gds0Q@mail.gmail.com>
Subject: Re: [PATCH] gpio-sim: fix memory corruption when adding named lines
 and unnamed hogs
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 6, 2023 at 7:13=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> When constructing the sim, gpio-sim constructs an array of named lines,
> sized based on the largest offset of any named line, and then initializes
> that array with the names of all lines, including unnamed hogs with highe=
r
> offsets.  In doing so it writes NULLs beyond the extent of the array.
>
> Add a check that only named lines are used to initialize the array.
>
> Fixes: cb8c474e79be ("gpio: sim: new testing module")
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> After writing the comment above, and looking at the code again, it may be
> clearer to instead check that the offset is within the bounds of the
> array.  Or do both.  Consider that my review.
>

Like:

if (line->offset <=3D max_offset)
    line_names[line->offset] =3D line->name;

? If so, then I agree it makes the purpose of the check clearer.

Bart

> Cheers,
> Kent.
>
>  drivers/gpio/gpio-sim.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index e5dfd636c63c..923e8ff53128 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -721,8 +721,10 @@ static char **gpio_sim_make_line_names(struct gpio_s=
im_bank *bank,
>         if (!line_names)
>                 return ERR_PTR(-ENOMEM);
>
> -       list_for_each_entry(line, &bank->line_list, siblings)
> -               line_names[line->offset] =3D line->name;
> +       list_for_each_entry(line, &bank->line_list, siblings) {
> +               if (line->name)
> +                       line_names[line->offset] =3D line->name;
> +       }
>
>         return line_names;
>  }
> --
> 2.40.1
>
