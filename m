From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: berlin: Don't leak memory if krealloc() fails
Date: Mon, 10 Oct 2016 10:35:45 +0200
Message-ID: <CACRpkdZfBgvR4ez-YXSna5GK8REdiNSPqWF9NqjuLMfp7pB=Uw@mail.gmail.com>
References: <1475237636-15109-1-git-send-email-jthumshirn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34141 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752418AbcJJIm4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 04:42:56 -0400
Received: by mail-oi0-f47.google.com with SMTP id t73so4983692oie.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2016 01:42:56 -0700 (PDT)
In-Reply-To: <1475237636-15109-1-git-send-email-jthumshirn@suse.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 30, 2016 at 2:13 PM, Johannes Thumshirn <jthumshirn@suse.de> wrote:

> We're directly assigning krealoc()'s return value to pctrl->functions instead
> of using a temporary value to handle error checking. This leaks memory in case
> krealloc() failes. While we're at it, implement error handling for failed
> allocations at all.
>
> Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>

Patch applied.

Yours,
Linus Walleij
