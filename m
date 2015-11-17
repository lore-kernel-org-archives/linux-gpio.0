From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: improve error checking and reporting
Date: Tue, 17 Nov 2015 15:44:04 +0100
Message-ID: <CACRpkdYhwEqiVJtD_Qn655-Fq5W3Q5yvMkt_dkHum4dkfLvBsA@mail.gmail.com>
References: <1447171030-15056-1-git-send-email-timur@codeaurora.org>
	<CACRpkdb4Ck4XCUEKX7TEgCg8723vZA-sxqmd753O1q9uTBszfQ@mail.gmail.com>
	<564B2D57.2080508@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34224 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbbKQOoF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 09:44:05 -0500
Received: by oies6 with SMTP id s6so5957225oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 06:44:04 -0800 (PST)
In-Reply-To: <564B2D57.2080508@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Nov 17, 2015 at 2:36 PM, Timur Tabi <timur@codeaurora.org> wrote:
> Linus Walleij wrote:
>>
>> And I suspect Arnd would be interested to know if you are doing
>> ACPI on something that is certainly not a server-class hardware.
>> Because you shouldn't.
>
> This driver is for the TLMM pin control device on Qualcomm's ARM64 Server
> chip.

Ohhh sweet. OK then.

Yours,
Linus Walleij
