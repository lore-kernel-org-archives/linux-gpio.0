Return-Path: <SRS0=nfV1=4Q=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD6FC3F2D2
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Feb 2020 23:33:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9E2E2469C
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Feb 2020 23:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgpmxZ9f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgB1Xdm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 28 Feb 2020 18:33:42 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41510 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB1Xdm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 18:33:42 -0500
Received: by mail-lj1-f195.google.com with SMTP id u26so5028729ljd.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 15:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hkOrGQTUil2jVBBDqFqKrlwpeqHUXILYxK5e31tvxS0=;
        b=jgpmxZ9fGsCQjwNW/xYZU8NzhYJJRQsRKUYM60FMiBWYpPSsA7yiWqy2cNQkzN6eMn
         1dvuYUIwF+XcZvWePefIMwMv/yGaE/mALxU/IQ5K74qLNwittf9Rx8wYiHQA8BYMvz3P
         xeebvZyWyYsSE6tTbgxclyjnPm92OscKGM6g8pLz8T1eXbaHkxG2RR+x0Sjb6FrZXKe4
         gJ3/p62lkJV/+eUgMnbkrxPoKaKzyrrBSx55VoFnx9K/tywC/s1NU6eAtdGg3PIY5d8k
         s7or8Wbym9H0j3o8BbmZURm+e9xD9cNkQFBtD0UTkC4dVqrErAH2fDnaSqWXZ3hvIJ+V
         s77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hkOrGQTUil2jVBBDqFqKrlwpeqHUXILYxK5e31tvxS0=;
        b=BUU0+xjhXnpRhMRlsQ8k1Euqsw6JDiWMzHa23w+HI1D1p44K+YwHPMIiX7UtHvOQbE
         y/kEdTE2Ar8Dq5JY/ZOsEO2+of1tshg/9ya1/7qRLbT1pC4VcgIHlajMmq/qxrMlPig0
         tNLu6qzY7TnF0Cxwa8Pytd8P0DJr5Ak0GfmN83eCY5LlxhStB0Rf7TXnowCiz9bY0y0u
         tRCMupc+i9gpNj+oBiHj24c5uZlxLQZTHxrzGlpfXr+clus24UCLuXPzItjsPDCSqysM
         vhNqfYI9ubsV4x1nDaKgGy6U7lf0fk4KDpmFHVaxVJrjHPMYSu+L8EN3GFzWgTrgMb9I
         Fhww==
X-Gm-Message-State: ANhLgQ3bbjwzfWMcfGzAV6wHF81QZWjTBhOr/MkO6+3tLKbs7ZtU6KWa
        4FT9JiPrioDfr2kRlHFa0L3rwi8ExojQrRceK2fg1A==
X-Google-Smtp-Source: ADFU+vseh+q+xB7V/6baLcFSo2HlPLM1fgbxWyxaT5jZNfkfHPqWAPnupzICk6ekXwCKX2Bh6JPOGDJ3BbU5Mc+I5Kk=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr4259493ljo.125.1582932820144;
 Fri, 28 Feb 2020 15:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20200228154142.13860-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20200228154142.13860-1-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Feb 2020 00:33:29 +0100
Message-ID: <CACRpkdYF5y7jYCczEkdLuECfiJNdp92xafgq1-GV-N2aF=3phA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: Remove extra kref_get which blocks hogs
 being freed
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     ext Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 4:41 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> kref_init starts with the reference count at 1, which will be balanced
> by the pinctrl_put in pinctrl_unregister. The additional kref_get in
> pinctrl_claim_hogs will increase this count to 2 and cause the hogs to
> not get freed when pinctrl_unregister is called.
>
> Fixes: 6118714275f0 ("pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied for fixes.

Yours,
Linus Walleij
