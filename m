Return-Path: <SRS0=MZSD=5Q=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BD6C43331
	for <linux-gpio@archiver.kernel.org>; Tue, 31 Mar 2020 14:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D1522078B
	for <linux-gpio@archiver.kernel.org>; Tue, 31 Mar 2020 14:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjokG7LF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbgCaOs0 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 31 Mar 2020 10:48:26 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44129 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgCaOsZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 10:48:25 -0400
Received: by mail-lj1-f195.google.com with SMTP id p14so22278970lji.11
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6Xz4CqYuqIBv2ZebWmCGF5bl8QGzp44TRh0S5GDwVs=;
        b=gjokG7LFkFY7ioSbmzmzaZTgKbNADr/MY5HmpceKvDgbLDoW0JUH0VKunGcKl6Sf3C
         MOCa3UQ79cYH22mO37ztuqRRVZXezKtdBJqDrIwHfU7IJTRVuYIUlaKzZ8/+TSX4oXzn
         aKj7korhPUcnruW1P7AI4Rgev9kHGAMysC/Tw25KLZSPPWwq13aeHfQNpvuFNoGHvafb
         ZXcN6K3+yR/7Bvxm8jQF4PfpWSgyadyQW7UemRq/7S6TqJRMEkS24Vpd5eTe0ZuMOGUr
         mRee7Fdfu1YQH9h6oWwMHfDiXJ22bW/p7KH19LNrACVayi6n9CAmwuYf+CUQPjJ9e026
         vmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6Xz4CqYuqIBv2ZebWmCGF5bl8QGzp44TRh0S5GDwVs=;
        b=tIXI68WGgQQc86WGZeTBpnxrmeexidDEPCuvpkEMBDO0c5i6ybL57L6w8QsTpiFfB9
         6uxpSGoH/zKy3aFxaaIfRaTUPdAvnPtdnQAUuDqhsXmAnzY5gXUI4Lm05U95DW8JvqKp
         byA+ShdaZy8z1KGQ2DZszBuwt1Bk1h+JmKeHsRhUTnNjGx20UisBFZFYsdl5mpr12bWx
         nv+ZIxb9/q1FknZgpKRrpN9pGBy+tpD48uA3pT3YQ516MHHo8UW/fNffxssH6/UWigBT
         HrXPMnygnanERv8p511uVu1Q6Ui/6q2b1xz6QYnPzLXApiflkK2bLovfG/q88aiPHUO4
         3aKg==
X-Gm-Message-State: AGi0PuYppLackQimzA3rgy2LDE0NxoSYKNauqid1RIoG8QRlO+ScqM12
        5zEXEl5TKu4LhhJW2xdF1P9e/8ba8PWBts9/4dkQKSy4S/4=
X-Google-Smtp-Source: APiQypKJfSEDkSQs+ZMk59JfG3Qiy+6BhF4ZV4C4FTck4vZmijIZ/WNKplsHv+iySVWZwiWndiZ7mZURqug3drdWvhg=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr2629917ljn.125.1585666104014;
 Tue, 31 Mar 2020 07:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200330090257.2332864-1-thierry.reding@gmail.com>
In-Reply-To: <20200330090257.2332864-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 31 Mar 2020 16:48:13 +0200
Message-ID: <CACRpkdY5g=LJLT6XTAL1Wn5cQ9uuzR3h5EUXJfW_Kn7S5tOXQg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Avoid using pin ranges with !PINCTRL
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 30, 2020 at 11:03 AM Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Do not use the struct gpio_device's .pin_ranges field if the PINCTRL
> Kconfig symbol is not selected to avoid build failures.
>
> Fixes: d2fbe53a806e ("gpio: Support GPIO controllers without pin-ranges")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied with Geert's tags and fixes.

Yours,
Linus Walleij
