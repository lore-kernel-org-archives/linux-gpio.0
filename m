Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E0EC433E0
	for <linux-gpio@archiver.kernel.org>; Mon, 18 Jan 2021 15:16:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 972D922BEA
	for <linux-gpio@archiver.kernel.org>; Mon, 18 Jan 2021 15:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393302AbhARPPg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 18 Jan 2021 10:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393223AbhARPPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 10:15:25 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E70C061575
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 07:14:42 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id h16so17977637edt.7
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 07:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HugYEP6XhIuhW4aanJeTiB3SihjPPep0QNF5phL7i5k=;
        b=jEZrpgW8R5YlIH5aHveUsS7rToDnwcuYnBp9XYZWsoLcDm3lw7mM2+z/wCSBdkesMk
         +ylTNZRHw6KKad31zYLjllSOEE0P8c2hobeLd+FKqYf41e9R7ueYPBDjyfw3CZ+hRj1/
         UnKbTJq+Ksk+ToPUCO6WAHb4tzExB9cbiebXf5A5OKqGAFqUMf1rzYBoJTuM8T9mZ+mu
         08Y1m+uIhexLHHAeXSVKHuafBLUZyYN9Ac8+8TjRNpS5A0uwPbWLJlOyBN435AO1XGQU
         3Jtn4ry9j9CBBEJPEEMQ186gtAu4nuNkaTTOguCQEYHKSU8xSNUAwGaoAF1XZyJdgTwe
         Ke/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HugYEP6XhIuhW4aanJeTiB3SihjPPep0QNF5phL7i5k=;
        b=GpD0vYve6IlX5zdwP+E5u4eFj6E3k0w1HWRXwwtFh8FDYrmX3RMkHD1ysHSOyxJoXV
         JJGD8CwHfQVEGXRAu5YNsKMmaJUHfIHmLoZ33ABSVdflPoiNOczUDQFu4FenRlR+Vc3d
         Bz0e5Eo1LMfrtNXMsvdIDPp6krGYpkBPAGTu6tFWpY1rlVKnEuygF+U6pwjnRj9bTZpv
         hsi/eW0G0NLDD1acDBTPjHvqx+ATMckLRZcHZ8DKP0OguAaLkiqMnCUH01wyzHm0hZah
         MAqQ+FYt54/5VJYTIF44z8odGSmwpqkEuos4WnlvUged5th+4jWqkmFam+etZ4RnUV/t
         Tm7Q==
X-Gm-Message-State: AOAM531qeAR8GC3ty7FQm+A9s9U5aBCWx3R2XXNa8HdENxMb2+jgkmkq
        jbDaQMFdie2H/E1FAz4HrKv3SjGvTwzuapyiBCNRxw==
X-Google-Smtp-Source: ABdhPJxaEwCyV8L6L450Mo7UIUS7JK+undDbHYFCbzMfz9Zc7fUG6D6Ty3jDxAG1B23/Bum1pkrni8PgsxEnSER8kNQ=
X-Received: by 2002:a05:6402:c92:: with SMTP id cm18mr5540387edb.367.1610982880894;
 Mon, 18 Jan 2021 07:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20201213235447.138271-1-paul@crapouillou.net>
In-Reply-To: <20201213235447.138271-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 16:14:29 +0100
Message-ID: <CACRpkdasEV9AFih-_VJQqPb69XHnD8DkkAB5qM7qyO4+D=ebrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kconfig.h: Add IF_ENABLED() macro
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Both patches applied!

Yours,
Linus Walleij
