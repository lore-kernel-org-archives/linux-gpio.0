Return-Path: <SRS0=lsbl=UY=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E74C48BD5
	for <linux-gpio@archiver.kernel.org>; Tue, 25 Jun 2019 09:01:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 851C620659
	for <linux-gpio@archiver.kernel.org>; Tue, 25 Jun 2019 09:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XtrD/EqO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfFYJBd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 25 Jun 2019 05:01:33 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45930 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbfFYJBc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:01:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so15396772lje.12
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SpGaUN34ukrBdheHm42Vk8FKt7BxEB3DDY8H2Mxele0=;
        b=XtrD/EqO15n0Jj+FpH9rp912zAls7LWmRlIVxqEk0PSDma/8XUECiZkVIqzYCBiFrQ
         reWRvQz9fbu5tq56znKQH4J/oTCOk1LWI7Fjg5TYuu71qQSTgz8Gl6ANcSGGR2ZChzRJ
         Nv8UCUHCQbjLYq33b/V59rUvsZOxoUXuiyfc7pZCdrg0XUK10Sip18wbj+ZhWxh6jzK7
         btafT4w6vijC3GPZPdY3Z1Mm7YBwwhUGRirxY/nmsFKwgNkS+K6laht/lVQA7KCryyiI
         4cELbiZ2rlsQwlRhQGv/Lndt+thpDZGu4VkuRYck8BMgW9BDexXcCMa6eDXF5ZtXda+X
         T/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SpGaUN34ukrBdheHm42Vk8FKt7BxEB3DDY8H2Mxele0=;
        b=rUvR7GzDS9BpPkgMp9dbqFF1BCWIngpgaAK0iDvR48P+yF2nB0a6cgsONElWzaatPj
         WhHIlZFuJssPpFtL4b+hd9KTjTEso/VgPoygGSy8r++7NO5CvR9Jp7Cm5kKYPEQe9b1W
         c9xNsnvms+0o4nABFGaEp6lzhrYb+MfEhINdqe+UORMtTlpMAzOqbTMDRvipOFUo5OWZ
         /4uc2W70YK79va39Exlmye/EBzfeCq22VnwtWwjDNOwgbqTl5FOVsDp30fytqF8J/+JY
         jcrqUeboQeRzphL+9XRZWBdHfs0tNJ/GuboPfvxh391XAKXGZ5e0La3UM6zDFJmk6OQE
         rz+g==
X-Gm-Message-State: APjAAAUw2Wm4VmzdjMco+bOBWafGtvaRn5SFlp2raF0MsrlsiKF//57l
        w6L+54LcSYH+sbFs5R/DO9ZkBzawBAdkmMsZNhsfdA==
X-Google-Smtp-Source: APXvYqzpuSQqLHFDVIbACr8WGm+HrLnSkqurVrr5K78qT7AtVPvuffPEkF9/CYbh9UoUQV2e9HhDv29nAMJXEfRlq5k=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr54454287ljj.108.1561453290704;
 Tue, 25 Jun 2019 02:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <1560787211-15443-1-git-send-email-info@metux.net> <1560787211-15443-2-git-send-email-info@metux.net>
In-Reply-To: <1560787211-15443-2-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:01:19 +0200
Message-ID: <CACRpkdbuPnm18M0F7HT3oBcFcyQtsc5CcAaTBXWbOwaJjRoG9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers: gpio: amd-fch: drop unused pdev pointer in
 privata data
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:00 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> From: Enrico Weigelt <info@metux.net>
>
> The pointer to the struct platform_device in the driver's private
> data struct is never used and therefore can be dropped.
>
> Signed-off-by: Enrico Weigelt <info@metux.net>

Patch applied.

Yours,
Linus Walleij
