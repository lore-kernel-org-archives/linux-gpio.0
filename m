From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/7] pinctrl: meson: Add a bunch more pins
Date: Tue, 24 May 2016 09:14:28 -0700
Message-ID: <m2eg8rigbf.fsf@baylibre.com>
References: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
	<CACRpkdY9oGZLt431NwTaFmZk98O8n3ZnMA1odhYZtcH7P1p=Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:34173 "EHLO
	mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752102AbcEXQOe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 12:14:34 -0400
Received: by mail-pf0-f178.google.com with SMTP id y69so8376775pfb.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2016 09:14:33 -0700 (PDT)
In-Reply-To: <CACRpkdY9oGZLt431NwTaFmZk98O8n3ZnMA1odhYZtcH7P1p=Jg@mail.gmail.com>
	(Linus Walleij's message of "Tue, 24 May 2016 11:23:37 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-meson <linux-meson@googlegroups.com>, Andreas =?utf-8?Q?F=C3=A4rb?= =?utf-8?Q?er?= <afaerber@suse.de>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Linus Walleij <linus.walleij@linaro.org> writes:

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
> These don't apply anomore sadly, Kevin can you rebase on
> Torvalds' HEAD and resend, and include Carlo's ACK on them
> so I can merge them in the next kernel cycle?

Coming right up...

Kevin
