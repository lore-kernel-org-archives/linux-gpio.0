From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: Use devres version of
 gpiochip_add_data
Date: Fri, 17 Feb 2017 15:35:04 +0200
Message-ID: <20170217133504.5poemeadyunc4pyh@kozik-lap>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487251636-2480-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 16, 2017 at 01:27:16PM +0000, Charles Keepax wrote:
> Use devm_gpiochip_add_data to simplify the error path in
> samsung_gpiolib_register. Additionally this would also fix a leak if
> the pinctrl driver was unbound, although admittedly I can't see any
> good use-case for doing so, but the driver does currently allow it.

Driver does not allow unbinding (.suppress_bind_attrs = true)...

Regardless of this:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
