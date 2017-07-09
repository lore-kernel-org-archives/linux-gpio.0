From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Getting gpios from user space based on gpio-line-names
Date: Sun, 9 Jul 2017 09:59:46 +0200
Message-ID: <CACRpkdYSPGb5NKpj9ruOy+SGxRvcsuvCoj-7VWaMyZBnU_hLoA@mail.gmail.com>
References: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:35513 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751883AbdGIH7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jul 2017 03:59:48 -0400
Received: by mail-io0-f171.google.com with SMTP id h134so13049846iof.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jul 2017 00:59:48 -0700 (PDT)
In-Reply-To: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "monstr@monstr.eu" <monstr@monstr.eu>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jul 3, 2017 at 3:01 PM, Michal Simek <monstr@monstr.eu> wrote:

> I am trying to find some docs about how to ask for gpio line
> based on gpio-line-names in DT. I see line names available via debugfs
> which is not suitable for production.

Bartosz library is the thing to use. There are simple examples in
tools/gpio as well.

> And also I didn't find a way how to ask for gpio Linux number from user
> space to start to work with them.
> This is for gpio mraa integration which depends on Linux gpio line numbers.

Hopefully it should not need specific numbers but instead go by name.
It'd be interesting to see how mraa properly uses this new ABI.

Yours,
Linus Walleij
