Return-Path: <SRS0=QqSN=DV=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22C7C433E7
	for <linux-gpio@archiver.kernel.org>; Wed, 14 Oct 2020 13:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C8C1208B3
	for <linux-gpio@archiver.kernel.org>; Wed, 14 Oct 2020 13:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="t153t+/+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731048AbgJNNPv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 14 Oct 2020 09:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbgJNNPv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 09:15:51 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51ACAC061755
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 06:15:51 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id t25so4721995ejd.13
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Opb6uV4YDt7mi5cONT3AJ54Tjor2liwZ4+e7RNXQ7Bo=;
        b=t153t+/+zMz8CNe1Er9brlcwBFVz62/DRNZlZ6NrHJyBde75cU7SLFtG/wibWn/R3G
         /Kc/Dt7LEZt0OVautnyIj1X2RPbtdDhgSeV97MSAgBfJazCfpcaERKDErn7EYb4M79xU
         j3OkAH0++bJacQfGismrGXlZlOpvkNx8ZosAnobyL45BgBDDe6kxUOGyn7sDCBfdWVvt
         d9F1E5Caw8CsZ/gXWYi0Q7O2Rm0TqFb9yi38iL5uPHHEnt7HY535UmU9h4FGKIsM40D9
         n+LFa4QGQl1o8VSFZSY999bUg0o9/PHCLEx0njmWGrMEm5S04/BcSEqswN0HB6zwWyST
         wJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Opb6uV4YDt7mi5cONT3AJ54Tjor2liwZ4+e7RNXQ7Bo=;
        b=CNTXP5qfXQN5CBYrKngYUgySICIsaFllB/NMyDhfxnV2l2eVIYOnDpCgQZQj7rllat
         emqQ6Uvc8dhhzu04Z0uRCLGwqX2YDF107zt4TrM5m0ILMDlG3fZQ3M1vkxzgbdw/6Vux
         9T7E+KVI3AAWWW2mvkYILypTi/IcH8Mt3Apejod8N7H98LblggyzOKqV9XFtngdXq/dB
         hgfeLuG8Qlchu4FHCN3zOKYELFjUlVd9fpTytCFtBFsMf7JKTEbU1TUa9EigAX4VECnF
         nQ5RgORmuJDk1LloLSeVNwXvSq7ilnN644nmLMscupETRTELjPeS8HWOZ/4ZtZr7t7jh
         9bCw==
X-Gm-Message-State: AOAM532WTyTN/x+wlDThaXIlUdwRLqK4kuIMYFalLG22XwrhtUSn4Okk
        ac+uEZ1jQKOFlrm/mFQd0q7oM9jYBbZioDbWFDBvZg==
X-Google-Smtp-Source: ABdhPJzcuiFfNo3GAOAcfaZgizmbmeRqCZoYAmJOdMbLX8TkaV0YI1GyL2DobwCJUbLVDB1xtn4xNK8e44EkGz0v+pI=
X-Received: by 2002:a17:906:14d:: with SMTP id 13mr5217587ejh.516.1602681349970;
 Wed, 14 Oct 2020 06:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201014113052.234932-1-warthog618@gmail.com>
In-Reply-To: <20201014113052.234932-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 14 Oct 2020 15:15:39 +0200
Message-ID: <CAMpxmJV5Qung1R-Jj0ApBgp4w3nRZwSRr4WDEObQ+otF6jFoyA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] core: Basic port to uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 1:31 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Port existing implementation from GPIO uAPI v1 to v2.
> The libgpiod external interface remains unchanged, only the internal
> implementation switches from uAPI v1 to v2.
>
> This is a minimal port - uAPI v2 features are not used, only the
> uAPI v1 calls are switched to the v2 equivalent.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>

Cool, thanks a lot! All tests pass with this - I'll force push it to
for-linux-v5.10 branch shortly.

Bartosz
