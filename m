Return-Path: <SRS0=FrA0=CV=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8883FC43461
	for <linux-gpio@archiver.kernel.org>; Sat, 12 Sep 2020 11:22:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42713208FE
	for <linux-gpio@archiver.kernel.org>; Sat, 12 Sep 2020 11:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOxO26eY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgILLWS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 12 Sep 2020 07:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgILLWG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 07:22:06 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E33C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:22:00 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so14584286ljg.9
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N4XM0NGOBVrvxRIjbN8hNHboDvUOhNwTM2cQ78WbgOQ=;
        b=BOxO26eY7fdi3kjFx2/i8247sbgu3bLtqaDUJF2O5Dz8oJoUMUR3QjPNgSAImAtwU5
         wOeXIbkB3/lk8JV6ye7hme5qnGqvwbxD6cK2rNa3SngdTrtTF0Ee13Wqpb/7F0BdHoml
         pRUgDROJjMEyLBVwZ16TI65DfZSvg0OTXWuc9Rv8IdGs8477jh2wNaltvNG3DUb2dtRW
         7bXfdGx4UZlto77f+N7vwiCdxFlornVTH6BtCq/B9oDW3QfnARH6KCqdIH/PbaSEZT/G
         hwTtc9PJkRvm7RvUYIo1tENNisa+4c9pczPp3KPoAtGGQ/l5AXaTMrQ5E08V0rscyiu5
         oknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N4XM0NGOBVrvxRIjbN8hNHboDvUOhNwTM2cQ78WbgOQ=;
        b=uVKkROHuyecLLko3ou67tysJMg2Fgu66z99w314mgyr67yzy+WHdmzzBLriI9eiKkd
         u/Ww0ejJXg51nTBfz1TLeJI/+OATMhdXOStos2lQc30wJAoZ9fGd/eBLPEuSKBAWKdiv
         dBEZq04QNKcHnzLg5cPVjXttDJqc3kjTvlJzgiBX9tUjabjboFDrUICrkgF27j7HuQkH
         JTInhPDOyBfho4a00/0TGJ4DFpiKxG/D7d3+oBp8HDySuLHXgP690swFOijzcoJuZ22K
         pY2tEkMxHqth2YWNUHP1g24tdL+RJgnn4ITHaMZ/AKELGhCL1ulJgqiK7m7yKVa/84gF
         4Bzg==
X-Gm-Message-State: AOAM532pPaflqO6YrXwjVxOb1iio9MVYjq0nMfEbBRK4F8yomcL87euw
        5p9kAMZYBYiwhnF7dooNGh2MwoajsMdxTqK8Zi5UclK5yws=
X-Google-Smtp-Source: ABdhPJwqN4Z3roEFA97X0gaDxoSq8NUqYoBglU/t/H2RePc2u5FV7yd43ijLS+EEbthcRDhQwcGKpT+GQ2CbiTALet8=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr2338153ljb.283.1599909718644;
 Sat, 12 Sep 2020 04:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200905214955.907950-1-heiko@sntech.de>
In-Reply-To: <20200905214955.907950-1-heiko@sntech.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 13:21:47 +0200
Message-ID: <CACRpkdYYtZRuuBpYpPCw1Dkpqr-53MgayebT-D2aZkbDUX1d-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: depend on OF
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        kbuild test robot <lkp@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 5, 2020 at 11:50 PM Heiko Stuebner <heiko@sntech.de> wrote:

> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>
> The Rockchip pinctrl driver needs to handle information from Devicetree
> so only makes sense getting compiled on systems with CONFIG_OF enabled.
>
> This also fixes a problem found by the "kernel-test-robot" when compiling
> the driver on test-builds that do not have CONFIG_OF enabled:
>
>   drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_pinctrl_parse_groups':
> >> drivers/pinctrl/pinctrl-rockchip.c:2881:9: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
>     2881 |   ret = pinconf_generic_parse_dt_config(np_config, NULL,
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |         pinconf_generic_dump_config
>    drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_gpiolib_register':
> >> drivers/pinctrl/pinctrl-rockchip.c:3473:5: error: 'struct gpio_chip' has no member named 'of_node'
>     3473 |   gc->of_node = bank->of_node;
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Patch applied.

Yours,
Linus Walleij
