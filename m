From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO
 is not defined
Date: Fri, 24 May 2019 10:10:10 +0200
Message-ID: <CACRpkdbRuveWT8huqpvo6vrSqyF2_g=xcHF+YjAs6AH4xcA65w@mail.gmail.com>
References: <1558683125-31882-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558683125-31882-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 24, 2019 at 9:32 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
> not exist:
> drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
> drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
>      pctl->gpio_chip.of_node = np;
>
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
