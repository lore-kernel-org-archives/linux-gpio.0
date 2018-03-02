From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: core: Add missing EXPORT on pinctrl_register_mappings
Date: Fri, 2 Mar 2018 11:07:27 +0100
Message-ID: <CACRpkdaxiUGO42Sk9608LwQ=W6-+_z32TdsRThFeK7ZTtHnzYA@mail.gmail.com>
References: <20180223134352.32612-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180223134352.32612-1-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 23, 2018 at 2:43 PM, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> Systems that don't have devicetree need pinctrl_register_mappings.
> It should be EXPORT_SYMBOL_GPL so that it can be called from
> pinctrl drivers built as modules.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
