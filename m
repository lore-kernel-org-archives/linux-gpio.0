Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB7EC433EF
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Mar 2022 17:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235415AbiCURgH (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 21 Mar 2022 13:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237838AbiCURgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 13:36:06 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B08DE915
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 10:34:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id j15so17231634eje.9
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ltv76U/MO47mShhSTFY8Nnr8qNTKagxVi37KNCerldI=;
        b=VSJrmNU3Rhm3gsrk1WwZsHu4X+V24jZGHvVW6b1MqjuAJzUs34QCtmmjmmqk8bQ0wP
         6tGiFikKnXzl7Yu7VJHBfZ7i3xEpSy0R40A1sHq3XagAV7f+XhiDZS0Z6WX36vlEhir0
         GeXhJeDH5uCG3uaV6H1+HbTX0zz9b+CfTor74BV3uzLM9Rkg62zpB2cKQKHSvH34Gjbu
         WNyidNJkvguXUCGLJyAOx3oPq1xlYIRBDoZ4PsgDyng5jyCgDxcQAkESH8nn2wfaISXO
         z1WtvkY6FHNQQJ3TgfItOKcziM7QpHt8x2dLtl386LT9qaFt5EWJkXYseGkdQfVGRSY9
         8oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ltv76U/MO47mShhSTFY8Nnr8qNTKagxVi37KNCerldI=;
        b=7fW2NiNNX8q4+2cc3o/ke8G4Xa2J3W3xFhaofMK+Xyw1ltSlnYIHLfXY0vSQeGPDLH
         r/uBC/pbW+5eFr7cIH+NjCT40zAn6got4UU8jrboyIX+rFG7RuoX2Qg05x5TYOjFNdpT
         dBL+zNJ+ydQz8Sx80VVRf1dOZPQZHBnpZ/U6ecT8hdZS5+dSm6syhDiEgudKKszQkRy5
         oflqtllL4J5zh8NsHXGzJLPps2HAQtCtdJIv3J9zmExGlEB6QdscuGWz1+OJCH7sDGen
         dFnRjaNF8A93JaKWPiwgmR5wfY3wLBTKHU7XcJah8mt9ZUoG5HmaQfs7L/SKDrS5DtuO
         be/w==
X-Gm-Message-State: AOAM530EQSrKUUlPwHukSQcbvJvOOs1W6bKvwRDgnBEwF2MaUeBlWoA0
        uLgQFwBLvHeADC+nL9yniqYs4Uq0w9pUewGIrACcuwLrSLc=
X-Google-Smtp-Source: ABdhPJwbkZvf9wZXcpEt1EqP7iKSA/CZtMS9bMKkWVls9520q2K8ANHnK+q8To9y7+bTCDO0VKqLQ70mB/MewTxk5dY=
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr22005303ejc.132.1647884079372; Mon, 21
 Mar 2022 10:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com> <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
In-Reply-To: <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Mar 2022 19:33:28 +0200
Message-ID: <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
Subject: Re: gpiod: Set pullup for Input Line
To:     Hans Kurscheidt <lve0200@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 21, 2022 at 7:27 PM Hans Kurscheidt <lve0200@gmail.com> wrote:
>
> Hi thanks, that makes hope.

First of all, please do not top-post.

> Unfortunately apt-get gpiod on my OrangePi Armbian board gives me
> version 1.2, while the dev is already at 1.6. I probably have to build
> it from source.
>
> Keeping fingers crossed .

I don't remember the details of old versions of libgpiod (Bart? Kent?)
I think it was available even there.

> Am 21.03.2022 um 17:26 schrieb Andy Shevchenko:
> > On Mon, Mar 21, 2022 at 1:30 PM Hans Kurscheidt <lve0200@gmail.com> wrote:
> >> Despite deep searching, I cannot find any information, if gpiod allow
> >> specifying pull-ups to input lines and how to do/handle it.
> > Have you followed this code from libgpiod?
> > https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpioset.c#n44


-- 
With Best Regards,
Andy Shevchenko
