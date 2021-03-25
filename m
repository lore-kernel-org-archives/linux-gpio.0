Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED891C433C1
	for <linux-gpio@archiver.kernel.org>; Thu, 25 Mar 2021 09:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9145B61879
	for <linux-gpio@archiver.kernel.org>; Thu, 25 Mar 2021 09:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhCYJRq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhCYJRV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:17:21 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77629C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:17:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 15so2276351ljj.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xtgWxHl1jBWFbgD+kv6AqSAbbwppmDLPyH8H5SEmUxY=;
        b=WYB7Cc3r/N8toO5HEXS4WvgZdy7e4DisDnlKJSVDlcwRznNZr3R/C2SKilRf8Rq4gj
         XHXoF+BOQkpgxnV2TcAs34RQwe1fA8xFgqxIpMXhF1+dsrccNXqaAz7GzmHsHMqSuDy3
         IXW8OETtw3Ehwes1LhfsJ1pwTAGJMfokwcUPGs2r4AoSlCaNeP7qxiXwSyUZ977FKt14
         SnqDCSgG3EDkOi51SUY8P3o6l2L4JU9POOt3xCt0GpVmKeJhSjh7XbSP41jy75enhdr0
         k1oVi8IQoNFyb7OQVJ61YCvuwnuO1P9bmHBFL7i0EbBDWR9UTS/lw7+hy0kdy5U5A8jq
         TcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xtgWxHl1jBWFbgD+kv6AqSAbbwppmDLPyH8H5SEmUxY=;
        b=S/xTey9aG/cFo+cAEM7581zuZkWsvYVdAUJ6+8h/l18fgSTP2yQPr5Ynw4gIzlsdLP
         AxtTT6wYlU1x66cmJnDa5MdjZZE3L27qpgPlwr/CVS0ABSzV1pGE7ZEXrudOcX2y+Ij0
         rUJXvuL3vYbUTgqMqD8onSb/HRdem7FoE47OPnpu8BPjSfTGnrBvhTaIWwHMfqdbMfvh
         EfzgIaYk8j4UB4R7FKoL/F3rzqYeOl6I//kSPs6RJene1ZWtoARBy0y1N5n2X2Me+FHy
         n6jIl1mu0juCTigS24aJpO5jtGZnSd8PrDfQ9SRWKGZFw2/RQPHAC60h/q8QtabPwQpI
         yr+Q==
X-Gm-Message-State: AOAM5310UiQOT7J51fIzp3yPkKaH0ewTAGNEys5PVYmW/yiDV5jceuGk
        3MCpMDD8+j2beH0S5CI1XsYYD8lPHLwNVQs4olpDMOEbfbWYVLHL
X-Google-Smtp-Source: ABdhPJztjGrwBtJbNrrNxBR/yEEBoi4BB8Tjr78VRoOeWtyAz1JU3+GYgpMwR4+Idq17mB80FNZQyb4r6pcliq6jXLo=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr5210204ljw.74.1616663840040;
 Thu, 25 Mar 2021 02:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210316134059.2377081-1-geert+renesas@glider.be>
In-Reply-To: <20210316134059.2377081-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:17:09 +0100
Message-ID: <CACRpkdZFqQd=g9u907LndbqNMYLnnAN-M5HRotbw5CU0EG0NDg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: PINCTRL_ROCKCHIP should depend on ARCH_ROCKCHIP
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 16, 2021 at 2:41 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The Rockchip GPIO and pin control modules are only present on Rockchip
> SoCs.  Hence add a dependency on ARCH_ROCKCHIP, to prevent asking the
> user about this driver when configuring a kernel without Rockchip
> platform support.
>
> Note that before, the PINCTRL_ROCKCHIP symbol was not visible, and
> automatically selected when needed.  By making it tristate and
> user-selectable, it became visible for everyone.
>
> Fixes: be786ac5a6c4bf4e ("pinctrl: rockchip: make driver be tristate module")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

I saw this was causing issues on S390.

Yours,
Linus Walleij
