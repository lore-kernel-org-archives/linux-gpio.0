From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: ts5500: Constify platform_device_id
Date: Tue, 12 May 2015 09:42:30 +0200
Message-ID: <CACRpkdY_Z+a-tmsYeBQEfDojdYv0tsd3vBFz2nrCgXZ_K8WV6w@mail.gmail.com>
References: <1430495809-32061-1-git-send-email-k.kozlowski.k@gmail.com>
	<1430495809-32061-3-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33134 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932078AbbELHmb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:42:31 -0400
Received: by oica37 with SMTP id a37so123879396oic.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 00:42:30 -0700 (PDT)
In-Reply-To: <1430495809-32061-3-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 1, 2015 at 5:56 PM, Krzysztof Kozlowski
<k.kozlowski.k@gmail.com> wrote:

> The platform_device_id is not modified by the driver and core uses it as
> const.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Patch applied.

And squashed with the two other patches as it is a logically
identical change across all drivers.

Yours,
Linus Walleij
