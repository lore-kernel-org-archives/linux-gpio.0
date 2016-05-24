From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V12 2/2] gpio: max77620: add gpio driver for MAX77620/MAX20024
Date: Tue, 24 May 2016 13:09:06 +0200
Message-ID: <CACRpkdazuHJY69O9Fy9DFrbmKmzhxjU0knSP14984EhYpqiCrg@mail.gmail.com>
References: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>
	<1463116755-30469-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34460 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752665AbcEXLJH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 07:09:07 -0400
Received: by mail-oi0-f41.google.com with SMTP id b65so20346838oia.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2016 04:09:06 -0700 (PDT)
In-Reply-To: <1463116755-30469-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, May 13, 2016 at 7:19 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO
> pins. It also supports interrupts from these pins.
>
> Add GPIO driver for these pins to control via GPIO APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
