Return-Path: <SRS0=IWnn=YJ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66D7FA3728
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Oct 2019 13:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7650821D7A
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Oct 2019 13:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTpnmoyq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393730AbfJPNxq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Oct 2019 09:53:46 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34424 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393717AbfJPNxq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 09:53:46 -0400
Received: by mail-qk1-f196.google.com with SMTP id q203so22809602qke.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3MpqWuXCuED4lPwTmYmfLDrEaS8sTh/GqrnlfZctaE=;
        b=ZTpnmoyqnGgVdoOocqBKv1ocwCh2S7f0PpiyMV4dIdRuoP/uwZW5d6ztsvG0pAgtSw
         y7sVez2MZV86WJ5SQ1FShYHwPnWzykBrjjxkc4rCYBN3SCav7pp+VHGTtX9rAVrtAK4H
         ujkbkv5zB+bU8JukhvrmMxuKH7g0lukQWC8MJVPgkJDaWnaU8fRWA92YNR41ZCoVw0nX
         0AxbTtXKFIFMGENcQziYHggTX3O3CZiFjFIoz4Drfop4J4isyb9btpuo2RobmLyWxqOt
         MUbZdLOH/rpwVQrKtXY5M+h3A9UpdQ1cSCRJ4bwACNIwr+oNXke5DTIyNS0CrGofY8cb
         /67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3MpqWuXCuED4lPwTmYmfLDrEaS8sTh/GqrnlfZctaE=;
        b=qwbkeYeSHhH3zSiZ2D6YS4aVd0wQWfeQPx063pQFd4WlQbPH6woH9rguIaK7uvILHT
         aMYH7gvK6Cgm2qU0CCRrzLjGYnKa2ZepuUQjAwcH/UvxEDIFiOChPxfrxrV78YdaNe1Z
         W3zjTKwoSy2OaPG9x6oJUXHcaP5R35GyrdqCxSkPwIv/KQ7+T1pw2s8HVlEEsiA3PDwA
         93BTEIe6eSJZIM4h0iNTp7e7UPwozfj7u8SXvE6Q6NpyhDTL74OTWprmiFGW0DAd7S0B
         5VnRtFK5OhV38jxQ+9nXwt4YAW/Hl0+1eF+y4CEFSaVIy1uVTAtJ60iwswJxM5cyj0JC
         toQg==
X-Gm-Message-State: APjAAAWD8zAogAH6YQDnfyJCbMJ6YybnADaWJAWMQYmBtIZqM4s547ID
        FJ6rY1+yQMU9WGTl8wkxTQaRSNB/t2TnkPM69R72gA==
X-Google-Smtp-Source: APXvYqzLuVyub2/mFLs66z7+S1u7CxXVvwqKq63XhUOVOUahZi0oy4vFqDFB8kLVPHKNosuPfckb+bt652CkfqxFknM=
X-Received: by 2002:a05:620a:751:: with SMTP id i17mr40220819qki.340.1571234025322;
 Wed, 16 Oct 2019 06:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191005105936.31216-1-kholk11@gmail.com> <20191005105936.31216-3-kholk11@gmail.com>
In-Reply-To: <20191005105936.31216-3-kholk11@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 15:53:31 +0200
Message-ID: <CACRpkdZRdSo+4ZrSbt+4FzRD7X5PaPQCX4A9eLnw5=Aa4bdfMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add MSM8976 driver bindings and documentation
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, marijns95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 5, 2019 at 12:59 PM <kholk11@gmail.com> wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add the documentation for this new driver for pin configuration
> with the pinctrl framework on MSM8976/56 and its APQ variants.

Fixed up the tags including SoB and applied!

Thanks!
Linus Walleij
