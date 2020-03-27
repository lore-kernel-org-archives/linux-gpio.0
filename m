Return-Path: <SRS0=HDci=5M=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD554C43331
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 10:42:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADA5120578
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 10:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sQQVS0qi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgC0KmY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 27 Mar 2020 06:42:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36339 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0KmY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:42:24 -0400
Received: by mail-lf1-f67.google.com with SMTP id s1so7418681lfd.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gz4qI8nVDNtgAJIn3APdRtkA9hlMMni4Oiu4B88S9gQ=;
        b=sQQVS0qi0De31oG2mZZcsnRlccamh9SBU/YMlszwhQAgraBAaMWwmlz0gm5N2nLF71
         UvfRQVItizDv0yu1x/jGUq7URTuAP7B0uoVZkHhdPD5cY8ZS2tb9suImw8K0F17c12QI
         cgF2sNtAFc45GmNb9pVFJgg76N4YSARCOVR/6/uT9Ub2IJXWUq9LoTvN9h9mWM41Yk3H
         CnQZmiQwNvr++SCDqE6Lo56gSII7mjL2/A93yJrWufvNCuX/uVrO1e7YYe16dacUnxRI
         y2GlsolAkTTkK5OgaKypiZxToDRjeM8P3bllCrYnobZ8DgKNPPLZ0WH6i3OKSQbw7TqQ
         Uf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gz4qI8nVDNtgAJIn3APdRtkA9hlMMni4Oiu4B88S9gQ=;
        b=lzIAgakaCKgW/vGh/ZKz6QdUd3sC+HlOZ62Ik0YqKll62K6/TGyvoqk07ArfVc7nWD
         j3om9VtQ2aPY5tcM3ypxR6Ce+UTJWlkAIlvH5STetMsbJ7fLSqs/yf9cCIbX28NfYv9R
         7+fsYVwOGRQtj4oUbWQs8La6ENb9wMFxhEcqSFyIJrrzEtEwSBSszzQKulaUe6wTlD60
         dxPtKn8tQau14in8O1S7tnLu7wsNVnF3zspN936DDV0PHw/9jEYSpnFpRkfSZN4Vz+Up
         co1QnbmWeTCB0Djw9gzmv79z1z71ehY9gkqH0hlpblPxfiSxozMuyJ1PBfOE8+QBiTaS
         CyvQ==
X-Gm-Message-State: ANhLgQ2UrRNFP4qdZMog+g25FrryF8uPdDqZA1NHps1TaKkyIHHnHKHs
        Ci3uzCnJIaVxVHZhJRTvwJ4G6/rB0QqE65vHThhvJA==
X-Google-Smtp-Source: ADFU+vvOV9nZ6aMz+8cfpoSBwzxsI5xEKGvfY4juq3Xc509inDqGUOyApfWhmV/t0OdQbUxH+yUD/rg9O6tRKRJQi68=
X-Received: by 2002:ac2:5b49:: with SMTP id i9mr8781324lfp.21.1585305741942;
 Fri, 27 Mar 2020 03:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-6-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-6-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:42:10 +0100
Message-ID: <CACRpkdYnk4yqqSj23FersOYZSLdExAyjV=UbwKGcDMBcxJBKDw@mail.gmail.com>
Subject: Re: [PATCH 5/9] pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Properly spell "Schmitt" in the kerneldoc for pin group definitions.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij
