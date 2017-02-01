From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: 104-idi-48: Remove unnecessary driver_data set
Date: Wed, 1 Feb 2017 14:22:46 +0100
Message-ID: <CACRpkdY=CvD=7cjJeiRBSj8bK3_mgwAB-vPuw=xTatNg6Ys8AA@mail.gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com> <a3c84725727c68514768b52d003b6b3ef2ce6558.1485786703.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:35753 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdBANWs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 08:22:48 -0500
Received: by mail-it0-f44.google.com with SMTP id 203so16307237ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 05:22:47 -0800 (PST)
In-Reply-To: <a3c84725727c68514768b52d003b6b3ef2ce6558.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 3:39 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> Setting driver_data was necessary to access private data in the
> idi_48_remove function. Now that the idi_48_remove function is gone,
> driver_data is no longer used. This patch removes the relevant code.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
