From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pisosr: add missing unlock
Date: Fri, 19 Feb 2016 12:56:38 +0100
Message-ID: <CACRpkdZcbzy=CV++aVCVUR7Rk7J5djsPAxirxbhOgkCZM8+92w@mail.gmail.com>
References: <1455873780-31935-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33801 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757639AbcBSL4j (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 06:56:39 -0500
Received: by mail-oi0-f47.google.com with SMTP id m82so10326234oif.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 03:56:38 -0800 (PST)
In-Reply-To: <1455873780-31935-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Andrew F. Davis" <afd@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 19, 2016 at 10:23 AM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:

> If spi_read() fails then we just returned but we missed unlocking the
> mutex.
>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>

Obviously correct, patch applied.

Yours,
Linus Walleij
