Return-Path: <SRS0=lu8F=YD=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48711C4360C
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Oct 2019 23:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FA1D214E0
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Oct 2019 23:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jxdawBRi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfJJXWU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 10 Oct 2019 19:22:20 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:44933 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfJJXWU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 19:22:20 -0400
Received: by mail-lf1-f46.google.com with SMTP id q12so5628662lfc.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 16:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fhU25nh/9Zr3m9syjFrDpmPKNSXHU1RyrJveosqbngk=;
        b=jxdawBRi4YZCtVjGb59KD4PNeVex1gvpCcDJXcg/aNF/shY17y9Fgd+3AxtuqYY1k6
         U1YoE1NXa2Gsf8sSD8osgq7Kv6dwESssaOz+6KFZ2s2+4FUZOJhA17k+5INSjmxcvdDD
         Jpai8r3jldHdXH6T70XK0R5nEOSE0fat/2mzvf/KWiT18QlYGsHhNBqTCMNvlptItkAs
         KLBaaAJL/soDKpXtR1DMHYKyzW3T0+oRGXDZ0g1eaSB5xEOeejsVKxGRsObKSKfRvcB5
         oXcaqbeQOiinm5AiHOSmpfFC5UvbOw5eflGrC+Bk5K3UfVmSeM1uW226/1KZ7976Ag9L
         PlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fhU25nh/9Zr3m9syjFrDpmPKNSXHU1RyrJveosqbngk=;
        b=e7rX9TlGjMseOxz+D+QMQyjzdkllqSGvoajY5YTHa2uc1pEhTZQ93pNODJwoDdUySS
         ideIfahTHdJ/URjpgRkTHCsDnvtlEFNfPD8lQ6WzSq4/8QuUgoTvJpYyMxMkc95niCmp
         4wP6qGnK/yJuycCf5tiWrnrHaXIDUFYYBwvVzE7yuRhBromtuZlrJs4otJIC7glQd26e
         fe8VA0dNSMNq7dAdtna1XJK7KAfEnqr0x6X1SHeo/2wQpv6odaOddslaSNlmS1hl4i8H
         wiNU3teoseN9wRdRhVJrdSwYp13VsSstlJroIW6I4iqLTocYBaBC2wc+l3WAmIQQxh2v
         heYA==
X-Gm-Message-State: APjAAAWhmOUBe3JZt3s5lh3WOSohRwc7VnioFbPlgGa8psJ5c2WgnN1E
        Tgs08/gq1/JnZY5ytHMorx46EJ4GZvSwDNzN0YDGKQ==
X-Google-Smtp-Source: APXvYqyE1xaTTTL157AtpT6PjyyIMbD4jzNJ9hzcFSr/Q9tgYLQHKBzukNzOccIGJnPlduK1mwcUpRlzlRcuX0etUBg=
X-Received: by 2002:a19:ae05:: with SMTP id f5mr7041581lfc.165.1570749738310;
 Thu, 10 Oct 2019 16:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Oct 2019 01:22:06 +0200
Message-ID: <CACRpkdb7ZvENhOetUCRwkC0uChhpg--DefcLVic3pQ5qR3zfDQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.4-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 9, 2019 at 6:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Small set of urgent fixes against Intel GPIO drivers that have been recently
> converted to use GPIO core for instantiation of IRQ chip. No conflicts observed
> with fixes branch of GPIO tree as of today.

Thanks Andy, I pulled this in so hopefully -next works, I will have
to rebase on v5.4-rc2 next week before sending this so will re-sign-off
at that point.

Yours,
Linus Walleij
