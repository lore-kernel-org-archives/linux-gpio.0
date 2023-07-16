Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A1CEB64DD
	for <linux-gpio@archiver.kernel.org>; Sun, 16 Jul 2023 21:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjGPVUV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 16 Jul 2023 17:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjGPVUU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jul 2023 17:20:20 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165DCFC
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 14:20:19 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-57a551ce7e9so38575197b3.3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 14:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689542418; x=1692134418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5jVNQL7Cqqr60okI8mc7o8ZzfhGkfsuMA8PNwkU7+4=;
        b=nZrzudf6xWNgDh9pI1qUJneWfZZ979ATLS6xoZ5hymfxndprmeWruOujesfVNEI09I
         imgYXL5vPi+KQbDW/5KpR+WqF2IbuLxDAoGRwDZOkCSomygdREedz7TIyvPhIW4T8HEQ
         Kt/oCml68TYo1IfQTRpYtbqyCrwWR/WX8oNl9zPPtMAWFuOH1jAK8a6w+ij5laChENWX
         dPuuWPHSgDQ2UUK9RqRGemmyAgLUjVEBUDoVX+9MkgSZm7F3SmnWtCCstm8nltqTK+NK
         gyVl/1WGHoIAqIanzO4RdVju//vpXy+qQfT65rYde56kb5xHqBtOWIiaWduXVrYpxINK
         xjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689542418; x=1692134418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5jVNQL7Cqqr60okI8mc7o8ZzfhGkfsuMA8PNwkU7+4=;
        b=Wtqrg9QI2x/FVnye2PrIuToPO7MLBfOv0qLtP6yJdnxjPGq/ulvwQl1w3dIgpemf+h
         Szl8dsPvuLY6uDRTlx+gmKW6dUavD/OnsC7k258TYieFZU3a5gmh3TyvehjfOoVKO/vu
         8iRwKAk8ot26AoVGvldmDr6yJy6fjgmHVmL801RpyCdM5O/am58OO6oXU9kX18foQShv
         JkhaLYq+Bxl3QbR1g5GiTZ2xe7ggBZnDiVCueB6NYHPeJXevkL1xlkUfeXx9MrVnwKAH
         2YhrVTE2uav9jBt/1ZLHfTgVpffr2VG8HkzIKoldXStFiN5y+v+IfuqOOKFoAozy/LtP
         SPRA==
X-Gm-Message-State: ABy/qLbTt8kvh2UoQN/lIcI5WvqP7DiyCL5QN4UUrl1IxV8WoPNoMptq
        mmPJtolhgzzvkIZt4lx2HtJPzJ6R5t4FBb9ydjWSEQ==
X-Google-Smtp-Source: APBJJlHFulXWKieW8R5pU5+4sBV9kVYwKWI7RxXFv0PMRLSfeuSHf71kiTm/P4n/g1hxXDT2l3GQ0t6WmONXnWG1MKc=
X-Received: by 2002:a0d:cb4a:0:b0:56d:4b45:f9e1 with SMTP id
 n71-20020a0dcb4a000000b0056d4b45f9e1mr10803683ywd.3.1689542418359; Sun, 16
 Jul 2023 14:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230714122441.3098337-1-huqiang.qin@amlogic.com> <20230714122441.3098337-3-huqiang.qin@amlogic.com>
In-Reply-To: <20230714122441.3098337-3-huqiang.qin@amlogic.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jul 2023 23:20:07 +0200
Message-ID: <CACRpkdbbUga0biH=1tkCgRzUqNiDGdVf2woda5X2s43ct-na7Q@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] pinctrl: Add driver support for Amlogic C3 SoCs
To:     Huqiang Qin <huqiang.qin@amlogic.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Huqiang,

thanks for your patch!

On Fri, Jul 14, 2023 at 2:25=E2=80=AFPM Huqiang Qin <huqiang.qin@amlogic.co=
m> wrote:

> Add a new pinctrl driver for Amlogic C3 SoCs which share
> the same register layout as the previous Amloigc S4.

How is the spelling of amlogic there in the end.

> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>
> V1 -> V2:
>   Added a comma to the last item of the array and a period to
>   the commit message.

Andy had more comments about the header inclusion. Please
include all used headers directly as requested, I think it's a good
idea and avoids confusing compile problems.

Yours,
Linus Walleij
