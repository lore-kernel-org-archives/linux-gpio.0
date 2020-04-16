Return-Path: <SRS0=B0Ck=6A=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81F7C2D0EF
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Apr 2020 10:51:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3B8B21973
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Apr 2020 10:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1HCk3OT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505526AbgDPKvE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 16 Apr 2020 06:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505651AbgDPKu4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 06:50:56 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5ABC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:50:56 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id j3so6840285ljg.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=owzIQXx8DypLfRa6xQhX9mwfxfRvz8ONYu7fJA+S6BU=;
        b=j1HCk3OT6t3XYp4+cV//V+70QYZlk9jweNWR0TZRhHbQwzU+yKgPqgViwMV+gWEMKV
         h5GpZpHY5ubMq+5faWDqw9J/w/UNadps++PuGyPWDUM19Al8Pfiao/DwgtHLqijz7Fzb
         JlCEDfXirasdepBl9Om3tM8BAUWhoyjrB+qf1IYTIAexvwY9zxjmvSuFjexf/ejSieK2
         JPpn2ssGcBrheJu6sYBZXCocTaGicHqDqlE2i0ovbS54ETVatTW8+5kHuO+Dl+yukWa7
         Hl6BkLFKL2g/krhsvZ9SMRrNA3GkrQeW4Dr3id+9lP2ju2KHKiQ407LYMPyUQ4ybxPxC
         dDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=owzIQXx8DypLfRa6xQhX9mwfxfRvz8ONYu7fJA+S6BU=;
        b=npVI/gDwEaLwKmakxUdU/chqdOlFTMArHoTPZbWDO4em4omiFw34ztA1puxFLv7z7v
         QYEPVPiuevTJka5pSLOJLtbnkKMC6KHHr3NEYN1jL8x/fLuBv/+ev5boBgMAQM9iVKXH
         cWvgr3QCZohcP5lw2anoHvwqK2zaWP/4Hsc9viViPhtxADXINTRBRHSu1G9clNxB7GU/
         W42rM3s+M0fyIdD/8T/c216z0Y1uzjZ2iXm9NWb8Q81qDqPNJcDiug/31yPft+IE4Qtv
         ItF2wMmwiCX+2gzO57Zd0bVSr1YqxdN4e/jwqVHOU4JhtsoOc32z8uSWNqHdRi0p35cu
         61ZA==
X-Gm-Message-State: AGi0PubOu2ELqIKJzTcYm0hJNJ/6TMEdTy/ijyZnxmhNyP2aJTIx54cd
        abwwy12PsYBbtF6Il7wfk9alw88w6zCVE41Zm48bAOL4
X-Google-Smtp-Source: APiQypI0Wb6T6xAwFzRLmyejV+xMheo238ZuocNd0VN/SCNCG0jQjC5nn3fjZdE8unhsntz1QCE3QYxw4D4pF1UsT1s=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr6223084ljj.39.1587034254693;
 Thu, 16 Apr 2020 03:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200408154155.68310-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200408154155.68310-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:50:43 +0200
Message-ID: <CACRpkdZKEpz=acfw0zQ71pWmLU8dALS4tap412U2x6GyY82opw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: merrifield: Switch over to MSI interrupts
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 8, 2020 at 5:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Some devices may support MSI interrupts. Let's at least try to use them
> in platforms that provide MSI capability.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
