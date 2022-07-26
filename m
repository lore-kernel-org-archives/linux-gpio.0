Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE5AC43334
	for <linux-gpio@archiver.kernel.org>; Tue, 26 Jul 2022 07:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238348AbiGZHsR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 26 Jul 2022 03:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238325AbiGZHsQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 03:48:16 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40ADDDFDA
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:48:15 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w5so4311815edd.13
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FH/29theWqCi+bWe4cZkC9kVr9XrvsNj1wv53N0Mxyo=;
        b=yyUauTSIja1NS2kRSo57hxSmByY69K71T1R02GJNP+Bz+KRkj62kj/6I4QYkyuPnH3
         19aLTtpfVlfw8hNqrFIeHWqKF+mhZnCMyJepWZVhaIkhI575pijXqqm1wOg2+sJapndR
         xa6WKQe7GJ3woUuVnjrDJ+TyrFZkxWAQjfkmrIpNRqc3uvi2OGGMhByUW9dsXTHKeMes
         YpNPNP0XI7SExk9eqs02E2eTIb8yoKSN/RSOIcLaLmlQk3wiQF10yPbXW/x7uqstLbxt
         AN+h0RtlCnFWRnn2RSSA9NBwhBiHu8h8xVWct83S8KQH54VKwIKHUt+I/XEpxGTq7k7+
         ITDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FH/29theWqCi+bWe4cZkC9kVr9XrvsNj1wv53N0Mxyo=;
        b=YQ3zErrjBZV/Uem73EPpoI/8FCAKp/+t48api3E0DhytpbMt0zdosHWvD6xTmczS8j
         BzCsiT49DyjDHaPXtM4qaCpWD3guR26LqE4wyL/aNNZxIpYiIHlGMt4vUeD6MTrZq7ZO
         jeaezVJ72lXhUZgKRyniPQyRCgapNaUzaggvQz0Hwm8yPv6Dv+E6X0gO2VjlGhWaO7mk
         iHMIBCZJt7wG5JfpdPui8qHkaROfhdHTVowEJ/f6/Cy3p3JA/PyJTD6IqqJyjxzegHlO
         CmQ6f7+8NRi6VE56GicsHBAcxxA5hT7vc9mJ3qR6wfZxkTL5MBhWJGWiI+qMLuOKAFU6
         wq3Q==
X-Gm-Message-State: AJIora/f2qvJZfeiOgP+ejwE+fpWGidtAj2zMWPwG5HxsRB+/91miWpE
        HH2pdqGX9jw8ZXeSmIwvyDtSpegEsFKM30w3J+pwL0lfiqAO9Q==
X-Google-Smtp-Source: AGRyM1uZga0NmMKKnrtL7tNwX0yv1AqXO6WwrAuYMFC0JhsER8PGlbr+vexB48sBx+y4/hFXsFUplNR17/2NCvfE8Y0=
X-Received: by 2002:a05:6402:430b:b0:43b:e639:8b25 with SMTP id
 m11-20020a056402430b00b0043be6398b25mr13083404edc.205.1658821693599; Tue, 26
 Jul 2022 00:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220721093422.2173982-1-marcus.folkesson@gmail.com> <20220721093422.2173982-2-marcus.folkesson@gmail.com>
In-Reply-To: <20220721093422.2173982-2-marcus.folkesson@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 09:48:02 +0200
Message-ID: <CACRpkdZJZ6JwGDLdPHqb8WW+fN+tAYNDD-ERwo4h2ftZ0cGEqg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: fairchild,74hc595: add
 strobe-gpios property
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 21, 2022 at 11:30 AM Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:

> Some shift registers (74hc4094 for example) has a strobe signal to latch
> data from the serial input to the parallel output.
>
> Add an optional strobe-gpios property to support those chips.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

As pointed out in discussion with Andy, let's drop this and just
use cs-gpios as-is.

Yours,
Linus Walleij
