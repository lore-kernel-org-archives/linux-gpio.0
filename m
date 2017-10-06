From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools: gpio: Print error string on IOCTL failures
Date: Sat, 7 Oct 2017 00:03:45 +0200
Message-ID: <CACRpkdZosHOhWVP4qJH=H+61T+qAsUeUGC8XykKdaD6BPQ85aA@mail.gmail.com>
References: <1506603704-7527-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:48617 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751782AbdJFWDq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2017 18:03:46 -0400
Received: by mail-io0-f182.google.com with SMTP id j17so2130565iod.5
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2017 15:03:46 -0700 (PDT)
In-Reply-To: <1506603704-7527-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 28, 2017 at 3:01 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> Add to error messages the error description by concatenating
> output of strerror() function to error messages print out by
> gpio-utils.c on IOCTL failures.
> Rationalize error messages, while at there, making all of them
> look the same.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Patch applied.

Yours,
Linus Walleij
