From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] qcom: spmi-gpio: Fix boundary conditions IRQ domain translate
Date: Wed, 13 Feb 2019 09:19:30 +0100
Message-ID: <CACRpkdYOeQh5LZS1U_Wa+1uSLr4EU9+tY4KY4MFW1yvZLA3zOg@mail.gmail.com>
References: <20190212035205.23477-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212035205.23477-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 12, 2019 at 4:52 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> GPIOs on the SPMI PMIC are numbered 1..ngpio, so the boundary check in
> pmic_gpio_domain_translate() is off by one, correct this.
>
> Fixes: ca69e2d165eb ("qcom: spmi-gpio: add support for hierarchical IRQ chip")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Good catch! Patch applied with Brian's review tag.

Yours,
Linus Walleij
