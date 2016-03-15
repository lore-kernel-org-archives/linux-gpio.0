From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Tue, 15 Mar 2016 15:31:16 +0300
Message-ID: <56E80094.9070206@cogentembedded.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
 <CACRpkdZko+MAKn-JGCNPhnSVJOHJQ1GG_0HNN33Z6zpbu9ZddQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZko+MAKn-JGCNPhnSVJOHJQ1GG_0HNN33Z6zpbu9ZddQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 3/15/2016 11:29 AM, Linus Walleij wrote:

>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> If pinctrl_provide_dummies() is used unconditionally, then the dummy
>> state will be used even on DT platforms when the "init" state was
>> intentionally left out. Instead of "default", the dummy "init" state
>> will then be used during probe. Thus, when probing an I2C controller on
>> cold boot, communication triggered by bus notifiers broke because the
>> pins were not initialized.
>>
>> Do it like OMAP2: use the dummy state only for non-DT platforms.
>>
>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Patch applied for fixes with all the ACKs etc.
>
> This unfortiunately coincide with the merge window so was slow
> to pick it up, but it will be in the first round of fixes to Torvalds,
> possibly at -rc1 possibly earlier.

    TIA!

>> -       pinctrl_provide_dummies();
>> +       /* Enable dummy states for those platforms without pinctrl support */
>> +       if (!of_have_populated_dt())
>> +               pinctrl_provide_dummies();
>
> So remind we: what Renesas platforms are still not using DT?
> arch/sh?

    Yes, only those are left.

> Yours,
> Linus Walleij

MBR, Sergei
