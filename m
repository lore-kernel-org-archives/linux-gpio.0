From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] pinctrl: sunxi: Testing the wrong variable
Date: Tue, 22 Nov 2016 09:56:18 +0100
Message-ID: <CACRpkdYLF0T1zbSAjLnzJt93uZ2-839bGbDTMfkRmS+ja2NC4Q@mail.gmail.com>
References: <20161118113557.GA3281@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20161118113557.GA3281@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Rob Herring <robh@kernel.org>, Krzysztof Adamski <krzysztof.adamski@tieto.com>, Laxman Dewangan <ldewangan@nvidia.com>, Hans de Goede <hdegoede@redhat.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2016 at 12:35 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> Smatch complains that we dereference "map" before testing it for NULL
> which is true.  We should be testing "*map" instead.  Also on the error
> path, we should free *map and set it to NULL.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
