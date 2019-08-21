Return-Path: <SRS0=6Eea=WR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2021EC3A59B
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Aug 2019 10:05:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC7F020679
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Aug 2019 10:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6cokKjo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfHUKFN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 21 Aug 2019 06:05:13 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37790 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfHUKFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 06:05:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id c9so1356511lfh.4
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m1f2HiISSaidRsiBte5wZoNhW3uuVsn+JOSHikJRLKM=;
        b=p6cokKjopghFW0uPUX4eglH6ytwAHYRurXCzgZZIt1aZPpSL/CcrWzI/EjzZ8gr9d7
         Jt/ily/6v0u1JXheWsQ2YpIYwiw7LAPiRusN0e1BC63/K0911V8HL3C4i8hJ7weQD2E4
         bY2s+VAbDKhFunCj8/qf2vxrSYpBp4hBX5Oifu8S20n06e7CHjj13SiUNf0Wx6gRsRcq
         dxo10MAKRJwgCKxBLDBTLN1DEI4J5g/FcI/unRLd4Gj8Wm2Azdk3dgXDH1f0qaGrZjeh
         7wrTIRSKLJIU2cXxrCgky5PHkzomRnf388IvVSGAsFXQJ2hGwLE1qUF7IiwRAfGPPs7r
         6u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m1f2HiISSaidRsiBte5wZoNhW3uuVsn+JOSHikJRLKM=;
        b=gSOdGWrU2+yHCjjJAaGqb0uEB+Q1tyDxf1lD/WPoqao3waEnxkiupNb/MEpfuNJvv2
         pU1VSlCBH54nis5J4PAf53JIXyBTsEQD8u39Hvx/X1x6cyXStKEDT41BVbZfmG80Ip7A
         0yNZ5l2QEUTzxMA9onsvDopn3U+ttzk8r5FdFg5+jiZStHYGViyU+5geTz+gPoldmL25
         1FnbgZ+jG2QgtgqrWjNNr/9axtgyusHQ6abNUnXsdS2nlLGjP4/qnRI45K2NpSCmy63t
         10yzsysfqbXU1BZ9fzNbXr35Db0agdOxgTuyWkpYC0cB4jlUHK+ky3NaMmvixZw+UT1P
         CkfQ==
X-Gm-Message-State: APjAAAW9KmuuaxqKo94KjIYHUvantC0hiBv0fQyOeseFsrzrklaqmpf4
        okArqijJEInX9A3JD8rApTDZ7M3erFryo2YGrdWHWA==
X-Google-Smtp-Source: APXvYqzlFpwgtUN1/ODTvZFOvLQ4eLRvTCMKs2bpqwwkwySlDtut76JVRBYwgvUd9xNe5dwZoPTCvPOuggx1q9LsPn4=
X-Received: by 2002:a19:e006:: with SMTP id x6mr17408408lfg.165.1566381911384;
 Wed, 21 Aug 2019 03:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190815060609.3056-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190815060609.3056-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Aug 2019 12:04:59 +0200
Message-ID: <CACRpkdZmNMf_k0jHhDoJEouYWMN49=oCs3aEQVXjKXKz6LdwXg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: st: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Patrice CHOTARD <patrice.chotard@st.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 15, 2019 at 8:06 AM Nishka Dasgupta
<nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> three places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied.

Yours,
Linus Walleij
