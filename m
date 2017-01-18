From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 4/5] gpio: davinci: Add support for multiple GPIO controllers
Date: Thu, 19 Jan 2017 00:23:27 +0100
Message-ID: <CACRpkdY_n-Ak-v+wYzk-+4KxytrLqZb767Y=OwGupwwFhnztEA@mail.gmail.com>
References: <1484669955-5349-1-git-send-email-j-keerthy@ti.com> <1484669955-5349-5-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484669955-5349-5-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 17, 2017 at 5:19 PM, Keerthy <j-keerthy@ti.com> wrote:

> Update GPIO driver to support Multiple GPIO controllers by updating
> the base of subsequent GPIO chips with total of previous chips
> gpio count so that gpio_add_chip gets unique numbers.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
