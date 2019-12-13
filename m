Return-Path: <SRS0=LJ04=2D=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBA9C43603
	for <linux-gpio@archiver.kernel.org>; Fri, 13 Dec 2019 08:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E7C0214D8
	for <linux-gpio@archiver.kernel.org>; Fri, 13 Dec 2019 08:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMDJxkiV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfLMIvG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 13 Dec 2019 03:51:06 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43396 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbfLMIvF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 03:51:05 -0500
Received: by mail-lj1-f196.google.com with SMTP id a13so1730604ljm.10
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Z8pJbrRFAv/SlVt/bSDmUqBFwkKFr/Lhgb4eauAhjA=;
        b=PMDJxkiVm1mqYfp/ezsU6gZukoELITxuF/mIzWkaCMb8HbMUt0H0XXohyYrah3DC8o
         uqedI955+6FULPhQIJeWc+4jOAht1WdCvwz3sCBIVpjuu8qEVOriXDF7nZYFmkybZ2gb
         aZptQmhIbuL+s0NMm1fzZ/iIZfmIr50n7rIcQzlMPV5j7q1H0K+WrH5BjGxJtnJ70Zpi
         YPfXecMgze8RwB3IQe+WFvHy2gIaUDX6TeXeHSlvLrh3NYlBQ48fnZaBDwlI8FgnHP+R
         V2D8i7oWgToWJAVqi3nZK41FFAG/U5BnNIk8OjYqM2CYxfoHo01aNJ3ImXlrk3oZV1BB
         ve4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Z8pJbrRFAv/SlVt/bSDmUqBFwkKFr/Lhgb4eauAhjA=;
        b=En97JzfE0d/zyQU0oWMeZTO40/yGiAgNGmQ1f8WedD+leSLIagFWYcalucSny57bU3
         l8fTzgsUKRxdoJWKISgrI6WhAoMOruOBorJg4CFBD+Xr8CNgdm5lNxhrXYQyf/AR4vNb
         fNVWqPq1WQxdWKc4Xi/GJVvzEek4PQV1ZFlRhuEdAPgOiIUxhCqq+7Px72fY7Lzo9H9G
         oufeCGA4Sehyhsm8TPJf9/L1lyQF8YMb2P5fPIU17jKTND8bmEuIeRR9cxHNPUBqGKti
         44Y6IgAfhZN8SKA021CVrwWv36gBrSxeodHjexJ8T0/mG4voZN41ae9pkXGmGer9rt64
         Pwjg==
X-Gm-Message-State: APjAAAUBsScq+NtX6nVNiC03GIeQ3OJnf1PEM0Sp2XYT/7u6E+FJBMTv
        kTzjpBV+6WCT8zawxj+z77thkMAFI2VNmEcOxubcxA==
X-Google-Smtp-Source: APXvYqyILnQnQIVLymrJqvXhhEyOLOB3SjozAuh1tYx1FYuarVqwz5mARQK0XlBDPuswAiEWqtLR5ZOSjwlUiEYSgvg=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr8428303ljh.42.1576227063362;
 Fri, 13 Dec 2019 00:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20191203141243.251058-1-paul.kocialkowski@bootlin.com> <20191203141243.251058-5-paul.kocialkowski@bootlin.com>
In-Reply-To: <20191203141243.251058-5-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 09:50:51 +0100
Message-ID: <CACRpkdaaK85sDp9sdMyZX8P8YKZDqv2H-8VBE7Yvi-VEhM2sNw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: Add support for the Xylon LogiCVC GPIOs
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 3, 2019 at 3:13 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> The LogiCVC display hardware block comes with GPIO capabilities
> that must be exposed separately from the main driver (as GPIOs) for
> use with regulators and panels. A syscon is used to share the same
> regmap across the two drivers.
>
> Add a minimalistic GPIO driver to drive these GPIOs, using a syscon
> regmap when available.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Patch applied.

Yours,
Linus Walleij
