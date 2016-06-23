From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: Flag strict is a field in struct pinmux_ops
Date: Thu, 23 Jun 2016 10:50:59 +0200
Message-ID: <CACRpkdYLmb1nxek5rufx+W5YeNYbavBpi2HHteZ9+pQZFZXrRw@mail.gmail.com>
References: <1466462448-98833-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35500 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751664AbcFWIvA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 04:51:00 -0400
Received: by mail-oi0-f50.google.com with SMTP id r2so60376270oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 01:51:00 -0700 (PDT)
In-Reply-To: <1466462448-98833-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jun 21, 2016 at 12:40 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Documentation incorrectly refers to struct pinctrl_desc, where no such flag is
> available. Replace the name of the struct.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
