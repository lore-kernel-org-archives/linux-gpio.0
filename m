Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F75C4338F
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Aug 2021 12:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E94C61073
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Aug 2021 12:37:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhHKMiS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Aug 2021 08:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhHKMiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:38:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB32C0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:37:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id p38so5522881lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9S5hNWF7Ym56keRWy48m1LDZ9cViBH7sfuOyRaprzEc=;
        b=OhLxJMmJn6LGQeeXfeGiPmO+AVDUGQYNXJzRzfNxRqi3efHSiZcwI019V8OUjhaXSb
         qyVz6X+DF4E6khqP1VjSveuZVdirnVTgWJoVcttI+pE7f0PfqZ8Tk2xevufW2vVMJwOb
         lp96fWowdQ+F2t7vIf4f9ksWjDCxUFHW/TUacoBkvZ0Nn8Cz98X4fC4sMgBr9ey/zE8c
         8XJP222RFXrP8FAF1Pja2BQfYUXPdTzUmaNfvpu+9hEcE3EnTZdvRUFjQ7Jwp6kfW9Cp
         zd+teOJ8jhY81xicFaR5mL6JRc+jpi4SCQhEv37rPqsZRNuUb600s4Qr6iwlnxyQOGB1
         u8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9S5hNWF7Ym56keRWy48m1LDZ9cViBH7sfuOyRaprzEc=;
        b=M06edZqxshOCDOnayMCIut4oXYHiE21urv5OJNALqAVJVpDWyxHabJVkM+aIkPGpg+
         OBlXGzrYyIQV3FPR4dDK271br6zWJLNPo0rAQSLtiF5hmHLIELt4QgT0HAGdlHrCvgzB
         iZcLnlrvnBxV1J4otgzqfK0GzD85bZ6PSiRAXqCHjmfLx41DyTrbNQW+E4ieCB6Az9hL
         ocqKfdcQ3/sXxEuzWTIk/mm7Zo/fw0vJu7LGd1+mViJfGlrUCKLAUfFUhpcPFwEqG8Bp
         vQfJNaLKfEcxYPXq2Ua97Maud/QTK9vvdBXHpzXo68irRW7Pez1c6w3NpPvkASiMcCDi
         mFRA==
X-Gm-Message-State: AOAM532o52cqVZJtdrDp2jBQUBaN+f6IQu7lLffc9BA2XgC+kZ/nEYMy
        UVg1SMg17L4+5a1fz9LFcCg2j8P3ptoPe0ksWHksZQ==
X-Google-Smtp-Source: ABdhPJzcII1prgIZeP3ejqboxiWA7I+FA2kPmqQ4S+j1vFjaVQJyk+h5CSOe2+KVFhyLYUO1sAb/UlIcR+aFDzlq8nk=
X-Received: by 2002:a19:ac04:: with SMTP id g4mr9218546lfc.29.1628685473062;
 Wed, 11 Aug 2021 05:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com> <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:37:42 +0200
Message-ID: <CACRpkdarpuFwzj-xRPRe0Y4iWwMtsMeTKwZRp8E0hSyDZZcHwg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base property
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 26, 2021 at 2:54 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> For backward compatibility with some legacy devices introduce
> a new (*) property gpio-base to read GPIO base. This will allow
> further cleanup of the driver.
>
> *) Note, it's not new for GPIO library since mockup driver is
>    using it already.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(...)
> -               pp->gpio_base   = -1;
> +               if (fwnode_property_read_u32(fwnode, "gpio-base", &pp->gpio_base))
> +                       pp->gpio_base = -1;

This is problematic because we have repeatedly NACKed this property
to be added to device trees.

I don't know about fwnode policies, but in the device tree this would have
to be "linux,gpio-base" and then it would be NACKed because of adding
an operating-system specific thing to a OS-independent hardware
description.

I don't know what to do with this really, but I understand the need of it
as a kernel-internal thing, however I am afraid that adding this will make
it possible to add linux,gpio-base = <n> to any device tree gpio_chip
as well and that encourages bad behaviour even if we don't allow a
DT binding (YAML) like that.

Is there a way to make a fwnode property only come from software
nodes and not allowed to be used in ACPI or DT? (I guess not...)

Yours,
Linus Walleij
