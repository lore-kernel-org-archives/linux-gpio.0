From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] gpio: gpio-mm: Remove unnecessary driver_data set
Date: Wed, 1 Feb 2017 14:44:18 +0100
Message-ID: <CACRpkdZzRMtTv-WOasd4feamqigSfPsfs3rR31RfCn+vGqpAiw@mail.gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com> <3c48d9bd3035ba5e983e520518e7a310342d9d30.1485786703.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:32922 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbdBANoU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 08:44:20 -0500
Received: by mail-io0-f174.google.com with SMTP id v96so60222122ioi.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 05:44:19 -0800 (PST)
In-Reply-To: <3c48d9bd3035ba5e983e520518e7a310342d9d30.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 3:40 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> Setting driver_data was necessary to access private data in the
> gpiomm_remove function. Now that the gpiomm_remove function is gone,
> driver_data is no longer used. This patch removes the relevant code.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
