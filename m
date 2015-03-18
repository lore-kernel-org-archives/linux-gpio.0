From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: sh-pfc: Store register/field widths in u8
 instead of unsigned long
Date: Wed, 18 Mar 2015 02:11:45 +0100
Message-ID: <CACRpkdZav+8L3AziXSN_Yfqdz304B8hun4D3m3==d+5WU_7bMg@mail.gmail.com>
References: <1425985583-26279-1-git-send-email-geert+renesas@glider.be>
	<1425985583-26279-2-git-send-email-geert+renesas@glider.be>
	<CACRpkdbSNeHcf5H-0ovLYkpoQyPRO2ys_eksKHJhs10x-QVJKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34020 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753778AbbCRBLp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:11:45 -0400
Received: by oier21 with SMTP id r21so24203687oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:11:45 -0700 (PDT)
In-Reply-To: <CACRpkdbSNeHcf5H-0ovLYkpoQyPRO2ys_eksKHJhs10x-QVJKQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Wed, Mar 18, 2015 at 2:10 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 10, 2015 at 12:06 PM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
>> Register and field widths are in the range 1..32. Storing them in the
>> pinctrl data in (arrays of) unsigned long wastes space.
>>
>> This decreases the size of a (32-bit) shmobile_defconfig kernel
>> supporting 7 SoCs by 26460 bytes.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>> v2:
>>   - Add Acked-by.
>
> Patch applied.

Oh newer version exists, sigh, back out try the newer one...

Yours,
Linus Walleij
