Return-Path: <SRS0=WyK8=WB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC25C433FF
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Aug 2019 11:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4F1120679
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Aug 2019 11:30:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FX3aXIsu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbfHELay (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 5 Aug 2019 07:30:54 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36182 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHELay (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:30:54 -0400
Received: by mail-lf1-f67.google.com with SMTP id j17so3633227lfp.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Bc8NHf4XEA3AFrQS5wX1u0FN2ecF3L6OaM/trUcBDs=;
        b=FX3aXIsu7CgrYcnB1VoyViq8b2RkKPSBAIqLvs2tcwg0AfgNecFb+qsD7mBzxsG/1Q
         r9ax/oSQcplUMj5ecYxt/FNxrmeLoeBE9EHbHZOvU1OU2SNBYMr8W82psgUg6UF3eQVz
         d4Pw6VqIDerqUm7ZxCTStppiEJZBBA8h/TRAoFmqEbxOqWgSnbQaQSXQB+6cZkF4rXZT
         pkIVndfQTXaDrj2uwTKJ7/MiBMOzT5BGQp67k0Xv5knD3MyHfJBFKFvuf1gQEZSvzIZg
         u+r5aQToWjdqzTc+mgqoq7R8R9O4A0eCSp+DCOW2R9ia332L3zXsxBAxP0SI0rHjQ5gz
         EsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Bc8NHf4XEA3AFrQS5wX1u0FN2ecF3L6OaM/trUcBDs=;
        b=FWfpqwa+LrpWFqpUnTiHNr4t7rngDGJISa7CWZEIhZdoo1o4Nvr8USFdFEiGAqjolI
         Lc/qHW+oNzG9VPcjD20mKGj9Mqbzu74oiSkKQLWWGQS/6wpkaQU+ckhtVFq244j82Hh6
         8cfUN7pyMqUmmLBKHlMRX/PEGBPt2lVbFRJcatm71mHWzUQBcp61zD+g2Jce+jSGyQFi
         /tSuHb+Mt1Mk54LVRHRXwh8whFZO8yDIB06xlf+0DEEWfJy4NPPDmcch+puSFzWuPb5Z
         Yt8Lob7433bWOlVysi9xAukSAEWPxzKsa4YuLyeMtyF5Wxr7NtXn1ZDIxjwqkVg15wtQ
         vIVQ==
X-Gm-Message-State: APjAAAU+cow710n57XsLZ7JUTu7w405ZYBdoP1F8oVIix+lnpLodfznL
        MZJW+qEDRh4/FnKF0krca6UFONK/0tTsmqZwizWm2HwN
X-Google-Smtp-Source: APXvYqxl7TKd1+ZelEywkZ7P3B2z2FodSFusAmjgisMekyhQnzsz8JfLhSQji4HesO4esu2pomVDaeO/JmjJ4q8gfno=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr2050295lfy.141.1565004652534;
 Mon, 05 Aug 2019 04:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190731132917.17607-1-geert+renesas@glider.be> <20190731132917.17607-3-geert+renesas@glider.be>
In-Reply-To: <20190731132917.17607-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:30:40 +0200
Message-ID: <CACRpkdap1KLy5ixCJdOA281m+MZLNuVMherFVCE3sLVzqAiRYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: lantiq: Use kasprintf() instead of fixed
 buffer formatting
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 31, 2019 at 3:29 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Improve readability and maintainability by replacing a hardcoded string
> allocation and formatting by the use of the kasprintf() helper.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
