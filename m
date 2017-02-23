From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools/gpio: Add .gitignore file
Date: Thu, 23 Feb 2017 16:26:09 +0100
Message-ID: <CACRpkdZua-XU4qvoY_MFkWu9tV3Ay+ZcgBSm6cCV75XvzBtu9w@mail.gmail.com>
References: <1487599261-19584-1-git-send-email-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:37328 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751169AbdBWP1A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 10:27:00 -0500
Received: by mail-it0-f47.google.com with SMTP id 203so3120096ith.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2017 07:26:13 -0800 (PST)
In-Reply-To: <1487599261-19584-1-git-send-email-prarit@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Mon, Feb 20, 2017 at 3:01 PM, Prarit Bhargava <prarit@redhat.com> wrote:

> Add .gitignore file for untracked files in tools/gpio.
>
> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

We already have a patch like this in the upstream kernel.

As discussed the include/ is wrong I think it should not even be there...

Yours,
Linus Walleij
