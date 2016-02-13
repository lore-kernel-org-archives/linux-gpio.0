From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] Pass correct license string to MODULE_LICENSE
Date: Sat, 13 Feb 2016 23:41:27 +0100
Message-ID: <CACRpkdaMho3eE9u3Lqqg0UBFBH-bo3d8LmO3y+HuyRQMBPKWYQ@mail.gmail.com>
References: <cover.1454342013.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34359 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961AbcBMWl2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Feb 2016 17:41:28 -0500
Received: by mail-ob0-f174.google.com with SMTP id wb13so168659627obb.1
        for <linux-gpio@vger.kernel.org>; Sat, 13 Feb 2016 14:41:28 -0800 (PST)
In-Reply-To: <cover.1454342013.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 2, 2016 at 12:51 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> Several of the GPIO drivers have a copyright boilerplate lacking the "or
> later" verbiage regarding GPL compliant distribution. The MODULE_LICENSE
> string should reflect the actual copyright license terms used.
>
> William Breathitt Gray (4):
>   gpio: 104-dio-48e: Pass correct license string to MODULE_LICENSE
>   gpio: 104-idi-48: Pass the correct license string to MODULE_LICENSE
>   gpio: 104-idio-16: Pass the correct license string to MODULE_LICENSE
>   gpio: ws16c48: Pass the correct license string to MODULE_LICENSE

I squashed these four and applied. One "functional" change so just one commit.

Yours,
Linus Walleij
