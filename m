From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] pinctrl: sunxi: Fix a memory leak in
 'sunxi_pinctrl_build_state()'
Date: Tue, 16 Oct 2018 08:59:04 +0200
Message-ID: <20181016065904.53lg6zth6mjf7mkg@flea>
References: <20181016062228.19472-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181016062228.19472-1-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: wens@csie.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 16, 2018 at 08:22:28AM +0200, Christophe JAILLET wrote:
> If 'krealloc()' fails, 'pctl->functions' is set to NULL.
> We should instead use a temp variable in order to be able to free the
> previously allocated memeory, in case of OOM.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
