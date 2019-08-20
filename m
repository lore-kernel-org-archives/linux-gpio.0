Return-Path: <SRS0=KNKo=WQ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5C5C3A589
	for <linux-gpio@archiver.kernel.org>; Tue, 20 Aug 2019 10:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EF8E22CF5
	for <linux-gpio@archiver.kernel.org>; Tue, 20 Aug 2019 10:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gNRs5fIz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbfHTK2z (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 20 Aug 2019 06:28:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44378 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbfHTK2y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 06:28:54 -0400
Received: by mail-lj1-f196.google.com with SMTP id e24so4600947ljg.11
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 03:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6v0DmvJvbjv2zURNnyD28KCYnRdojvCBng/rMzEpn8=;
        b=gNRs5fIzJ6vnI/BbUQyR6ZDxhvBG1TP7JzEw85CieCU9eV2avrseHmnon3PJ/D4NPB
         Tjhm4ZiuDc5M3XC5FqX8KLhEgtZhuntESWsoMJEHvqqpJhGhq8uF+6VqyJ9WXLFcuklc
         LsSpHN0dyTSOtWuEOS6KScZ4MHFJURxzpTBXb+wBTQsUMxXwaCGQy1ahOWE2g4YLtyJz
         KP1iZ2f8ZyML13bm3SUPm1ibVs0GJ0fEszHj0/w2bycfQkth7+1qPf15ngUbA0/eLAxu
         pLE+jD4oPgDtZOJ5fWywahzztVuHJrel8S0zthN55WinfAGRGKmtlzZ4BFQmLZsNvMW5
         XAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6v0DmvJvbjv2zURNnyD28KCYnRdojvCBng/rMzEpn8=;
        b=AWiZyQ2lHwYE3gedgFVINVa6pcF9+s4DbTlFeZ3C9AB/D5cuGl4xqDz/ZRU0yF7S99
         yH9cX3Bz7eosfaekmSW52SHRGFbvWUUCe05KtzgYFK34I73B4nCOKJuPfuPRlE1OBb0O
         fJtHLsLfp0DgYQJN59DC0gpiBHLoUK9GbLPqCAU0y7mzWydj3O6fG9PKV9BQvsTR1TWO
         6jmSxeR9NpTu2U6nsOhZn1fPIAMpMcTPAgY1gaY2y57TTnqVLJrrmyU0dFa4aZTVVUe0
         n7RzCZYKZEe0gkEXOpq/XE22OmaRTGs5u9PUjoiX2QTU8GtxMKdk1tQERiRdx9VA3axR
         3E5A==
X-Gm-Message-State: APjAAAUhgHhk1AxQdiWn9MunbR4/Tu5yPTQ8QYfHY5xhIORrxkDE8tZO
        aqxDHSbDBPTLU1G2qP+WUqe/ia+QylmJbDntJDZ5tA==
X-Google-Smtp-Source: APXvYqx8TwsfpdaBO6LSWSsVL90xN2wj91FWdDxSOTkHhFycWNNiPtSt2zw2+Gmfxi3onNByEmbzj5aLb/rDw58ZTIE=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr13798111lji.37.1566296932663;
 Tue, 20 Aug 2019 03:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819075757.1753-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190819075757.1753-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Aug 2019 12:28:40 +0200
Message-ID: <CACRpkdZcryG38rc7aQ41=qe9Ziae98YQLEw+xNHEDCGz0OTCog@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rk805: Make structures constant
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 19, 2019 at 9:58 AM Nishka Dasgupta
<nishkadg.linux@gmail.com> wrote:

> Static structures rk805_pinctrl_desc and rk805_gpio_chip, of types
> gpio_chip and pinctrl_desc respectively, are not used except to be
> copied into the fields of a different variable. Hence make
> rk805_pinctrl_desc and rk805_gpio_chip both constant to protect them
> from unintended modification.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied!

Thanks
Linus Walleij
