From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] drivers: field for new GPIO driver
Date: Tue, 13 Oct 2015 06:04:35 +0900
Message-ID: <CAAVeFuJWm1hYD4NZ=7OS2eGY1rA0Eh7MGriJ9dG-sUta-CBwZg@mail.gmail.com>
References: <1444219008-2680-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33255 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751086AbbJLVEz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2015 17:04:55 -0400
Received: by oiar126 with SMTP id r126so41996474oia.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2015 14:04:55 -0700 (PDT)
In-Reply-To: <1444219008-2680-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: YD Tseng <ltyu101@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

On Wed, Oct 7, 2015 at 8:56 PM, YD Tseng <ltyu101@gmail.com> wrote:
>
> Dear all,
>
> Sorry to bother you and really appreciate for the review.
>
> >>A very simple memory-mapped I/O GPIO, you should use select GPIO_GENERIC #include<linux/basic_mmio_gpio.h>And see for example drivers/gpio/gpio-74xx-mmio.c on how to use this generic MMIO library right.
> This GPIO controller is located behind PCI-E device, We refer to drivers/gpio/gpio-amd8111.c.
>
> >>So the dirver should support the .set_debounce() method.
> rename PT_DEBOUNCE_REG to PT_CLOCKRATE_REG.
>
> >>Is it not VENDOR, and what is in these registers really?
> >>From the code it seems it is pin control registers, and this driver should then be in drivers/pinctrl/*.
> >>See for example drivers/pinctrl/intel/* for how to do that right.
> rename PT_VENDOR0_REG to PT_SYNC_REG, remove PT_VENDOR1_REG
>
> >>Too many local variable. Just used a->b->c directly.
> >>Well this will be using the MMIO library anyway so most stuff go away.
> Modify in the new patch.
>
> >>What is this? Pin multiplexing? Then implement this properly using pin control.
> It's only used to sync the gpio pins.(avoid reusing the same pin)
> We modified some code in pt_gpio_request(), this routine will return EINVAL if a pin is used.

Do not reply to reviews in a new patch. Reply in the former thread,
*then* submit a new patch.

>
> ---
>
> This patch adds a new GPIO driver for AMD Promontory chip.  This GPIO controller is enumerated by ACPI and the ACPI compliant hardware ID is AMDF030.
>
> A new file is added and 2 files are modified.
> drivers/gpio/gpio-amdpt.c            New file
> drivers/gpio/Kconfig                       Modified file
> drivers/gpio/Makefile                    Modified file
>
> Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
> ---
>  gpio-amdpt.patch | 56 ++++++++++++++++++++++++--------------------------------
>  1 file changed, 24 insertions(+), 32 deletions(-)
>
> diff --git a/gpio-amdpt.patch b/gpio-amdpt.patch
> index 228c06a..46b3ee8 100644
> --- a/gpio-amdpt.patch
> +++ b/gpio-amdpt.patch

Errr you got to be kidding, right?

You are sending a diff to a patch. That's absolutely unusable and I
don't understand why one would even think of doing that.

Re-read Documentation/SubmittingPatches and other relevant documents,
and make sure you understand them before submitting anything else.
