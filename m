From: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: Re: [PATCH] arm64: vulcan: enable GPIOLIB in Kconfig
Date: Mon, 2 May 2016 18:42:41 +0530
Message-ID: <CAB=aS0NbfH-YRJKtZ1N_OukpdXXdYeQTnuSBSP1HnCWoYSV2cw@mail.gmail.com>
References: <1461819767-17539-1-git-send-email-kamlakant.patel@broadcom.com>
	<CACRpkdY07afPyo35Fh25FXPCXED8UymbwS3AbqFnGauSmRHMwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f171.google.com ([209.85.161.171]:35002 "EHLO
	mail-yw0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000AbcEBNMm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 09:12:42 -0400
Received: by mail-yw0-f171.google.com with SMTP id g133so248255873ywb.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 06:12:42 -0700 (PDT)
In-Reply-To: <CACRpkdY07afPyo35Fh25FXPCXED8UymbwS3AbqFnGauSmRHMwA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Will Deacon <will.deacon@arm.com>, "Jayachandran C ." <jchandra@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On Sat, Apr 30, 2016 at 2:02 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Apr 28, 2016 at 7:02 AM,  <kamlakant.patel@broadcom.com> wrote:
>
>> From: Kamlakant Patel <kamlakant.patel@broadcom.com>
>>
>> Add select GPIOLIB in Kconfig for Broadcom Vulcan ARM64 GPIO driver.
>>
>> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> But don't you also want to select the actual driver?
>
Vulcan GPIO is compatible with gpio/gpio-xlp.c driver. We have already
updated gpio/Kconfig for this.
I will send the device tree changes in next patch.


Thanks,
Kamlakant Patel
