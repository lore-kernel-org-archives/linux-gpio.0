Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660C9C4743D
	for <linux-gpio@archiver.kernel.org>; Fri,  4 Jun 2021 22:06:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AC1E61402
	for <linux-gpio@archiver.kernel.org>; Fri,  4 Jun 2021 22:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhFDWIm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 4 Jun 2021 18:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhFDWIm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 18:08:42 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56971C061766
        for <linux-gpio@vger.kernel.org>; Fri,  4 Jun 2021 15:06:46 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r5so16262055lfr.5
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 15:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nz4QFsqdAR6oQ/HCwfJe4SCa4/szCk48V9kJk5ytCmc=;
        b=rVPkfpEYsd3PtiJwoC1FpgyVlpyPZAsMpOZw7BUHvdDoHjIrlNPDtTVGCPhlvmHyKi
         OmGj1HeftCbZ/LPidGrbzn6w/bLg3Rue2MGIDbH2qSIUkdMJ+Do+CelYGM1tHKoyx8YE
         4LqPri2R5aikfT1YwfJDWwnv0Jpxh09jKkC69jNQL3kPdp+MEVWuyfaXvREYFDStgBZM
         vqExRr/yeJ5iFy+JsbYIeMycwxHEupdbcsOpR9P0mNw27a0U2u15Phhkf3aC0vQB3TtQ
         g08npX9O1UPEmqz+7A67EjG2chfs4a40yYB8p/J9QWSMAA6n9h9wFQ/N4gXAVWdvTq4Q
         Lufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nz4QFsqdAR6oQ/HCwfJe4SCa4/szCk48V9kJk5ytCmc=;
        b=JJ5tAsY7Lnb2I8ERJxWScOwTtaLnrLwxbk/R3Zhx0vLwlJDL98dv5L/zNjIT6elOoQ
         KnGQpXoeVPACCf5LKbXDGVsySk28dF9jY6VqsyueUm7VQAEjSoeNJScuFC6zjTWKvgfI
         p4pHnCjlk00VULpxVYRW4VqWQ9hlcSocLP/LftT9DBBJvQThZJ3CneYWcDrDMBuYcJ0r
         xibGsPCn5oPBGZgAgH/bSSMGBbql+Jkoew03m0hhZNyrBRvlkG3VW8cO9Vn+q/JmC+o5
         R7/WahZ72QwtlF4wzdBsf4O1Vepw8raAPx6MqCZnw4uQ2YHYZFEjUgTI/DXIqxt48WyI
         9gNg==
X-Gm-Message-State: AOAM530vFKg7c2gFqtr9M9iCMOv31MIpYfSQc6NjYdd6YXD6XXnj1T+1
        fxjnem2afuqpnkjDK1TH0RfMHfVVSi3OE7u0xGXfgg==
X-Google-Smtp-Source: ABdhPJxZuBCUE4c68IteCQbT8/iSI2k40U6RnJYDv4rh2zLmaSiwfgAV+B6e5L7GtAIzreUlQVR3wa+LH8Bgt0KKO/E=
X-Received: by 2002:a19:f616:: with SMTP id x22mr3980083lfe.291.1622844404733;
 Fri, 04 Jun 2021 15:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210604185013.86662-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210604185013.86662-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 00:06:33 +0200
Message-ID: <CACRpkdb-fkWUjUXAdta94qjnYt24+e+LD_ARJKPsEeYgjMZQ8Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio-dwapb: Drop unused headers and sort the rest
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 8:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Drop unused headers and drop the rest.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
