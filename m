From: Rohit Vaswani <rvaswani@codeaurora.org>
Subject: Re: [PATCH 1/2] gpio: msm: Fix irq mask/unmask by writing bits instead
 of numbers
Date: Wed, 18 Dec 2013 17:27:49 -0800
Message-ID: <52B24B95.8010004@codeaurora.org>
References: <1386717544-478-1-git-send-email-sboyd@codeaurora.org> <CACRpkdY8W8tGVH-Os5neeFfHWjojdB5fBbjgWcsWkiMyJj=YAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY8W8tGVH-Os5neeFfHWjojdB5fBbjgWcsWkiMyJj=YAA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <Bjorn.Andersson@sonymobile.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 12/12/2013 11:02 AM, Linus Walleij wrote:
> On Wed, Dec 11, 2013 at 12:19 AM, Stephen Boyd <sboyd@codeaurora.org>=
 wrote:
>
>> We should be writing bits here but instead we're writing the
>> numbers that correspond to the bits we want to write. Fix it by
>> wrapping the numbers in the BIT() macro. This fixes gpios acting
>> as interrupts.
>>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> I've applied this for fixes and tagged for stable.
> Bj=F6rn, Rohit: OK?
>
> Yours,
> Linus Walleij
Acked-by: Rohit Vaswani <rvaswani@codeaurora.org>

Thanks,
Rohit Vaswani

--=20
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um, hosted by The Linux Foundation
