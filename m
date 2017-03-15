From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: samsung: Fix memory mapping code
Date: Wed, 15 Mar 2017 14:44:19 +0100
Message-ID: <CACRpkdZO2fspG7dQ6P7GoNvXwpQRDfdrfq7pj3Zb945PaZ_EqQ@mail.gmail.com>
References: <CGME20170223101244eucas1p2eddf13a013d66f9ccdbe45f410b5939c@eucas1p2.samsung.com>
 <20170222170202.heu35anyoziwv23n@kozik-lap> <1487844760-26272-1-git-send-email-a.hajda@samsung.com>
 <CACRpkdbWxRVf5aVJYFMzYEzY+UvK3-vk59U=dNdK113wYOpkOw@mail.gmail.com> <bfec244e-d522-432b-352d-4071ba09ef74@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <bfec244e-d522-432b-352d-4071ba09ef74@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 14, 2017 at 3:28 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:

>> Please check the resulting tree on my fixes branch and rebase on
>> that.
>
> I do not see your revert on fixes branch of [1].
> The most recent patch is:
> 96e1ce8 pinctrl: uniphier: change pin names of aio/xirq for LD11

Yeah I had not had time to push it out until in the evening.

> And on this branch my patch applies cleanly :)

As per your advice in the other thread I took out the revert
and applied this instead, thanks!

Yours,
Linus Walleij
