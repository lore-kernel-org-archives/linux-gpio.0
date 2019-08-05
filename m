Return-Path: <SRS0=WyK8=WB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF277C0650F
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Aug 2019 11:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9692C206A2
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Aug 2019 11:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SmFf48nl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbfHELVY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 5 Aug 2019 07:21:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42788 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbfHELVY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:21:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so78964741lje.9
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d8hNDwGs8bcTkf5jcX5OpjV6TDJ03VTJoMgNpkl3MEU=;
        b=SmFf48nlUMtHnH/4MDqfmGZa9SsDFGG08uJ9cUu61xnoEmCdTkl4hZ2mab1PS3iWTd
         0emsWS81L1qTrLPk336eb/6aZPADuZ/G8JKgWKNLY3CXqRzfJUs0sFnxi2ulkYMqn9c+
         Lr7CPwjWDiEOO1IGxcJHf3Dtot1TE1jfnSk0uMZ+uggCsWjm7NfxsM012T0w/RGOh62l
         w3ILbSxbdh758KsMkaXY6cr8vOrhrqupbvTuMBxYHKUEYGu62aL+thTBWGlS8AAjZsrm
         PGqqxSNPF4LTN+7X74PUXAB6ZwG4PgD9TQ6r8+ksMb0tumAAe0S/gJTzLjZJjwzTkKSs
         Kwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d8hNDwGs8bcTkf5jcX5OpjV6TDJ03VTJoMgNpkl3MEU=;
        b=ZOiN0nWv+BKPXnWAlQxySNgztGvsfXC/78g9/M2jPef3XobpzWdHRjBpGJgYANYYWA
         tGQ3VC+cOM6vY4HMyf5pmwt0dOdBr95hZHoFpsDpKYXiayNCTgqJZxBhGmMxJnuhC6Iz
         qDmDGUjOaXUzYzWGpxumG6935fnigo5q1TAtjvP4pXTiVXDRjncgb18aJRUygkHSNm4W
         XdeYoaBp8/KX9K8jbr9El+zll6gFf+0a/CpiJs5KMR5pJBhi6mDdw8nSnIgLiZRX1FBj
         7o7Q25Uz2oV1JeYswFmkdfohFzAgWBriJlmF2BvWsEydUOPZ5HPlipGp5mBJWMXHTzbQ
         dRYg==
X-Gm-Message-State: APjAAAUr2q3lhhMxTPO8BsS2XuIiXFjdBonS9pHm6vO2dbE6T4KA7+Oj
        5CZKEw2WUVoTSLSGZHqrhD/AJOybp7+haYPD1Bh3BADx
X-Google-Smtp-Source: APXvYqzc/dxywuCfBMgBTR5GgO9I26r0ATaAILxLk3ZjLZrmxVOqZjYWKXaz3vtYEUWieKdVt+79lFCdSQo5MvANVl0=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr13898023ljo.69.1565004082120;
 Mon, 05 Aug 2019 04:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com> <1564465410-9165-5-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1564465410-9165-5-git-send-email-hayashi.kunihiko@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:21:10 +0200
Message-ID: <CACRpkdasSJAq6KdsMPMwo77VG-5TzDMmKPPNXXrmEZj4jzurvw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: uniphier: Add Pro5 PCIe pin-mux settings
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 7:43 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:

> Pro5 PCIe interface uses the following pins:
>     XPERST, XPEWAKE, XPECLKRQ
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Patch applied with Masahiro's ACK.

Yours,
Linus Walleij
