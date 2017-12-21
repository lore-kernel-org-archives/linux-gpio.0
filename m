From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: adi2: Improve a size determination in two functions
Date: Thu, 21 Dec 2017 10:23:05 +0100
Message-ID: <CACRpkdY+bLk9Ncpp8egXSh5PX3jQ-KP+Sd-wQmE+4NrPALYvwA@mail.gmail.com>
References: <3d620bed-db19-aacd-0ea5-4c64aee104d1@users.sourceforge.net> <528bd747-ad86-8480-f4f7-b8689448b336@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:42593 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752160AbdLUJXG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Dec 2017 04:23:06 -0500
Received: by mail-it0-f67.google.com with SMTP id p139so9942692itb.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2017 01:23:06 -0800 (PST)
In-Reply-To: <528bd747-ad86-8480-f4f7-b8689448b336@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Sonic Zhang <sonic.zhang@analog.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 20, 2017 at 1:02 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 20 Dec 2017 12:38:53 +0100
>
> Replace the specification of data structures by variable references
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
