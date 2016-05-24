From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/7] pinctrl: meson: Add a bunch more pins
Date: Tue, 24 May 2016 14:45:17 -0700
Message-ID: <m2posbgmfm.fsf@baylibre.com>
References: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
	<CACRpkdY9oGZLt431NwTaFmZk98O8n3ZnMA1odhYZtcH7P1p=Jg@mail.gmail.com>
	<m260u3ia37.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:34178 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411AbcEXVpU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 17:45:20 -0400
Received: by mail-pa0-f51.google.com with SMTP id qo8so10446001pab.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2016 14:45:19 -0700 (PDT)
In-Reply-To: <m260u3ia37.fsf@baylibre.com> (Kevin Hilman's message of "Tue, 24
	May 2016 11:29:00 -0700")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-meson <linux-meson@googlegroups.com>, Andreas =?utf-8?Q?F=C3=A4rb?= =?utf-8?Q?er?= <afaerber@suse.de>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Kevin Hilman <khilman@baylibre.com> writes:

> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> On Fri, May 6, 2016 at 4:21 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>>> Add support for several more devices, both in the EE domain and in the
>>> AO domain.  Also, add the pins to the corresponding DTS files.
>>>
>>> Tested on odroid-c2 and Amlogic P200 boards, and verified with working
>>> ethernet.
>>>
>>> Depends on the initial GXBB pinctrl support from Carlo[1].  Also
>>> available in my git tree[2] with all the dependencies included.
>>
>> These don't apply anomore sadly, Kevin can you rebase on
>> Torvalds' HEAD and resend, and include Carlo's ACK on them
>> so I can merge them in the next kernel cycle?
>
> Looking closer, these have dependencies on the DT changes that you've
> suggested we take through arm-soc, so it would be cleaner if I take
> these with your ack through the amlogic tree.
>
> Since it's a brand new driver, I don't expect there to be conflicts.
>
> Does that work for you?

FWIW, rebase available here (with all deps, some of which I think
you'ved already merged):

git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux.git amlogic/v4.7/pinctrl

Kevin
