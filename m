Return-Path: <SRS0=tEc5=26=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC2AC33C9E
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Jan 2020 02:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18B2B206ED
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Jan 2020 02:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xbkm+94E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgAICCg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 8 Jan 2020 21:02:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36638 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgAICCg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 21:02:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so5453601ljg.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 18:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fvCKXeC9sdlzORfj+q066OKqVIfxycI4K4fCnGeIty4=;
        b=Xbkm+94ETCfWyCcAUN7E7HtVpmAWx0TCuDffKDKuu1/tdVtzZQ3DIFHkiY8bPUw3mT
         g1VxV1gUubYMTPmSdFBnHQM+3eF4qxy2welOWJ28ZcFhl1VY6rAwjTgDJMTuc99+bsVe
         i/SIcBALDS68nC5SEZ1HaZG7IVuElnir1f0RJnl/C1UIRhgIcp7hCizWE+A3IVUR9LPu
         59FyRs/+2lh3Igo9laqLBuLrN1C7El7rCQBIjPlU3q6734Xg4rNoM8+SJemhdOkA7a7g
         VWjqzBv0QSlebYl/do+PUVFmtXun9nvnhR/uOxwxxm7ni4pJddLrzgo6A4th3CrKm/ZF
         jDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fvCKXeC9sdlzORfj+q066OKqVIfxycI4K4fCnGeIty4=;
        b=pfoHrMiUf+AziUPaOurQJ5dAqwGNHQ1whMGDYFQs2W+/b49insxxZB/uxEC6/KbPF7
         J4balZsW8pzWyat/LnoIzds9//c/N7x71k5Qa0u0QdjH8lfsO/SHV2EzbrBURmHv8D3x
         WDOp44GDUjIA1Ra04QT17QTH76AA0bbg+pDE94UQzT/ks+zcTDjdAo9TvOqNHgh1yI2H
         pauSm5c+ZwQQZOJ12XhJCBXcfE7w0yO4RCtTDGm5QoX+0r1P4siDH+1kzJK8pXmBmzyY
         2Pfovi+QL5R/hNL4LmZi+jXXJcclPr/h8qOzCPgi3piZPtpFYsTal+Ee5G5e9tZLkl9z
         GKmg==
X-Gm-Message-State: APjAAAXMJRnnSWjcCdKCqDkQ+cD1KfHX8KBRGJY4orgCNNI5PpLwMFde
        1TaXiLsCRkNtQipt0gXh6qIvX31PbbVK6mYvOOV1/w==
X-Google-Smtp-Source: APXvYqxZ08HhWiEqTSsfeYkThwFIVkKIVbbxklN/iSrg+yEE/ocnYT6XLihLCofxIG/dH8RYgvZH70JqaHOPzkFsKLg=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr4817754ljj.77.1578535354611;
 Wed, 08 Jan 2020 18:02:34 -0800 (PST)
MIME-Version: 1.0
References: <20200107212432.27587-1-linus.walleij@linaro.org> <CAMpxmJVrJaXy3rraT2jydMyXbfUTRKXfAKtazkeuQcnxAg396A@mail.gmail.com>
In-Reply-To: <CAMpxmJVrJaXy3rraT2jydMyXbfUTRKXfAKtazkeuQcnxAg396A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jan 2020 03:02:21 +0100
Message-ID: <CACRpkdbc_Do5tjk3c1n_U6T4AnF1Y19Nnf=uJyQQTL5GntN2LQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Update TODO
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 8, 2020 at 9:50 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 7 sty 2020 o 22:26 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > Drop the completed item: hierarchical irqchip helpers. Add
> > motivation for gpio descriptor refactoring. Extend the list of
> > stuff to do. Minor fixups.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Hi,
>
> thanks for doing this, I'm seeing just a couple typos here and there.
> They're probably not important anyway as it's a "temporary" (right...)
> TODO item.

Thanks, I fixed up the typos when applying.

Yours,
Linus Walleij
