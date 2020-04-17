Return-Path: <SRS0=nlfL=6B=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F27C2D0EF
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Apr 2020 14:36:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14D272087E
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Apr 2020 14:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/v6nzjV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgDQOgn (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 17 Apr 2020 10:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgDQOgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Apr 2020 10:36:43 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF39C061A0C
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 07:36:42 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id m8so2288998lji.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hsQxsLkGr+x1jBlRKnkBHWDMjvgC7496JJqGqem4MVI=;
        b=B/v6nzjVxzQ8hcjVtCntwklO1Or8E84jT2npg6fawUyB3nmfWRZK6AKmNE3gg0tjHz
         4aKNywzkDtMGIIsqYkHHlqsRFzYkcSboUbpUisChY4uggzAAX5hrhLctSIC7+ESBJ9gs
         rNM7Do4DRtWPm1JWok/NG791sweaoAsARkQSRK/yY8dw1rN8n5zl374Shd0PYUOFhpWS
         Lqm1j6IDsqJQT68siC0ptiqJ0ob++0hS/87p+Xi/RmA6+IUhRCRJhfskneR6iVXIDNTr
         pWfRKoTzuZ5XRVGparRkX0jWl33wT5/zqWu044A3xmbphzbv8XykO9xKAYrVbPQNgOtM
         dsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hsQxsLkGr+x1jBlRKnkBHWDMjvgC7496JJqGqem4MVI=;
        b=cpFWIzsIawIspotY9tAdbxSGiOL0KXoFyLtEdKLU3NjB18m6PRAXmHIGRNxrrxsbP5
         +ajD1T6sVYYgSqBNYkV0IY4lUEWxSY/Z5yuBQkcZ81W4HZkOXiFvskoAN5e2NLvhecua
         Ouy7Y55qKx26+3E2VBXpJ6AUsg5/zZi7fDZwEJzsj1hFt89PxrVYEkviq4zlterowir3
         2QfVjLRBMKfvq1yVUBM2i39PZ7efmY/Hbsg/XYtx1fMSBOE+BpLxUMFAQkADCKGRjWDq
         nI251cXF1+IPBwoEgTgSgnfqao7EBrwcJtdeamI+50XC0tHF7jPRalb98dkdYk/v7kYc
         cmjw==
X-Gm-Message-State: AGi0Pub4Q7QeEzbqMoadkzMKAhKPC/mWJVxu0qmFJfnDRLwtXK+lJi8m
        m5TqD3aWRNm+TSobgOF7o3chSKzRYDWRX6HyqpsoI5Oi
X-Google-Smtp-Source: APiQypI17sR1VJnoeOfw1HsRC0J1Ugd5y4yCRK1+PT0BvZQrMSgGwVOQnxShJDZ4Bv+NtAhR0RYisNelJr0gV5iFvjo=
X-Received: by 2002:a2e:8087:: with SMTP id i7mr605300ljg.99.1587134201353;
 Fri, 17 Apr 2020 07:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200417131455.GA7456@black.fi.intel.com>
In-Reply-To: <20200417131455.GA7456@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Apr 2020 16:36:29 +0200
Message-ID: <CACRpkdbmvy8SGi2UWxkzfftd4B71ZaGJO0Dj7w-CRHqAWzRZkQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.7-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 3:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Fixes for v5.7-rc2 of Intel pin control drivers.

Pulled in for fixes, thanks!

Yours,
Linus Walleij
