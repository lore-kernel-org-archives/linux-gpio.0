Return-Path: <SRS0=mvGR=DG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3444C4727C
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 13:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75B4121531
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 13:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fsD9nzfH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgI2N0C (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbgI2N0C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 09:26:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A92BC061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:26:02 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y4so4008108ljk.8
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+suD/UKCVwZ5/9vCLHfVIVUw8ZqdLjq+I4JDrjqAHjU=;
        b=fsD9nzfHpx7Jn5l+QguvDo0wYYEB5/qwGs0CB/GBvaj+fztlpDqOLpTizBF2MehcAz
         iEmyBDwD+OQUImfx4+wsxPh82JqX26sKSPxiwUbRAAP79dLY1k5pnyMj9iBkoYZINsel
         1b29Yv6gRVsQb4c8dAXrUiJPg+M0qcM4qK5ukKpT/Iv8gSgs4nQojxDvPMy1Zzd696lC
         ulaz6k7vx1BlA6PQCUl+uQBAqv4+oPP/wLh/c2gzl54IJwHEfKW+Pe1aXwbQPsCvRBGz
         BYRNrCb9iH+4TZ0NEN3IuJ1dTB8/pjv26Ocnu7XlqX9KziOFe2lxjHlpbAIMvLdi//Zx
         7TNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+suD/UKCVwZ5/9vCLHfVIVUw8ZqdLjq+I4JDrjqAHjU=;
        b=V/aYxdi1lN7iu2qMPbZR8piZxI3V3R1xlSNe9oNMeC1hUUpT2aEHaabH3Pn24yGP7d
         z+bfWLGxjuHo08XxrWBrOlCUdi7628+EJcHjjcgQK4dJdpbDZGPgf5GwAU51eDOXf3m+
         sQ7TLTpdGH7Yg1vc1j/Gk2hOCjnxcmdDPuV/PW1m5cD/u1r2xMd2sqJf/I8hndgUb2Qx
         AcSAj7Oq0/WTS8/P2b+tr7n0PYntfilSeB8naMQy4gfYN00QXb2eKo5TTBjYtiPvpkJs
         I7jD+XH8nIPNaEEPtvGOeTVElydli8U2zJmWdMXJV80BXfvoReP+9v8TipGLLsgfk86u
         30vA==
X-Gm-Message-State: AOAM531OQgdG3w9/tI3ZY1jky0dlRUNVuX2N507YIVAcCemxUs5uiamX
        dxo+LzHEVp3kBRJQM8JQNpQCaT0o5LY4BfCgraZFvQ==
X-Google-Smtp-Source: ABdhPJy8FrE4DtZvE+N7M9IrW1DBMhLoFcKMrK7A+HJ4VoFzBay3c/Eh0NVo0tnOfR5YWTA63NUy3ZB6y/PFP1Rl3n0=
X-Received: by 2002:a2e:a177:: with SMTP id u23mr1140504ljl.104.1601385960779;
 Tue, 29 Sep 2020 06:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200921082448.2591929-1-liushixin2@huawei.com>
In-Reply-To: <20200921082448.2591929-1-liushixin2@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:25:49 +0200
Message-ID: <CACRpkdYroSeoVrvSg-cUqyaGEknOCa7fiA-jNP2fgrXFvU5ZYQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: spear: simplify the return expression of spear310_pinctrl_probe
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 21, 2020 at 10:02 AM Liu Shixin <liushixin2@huawei.com> wrote:

> Simplify the return expression.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Patch applied!

Yours,
Linus Walleij
