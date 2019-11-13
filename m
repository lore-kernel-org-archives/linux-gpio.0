Return-Path: <SRS0=m41j=ZF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C76C432C3
	for <linux-gpio@archiver.kernel.org>; Wed, 13 Nov 2019 22:03:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D8A7206E5
	for <linux-gpio@archiver.kernel.org>; Wed, 13 Nov 2019 22:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HGQ4dNLy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfKMWDS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 13 Nov 2019 17:03:18 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40108 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfKMWDR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 17:03:17 -0500
Received: by mail-lj1-f196.google.com with SMTP id q2so4334309ljg.7
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 14:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JqHfI5ALH9KcimR52/eIMycSfCYV876/hi3RCTrIB74=;
        b=HGQ4dNLyU5OtnMtiLmmnk4Fl3ZiJHQTSytIKUUUX4BuaOX20DOk7zfCpxbTr+0hTKs
         0TaRrBI9AP2FpUUtQebmlUlvH5Gf4f49jHumtvsFkZJXulAPr0e75ZcbiMxWrCwZ7DNW
         IeH3XNrNfsaPnFu7i9i/eqJqH2qk7+M1RorkJab4Zaemhf7KQg04X2EpPObNLrfuzKXM
         ejaOPsRHOmHvbjGjFWgSVWgv+sqrz1+DfsSQYF+vLsASLu/isw28EEQ+Ghnppxc5H9wz
         V0fbvuiiFcOTzP9yE8I0XUiABoVZiMmrXWEOUAogqCTDDLFc2Z5ifArQ2QFJElOqzH8R
         LACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JqHfI5ALH9KcimR52/eIMycSfCYV876/hi3RCTrIB74=;
        b=Z/nzyUYkRt83DRFk+ZzHG0YMzretGTskSTc+vnOtVYoHJ5qJoCYamqR5e12MnmOKu9
         hWRiAO/BflKSPipjjfiyB2GwMQ+F4BJ0QJBz+hdCetHM4+b935VvGZeD7KUi3UJUe4Tp
         ljiCPolUxPYmdXDmL8XRcyrV1vq/8CQpjhTKpOo8y5J0yvxaY5WjTnHqltoV7LNq3syV
         CR6NkOyxR78aKIqvPtcDeROz+QsJakql0RVwByGxerYHcB6yI1cInNz/olQD+H2ZIK30
         JF9U+3yQ/yBQKfIvbZjvH9BaMzEtMH4tSMqi3hmH+Ejn0uUR1HP67NvHJ55ecqm+D66r
         eLog==
X-Gm-Message-State: APjAAAUrlrT3DNx3S/EuAd3xUaf02tQWjePltu26aomWA1waXHuoUCV8
        YtC5K8oJjMsu47FePwgR/DuAsQLI0py0PjBO+B3eCQ==
X-Google-Smtp-Source: APXvYqySWN3qUBXeP0ENnw595IzkonSYqbDMC9VbrvSxNOqd4AvJOboLPVlmSgpDAAwNVPWunljQQhdYVMx2K13Nv+w=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr4128869lji.251.1573682595350;
 Wed, 13 Nov 2019 14:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20191113155411.20068-1-brgl@bgdev.pl>
In-Reply-To: <20191113155411.20068-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 23:03:03 +0100
Message-ID: <CACRpkdbMFG09uBg+w=W=Vy_3L9Ynj8Lk-t=vdRfKCrGRLQqS1g@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.5
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Wed, Nov 13, 2019 at 4:54 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> The most important feature are the new user-space interfaces from Kent
> Gibson. Other than that, there are a few minor changes to various
> drivers I picked up. More details are in the signed tag.
>
> Please note that this PR has Greg KH's driver-core-next branch merged in
> to satisfy the dependencies of the tegra186 patches from Thierry. This
> should still cleanly merge with your for-next branch.

Yeps I saw the discussion with Greg, it gets a bit messy when I
send the pull request to Torvalds so I need to be like
"there is a whole bunch of alien stuff in there" but hey driver
core isn't that much and it's uncontroversial, luckily it wasn't DRM
or something. :D

I pulled it into my "devel" branch.

Yours,
Linus Walleij
