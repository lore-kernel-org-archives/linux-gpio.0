Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9ECC47082
	for <linux-gpio@archiver.kernel.org>; Mon,  7 Jun 2021 07:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 870A36121F
	for <linux-gpio@archiver.kernel.org>; Mon,  7 Jun 2021 07:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhFGHGB (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 7 Jun 2021 03:06:01 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:45996 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhFGHGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 03:06:00 -0400
Received: by mail-lj1-f174.google.com with SMTP id u18so572915lju.12
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 00:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=byysuq31NqSJ/wEAfWvATOeFVnLZyU0dDvr6U4G7ixg=;
        b=Wie72tEOsYTmHR/0QEli2bJx5rwQj+1aaleOBHWQwtRfswtxcPhWeKH8ZcLEQjm/rL
         3W0YPHwk9EUC2xgALLXGB3mdjGsd0YkNGlf4ZxcdikYP3X0XfJWDROtxh+vUmuLAXsal
         H37vAr3qlgjFjOHsqWc/ElO4gzkorRWiDD5hgUq82zoCOlDeAPo4UEg1goNRB6JXnZmj
         0KYssOGzHy6H6YviXqocjnIhbcUZDGuJyMsLwO5G4JEJLursqP3AW1UbtLwIJB3O3Yrp
         kR9vk/Z6SV8/DL1AnUe9NVBSyE59BNVoel5OhJmyraDrYEvTUP2unhWbMZvtEwa6hiVw
         J9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=byysuq31NqSJ/wEAfWvATOeFVnLZyU0dDvr6U4G7ixg=;
        b=hJi0AqoUvfWnRMwH9Y2oC5Tf9pH/ObPQxMyrsu+ujA/9GUgr0at0QgZ3IIhHw9Vsm+
         MI6W2eCnlrarCEM2VlK3atrUKZ+5cSJHZrC5FCup3qBBCwGwv/42QmNfATbDQlQ1Vklx
         q2eeDp7Gi1Ba4/l/etkMbKP9Emt6fBamrRChXUdAi7hXgeAPzke8GyJ8UZ6Fi9+GSVXu
         kY8P9bFKvFGlhN5eLA4fOQqs5r1ClR+bt+VB0JEzIxpxN8wsNWmhhPHOJA6lAuopYFMV
         itmPWuF9IE+oyMgz/EB3Z8AlgAfPn+FXQCXY0I0okM1bMw7Ah+80+0HODitQNtPdwkDW
         NNjQ==
X-Gm-Message-State: AOAM532n9HrdC0/iFhEhf5zLLFqVpZXxLxtQP2fbHLXxIcUBBDmIuSmT
        Uvn9Xb7hU8LlAoprX8MWCCEg2DypaVEz0WbpKJuamQ==
X-Google-Smtp-Source: ABdhPJwGqQGTe/jVvXVpdtfh4ldNGqHyMFsr3xX2w/aRd0jDvuSNNY54PMchcbawxwh8sCOROuRyKq5JfAzFnY97i44=
X-Received: by 2002:a05:651c:1057:: with SMTP id x23mr13380683ljm.467.1623049388829;
 Mon, 07 Jun 2021 00:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210602150420.18202-1-dariobin@libero.it>
In-Reply-To: <20210602150420.18202-1-dariobin@libero.it>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Jun 2021 09:02:57 +0200
Message-ID: <CACRpkdaSYrrwwn+nXj5M+zvgxTBnspdMgQbbViAFV7TpaUPkAQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: single: config: enable the pin's input
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 2, 2021 at 5:04 PM Dario Binacchi <dariobin@libero.it> wrote:

> It enables / disables the input buffer. As explained in the description
> of 'enum pin_config_param' this does not affect the pin's ability to
> drive output.
>
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

Patch applied!

Yours,
Linus Walleij
