Return-Path: <SRS0=m/kr=AI=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC00AC433E0
	for <linux-gpio@archiver.kernel.org>; Sat, 27 Jun 2020 23:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F94520760
	for <linux-gpio@archiver.kernel.org>; Sat, 27 Jun 2020 23:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5E3iItr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgF0XJX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 27 Jun 2020 19:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgF0XJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Jun 2020 19:09:22 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854B8C061794
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2020 16:09:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s1so14033268ljo.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2020 16:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+Gk6C25fuWmk+GBH5lKSDs3HLFxbW4odrI+mVCJymw=;
        b=s5E3iItrfhXETCmGt7FOq/eg95O7MMhQTvIRAbG7Wl2FnNAKyVhDkZHZrQByeQB1XY
         0BZIEQ2Kssrwra5nfCDdTeSXwKuZCBRMSq2119maVU4a4nU7Hg8FawFQSZc8e76Z+ZtX
         BcUu1yS2ttfdBHjXIxG+5oHMvlRPLZxZI5SpRa47XEDZfov5ACSLN19ujSR/Mp9Ph3w4
         rgw4TtW1DkbjzbI6fMx+UU4iP6+q+WPl2Z6aj572pyJfZ2m18C8bw+s/1mpXTmY6O8EN
         xQbEHEbqOc68sugImSYGc5838RX/j0nrIoH9414KI75KGP47C0UsfkIeOYA4Hpy+PmlH
         9Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+Gk6C25fuWmk+GBH5lKSDs3HLFxbW4odrI+mVCJymw=;
        b=ow14JIAdcwyoBKULYQumFjPG8ZpqUU6evBF48cu+AzSfifbFQ1bRWksXJnCbwj8Ln5
         sltJ4PtTp4O1kvvUwyGKokAZYpzwcU1xHs6jFonIXrYAfuJL7IRoEn8aW16BYoXqZhGY
         7kQmdXXxhab+TVLhYRuYslxvO/a3g09as8TJ8hDSYIYpSFtqzjihPThh6cqjhgXw9Z5b
         hjlRZqv32E1RNUf2F6EDnBybUI5hOH+J0bbp3/SAKKnUZ99551+zWDBQFJtPcy/lrRm8
         ud3x9T9Ja/dELobKD+0u8e1ueLN4ij8apgT4PTXb2JwIVdRHxZkwPwPFeKP8UkUaiUSe
         CmHQ==
X-Gm-Message-State: AOAM532Pctp/aqDiNhfuvLb87E3ZCbwEvUtdNUrMkSjCJGjbKbHTKyBg
        PzfWoqmzFXUrSXxl6WxY7MiGOA/MG1V4TcUI/zMVtxy7pwY=
X-Google-Smtp-Source: ABdhPJwAeJ6mXtDHh6e8wkR5vEWG3dtODExQa9CxcurVPwEp/mDEH3kowaayQtxo+cyqLQLNbnHPMNIEsuSkhrZ9zns=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr5073657ljc.100.1593299359478;
 Sat, 27 Jun 2020 16:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200627184612.GA26954@black.fi.intel.com>
In-Reply-To: <20200627184612.GA26954@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Jun 2020 01:09:07 +0200
Message-ID: <CACRpkdbrPoSBkv=ncM5H-9-0f2w8Y4d+Epd0GZAYQf2vO43FYw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.8-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 27, 2020 at 8:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> One fix for Baytrail for v5.8 cycle. Shouldn't be any conflicts.

Pulled in for fixes, thanks for this fix!

Yours,
Linus Walleij
