From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: generic: clamp retured value to [0,1]
Date: Wed, 5 Feb 2014 22:21:08 +0900
Message-ID: <CAAVeFuKsxft3voCdDVfU+uYYGeUR1e0o4RWeRqs8h3EmnSx=-w@mail.gmail.com>
References: <1391606053-12422-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:58067 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757AbaBENVa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 08:21:30 -0500
Received: by mail-vb0-f46.google.com with SMTP id o19so265255vbm.19
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 05:21:29 -0800 (PST)
In-Reply-To: <1391606053-12422-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Evgeny Boger <boger@contactless.ru>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Feb 5, 2014 at 10:14 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The generic GPIO would return 0 for low generic GPIO, and
> something != 0 for high GPIO. Let's make this sane by clamping
> the returned value to [0,1].
>
> Reported-by: Evgeny Boger <boger@contactless.ru>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
