From: Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH 0/7] pinctrl: meson: Add a bunch more pins
Date: Wed, 11 May 2016 11:18:11 +0200
Message-ID: <CAOQ7t2Ys-zow-wn4p5chYxrYrjun-9_5p4_Xij6bXLApyt5itw@mail.gmail.com>
References: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
	<CACRpkdY99HWOQ4fhuYuPZ4JpwK6s75TXYpaBaBxhLLJFRLCd6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34533 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932095AbcEKJSN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 05:18:13 -0400
Received: by mail-wm0-f68.google.com with SMTP id n129so8177712wmn.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 02:18:12 -0700 (PDT)
In-Reply-To: <CACRpkdY99HWOQ4fhuYuPZ4JpwK6s75TXYpaBaBxhLLJFRLCd6w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-meson <linux-meson@googlegroups.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, May 11, 2016 at 10:57 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Fri, May 6, 2016 at 4:21 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Add support for several more devices, both in the EE domain and in the
>> AO domain.  Also, add the pins to the corresponding DTS files.
>>
>> Tested on odroid-c2 and Amlogic P200 boards, and verified with working
>> ethernet.
>>
>> Depends on the initial GXBB pinctrl support from Carlo[1].  Also
>> available in my git tree[2] with all the dependencies included.
>
> Carlo can you review Kevin's patches? I'd like to apply them if
> nothing's controversial about them.

Go ahead and apply them:

Acked-by: Carlo Caione <carlo@endlessm.com>

The ack is on the formal correctness since I still do not have access
to the datasheet.

Thanks,

-- 
Carlo Caione
