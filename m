Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2102C433EF
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Jun 2022 10:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348933AbiFVK44 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348179AbiFVK4z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2022 06:56:55 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9837B3B57B
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 03:56:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g25so33321451ejh.9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0L/85O7qWiOyiE/ctF1brUsojNofUv2Ot6+QCS64aCw=;
        b=LytC0ph759aBwAtpZBsDKhzDe9BzWX2cPTWz4F24+E4+211hyLBQ07rPZG/qX2xRUa
         g+3XD9mhP3amHicnUkVOawLvMTenCnHrh4WwD2SjFcx/qJdXikbDJXGI6ZoaQEZz9P04
         qdu4wdxRxyILTbBqZhga+Lm7StfTtWTPhhaCELSAMStNjxuylKZgwoCjVZM5nXEq1I2Q
         XkGVmdYbLQ0K8zy1CTpmVYZYeb53NokOM+xyTV1JCbLH+sIUBzBRZJFJ5dtVC9OlFwcE
         jEB8UNkSSjkE+BdaPI8751+MTeUJLtMJvqmkwH4R66YL5+vpK21t5NRNShHOf1HtplGm
         k5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0L/85O7qWiOyiE/ctF1brUsojNofUv2Ot6+QCS64aCw=;
        b=N3cb5B6gE2H8kAp1mfMI9YaPdv1LtzO+XJPJLslK3gea35v2OkCEpXUO09lOXep2PI
         rqWfKazQeVKaawA2NwWo4SlUDe9z9LSrJ96xgfXFZshzQbn3awhhCosVgPL9b1MITFPi
         uNj44hmncA002YReoECaxMwnI5Vh8enmlNSupUPZRie0Cs7ykQ45vCaZCKbDh1AMTKhb
         NOEsccpSd1xWEabVtdveIxvRHSEQ8z8V6gIwbIzyCZ9gznyrQ4Dp38tBeobv9vlUxelP
         UUskhs3TpRTY8WX0OpeBoFRrzM4qAlc58pbLjYLBDwiJWXJs3DygNNGzPzA85cK43Wm5
         mnlA==
X-Gm-Message-State: AJIora/AIfentVQEiQiu9RBN7P9FYfQyyCn+iZGXBMa4HgLS+1pza+1J
        aCPFRUIo3h0iTPtAfmmSbMpS2FzNdxX4lI3d6G0=
X-Google-Smtp-Source: AGRyM1vXbNVtF2BnX0rhRofJwbTZCb2OHD9q3IGPVSEfeaX78C3yJKBqTWQ6jkVtljqPxK1fU/vbom58i/BYFaPq310=
X-Received: by 2002:a17:906:d550:b0:704:7ba6:9854 with SMTP id
 cr16-20020a170906d55000b007047ba69854mr2490850ejc.579.1655895412142; Wed, 22
 Jun 2022 03:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
 <20220622102632.GA37027@sol>
In-Reply-To: <20220622102632.GA37027@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Jun 2022 12:56:15 +0200
Message-ID: <CAHp75Veb-_R2krR_gkV1mH8EEze60R2ktTAu_R4yKMW3PCQ7Zg@mail.gmail.com>
Subject: Re: Reading current output value
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 22, 2022 at 12:32 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Jun 22, 2022 at 09:54:41AM +0200, Yegor Yefremov wrote:

...

> > sysfs works.
>
> Yes and no.

Exactly, and I would suggest forgetting about sysfs. Consider it abandoned.

-- 
With Best Regards,
Andy Shevchenko
