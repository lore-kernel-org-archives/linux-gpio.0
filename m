Return-Path: <SRS0=sbuz=7X=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01A8C433E0
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Jun 2020 09:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59A79206F4
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Jun 2020 09:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SA0tA79F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgFJJSd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 Jun 2020 05:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJJSc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 05:18:32 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B987C03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:18:32 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j12so1042657lfh.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kxWY8XEbn8Ok7oBcgLQpTmQYtx8Wj0QtOJ7t8WxrgPg=;
        b=SA0tA79FKZd+CfHK9ZNdbyhLb3iBKdMTTc6eqhkv2AqTV9tmVctiypXv2oeTr2DRVl
         8Gs+ZcaQk1LUtH01XFyKgZ9jt8JjK6qje50D9wkKs6MT+eZbj3cNiKvXm+QulUk7UMpe
         seKygmpDw9VP5DzIrqwANaflh6+C198mG6CF22bRMXmWnhEcYoUzaoxuM7NEwVuS6CrP
         YOrYw3b9KI34l3SMG65yJW96gGEFhFb1JxzARzMRLIsrMr5F2maCTGld4jLTOGMW7Vkj
         +I0vSWFzy8i8BrJQrWA0lrK8+dmGiXhjR+sN9nGRz0Mlw9PPqC8wf+qDRi1Pf9X8NO4U
         ZRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kxWY8XEbn8Ok7oBcgLQpTmQYtx8Wj0QtOJ7t8WxrgPg=;
        b=sh84+QLEEYL/KH9Sp6qw9wfT6+3cuE4g5cc9Ui91f+ENMqd+nAfgTP1pbCdngrW5Wa
         LI7DXVMI6U7Pi0ProkQ0RCVORzx5XML0cLqp2WE+TrAbCzhwYO+dCM4/uBbXqMdGgzhn
         v5J4H2xZvT0Oe9XzfiEsDg+qmZUI6mH0GPJACEBZvmZUSrFODW5ZO+ltyqIPPSUrvIPi
         wuStIR/AFI2V5EHcHBd1tXWWjvq5nceRbrEXiMhEj+b8zRpJDO5rF5TIfYYBp9f8NTWU
         2oUW+yYpCd9DNnUJaRSqimPenpMyfupFOm+v9HtYmxynAZVnGj9Bcpy2WTCFsEE47s6w
         Di8w==
X-Gm-Message-State: AOAM533nypvt4vJw9NgWduKmfUWct05JXlCiSioqQ/HH4VGdAvGwIWFO
        b2X611U9FOtodX/V3WHTpacaK6jrPZ05BcP41Z5IGQ==
X-Google-Smtp-Source: ABdhPJyuQQc0bMA/9zTcFme+AnpFrXQdnMxS0yR7IMoAZT2tDAyaZSMjgDtVwz5lLWcBCo2OMA53r6AE2tAh3ICuKx0=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr1194962lft.194.1591780710628;
 Wed, 10 Jun 2020 02:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200605025207.65719-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200605025207.65719-1-navid.emamdoost@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 11:18:19 +0200
Message-ID: <CACRpkdY6dXr2J2FP8yiK-RN4G2DE6-mTRAU4oj_fxo+x3mGYQA@mail.gmail.com>
Subject: Re: [PATCH] gpio: arizona: handle pm_runtime_get_sync failure case
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        patches@opensource.cirrus.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>, wu000273@umn.edu,
        Kangjie Lu <kjlu@umn.edu>, smccaman@umn.edu
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 5, 2020 at 4:52 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:

> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count. Call pm_runtime_put if
> pm_runtime_get_sync fails.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
