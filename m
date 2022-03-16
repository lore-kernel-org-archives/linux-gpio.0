Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C6CC433FE
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Mar 2022 16:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241099AbiCPQHg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Mar 2022 12:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237911AbiCPQHf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2022 12:07:35 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E20E5AEF2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 09:06:21 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2e5827a76f4so28704857b3.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2CjuLtiygIAsFw7UyXktfZ7WSDrm/cFs1oSdPGPEYzI=;
        b=OspIU2BhBJZC2NaN5YDDr0A7x7A/09XpSt1tU7QY70aJC3u8VqmuEFWi207WmuMqaf
         6qpmskYfqHgSRy8unq//2bYVJHWb1vxfSgdYNvH5fdCVUM/bf80mEhpqQECcrwvSAe2X
         gUiEcmsspKe4vdCKv2esPk+89ax6t4uP8VqxBw6YQ8EbjI3/flkeivtAn/+fPGsQeqft
         1ERvmYR9WPryF4CqwWcEvCUcFURjV9xgS2UbXOS3zdeCr4yVIaJtK98Xn9G19dBlqglb
         OVZ8gc4OzjNw7apBrhjZ2eOWa5Z3gMehHZCmWycs4iKL6tJjD/HDMh4RKznV0irszz6l
         cw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2CjuLtiygIAsFw7UyXktfZ7WSDrm/cFs1oSdPGPEYzI=;
        b=s7MbzdSfoBnkcgmICaWN1mwJ4LO4SPxGfwjXExNI2eJ1tzSp3nbI5SlSd26fgV7w2R
         zjOzDD93Iflomip5VcLMxRreyqmWSstn2+7Nr80xo4ZNw68caCMC8yK3xwOffKcbBWEo
         /VEjep9p3VhQ/JsGsHZq6rszvCvidTS3Gg6n7XSJJEY4M/Zzj3mXuEUnAGE0mY92tMGB
         T/SXofTx9s5xgDcy6brDfGybCD4nHtH/hul97lhib4sFCNnQUbXAYGY/MY5xb+kGT/cr
         mA93WaqB8Jlb5iiVOSNfipouLjIv+huS44GNzqYkqXTRVg8HTI6/2OoeV0sosvOZ0OzK
         HgbQ==
X-Gm-Message-State: AOAM531BwWCmSqglg3k2GoQxCHEInqa/mnSmOafGR23HsA/ugJiFYcrL
        OQzc7upIOqhWYCgiUYF8pNRlQ8FWVF9QeYvMwQlQMQ==
X-Google-Smtp-Source: ABdhPJygYdyJ2oD5MvUWxH7zac5rsixkpWaHXwVbW8sC0RtxEydpTGWI+yMWqIGchfBWGr94pp7UVI9eQAkP5mAQKVc=
X-Received: by 2002:a81:9c47:0:b0:2db:9e18:6e75 with SMTP id
 n7-20020a819c47000000b002db9e186e75mr778283ywa.437.1647446780804; Wed, 16 Mar
 2022 09:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220316141354.247750-1-sashal@kernel.org> <20220316141354.247750-11-sashal@kernel.org>
In-Reply-To: <20220316141354.247750-11-sashal@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Mar 2022 17:06:09 +0100
Message-ID: <CACRpkdauQjYyouf-TeVuDeLQ6SPtXJpV9QGeC17BEBs5Y_Fr9w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.16 11/13] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 16, 2022 at 3:14 PM Sasha Levin <sashal@kernel.org> wrote:

> From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
>
> [ Upstream commit fc328a7d1fcce263db0b046917a66f3aa6e68719 ]
>
> Some GPIO lines have stopped working after the patch
> commit 2ab73c6d8323f ("gpio: Support GPIO controllers without pin-ranges")
>
> And this has supposedly been fixed in the following patches
> commit 89ad556b7f96a ("gpio: Avoid using pin ranges with !PINCTRL")
> commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not defined")
>
> But an erratic behavior where some GPIO lines work while others do not work
> has been introduced.
>
> This patch reverts those changes so that the sysfs-gpio interface works
> properly again.
>
> Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I think you should not apply this for stable, because we will revert the revert.

Yours,
Linus Walleij
