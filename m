Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C83AECAAD4
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Aug 2022 13:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbiHaNTy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 Aug 2022 09:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiHaNTw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 09:19:52 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5989A65ED
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 06:19:50 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id j204so4108858ybj.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=pMO9zhn0WdqqUu5krLuleog7z0gfNsoSQcTsswsRaWY=;
        b=y2BdC954J4C9GUD9ZJ8M1Aa426/7D/dvGh2td7B++IlX+5HEqHRD/L0miXM6UMhPeK
         p+4+BIIaUZ1xAr8+el7OueG/+qtTHU1sF0GwLfe1aGhx8rjcBJ6bwrREw2IFTfpfAm1q
         iSFeosHBEnqbIvFQeDdL81oldEu729ibvRIvGZ7xpx8WtO143GQClG4VXuzcUuuu7fpS
         hmfNOHysxq772HCPhgimScZWdTUxIkuKmCzbWeq51iusgcbuKT1tWRQPefsCDcKzQExO
         Nmj1NTEATHAfrvw+eviL/nBZjI54+FELhxNCa/e0Zswpi6xvUZdcQzOeXI4whlePaDzr
         pMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pMO9zhn0WdqqUu5krLuleog7z0gfNsoSQcTsswsRaWY=;
        b=qTjd7hbEixjdD56Aagm1KFwn7IKV+Q5+K1J4rTIh1D2HufnbqzRV4TXwX3Pz8fniwi
         6AYIJF0not38Sn2paxwc414SASgHo3SQMzBlCn0gHWHzH1HVydTg9bERWXBlBx4ADHk3
         YYU6LtXM//VlKovPOKB2YTExitb4TTkt8LG12zcpll3UMqzw5AU4jtJo/HG4wzbZw68I
         2tXWA1jahUc8xzB6tWs/denoTh2jyH4ilFj0agurtUGbJqKzkHSQ7Ey+BfXwkhAz60oV
         NZU34efevrIV4XfunKma/7+1QNIuWwd/drSR0o+I6y2jFQM/+HFVDPLHbiVoJ5fJOzId
         07XA==
X-Gm-Message-State: ACgBeo1H4h8WSCvaZrHihR2Q36yVHadtqcPJHHXqC5hTfpmmT4DP8WJW
        4oLM2A09Rx852GZBckTe2Vevm5bpxspnIHHYTIHZmA==
X-Google-Smtp-Source: AA6agR7wh9mcoL6FNlyP3aE62brlyApS07wo5gBlXPuUSYJL6d1ebY9XP02w3lB3wMLu2ft0DTlPNWVJUK6UXxTwiTg=
X-Received: by 2002:a05:6902:124e:b0:668:222c:e8da with SMTP id
 t14-20020a056902124e00b00668222ce8damr15292251ybu.383.1661951989549; Wed, 31
 Aug 2022 06:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
 <20220815120834.1562544-2-lewis.hanly@microchip.com> <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
 <31d2bd0514652685cb87a7c9d17529b9064de2bf.camel@microchip.com>
In-Reply-To: <31d2bd0514652685cb87a7c9d17529b9064de2bf.camel@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 15:19:38 +0200
Message-ID: <CACRpkdZqvEvqjzTN3oQqrV_CNK+D2+c4FjLiC1_ZoKQ-rMMe5A@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
To:     Lewis.Hanly@microchip.com
Cc:     linux-riscv@lists.infradead.org, Conor.Dooley@microchip.com,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, palmer@dabbelt.com, maz@kernel.org,
        Daire.McNamara@microchip.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 30, 2022 at 6:51 AM <Lewis.Hanly@microchip.com> wrote:

> We had looked at the bpgpio_init, our controller is not fully memory
> mapped to support the bgpio_init() and get all routines for free.
> While we have in/out and intr (interrupt state) 32-bit registers, we
> would not get as much free as other generic memory mapped controllers.

You're not really saying what the problem is?

Is it that some registers are not one-bit-indexed from 0 per GPIO?

Yours,
Linus Walleij
