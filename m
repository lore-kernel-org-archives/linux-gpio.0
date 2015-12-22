From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: revert get() to non-errorprogating behaviour
Date: Tue, 22 Dec 2015 10:07:47 +0100
Message-ID: <CACRpkdakEtRAa8irCv=n1q9MAKLKyBvMmf6OXgeX3MySiwH7iQ@mail.gmail.com>
References: <1450344071-7169-1-git-send-email-linus.walleij@linaro.org>
	<20151217212658.GZ4000@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20151217212658.GZ4000@usrtlx11787.corpusers.net>
Sender: stable-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Trimarchi <michael@amarulasolutions.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 17, 2015 at 10:26 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Thu 17 Dec 01:21 PST 2015, Linus Walleij wrote:
>
>> commit e20538b82f1ffcc06e68feb117f24f211cff7a4d
>> "gpio: Propagate errors from chip->get()"
>> started to propagate errors from the .get() functions since
>> we can get errors from the infrastructure of e.g. slowbus
>> GPIO expanders.
>>
>> However it turns out a bunch of drivers relied on the core
>> to clamp the value, so we need to revert to the old behaviour
>> and go over all drivers and fix them to conform to the
>> expectations of the core before we go back to propagating
>> the error code.
>>
>
> Okay, lets fix the drivers and then revert this revert.

Yups, I'll send out a serious patch series later today
fixing all affected drivers and then reverting the revert.

Yours,
Linus Walleij
