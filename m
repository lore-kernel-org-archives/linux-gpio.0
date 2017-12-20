From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers: gpio: remove duplicate includes
Date: Wed, 20 Dec 2017 13:08:05 +0100
Message-ID: <CACRpkdY5iM_Fsa5oLWtZj8PJbnQ1crbRFkTkTQMrQ_R4sAio+A@mail.gmail.com>
References: <1513429012-8327-1-git-send-email-pravin.shedge4linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34012 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755085AbdLTMIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 07:08:06 -0500
Received: by mail-it0-f68.google.com with SMTP id m11so11309748iti.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 04:08:06 -0800 (PST)
In-Reply-To: <1513429012-8327-1-git-send-email-pravin.shedge4linux@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pravin Shedge <pravin.shedge4linux@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Dec 16, 2017 at 1:56 PM, Pravin Shedge
<pravin.shedge4linux@gmail.com> wrote:

> These duplicate includes have been found with scripts/checkincludes.pl
> but they have been removed manually to avoid removing false positives.
>
> Signed-off-by: Pravin Shedge <pravin.shedge4linux@gmail.com>

Patch applied.

Yours,
Linus Walleij
