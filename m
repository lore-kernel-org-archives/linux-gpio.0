From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Tue, 2 Oct 2018 14:51:07 +0200
Message-ID: <CACRpkdbBOHwgy_Xp3UG4bW4vLnVhOAgY+97Rs-ANJjve+cS1hQ@mail.gmail.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com> <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org> <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
 <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org> <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
 <D3E6F4C4-E1C4-4D88-B118-878576BF5281@gmail.com> <CACRpkdawwrpEe6AAfdaxw6OMFXkCnq0gpznk1Up5p1=Wigx_2g@mail.gmail.com>
 <CAPybu_1P-RWCP8yjQKkFYAX11KtYGhAfASY24Q_NZ19PD09gxA@mail.gmail.com>
 <CACRpkdaN5G4ephY+6BPLRF+aUrO4-sPa+2erRYrwTGwPBwu8fw@mail.gmail.com>
 <CAPybu_33WNiCdkwgNtkiTP2PL+9ai85Z2LiMB6yqNZrV5JdmXw@mail.gmail.com>
 <CACRpkdaccTSqpKQeUc1c6UEMo+fZmB+w0BQJL--gubrLMmKSgw@mail.gmail.com> <aa06e450-84a7-11f9-3972-08f1c9dbd1c4@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aa06e450-84a7-11f9-3972-08f1c9dbd1c4@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: timur@kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, jhugo@codeaurora.org, Stephen Boyd <swboyd@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 2, 2018 at 2:26 PM Timur Tabi <timur@kernel.org> wrote:
> On 10/2/18 2:38 AM, Linus Walleij wrote:
> >> But as today the only driver that seems to be using valid_mask is msm,
> >> so perhaps a hack is something better and then when we have a second
> >> driver that requires it we figure out the real requirements. But it is
> >> definately your decision;)
>
> Please note that MSM is supposed to be the *first* driver, not the only,
> driver that needs valid_mask.  So let's not make any code changes that
> limit this feature to the MSM driver.

I just recently encouraged Thierry to reuse this for the Tegra186
driver:
https://marc.info/?l=linux-gpio&m=153787164826821&w=2

Yours,
Linus Walleij
