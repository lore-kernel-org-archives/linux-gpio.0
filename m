From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Pinctrl: mvebu - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 16:25:21 +0100
Message-ID: <CACRpkdZ8wquWRNKs=9Y8A8VPuUBB06BH5K4SMsFQr2cBWkZz0w@mail.gmail.com>
References: <CGME20170130045153epcas3p37f0c1815f13d6701dd4da3c50c54b35a@epcas3p3.samsung.com>
 <1485751903-29284-1-git-send-email-shailendra.v@samsung.com> <20170130092400.589f6a93@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37700 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932372AbdA3PdF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 10:33:05 -0500
Received: by mail-it0-f48.google.com with SMTP id r185so103748690ita.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 07:32:49 -0800 (PST)
In-Reply-To: <20170130092400.589f6a93@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Shailendra Verma <shailendra.v@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, Andreas Klinger <ak@it-klinger.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Jamie Lentin <jm@lentin.co.uk>, Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>

On Mon, Jan 30, 2017 at 9:24 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 30 Jan 2017 10:21:43 +0530, Shailendra Verma wrote:
>> of_match_device could return NULL, and so can cause a NULL
>> pointer dereference later.
>>
>> Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
>
> In practice, I don't see how of_match_device() can return NULL here.
> Indeed, those drivers only support Device Tree based probing, so
> of_match_device() will always return a non-NULL value.

OK you're right, this is too overly cautious.

Saliendra, sorry but I have to drop these patches.

Yours,
Linus Walleij
