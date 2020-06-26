Return-Path: <SRS0=8KUG=AH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8665C433E0
	for <linux-gpio@archiver.kernel.org>; Fri, 26 Jun 2020 21:54:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B86502089D
	for <linux-gpio@archiver.kernel.org>; Fri, 26 Jun 2020 21:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iY2umJ23"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgFZVyK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 26 Jun 2020 17:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgFZVyK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 17:54:10 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4C5C03E979
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 14:54:09 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id n23so11861418ljh.7
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ahxuLzAEe20xgMczMIARkdH//kqBOD/hJJh1HxpZGWs=;
        b=iY2umJ23koaRNqtlf2EF0RDQttsupSobGPSLLxJ2ncf3fAaR5Kc3y9MsosgCCfmpVn
         1lpvLiNShaaLR7ne8fTk+WZm8osFM1AikBrqDZqLeYlSjinSPbHXxGSnyIC6URym4tFf
         vOUefBICT3mHv9+PibXDdBO2eXx3BUuTtvC2FIv9AU7uQ797zKRx92YH+XQnWWnJouvc
         aJvGUUE0vWhnerMHRn+vKDPtVaThJgbNwqhnOvNzXkLIFu4YNkQeHUu+gNkyqUA2KV77
         Vn2bUCiqsE4v2I14Mw9f6QpFT121Cv3GvpDq51AsWqgZyNgLFlckq3wlVgDxIdySNSIe
         GomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ahxuLzAEe20xgMczMIARkdH//kqBOD/hJJh1HxpZGWs=;
        b=RtKTYRL0lgzrqBHua1t78UFG0DbqhUMpZ/4BH7135qvJz3tgNOMXt3eJMNlwXhe6gF
         oq8rfsnyT7A3cosebrIEpNs5Cu7DHx07a5Q8WxlVvWNWASxtHS08MNIrPpny9nrYo+fn
         k7tfEcqdKye5BfUpVLW3KX4L5Nhcu28ao5dyrQQHgC7RS8n+r6maWqHsmpmRMNyeFcUm
         LYwEK3IR0oSiTDP7dO9bB4y95sd08UCkqdVICS0vyJykVwbs4GZ4Jnpbfi1z85MWQZTw
         OyLGLzMnwW3zEwUvjuMN1zKK2K1mc+shvvL0jbMsZ8f8bewdjJme2ORYnQ2TxmYQO3s3
         4v8Q==
X-Gm-Message-State: AOAM533mYzfIa/FPssrxNWDY7EZmQjmOnSBo4iugOtSik8F4CPJqECyc
        yOLdBFX3rvn/fIU2rbTQIPy50FUtChqf3X8kcP71oA==
X-Google-Smtp-Source: ABdhPJzmwUaGkl5aaOrG+KzP89HDgmNj0i3cADd76IpEpxynSKnpI7u01yKDDUmeFNUjW0z0ttz7m8ofARekzYrSFIg=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr2567176ljn.286.1593208448352;
 Fri, 26 Jun 2020 14:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200625160846.5717-1-brgl@bgdev.pl>
In-Reply-To: <20200625160846.5717-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Jun 2020 23:53:57 +0200
Message-ID: <CACRpkdbCPWJyt8tifdPh4vZmx8Zsy+VmDdRmUxO91cC9WJ5E=Q@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.8-rc3
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 6:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following fixes for gpio-pca953x collected since the
> merge window.

Pulled in! Thanks!

Yours,
Linus Walleij
