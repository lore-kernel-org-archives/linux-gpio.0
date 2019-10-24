Return-Path: <SRS0=SOgY=YR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F4CCA9EAF
	for <linux-gpio@archiver.kernel.org>; Thu, 24 Oct 2019 12:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2F1620856
	for <linux-gpio@archiver.kernel.org>; Thu, 24 Oct 2019 12:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACiWYYwS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439103AbfJXMED (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 24 Oct 2019 08:04:03 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45568 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439539AbfJXMED (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 08:04:03 -0400
Received: by mail-vs1-f65.google.com with SMTP id l5so4734832vsh.12
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2019 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yIHdRDSmrUwrFRgZT+l4aoJ5+wJfwLc1Gxo6qeqIHsA=;
        b=ACiWYYwSNj0go/Tl2/lQqg76/wKNHgtph1WZCkgwEJe+upDk/hj6BlpfFgn9+Bowg8
         jz152L6lXUVWJiTqirAUj9jqzvqB06NHvmV3RDhScyffS58ZGPFZzSI6c9B7jFP293S8
         jh38rJLqgSQWl/oXaLYtseJ1zWtZhTuVLL9uK4dWuP8jpSN7xzM0vS5EelSPDkwDmp6p
         nxMu6fAJYoE5Djc8CPllGbBwznEYsqk8sA1l+Fcbw+fynz7uA0UBRAAHptjGXDTqLlVr
         Dt09fWR5mLgf9rPKJO0+C40g9KFUwEXUSTolAIDb7FkdpSQKkUP3vvqM3/ZfvVhwk0CI
         QsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yIHdRDSmrUwrFRgZT+l4aoJ5+wJfwLc1Gxo6qeqIHsA=;
        b=aifxL93pQ4KLof6tRwi0pCE7UhZB/Do1iRn3vlXtH0yytKGlAKgPR6qAlCPfKhh1z3
         VZP9ulOpnJCkoUd7uxsCZhgtTm2FfMSigGpaEEtPT/znYv1rlaMoAd1HKUDqPeQnRQkA
         YR3yFXA1dYT24lb6oizM1LeCYtIeX2R6MtbbRKY2KlaN7zi2OJXoClpakOX2+ifA4sxZ
         B+j67M3bR+cUbNWKa9KWG+Y7hCT8Zr/bHXEPKGrNK/eusWRZWQhHTTMDGu/2TodSy+tR
         d7fI6sg6mn7kjvv6A9Ofji6mJmDZ2rC1Fsox9+x8uFpDau/5VSS71Q/fMm6k0/JgV4jb
         PmYg==
X-Gm-Message-State: APjAAAV7H/cSQQgiqNST2V8bcEG503M6tzNfYS0CoVwfvRwFcMTlQiVT
        75LGfVULfaqaw9X/QcZ8qoRQfnZtadsqaR/VWaYFfg==
X-Google-Smtp-Source: APXvYqy2tjNnWaUw1UPJsxMKldXvGJ+Z5Kl6+j0vYrUnvZIiztW/IstiPyKsEf34lEfaQ1dY5ztUXc9J76ibMzre49o=
X-Received: by 2002:a67:edd6:: with SMTP id e22mr8357905vsp.84.1571918640462;
 Thu, 24 Oct 2019 05:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191016141053.23740-1-yuehaibing@huawei.com>
In-Reply-To: <20191016141053.23740-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Oct 2019 14:03:48 +0200
Message-ID: <CACRpkdZFmXBs8fUnq5hiQ-=RELKM_L+mN4Sy+wWkDTwJb3sPgA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 16, 2019 at 4:11 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
