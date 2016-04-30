From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] arm64: vulcan: enable GPIOLIB in Kconfig
Date: Sat, 30 Apr 2016 10:32:35 +0200
Message-ID: <CACRpkdY07afPyo35Fh25FXPCXED8UymbwS3AbqFnGauSmRHMwA@mail.gmail.com>
References: <1461819767-17539-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:32816 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752223AbcD3Icg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Apr 2016 04:32:36 -0400
Received: by mail-ob0-f171.google.com with SMTP id x1so42774459obt.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 Apr 2016 01:32:35 -0700 (PDT)
In-Reply-To: <1461819767-17539-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Will Deacon <will.deacon@arm.com>, "Jayachandran C ." <jchandra@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Apr 28, 2016 at 7:02 AM,  <kamlakant.patel@broadcom.com> wrote:

> From: Kamlakant Patel <kamlakant.patel@broadcom.com>
>
> Add select GPIOLIB in Kconfig for Broadcom Vulcan ARM64 GPIO driver.
>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

But don't you also want to select the actual driver?

Yours,
Linus Walleij
