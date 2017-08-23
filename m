From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gliolib: request the gpio before querying its direction
Date: Wed, 23 Aug 2017 10:32:08 +0200
Message-ID: <CACRpkdZv0NjXfwm_-TSoY=QFeP64V-ZoKvmLXk3qkV49fq1UtQ@mail.gmail.com>
References: <1501179565-26466-1-git-send-email-timur@codeaurora.org>
 <1501179565-26466-2-git-send-email-timur@codeaurora.org> <CACRpkdYPBd4ZvuXo__LRQezTQD3u=3r2WO+2dTzBanLL1zX72w@mail.gmail.com>
 <103341c8-6cc5-3d3f-eef7-28b9f31cdc71@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <103341c8-6cc5-3d3f-eef7-28b9f31cdc71@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2017 at 11:23 PM, Timur Tabi <timur@codeaurora.org> wrote:
> On 07/31/2017 08:35 AM, Linus Walleij wrote:
>>>
>>> Before querying a GPIO to determine its direction, the GPIO should be
>>> formally requested.  This allows the GPIO driver to block access to
>>> unavailable GPIOs, which makes it easier for some drivers to support
>>> sparse GPIO maps.
>>>
>>> Signed-off-by: Timur Tabi<timur@codeaurora.org>
>>
>> This makes all kind of semantic change, so patch applied.
>
> Have you push it to git.kernel.org?  I don't see it.

It's right there on the "devel" branch from the GPIO git tree.
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel

Yours,
Linus Walleij
