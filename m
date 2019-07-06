Return-Path: <SRS0=WFCU=VD=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA4BC5B578
	for <linux-gpio@archiver.kernel.org>; Sat,  6 Jul 2019 22:34:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 633F520838
	for <linux-gpio@archiver.kernel.org>; Sat,  6 Jul 2019 22:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jEQXswWh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfGFWet (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 6 Jul 2019 18:34:49 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40834 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfGFWet (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Jul 2019 18:34:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id m8so2901041lji.7
        for <linux-gpio@vger.kernel.org>; Sat, 06 Jul 2019 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLgw/xR00Rr0ulhIzOABkbpz/zSiCLJleiWD8vd5tcg=;
        b=jEQXswWhcYyBI2kICuWjcqZ8qlrjejgxySrCHGjgjHLp8PnD7krqad3WkJ8xReW61Y
         1hQNCTuxFppFbD4mgAFO5nQicCKWYeNOB2OO/NVOFdNyF6tzkjozA2ul0ShgJc/Zyo9n
         N8+H0zy3Ze7bt+RXNx/9lBBo5nNXommXKO0LwwEqMYF1BAu5hJkZMp9UHAp6m6czyDuY
         Ax6y0NoSPrOhMImI0xTL8ML6u3sFnuGsaD/f8q+7Rx3/rM/eNZyK1pIO/p4nj98HRgL3
         DgRt9NeDYk86uzsxaUhglTNrZVZ8T3CVvZ8zNNyQqPdWVlV7ett6l9A511QUhbnduseu
         srJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dLgw/xR00Rr0ulhIzOABkbpz/zSiCLJleiWD8vd5tcg=;
        b=YUoapwUmt8vHwHehcWSH/+src4l7PzeRXuonREA3ihIu+8hu7kBI083V864HNkr6pN
         LHJ3bnXHGxDCYw1SpqM8Sn4grjg3fhAKMulGQ9bVP0BPAdqTkGlo+rzlpRhLVVzZaW5r
         2DO56DirX8IgjTLaOAltaMBQkzQ2BZAMhIK+D+HA7P0PUPWMwfOG6mgPS1qF52UT+s8v
         xkwwjAPqXry3uB4g9vwdctYsC+QR3ahFnP4XG7i/y78DUGM0PiFeMOPsLtJTgmS5izzd
         TN8n8AjOCPhD1MNaPHmAMAALr58dpg+RH2iU3Fblr19ovjp3WS0Vkh7GTx6+nSNGned+
         MAZQ==
X-Gm-Message-State: APjAAAX2FGGDWQKlmziMSR4+Qsu8bvxEy9dRjJO+bzxYm7ZW5FD5GTrc
        jyS49/dqk/knfy25uKL4k0BH9hNI3Q+ZpLwB+enYSa5M
X-Google-Smtp-Source: APXvYqx13cF2PlmOp1PXhyDx6OecBtpXWBZN1yq1vnMDfsUTnM3Hdprtb3l623OoOJwZ/o/YlJlhAo+9QwKz/g+KDGw=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr5997493ljm.180.1562452487644;
 Sat, 06 Jul 2019 15:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190705123220.54008-1-yuehaibing@huawei.com> <CAMpxmJVZHJKQ7bbHo=T9R99qguF315bZ=YVRrCdqti2SyzAnDg@mail.gmail.com>
 <74ffe8ea-e6fb-bd2a-42bd-08392eb27c69@huawei.com> <CAMpxmJUeg1jVZdCeiRqTZykBZNPGAeQkaNfA7qc1zt+sL9HPjA@mail.gmail.com>
 <CAMpxmJU0=w=htiY3CL9GDBU+waBjV0X7yh1UG6ip5BiV3J7nXA@mail.gmail.com>
In-Reply-To: <CAMpxmJU0=w=htiY3CL9GDBU+waBjV0X7yh1UG6ip5BiV3J7nXA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 7 Jul 2019 00:34:36 +0200
Message-ID: <CACRpkdZikRyZtbYajc7gN0N6xRoCQpGGVO9rivwuG6-AeVo1xw@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Fix build error without CONFIG_DEBUG_FS
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Yuehaibing <yuehaibing@huawei.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 5, 2019 at 2:59 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Wait, nevermind. I think that commit a4de43049a1d ("gpio: tegra:
> Clean-up debugfs initialisation") is wrong and we missed that. Linus
> what do you think about reverting it?

OK I reverted it.

Linus
