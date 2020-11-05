Return-Path: <SRS0=WQsA=EL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296BEC4741F
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Nov 2020 09:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAF302151B
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Nov 2020 09:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jfkCQR9W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgKEJyV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 5 Nov 2020 04:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKEJyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:54:20 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AAB7C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:54:18 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id v144so1353910lfa.13
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nn46Rfb7E01dgOnZghj9LxIH092CO41d7sQ5WYhFVdQ=;
        b=jfkCQR9WMVdZiz0I+ac/hxFxAyN2v5LKXGC6V5xrBLsKvH6+4/Yq8SG/WVt26/P76v
         y/qWzQ6swEXFspWiKAFWGvpIVzXZBmSsV5xM+IYOflpeIhI8GhDQqdLKaPEsh3s+NMXr
         gzFxhpI8fOIYnpZCvYJBD78tKxkFkrC6/hK7xQXvZQn8/7zCAlOGMKZEdTFZw9z+5wAx
         NDf2dDOvIP9iN0P84KBM7er3rPl2kHic0NDjSszzrL6qgxzME4w7fuiW9DmTpfJdeVu7
         0KEZdJ1kZuvfDMtFD49DgJPZcFzk/m85PaTEVKNZLWuTaSVM87wZYc5KhGVDvIEYqNsj
         wJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nn46Rfb7E01dgOnZghj9LxIH092CO41d7sQ5WYhFVdQ=;
        b=J0z51w4cespwLb+bCF342qhUBJI7xLWNoE9R6TnI6OxT8vsNVuM3lmJ1yj+xitl0bw
         hnb0yPrrHA0QdNSlczC+L7S6HV6TwxUO/zxSsKTnZR1FXiVeSsnajV5+wEJfYgUpnRZ9
         A5pwBD6SKvzpT3mRYiM0BQST7LYaPpun8R7fB0DO3eIk6PDK4xEv2QlW0MKlf/xvQXSH
         axeWRAASvZyEqxarfR8GDPfgX5uZjZHbgb7D8LfM4+y94TbeeQkkvPjB1/dLpgLFuue4
         i8TqKhFT8OVWT9CKSPixqhwyYdZuWX62kNOaSozSnoY+QtgOa1EP+6yAedkfY8YFpL7z
         RTXQ==
X-Gm-Message-State: AOAM533AUjlr8NbNrk64/OcVyEcx/pAvU+7UZkkXO0jSfkfeevNnkYus
        8G7uO1yapUIBxBb5I45G+w43vwnFeOzGOkvYMhMItQ==
X-Google-Smtp-Source: ABdhPJxH8fkyaJj843nvQE3/sKrUAkmTYiCfA/u1a8EZfY5GBIYnjGtqplVsXyUn1piJHUgSLwE9JOWll1WCZT7M0Bk=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr714172lfc.260.1604570056828;
 Thu, 05 Nov 2020 01:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20201028151637.1734130-1-geert+renesas@glider.be>
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:54:06 +0100
Message-ID: <CACRpkdYC3PXex0CBGfLC7Hdj6a9J=Vb-P9Cay-p4G8B5_VSUwg@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: renesas: Cleanups and improvements
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 4:16 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series contains several cleanups and improvements for the
> Renesas pin control drivers.
>
> I plan to queue these in renesas-pinctrl for v5.11.

Looks good to me, just some generic talk around the optimization.
I saw Biju also sent some interesting optimization patches.

Yours,
Linus Walleij
