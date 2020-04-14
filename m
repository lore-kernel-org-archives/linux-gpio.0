Return-Path: <SRS0=1XHY=56=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD9BC2BA19
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Apr 2020 12:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE7F620732
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Apr 2020 12:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPlkLfIr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439891AbgDNMWq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 14 Apr 2020 08:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440031AbgDNMWp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 08:22:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFE7C061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 05:22:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n17so12206142lji.8
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=U0eU5F2NzONWTgFiHuyY3nEDjxau3uAumIa/5rJ5Mu8=;
        b=FPlkLfIrSY7qRNZj6visowVmK9u+VGyYR3rT7cEgTyGKAKwHlR6zhBj57RQDxktmig
         sAm1u61PF+aOs0jC8eX12Jue0LJ5E8a5ocmekb9LAco4sv9KhHtmE3D6Z8JNlQyOG4/N
         CJmwy8IZ08k3h1LyFdf8lkw9Z3ZE+W8XlpvqI13kZBpdBPBrhxqXhHJ3Uvd4tIcWmrnv
         vVFgmWFkCBmUDsBO6pj/A21HStK/7cr72lfv67p8wMY1JnktWQN1ZuTQ8Sc3xbEODYmL
         iBHlejAFh1MvL+q99bm0UDBZWsBz4PKQM4yEvXn3Au66RTHb13PXYwu2ZIKaHJZIwb3C
         d9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=U0eU5F2NzONWTgFiHuyY3nEDjxau3uAumIa/5rJ5Mu8=;
        b=ri/FlBCJaX9TSup80M2iTX7JY9UkQkov+8pH+7OwZMWZiYPkhBslOYFGMP9XGL+o6s
         3Be/XqGdbQW+HGRaELH/Bw/rtuz8dYokILB9EMbF8hxK9CjIr+bD4LVSE2yNiBEiFfPk
         Nedf8DJmmUNRXpZe0TH2J5JXkzn13mptkqC8UcMUaS+9uZXz2x6kowTB7T10gIh63NWI
         9nZ656sBeucWxdqYV3wK6L2KlKK+xdt601E4ATd2bWpVbHZuqFNyAjK2wM17+ZXHkVtm
         WfHHjtT1Q+qVRxJ4BYILkC9yneAPaXFHfunh4SWiWH83la3te+shTo3MsKf6FlLLyvKY
         h+5Q==
X-Gm-Message-State: AGi0Pua3lfLqJvS+cRXz2Zy7fx1qZIoNcwU1z64Bhuct76TbgVg0LIIh
        TPnr9Emp/FKs7FBeRXuGii+P924FVz9A5QnKtFVRLa4vGII=
X-Google-Smtp-Source: APiQypISyk6uj/3JbENUuKGnjxckRpjqlLSr2BNdw84DI0n5tcjV5xl5QRxlT3wF8IHXFnG56tHb4Ivgq+Vda58nN54=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr13029309ljn.125.1586866961194;
 Tue, 14 Apr 2020 05:22:41 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Apr 2020 14:22:30 +0200
Message-ID: <CACRpkdadTD-6iYn1CAZJ_1js0fcpFZ5TGZsdWfXvcq7QtggzCA@mail.gmail.com>
Subject: Problem with b4
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     tools@linux.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sergey.Semin@baikalelectronics.ru,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Konstantin,

I'm trying to use b4 to download a series for application
of GPIO patches but run into this:

$ b4 am -t 20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru
Looking up https://lore.kernel.org/r/20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru
Grabbing thread from lore.kernel.org
Analyzing 14 messages in the thread
Found new series v2
Will use the latest revision: v3
You can pick other revisions using the -vN flag
---
Writing ./v3_20200323_sergey_semin_gpio_dwapb_fix_reference_clocks_usage.mbx
  [PATCH v3 1/6] dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema
    + Reviewed-by: Rob Herring <robh@kernel.org>
    + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
  [PATCH v3 2/6] dt-bindings: gpio: Add DW GPIO debounce clock property
    + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
  [PATCH v3 3/6] dt-bindings: gpio: Add Sergey Semin to DW APB GPIO
driver maintainers
    + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
    + Acked-by: Rob Herring <robh@kernel.org>
  ERROR: missing [4/6]!
  ERROR: missing [5/6]!
  ERROR: missing [6/6]!
---
Total patches: 3
---
WARNING: Thread incomplete!
Cover: ./v3_20200323_sergey_semin_gpio_dwapb_fix_reference_clocks_usage.cover
 Link: https://lore.kernel.org/r/20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru
 Base: not found, sorry
       git checkout -b v3_20200323_sergey_semin_baikalelectronics_ru master
       git am ./v3_20200323_sergey_semin_gpio_dwapb_fix_reference_clocks_usage.mbx

This is weird because I am looking at the v3 version
of patch [4/6] here for example:

https://lore.kernel.org/linux-gpio/20200323195401.30338-5-Sergey.Semin@baikalelectronics.ru/

It seems to be in-reply-to the right message and everything.

Can you tell me what I'm doing wrong?

I just installed b4 on this machine with pip3 install --user b4

BR
Linus Walleij
