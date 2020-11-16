Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0357C2D0A3
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Nov 2020 19:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EE9120656
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Nov 2020 19:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATSLGuX5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgKPTLR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 16 Nov 2020 14:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgKPTLR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 14:11:17 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3105C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 11:11:16 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id z21so26657149lfe.12
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 11:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ozx79/eH+Enhtyxatz0apcTmmFQj2mcMHSsPotXXJEg=;
        b=ATSLGuX5NkyzC8WyWbixv6Kk9MSYiohL+EyrObTo7E4dx2xSPqK8k5O2pgo00cqUQq
         Al1I+A9Nzpg7z2aC7nuodQ8YpGCdNLFXReFBNJIzZLNrmRQ/ioKPs5FE1/iDMJcLkwbC
         v6tywaJfFhDOohlR454QakdOSzfI+zO9hv9rfGdVi5bVEQYrGdD0lIKfdZdVaynXEVt9
         TAXJhZr0/QvC1yvRXrwBJCMNKxmtEGyTyaN2jBIf636cUB0SKyqMzkey6rQcqNQM73tc
         kCFRGPm5Sbff5fFmy9lD4W4pZ0q+FLJX1xqM6OyNxkh5ZyQhpbneC/TzkGKv5wezIfxy
         +VXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ozx79/eH+Enhtyxatz0apcTmmFQj2mcMHSsPotXXJEg=;
        b=OZ7G6JUrOX6vcwsinrOUDWc3EA2uWEJVX7Kuz2tNNTSNhpUQc26+NGzPZfFGMkJePv
         YyxkkvrLVfACypFrxlRZMOUhxrcD9v6PD4krtFn9YKf5S2h7x6oP1i1nUag1GmkBlxfV
         nNPk55De36qnAWMe/d9o91JsYe89HGi9ZQ8OAhbLZDg3h5BJFWm8ar/M37dVqfgzJCCZ
         r1u2SpcVigO7u3TNhGLVzK4MmJv8gH2+11GJuU6BzNN/uTUy1baOMLbRhML+6C9GFCGj
         S9UP3jyREY2TbaA5R1BBw56dwedEZafbKG8kGTjW2zwuUShSDzFUftyAwFsqo5Xup4mi
         Q7NQ==
X-Gm-Message-State: AOAM531fGwBDWAKIGHT66NIl8VL8WWGtMPABqbj5bK/vN8Zutmdr03+H
        j9izljAa8KSSaCwXywgZ9WxdJMKfvhhErylFYitRKf4LYaE=
X-Google-Smtp-Source: ABdhPJwRY2fDgyA5KkaH8IGK50cG3kKVG5Zp0WLNKstkE2ZN8yHfNXaOLTbm5lavrO1YW8Sn1PaeVAu0zAHJhcqL7po=
X-Received: by 2002:a19:207:: with SMTP id 7mr318931lfc.251.1605553875441;
 Mon, 16 Nov 2020 11:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20201116175128.4824-1-festevam@gmail.com> <CAHp75VdGGxMO_O-X_dfBTog0TG9Aurr6Txgq_nRwU40QvaQNrA@mail.gmail.com>
In-Reply-To: <CAHp75VdGGxMO_O-X_dfBTog0TG9Aurr6Txgq_nRwU40QvaQNrA@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 16 Nov 2020 16:11:03 -0300
Message-ID: <CAOMZO5C04aNkd_W-EueQkDfn_=HGDdN7MQCJtxDpwJS=MDSyYw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: Remove unused .id_table support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Mon, Nov 16, 2020 at 3:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Another (and I think better variant) is to switch .data to be a
> pointer to the corresponding struct, then you may drop enum and hwtype
> completely.

I did as you suggested and sent a v3. Thanks
