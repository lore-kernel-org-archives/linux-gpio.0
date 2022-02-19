Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1190BC433F5
	for <linux-gpio@archiver.kernel.org>; Sat, 19 Feb 2022 01:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbiBSBEz (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 18 Feb 2022 20:04:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbiBSBEy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 20:04:54 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7378940A0B
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 17:04:37 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id p5so22648945ybd.13
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 17:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V/5MZpvS7D7UCX9Y+8AXUjnbJUpLL8w0dr/vzChF9N4=;
        b=LTf00weuUZUotionu7vEagp7Zndc9dtlvFwvE2bxpR09RB3rl58r+WnYGACXDniYt6
         M6TYWf3MuCQkglPSP/UBYubeJWb6rtUM+rPNvAfcK3USRyFyb1IT2k8NG5PtyyJia+vi
         W47ddjW5abUMulqv9nSvIiYSUmuoYuoWShCIaiqMVIPir8SohK28EimmOUlVO18+4cF9
         GM3Hqvyj7j/aShKqN+p35TMTqOSivPm1JJJ5M/cKpwIDqzv6WsV2ZByqtdVnbnUyr5/s
         qyEKeMCG12gXF4xrwqLSTiRnnLv6gXFIvn3BJ9ERdJU02szsi0zeU7tn/ySkQQUY2RcV
         ThYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V/5MZpvS7D7UCX9Y+8AXUjnbJUpLL8w0dr/vzChF9N4=;
        b=lvyAZ5buSkmY+sDKslrMR6/PuQO7Z2bUYBtynUXsxHrLZSN/4oqqxX9PXMm98GZy7H
         /mOor935SNybGxGkbNfQIiXmOS0LuqDDTlWuRzPJ6f7usUkrX+Kuhvme3mwvpk8eMpFz
         e43nYzh6Ftip2Kesiii0AOaQhaI42lLkSEyDZJH3fyhfU3jZ4OF1YtB/udF8DKoKUF6x
         R0DooH4R6oEP3etN4MEmYVdwbX2UNInCmSUJpUPZVje76hntmXQ//P0k7Xcp0VmcBmii
         xXkBqsXwNjWtkLMtudmnGHU4Cksdb1f1a6AavHp8I6VDYv13PvQ+CevgxMUmvy8jrv3w
         pFZQ==
X-Gm-Message-State: AOAM532ydc1kWD9hwiPTMvAk0ivIFU3eWxcQqIA99ytl89Z1EzNlck1d
        1kqSet+rdM11azKai/wUOy/IT4RMEI7vqsH2vI7uoJzed8jQ+Q==
X-Google-Smtp-Source: ABdhPJw05VA0Iq2tRkOCFLYVIC6Fk12gEF5SwjESCl/UrOtzfi1mu7Cz+/vjy7nETXhz41BxhCkF2R2ajVbHMcBAxd8=
X-Received: by 2002:a25:dc6:0:b0:624:128a:a92c with SMTP id
 189-20020a250dc6000000b00624128aa92cmr9954527ybn.533.1645232676704; Fri, 18
 Feb 2022 17:04:36 -0800 (PST)
MIME-Version: 1.0
References: <YgvdxSwYkHfSuV8a@black.fi.intel.com>
In-Reply-To: <YgvdxSwYkHfSuV8a@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 19 Feb 2022 02:04:25 +0100
Message-ID: <CACRpkdZff=9V467Nv9OayxYjnyf7=4UbdAAdRYGF+m5MCzmrMw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.17-5
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 15, 2022 at 6:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Hi Linux pin control  maintainers,
>
> Single revert due to possibility of clashing with real hardware (in the nearest
> future) that uses ID for different pin layout. That's why for this cycle to avoid
> any potential issues or even damages of a brand new hardware.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko

Pulled in for fixes!

Yours,
Linus Walleij
