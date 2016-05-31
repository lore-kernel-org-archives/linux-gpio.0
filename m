From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: Moving pinctrl node under syscon for UniPhier pinctrl driver
Date: Tue, 31 May 2016 17:40:16 +0900
Message-ID: <CAK7LNARprew8qYJjf=_H-q-Pa+mJRgzRJxMAPagkNNr1x3YcjA@mail.gmail.com>
References: <CAK7LNARp2t8y=8OaCTLG3ozBO-ZpyxVdEpo2M74TQ9ctcSnepQ@mail.gmail.com>
	<CACRpkdY_5mK29fvnqnXQLXDJyWzCPui5rApAa3v=uoa6+zG3fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35761 "EHLO
	conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755853AbcEaIkX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 04:40:23 -0400
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com [209.85.161.174]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id u4V8eGSE000316
	for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 17:40:17 +0900
Received: by mail-yw0-f174.google.com with SMTP id x189so181589647ywe.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 01:40:17 -0700 (PDT)
In-Reply-To: <CACRpkdY_5mK29fvnqnXQLXDJyWzCPui5rApAa3v=uoa6+zG3fQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

2016-05-31 17:18 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:

>> But, this effectively breaks the current DT binding.
>
> Does it really? What matters is if it still works after the change.

Yes.
I use syscon_node_to_regmap().
I want to get the regmap of the parent node, not of itself.


>> [1] Add the new binding support with a new compatible string.
>>     (note the old binding is still supported for backward compatibility)
>>
>> [2] Wait a couple of releases, keeping both of the two bindings
>>
>> [3] Drop the old binding support
>>
>> If it is OK, I want to move it forward.
>
> It is OK with *ME* because I'm just the GPIO maintainer and I'm
> not really picky about breaking DT ABI's, I think you need to crack
> a few eggs to make an omelet from time to time.
>
> The problem is rather the devicetree people: do *THEY* accept
> this?

This case is really an SoC-specific matter.
I hope it is acceptable because I am not disturbing other vendors at all.

I broke another DT before on my board,
https://lkml.org/lkml/2016/2/25/89
in this discussion, Olof said it is a good practice
to keep the old binding around, but I do not have to
keep it forever.

I am not sure how strict devicetree people are, though.


-- 
Best Regards
Masahiro Yamada
