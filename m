From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix of_find_gpio() when OF not defined
Date: Tue, 19 Nov 2013 10:46:31 +0100
Message-ID: <CACRpkdYU+SiMKAt1kKe12a+2RN4LXZpg4som6DGySzu8UxrGow@mail.gmail.com>
References: <1384825049-8214-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:59831 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751597Ab3KSJqc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 04:46:32 -0500
Received: by mail-ob0-f178.google.com with SMTP id uz6so252752obc.9
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 01:46:31 -0800 (PST)
In-Reply-To: <1384825049-8214-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Nov 19, 2013 at 2:37 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> The prototype for static GPIO lookup functions has been updated to use
> an explicit type for GPIO lookup flags. Unfortunately the definition of
> of_find_gpio() when CONFIG_OF is not defined has been omitted, which
> triggers a warning. This patch fixes this.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> --
> This fixes the kbuild test robot warning about
> "gpiolib: use dedicated flags for GPIO properties". Hopefully this can
> be squashed into this same patch. Apologies for the trouble.

Thanks!

Patch applied for fixes.

Yours,
Linus Walleij
