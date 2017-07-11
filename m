From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ssbi: mpp: constify gpio_chip structure
Date: Tue, 11 Jul 2017 14:44:01 -0700
Message-ID: <20170711214401.GE20973@minitux>
References: <20170711211836.GA31321@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170711211836.GA31321@embeddedgus>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue 11 Jul 14:18 PDT 2017, Gustavo A. R. Silva wrote:
[..]
> before:
>    text    data     bss     dec     hex filename
>   15136    5112       0   20248    4f18 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.o
> 
> after:
>             bss     dec     hex filename
>   14849    5024       0   19873    4da1 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.o
> 
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
