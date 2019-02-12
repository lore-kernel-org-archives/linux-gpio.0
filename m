From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] qcom: spmi-gpio: Fix boundary conditions IRQ domain
 translate
Date: Tue, 12 Feb 2019 05:08:10 -0500
Message-ID: <20190212100810.GA12517@basecamp>
References: <20190212035205.23477-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212035205.23477-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 11, 2019 at 07:52:05PM -0800, Bjorn Andersson wrote:
> GPIOs on the SPMI PMIC are numbered 1..ngpio, so the boundary check in
> pmic_gpio_domain_translate() is off by one, correct this.
> 
> Fixes: ca69e2d165eb ("qcom: spmi-gpio: add support for hierarchical IRQ chip")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Brian Masney <masneyb@onstation.org>
