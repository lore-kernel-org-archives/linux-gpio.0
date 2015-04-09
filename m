From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RESEND RFT: pinctrl: sirf: move sgpio lock into state container
Date: Thu, 9 Apr 2015 10:15:42 +0200
Message-ID: <CACRpkdaFvYCpxJqESniQO276-BWV_W7n7vP-7_B+0Zo1eEOL7A@mail.gmail.com>
References: <1412066704-28633-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdYOyDMtoh6WaZhB9PQ9fn58zbbRsmgzB7HDw=v+UqhwHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:34829 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751767AbbDIIPp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2015 04:15:45 -0400
Received: by iejt8 with SMTP id t8so22769570iej.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2015 01:15:43 -0700 (PDT)
In-Reply-To: <CACRpkdYOyDMtoh6WaZhB9PQ9fn58zbbRsmgzB7HDw=v+UqhwHg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Barry Song <Baohua.Song@csr.com>, Barry Song <baohua@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Oct 21, 2014 at 10:32 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Tue, Sep 30, 2014 at 10:45 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>
>> Instead of referring to a global static variable for the sgpio
>> locking, use the state container to contain the lock.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Barry, did you get around to testing this patch?
>
> Shall I just apply this and see what happens?

Found this patch littering around. I will just apply it now.

Yours,
Linus Walleij
