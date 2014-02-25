From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND 1/6] mfd: lpc_ich: Convert ICH GPIOs IDs to enum
Date: Tue, 25 Feb 2014 10:35:27 +0100
Message-ID: <CACRpkdYgFA4FvGtvYQDzdkU6LY0qN=kNc4B7yX-2CcrWBSJdBg@mail.gmail.com>
References: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
	<1392386518-11025-2-git-send-email-vdonnefort@gmail.com>
	<CACRpkdbBJzV312o8Bk3Bf05zW2RB6N3fxr3uE7SuC7DQnaP7oA@mail.gmail.com>
	<20140224154018.GB15847@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:47072 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066AbaBYJf2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Feb 2014 04:35:28 -0500
Received: by mail-ob0-f176.google.com with SMTP id wo20so2556837obc.35
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2014 01:35:28 -0800 (PST)
In-Reply-To: <20140224154018.GB15847@lee--X1>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Aaron Sierra <asierra@xes-inc.com>

On Mon, Feb 24, 2014 at 4:40 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 24 Feb 2014, Linus Walleij wrote:
>
>> On Fri, Feb 14, 2014 at 3:01 PM, Vincent Donnefort <vdonnefort@gmail.com> wrote:
>>
>> > All those IDs are arbitrary and so can be encapsulated into an enumeration.
>> >
>> > Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
>>
>> OK Lee, how did we want to proceed with this? I think it's
>> easiest to put all patches into one tree, this is just too little
>> patches for cross-immutable branches & stuff.
>>
>> You can either take the whole lot with my ACK (hereby
>> provided) or you can ACK patch 1+2 and I will put the whole
>> thing into the GPIO tree.
>
> I'll save you the trouble.
>
> Applied, thanks.

Thanks Lee!

Linus Walleij
