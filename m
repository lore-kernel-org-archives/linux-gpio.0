From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v1 5/9] gpio: davinci: reuse for Keystone SoC
Date: Fri, 29 Nov 2013 10:25:14 +0100
Message-ID: <CACRpkda=5KyvRpN=O5UHhX8S-jYB-0g3272Xg61_jvpCEb7Nzg@mail.gmail.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
	<1385494815-15740-6-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:55154 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751235Ab3K2JZO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 04:25:14 -0500
Received: by mail-oa0-f53.google.com with SMTP id m1so9982980oag.26
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 01:25:14 -0800 (PST)
In-Reply-To: <1385494815-15740-6-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>

On Tue, Nov 26, 2013 at 8:40 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> The similar GPIO HW block is used by keystone SoCs as
> in Davinci SoCs.
> Hence, reuse Davinci GPIO driver for Keystone.
>
> Documentation:
>  http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

This is really nice, and we want to reuse stuff.

Just waiting for some comments on the previous patch...

Yours,
Linus Walleij
