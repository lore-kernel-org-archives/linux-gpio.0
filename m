From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: qcs404: Correct SDC tile
Date: Wed, 6 Feb 2019 09:24:17 +0100
Message-ID: <CACRpkdbWmxib6QBOdOxZV87OhDzB-ygNTFwOjL5uaPtk51_1tg@mail.gmail.com>
References: <20190131172953.27339-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190131172953.27339-1-bjorn.andersson@linaro.org>
Sender: stable-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 31, 2019 at 6:30 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> The SDC controls live in the south tile, not the north one. Correct this
> so that we program the right registers.
>
> Cc: stable@vger.kernel.org
> Fixes: 22eb8301dbc1 ("pinctrl: qcom: Add qcs404 pinctrl driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for fixes with Vinod's review tag.

Yours,
Linus Walleij
