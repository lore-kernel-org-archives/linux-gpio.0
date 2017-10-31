From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: sunxi: Disable strict mode for old
 pinctrl drivers
Date: Tue, 31 Oct 2017 09:45:54 +0100
Message-ID: <CACRpkdbe_EyxNkvEZ-HdDO9W+0fABEe+UeV3VmLWfP7FKCk-2g@mail.gmail.com>
References: <cover.3e8ef5cb08d0164375d7644df0548e5f39b0fe66.1507582414.git-series.maxime.ripard@free-electrons.com>
 <ff835e2006e92d5fae35b7325d7ae9a5ae041e1d.1507582414.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ff835e2006e92d5fae35b7325d7ae9a5ae041e1d.1507582414.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2017 at 10:53 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> Old pinctrl drivers will need to disable strict mode for various reasons,
> among which:
>   - Some DT will still have a pinctrl group for each GPIO used, which will
>     be rejected by pin_request. While we could remove those nodes, we still
>     have to deal with old DTs.
>   - Some GPIOs on these boards need to have their pin configuration changed
>     (for bias or current), and there's no clear migration path
>
> Let's disable the strict mode on those SoCs so that there's no breakage.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
