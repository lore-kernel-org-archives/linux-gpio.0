Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6EBC433F5
	for <linux-gpio@archiver.kernel.org>; Sat, 19 Feb 2022 00:51:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240574AbiBSAvR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 18 Feb 2022 19:51:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236275AbiBSAvR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 19:51:17 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BD0276D5D
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:50:59 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id p19so22704561ybc.6
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXoRcxd/PxYohLQuDrXNBKC8j1xxruLF97guBacNWlE=;
        b=rid44RDP6i/IyKvN0mvHkgxD7LQCEuqQqYxPqJ8hXXRcILYW3Y5QxLsWfL+aSEDs3y
         Mf6gmzprzc000szkdKEn9ujHljqBKiuG+0wEeVxWlIltnrHynd/dVWSiURAAavhBl6hj
         X/HdMZHM8PSb+Oynwq4xOMKVSM5i2Yo4Up5auwNDRqkIWg6W7OJCN9iIBLxs8ph1RufY
         2bqsTBTTyqYcICUPWL+2sJ/rZJGR0js2wcqLqaM8jTDfbDHjleoT52HVol70H+SPmxSN
         Z1i1i42/fPmBaatQTvpvWllhxGQXTrPEoSMbrGeUoEGdtVP6Z9d8n8vEbxBcyXE2KMw7
         LaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXoRcxd/PxYohLQuDrXNBKC8j1xxruLF97guBacNWlE=;
        b=YqkOkR+PxgmPYPvay9Nz7yNw6p0yMNi1VNGZHKQXEuDuqFMLYlbsa3SNoZdT22K1jY
         ON2YYGuXOrxsalfPx8gzZ63LZDhBQaak71YpfbiVCJ7d10QzVgKSKGvVEuhuUdtg11Ee
         9cXI0Y9TIeXzVsxjsjwFv8nJ8uVx54Ng8TOFQ5nzc1R1Tq2MnJzQrBIgbFl79W553rEG
         yeLezkF14yYeQOHbYwCf6uGJXgz0N280UYFc6lcry0jErO6D12EHK3wu6iaiENzpcUw1
         roVnc49nmrZ81smdQ7If1u36B6TnEF9JThaKOBvM3Ssj9fMXG6mNlRpvHtITETtDkPrJ
         xO9A==
X-Gm-Message-State: AOAM532gDlwRwHTAtPE0fAbNodxKkhlAU+E4HRnY+BWmZdHgNBzFS/J1
        NW06qk3Z9A+C8BsAE0wgbS6zegzuisyL6GwPoweilQ==
X-Google-Smtp-Source: ABdhPJyOHCqTr6s4YxN8I7+fD33QonsyyzRr1EyAqSXbWIPDsxeaLLl37s1WIuUsMRmea4RikYkqTa1ApEabhza8HMM=
X-Received: by 2002:a25:a50a:0:b0:61d:720e:2748 with SMTP id
 h10-20020a25a50a000000b0061d720e2748mr9629946ybi.492.1645231858884; Fri, 18
 Feb 2022 16:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20220211092345.1093332-1-maz@kernel.org>
In-Reply-To: <20220211092345.1093332-1-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 19 Feb 2022 01:50:47 +0100
Message-ID: <CACRpkdashCs2GAK5hy6imOnQjJAuTJiZn0Syf+T=2KwUG9reZw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: Use a static name for the GPIO irq_chip
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel-team@android.com, Emil Renner Berthing <kernel@esmil.dk>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 11, 2022 at 10:24 AM Marc Zyngier <maz@kernel.org> wrote:

> Drop the device name used for the GPIO irq_chip and replace it
> with something static. The information is still available from
> debugfs and carried as part of the irqdomain.
>
> Suggested-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>

Applied for fixes!

Yours,
Linus Walleij
