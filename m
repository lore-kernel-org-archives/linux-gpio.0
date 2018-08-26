From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] gpio: ftgpio: Support optional silicon clock
Date: Sun, 26 Aug 2018 21:04:45 +0200
Message-ID: <20180826190445.GB7359@lunn.ch>
References: <20180826110321.17723-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180826110321.17723-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, Jonas Jensen <jonas.jensen@gmail.com>
List-Id: linux-gpio@vger.kernel.org

> +	g->clk = devm_clk_get(dev, NULL);
> +	if (!IS_ERR(g->clk)) {
> +		ret = clk_prepare_enable(g->clk);
> +		if (ret)
> +			return ret;
> +	}

Hi Linus

Is there any chance devm_clk_get() could return -EPROBE_DIFFERED?

   Andrew
