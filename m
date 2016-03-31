From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: xlp: Add GPIO driver support for Broadcom Vulcan ARM64
Date: Thu, 31 Mar 2016 10:44:35 +0200
Message-ID: <CACRpkdaSV8m90X=fKQO-FtVWbAf6kganwcNeg3hNmhSg0ow0mQ@mail.gmail.com>
References: <1458652125-4527-1-git-send-email-kamlakant.patel@broadcom.com>
	<1458811900-6920-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33345 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754745AbcCaIog (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 04:44:36 -0400
Received: by mail-oi0-f47.google.com with SMTP id d205so51379854oia.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 01:44:36 -0700 (PDT)
In-Reply-To: <1458811900-6920-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 24, 2016 at 10:31 AM,  <kamlakant.patel@broadcom.com> wrote:

> From: Kamlakant Patel <kamlakant.patel@broadcom.com>
>
> - Add GPIO support for Broadcom Vulcan ARM64.
> - Add depends on ARCH_VULCAN to Kconfig to enable gpio controller
>   driver for Broadcom Vulcan ARM64 SoCs.
>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
> ---
> v2: Add devicetree binding documentation for GPIO on
>     Broadcom Vulcan ARM64 SoCs

Patch applied.

Yours,
Linus Walleij
