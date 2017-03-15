From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] pinctrl: meson-gxl: Fix inverted registers and add
 missing pins
Date: Wed, 15 Mar 2017 10:49:13 +0100
Message-ID: <5e975901-b5d4-fdc8-9866-ad6bc9e3b599@baylibre.com>
References: <1488893462-7016-1-git-send-email-narmstrong@baylibre.com>
 <1488893462-7016-3-git-send-email-narmstrong@baylibre.com>
 <CACRpkdZ+x6vZQKfCoKD3dn-XzAxBBwMy=HF1Zi7SqXFWv28rZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:33903 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752511AbdCOJtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 05:49:31 -0400
Received: by mail-wr0-f172.google.com with SMTP id l37so7183241wrc.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 02:49:29 -0700 (PDT)
In-Reply-To: <CACRpkdZ+x6vZQKfCoKD3dn-XzAxBBwMy=HF1Zi7SqXFWv28rZA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 03/15/2017 10:43 AM, Linus Walleij wrote:
> On Tue, Mar 7, 2017 at 2:31 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> Fix some inverted bit numbers in some pinctrl groups and add missing pins
>> and groups to be in pair with the GXBB pinctrl pins definition.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> This does not apply on my fixes branch and possibly no other
> v4.11-rc1-based branch. Can you please rebase it and resend?
> 
> I guess this also needs queueing for fixes?
> 
> Yours,
> Linus Walleij
> 

Hi Linus,

Indeed, it depends on Martin's "pinctrl: meson: gxl: add the missing PWM pin definitions" posted earlier.

Neil
