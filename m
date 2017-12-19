From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH] drivers: gpio: remove duplicate includes
Date: Mon, 18 Dec 2017 20:52:53 -0800
Message-ID: <CADtm3G5L61_P36xSz=_ADN=vr48wAe9CxSROKicwTjFge3-y4w@mail.gmail.com>
References: <1513429012-8327-1-git-send-email-pravin.shedge4linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:46266 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934563AbdLSExZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Dec 2017 23:53:25 -0500
In-Reply-To: <1513429012-8327-1-git-send-email-pravin.shedge4linux@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pravin Shedge <pravin.shedge4linux@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Sat, Dec 16, 2017 at 4:56 AM, Pravin Shedge
<pravin.shedge4linux@gmail.com> wrote:
> These duplicate includes have been found with scripts/checkincludes.pl
> but they have been removed manually to avoid removing false positives.
>
> Signed-off-by: Pravin Shedge <pravin.shedge4linux@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
