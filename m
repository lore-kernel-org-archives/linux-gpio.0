From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix filtering out unwanted events
Date: Thu, 29 Jun 2017 11:33:21 +0200
Message-ID: <CACRpkda0WViPpULRAZCcBzCfCuum0GHkyWnWonS8A+LZvP+xXQ@mail.gmail.com>
References: <1498218316-27860-1-git-send-email-brgl@bgdev.pl> <1498218316-27860-2-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:34145 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751602AbdF2JdX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 05:33:23 -0400
Received: by mail-io0-f173.google.com with SMTP id r36so3757176ioi.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 02:33:23 -0700 (PDT)
In-Reply-To: <1498218316-27860-2-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 23, 2017 at 1:45 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> GPIOEVENT_REQUEST_BOTH_EDGES is not a single flag, but a binary OR of
> GPIOEVENT_REQUEST_RISING_EDGE and GPIOEVENT_REQUEST_FALLING_EDGE.
>
> The expression 'le->eflags & GPIOEVENT_REQUEST_BOTH_EDGES' we'll get
> evaluated to true even if only one event type was requested.
>
> Fix it by checking both RISING & FALLING flags explicitly.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied for fixes.

Yours,
Linus Walleij
