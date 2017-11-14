From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] [v7] pinctrl: qcom: add support for sparse GPIOs
Date: Tue, 14 Nov 2017 11:03:39 +0100
Message-ID: <CACRpkdYT1NDzuEuDU47jC-iXTE8JWxqGnKhJYKp0oGiL1wX7ig@mail.gmail.com>
References: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
 <c219c289-9cad-f96c-f766-ec28af8f078d@codeaurora.org> <CACRpkdbwe9+TovFYoD-W_9kabe+jsVbN6juJQBUzicq=1XDphg@mail.gmail.com>
 <b8bbba8d-f91f-8e8f-8e79-2e772b48d9b9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <b8bbba8d-f91f-8e8f-8e79-2e772b48d9b9@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Varadarajan Narayanan <varada@codeaurora.org>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 13, 2017 at 10:53 PM, Timur Tabi <timur@codeaurora.org> wrote:
> On 11/13/2017 03:49 PM, Linus Walleij wrote:
>>
>>
>>  From what I have understood Qualcomm has one finger constantly
>> on the fast-forward button for upstreaming right now, which I think
>> is good (everyone should have!) but the limited number of trusted
>> maintainers of core infrastructure code makes bottlenecks form
>> around these drivers where review is really needed and deep queues
>> of patches form. Sorry.
>
>
> That's one of the reasons why I prefer v5 of my patch instead of v7.  v5
> does not touch the core.  It's much less intrusive and has no risk of
> breaking other drivers.  I can't say that about v7.

The more intrusive design is on my request so I will look at it in detail
ASAP. I took a quick look and liked what I saw, I just need to make
sure about the details. Also it'd be nice to have a nod from Bj=C3=B6rn.

The main reason for some of the work is ACPI, am I right?

Timur could you look quickly at the series posted by Andy Shevchenko
(6 patches prefixed gpiolib: acpi: ) for augmenting ACPI GPIOs in the core?
Especially patch 5 and 6 which introduce the ability to add quirks in the
core.

I'd like to get some ARM-based people to look at it to make sure we
those systems can also quirk their GPIOs if need be.

Yours,
Linus Walleij
