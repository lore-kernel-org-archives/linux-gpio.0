Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD74C64E7B
	for <linux-gpio@archiver.kernel.org>; Mon, 30 Nov 2020 17:17:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 911C62074A
	for <linux-gpio@archiver.kernel.org>; Mon, 30 Nov 2020 17:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJo645cu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387393AbgK3RQv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgK3RQv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 12:16:51 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F519C0613CF;
        Mon, 30 Nov 2020 09:16:11 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id x24so10818000pfn.6;
        Mon, 30 Nov 2020 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xyuaUQNlZ+Wr7lRf3nZ/9q8iV++QMK7ihsb3scweM/4=;
        b=LJo645cu6Dc21q6H5tXRhmsxSmDTrudgcosig/TUZDRaag8cGD9K422OZUx3VsCxyv
         4F7IJt+uc3vU7/vMMSaBd1+XYk0zsuc12yQ0l42z/m2fjw1q9ynqj9mmu6+kpy2f6F5g
         h1Q2AJfLsmbue83/DIxV9TrVf+Lu1v8i7ovW4iHKnGU3I/ibmIyFQe4jn8Ip296IkuwF
         C8f+PAlfM+zWccJJ1FNB4hCf3vKibwulko4llqzM+ESRqQwxnt9zNVRo/eWtnejuFXw3
         fpadnP5Y/znsCDxRR326J2afDg4yLeCIgyGTsSvCbID374EGQyOCOdvnvRdXyo7dHMKJ
         ub3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xyuaUQNlZ+Wr7lRf3nZ/9q8iV++QMK7ihsb3scweM/4=;
        b=GWcMS5y0RnyaWC1ZyHsP2zX4eqrlw0XnC0RXw3Ef3KYl/MG9C1v9rSEValinvj27Z/
         1rRmU3LI1zXoLDVYVdI3Sm3kNKOhOrgz/Dra2tPpg0eQbwG3mwoy4TPpD+Hk1CyVpNGZ
         7NTYjilwl9t9F6A4w5pmDrlAZ5taKm/T08rKqpn4I/s1FaG0JnnB5N6ne0HRhtmwFlef
         ust8HHnTwo7+GeTbFnprpLN8I7JsxtWKRKz9DC6lixiFWJ0OtgftMYtBnM9fwjCUymkC
         P3ptgPXZtRrkWnrNuhTLt5gP2srPxSsGlTUv43iBCrYFuwzEpPdq0swgKuPenm+CcVeL
         bV5Q==
X-Gm-Message-State: AOAM533GGAf1YsR0uBwWTFgkptR1caW5cfKo2I6enhJu/ltkKUYVGted
        BtQ8GvkjS/8+TkyMN3VWwaSBK0wQSLJL42pP+vE=
X-Google-Smtp-Source: ABdhPJwbYAjaHu4+YFGhnmxvHBwRcaj9DcadlyfYub6DkQF9J3079948EtG5DH1IdaDWYfjUs60QN1FtmQGU8XGwiH8=
X-Received: by 2002:a63:1514:: with SMTP id v20mr18729291pgl.203.1606756570899;
 Mon, 30 Nov 2020 09:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20201119142104.85566-1-alexandru.ardelean@analog.com>
 <CAHp75VdkomLMPYZbB7-KerGmyxXxB8hQuAjLtJ0bhB5f5vfuNA@mail.gmail.com> <CAMpxmJXbpiiKzxsrBk5mdLf1Kk5_-5pwJYOeCsTTqKmS2QUMTQ@mail.gmail.com>
In-Reply-To: <CAMpxmJXbpiiKzxsrBk5mdLf1Kk5_-5pwJYOeCsTTqKmS2QUMTQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 30 Nov 2020 19:16:59 +0200
Message-ID: <CAHp75Vd=S26VgrkcQoMN=xFburOn8207MUYbGzMBLHgn0iuErA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xra1403: remove unneeded spi_set_drvdata()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nandor Han <nandor.han@ge.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 30, 2020 at 6:37 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Thu, Nov 19, 2020 at 4:04 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Nov 19, 2020 at 4:17 PM Alexandru Ardelean
> > <alexandru.ardelean@analog.com> wrote:
> > >
> > > There is no matching spi_get_drvdata() call in the driver, so there is no
> > > need to do spi_set_drvdata(). This looks like it probably was copied from a
> > > driver that used both spi_set_drvdata() & spi_get_drvdata().
> >
> > While above luckily (*) okay it may not always be the case.
> >
> > *) it can be paired with dev_get_drvdata() which is usual for PM callbacks.
> >
> > With amended commit message
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
>
> I applied this patch. I wasn't sure exactly how you want the commit
> message to be changed - it sounds pretty clear to me so I took it.

For example, by adding " or dev_get_drvdata()" to the end.

-- 
With Best Regards,
Andy Shevchenko
