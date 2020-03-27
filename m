Return-Path: <SRS0=HDci=5M=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F33BC43331
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 10:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B59E20578
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 10:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBPLIaNM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgC0KrC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 27 Mar 2020 06:47:02 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45573 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0KrB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:47:01 -0400
Received: by mail-lf1-f68.google.com with SMTP id v4so7411388lfo.12
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wU8Dfibnw+YTY5Ju+RmFsCxvCrwd0qkmqQMufVeyPLw=;
        b=QBPLIaNMoOcpMZQsVATdmdxE/wwRGqza8magxFu1Qw7kbiCc5hCzxKl5G9VRQd/tA2
         5prTY1VLKPgD02ssUEmf1usvCva3Fexhl5o2axAhR2wiH/jd5KZil4cFW+P5gnw7bL3U
         zDF8oZGVU5DhlSxaBsk4eKF81q5L4BWrNd6xGwglejhSbyfFX0o5NrXDaamns7y2kght
         ikkFxwWQSgTdDIqXDtU6rPYvvlPZQhesR7Y1sLHsusNQlYz3YuH7a/kIcdBmuZtEIcZt
         6TX94tvZgrDPgTqPT6C/ZMQyCjw4Edftej0rDPP6QBZEd29RxMX/JmEkDWI+o7Urs56m
         +UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wU8Dfibnw+YTY5Ju+RmFsCxvCrwd0qkmqQMufVeyPLw=;
        b=ch2ItasJmqYK5mlK1d5td7RmZv4PV9CCC40sZdlxt8EpMtxqEAZPG+4oU/E86tz6x+
         +Vy6k6RY7TZ9YLYVkqE/yyGXKd8S2C4dM7ZMN9wORCTyT4H12TMA8ujge8eFIelMCkAv
         /IxAU8/19ggBLHGLcsjtbh5FzuctawZ1bW/Rjb2u3IZRTwjC/VnKBTnKh8iXi+gV10lW
         Bkxs/HiGaHIplJscOrt0Y+5hICKRwMaHPmzG3UGwOiy7SfAhUDqx4oJBh0nOBRKBHE2w
         86tZT2RRY2RigA4yomgwaXwPiBwANX63xaYXlFZOt5KJg1VRUHENT6cJeR0gNbP7cJCR
         rd3Q==
X-Gm-Message-State: ANhLgQ0Suvs4vz3UiHL926M3qcKMFL0HudZPDHwNlTl0MlpYLyA0gICZ
        ari+2YTw1GxBPkAmkcYv/jqYgY7e7sCykkJHkQL5kg==
X-Google-Smtp-Source: ADFU+vv/p4JFrSNfSyE52YsXAXHGzg5C93Bdnn3K8+n5BSLIN+mgMXn2f50qZWsBMuasncx+q1mbB5Pix71eH/fZ8Vo=
X-Received: by 2002:ac2:5f75:: with SMTP id c21mr8572327lfc.194.1585306019131;
 Fri, 27 Mar 2020 03:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-10-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-10-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:46:48 +0100
Message-ID: <CACRpkdZZgHm3ZqRdCoC4e8ef_Don0dSWans3=7K4cLDTGa5mUA@mail.gmail.com>
Subject: Re: [PATCH 9/9] pinctrl: tegra: Add SFIO/GPIO programming on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 19, 2020 at 1:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Prior to Tegra186, the selection of SFIO vs. GPIO modes was done as part
> of the GPIO controller's register programming. Starting with Tegra186, a
> pin is configured as GPIO or SFIO with a bit in a configuration register
> of the pin controller.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij
