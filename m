Return-Path: <SRS0=nfV1=4Q=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C45C3F2D3
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Feb 2020 22:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F8EE2469F
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Feb 2020 22:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6Mz6v7N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgB1Wna (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 28 Feb 2020 17:43:30 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41116 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbgB1Wn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 17:43:29 -0500
Received: by mail-lf1-f66.google.com with SMTP id y17so3252244lfe.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 14:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1BxbADyqh67zLR4CkPE+bXFbR7jY3OFFxVQi+eBGBI8=;
        b=i6Mz6v7Na8BLINyiuQ/hSPnAQQmxYEOfbBcBVFXW97UtP8mWO1dwLWdjpxC9QcQGCg
         GdGmH5PSCv3zZzOrPrMscGcCVDWEUpcF/bT6gk4hxsNm+jfO9DSU3BDnWl0836NcMsVt
         AeoxZzXYTmEmRyTbde9eiR8/snn6du/PNUk9R33LMErQxsnUUVCGoyzoCaR7OPs1Lycm
         KFvIQTf9dTXt9wDtHbgx+sHgl2V0qBKNBlC7Chtn3n2RL5q+hsn2Nku/sT5hzRzxg/Mk
         GW5LmRNmZk92fK87ghlEjij9rPeSrQnhwdJqJ4cTn9k4ZWcE8oEBFHkcz1F+cG8aVhSU
         oaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1BxbADyqh67zLR4CkPE+bXFbR7jY3OFFxVQi+eBGBI8=;
        b=j14/3EcE5B7uo8gK9Z0UPbHtsGeZXK7m9pcHUXI7HfoxuiiL0mFfaKS4TToy3vt+Va
         LTPy7SJKrvlJ2voR1vT1ofOah40gDmkfoOZscnU9ipLyXR1hcpi//vUWEIVhkFmJJgyw
         iSvqcTijwDSdUWO3uXQSBG0MCJTKh6fWJHM07F4+VTb0FgCIKkn2bIQb/mWwBFPdiiOH
         YqssO3GkxTM58pLbWGGbD/ENK5n11BQoiHhN+Gk+4BP886MNHO33EUiATLhMyp+pRT06
         ZwD4Axu40P1tvzZ5bnsjbXOcCYon1QMjCUXJISr3byXmGh5GUVXzvfbUbuwe7HoQVsrU
         ep+A==
X-Gm-Message-State: ANhLgQ0lnN3QYDDLEXVAyZ8XYkCF+/bz5kCtTvzrSxmOQvKY6wg2xyP+
        7ukUwprRo7Y8I8G0DqBfj4Thc0ZxJ3feuH/zJytv2w==
X-Google-Smtp-Source: ADFU+vvwV+eXKAqc/AH6wyolv56OmLms52Q1I+Lg/sFK1m7+034EZ451eAX8G9p01LxfFc6BXUqFS0ufeeNdx6RY9L0=
X-Received: by 2002:ac2:44a5:: with SMTP id c5mr3584341lfm.4.1582929807065;
 Fri, 28 Feb 2020 14:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20200220130149.26283-1-geert+renesas@glider.be>
 <20200220130149.26283-2-geert+renesas@glider.be> <CACRpkdbgsR1n1qj3HmQWcEjeDdN85N1Mw8kLOUAeDjESW36MDg@mail.gmail.com>
 <d2b87102-fdf3-f22f-8477-5b2105d9583b@gmail.com>
In-Reply-To: <d2b87102-fdf3-f22f-8477-5b2105d9583b@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:43:16 +0100
Message-ID: <CACRpkdZwaKA-Gq4wjkPZ_VFiOgNgvLPnYmx4A3AFE-0eNNjQpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: of: Extract of_gpiochip_add_hog()
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 21, 2020 at 6:18 PM Frank Rowand <frowand.list@gmail.com> wrote:
> On 2/21/20 10:08 AM, Linus Walleij wrote:

> > Patch applied with Frank's Review tag.
>
> I created a devicetree unittest to show the problem that Geert's patches
> fix.
>
> I would prefer to have my unittest patch series applied somewhere,
> immediately followed by Geert's patch series.  This way, after
> applying my series, a test fail is reported, then after Geert's
> series is applied, the test fail becomes a test pass.
>
> Can you coordinate with Rob to accept both series either via
> your tree or Rob's tree?

I see Rob already applied the test.

I do not personally bother much about which order problems
get solved but I guess if Rob can back out the patch I can apply
it to my tree instead, before these patches. for some time,
before I start pulling stuff on top.

Yours,
Linus Walleij
