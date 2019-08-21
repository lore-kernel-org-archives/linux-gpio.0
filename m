Return-Path: <SRS0=6Eea=WR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE60C3A59E
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Aug 2019 07:44:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C7E72339F
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Aug 2019 07:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfHUHow (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 21 Aug 2019 03:44:52 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45393 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfHUHow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 03:44:52 -0400
Received: by mail-oi1-f196.google.com with SMTP id v12so881265oic.12
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 00:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uzkEfooTsvFN/WnSeaQ1fXdLWTFyAWb/5oSKnNHQQUA=;
        b=p670MKstmsfBiIXRL2moGdO3ICbfbpt8WBREft4xCfWI6/k9huUf4QkuU9YLpk8hMP
         dvi8e6T5f1C+NRhG4PnlYwa1mhhtL13wRuSntXjt59DoJuDmYDKlUUKhOjxup2HwhPc6
         ouROGjwGyEZxI4rehzNnbHDw5IcWqxjZl0XF16y7KfXJjhOpdFK60h1Ho8k+YHz1Ekov
         BXf5sXqhbaVSCs+l4m0LXhbjqkk5Br0UUy4vC1KErbWpVFEy0jW9hQ1vJZh8apoMTWzs
         PS0aFgxnfb6xZ1uGuNDjd3+rLwvnjJE/CmF5YIkMrGkXwxTKOoTJPgoFcuqG8F68oqwE
         YnnA==
X-Gm-Message-State: APjAAAVIZF1iuZu6UyNmMcFgO6rpUjG1sJRndXp7F/eVdleoS16mUO0i
        5pM3Sq2MqX937mhfjrHHfBemNxhemamFJtcGf+s=
X-Google-Smtp-Source: APXvYqwnhEP20UEBq1324LZmjcL2Ll+JHPWsjnvZCgh3TZ1OwBWdB03YFwSqxafiyWE97zsEqPfUI5ZhcRX3Vll2KUA=
X-Received: by 2002:a54:478d:: with SMTP id o13mr2864440oic.54.1566373491853;
 Wed, 21 Aug 2019 00:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190820135955.14391-1-linus.walleij@linaro.org>
In-Reply-To: <20190820135955.14391-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 09:44:40 +0200
Message-ID: <CAMuHMdXZHgU9pOSOTDET72iqn4G9Gj4VQYsj2pHBAaW3XxBXxQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] pinctrl: rza2: Drop driver use of consumer flags
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 20, 2019 at 4:00 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> These flags are for consumers of GPIO lines, not for
> drivers.
>
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
