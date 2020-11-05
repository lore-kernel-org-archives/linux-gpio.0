Return-Path: <SRS0=WQsA=EL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4236BC4741F
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Nov 2020 13:56:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB76220715
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Nov 2020 13:56:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dh0smW5Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730466AbgKEN4O (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 5 Nov 2020 08:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgKEN4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 08:56:12 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A31BC0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 05:56:12 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id l2so2436834lfk.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 05:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pWfr6I/1fhJwOoSf0YAlJNTAtwTO7N82LKv6JheUJrA=;
        b=dh0smW5ZHA8/k2JdZxEaAbu1SFaVcaFR8n6fGRx1taylpO7O13Uia0bIG+nyAcp6Ze
         58CH/affcXWzrdXyk7aumyOI6iONzzSyl2VU9uKIzfLQyEIdDWGUpoBZ6j2Zlb3x8uiw
         ahq7w1R4k5Vc39DihoB8D/YnNSiqo22/xAbJauqwpOsGm5WupE6zqadGH8LMzXgbuohp
         2gm/AfDkpazzOa3Z5Sy8hurv0CjN9wdBsdytjBJ5Bm4ecFA9AWSTBD47D+lo/HunH7u8
         5XiE/+LhPEwIRdSZK7UT5liPBytxyoxydytEbZ8b5ehmCjk0xIJn5aGw436meUFwzCcw
         +agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pWfr6I/1fhJwOoSf0YAlJNTAtwTO7N82LKv6JheUJrA=;
        b=X9T5qcPo5kHqhKFgcFs3ysB457cC6eGCHZrpvIwnJLRciD+RzzvMuw+fOe5EpJgJtM
         cigZw0OnHa7ZcMPGzrR3bbThI3h6oY4BPmnnU7HeCspjNTPRuar8vYE7ohlNcKd6zY1B
         /vrYwYzEWLmGRgTDMG3mhSr3ENEsX+zUlqtzrWVfVq2rfP1qKwn5E5ruvKLC2xh4rYHP
         +peSo1BRnSN8uy/1g8uoiDaEc5hlLjL2I9YeP9d24qeR2NkUpfE+YhAZzsCib8uA1PEr
         lvn6Z5ELQMHPvu2uHkzeXvY6ksQEG9QKcohuCxbBnAOuRsFdGW++rAoS7RThQ22gyk+Y
         r7KA==
X-Gm-Message-State: AOAM5318u7q73xfLE7x2y78dkDLtMbjQm1OwHLMlsbYsUmvYwfLYUCjc
        U5Xpw8e32/CLb87xrbAqAQtogQ0MUehNxPVntX7rKA==
X-Google-Smtp-Source: ABdhPJz1NkMdVDk2FKVmNqglkouzFOqJK2r6nNAUhTjFtrEgBbtn9xveKMPS3FTyRh2Xf7ZdUcxMmijM8XkJxyAwmCE=
X-Received: by 2002:a05:6512:3225:: with SMTP id f5mr987061lfe.441.1604584570861;
 Thu, 05 Nov 2020 05:56:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1603893146.git.mchehab+huawei@kernel.org> <53f82f9b3c063bb1b928bdea4986f1471ad3ace7.1603893146.git.mchehab+huawei@kernel.org>
In-Reply-To: <53f82f9b3c063bb1b928bdea4986f1471ad3ace7.1603893146.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 14:56:00 +0100
Message-ID: <CACRpkdZMpRvF3OhgPzSnk_qJcMNW+RtcYud8VEhgz2RVzN=ntQ@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: ABI: don't escape ReST-incompatible chars
 from obsolete and removed
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 3:23 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
>
> With just a single fix, the contents there can be parsed properly
> without the need to escape any ReST incompatible stuff.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
